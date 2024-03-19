---
title: Data exfiltration considerations and best practices for dataflows
description: Learn the security best practices for protection against data exfiltration when using Dataflows.
author: nikkiwaghani
ms.author: nikkiwaghani
ms.topic: overview
ms.date: 1/17/2024
---

# Data exfiltration considerations and best practices for dataflows

[Fabric dataflows](/fabric/data-factory/data-factory-overview#dataflows) and [Power Platform dataflows](overview-dataflows-across-power-platform-dynamics-365.md) are Microsoft 365 services that enable users to easily connect to, extract, move, and transform data across hundreds of supported data sources. Dataflows build upon an underlying service called [Power Query Online](../power-query-what-is-power-query.md), which hosts the data movement engine (Mashup Engine) as a cloud service. By default, connectivity originates from this cloud location and has unrestricted access to the internet. Therefore, when using dataflows to access and move sensitive data, organizations should consider strategies to deter insiders from accidental or malicious data exfiltration. This article outlines known risk factors and best practices for safeguards.

## Considerations

### Arbitrary code execution

Dataflow ETL jobs are defined through programs written in a language called [Power Query M](../power-query-what-is-power-query.md#power-query-m-formula-language). In its default configuration, the Mashup Engine executes these programs in the cloud, outside the tenant's network boundary, and with unrestricted internet access. Users can author programs that connect to multiple data sources, and upon consent, allow data to flow between these sources.

A trusted user who has access to sensitive data can author a program to push the data to an untrusted data store. Since the Mashup Engine runs entirely in the cloud, it doesn't go through corporate firewalls and proxy servers. So, it isn't subject to any data loss prevention (DLP) policies that might be enforced by these networks. Since the point of access is on the public internet, data can travel to any destination that the user has access to&mdash;either through authentication or anonymous access. Here are some examples of ways in which these programs can exfiltrate sensitive data:

* Anonymous web requests: By using [Web.Contents](/powerquery-m/web-contents), users can make web requests with sensitive data in the body of the request.
* Cross data source filtering and joins: Sensitive data can be used as filtering or join conditions against another untrusted data source. Specifically, data can travel to the untrusted data source in the form of query strings or parameters.
* Output destinations: By using Fabric [dataflows](/fabric/data-factory/create-first-dataflow-gen2), users can specify output destinations for their queries, thereby transferring data to a list of supported data sinks, which includes Azure SQL databases and data warehouses, Fabric Lakehouses, Warehouses, and KQL databases.

:::image type="content" source="media\service-gateway-dataflow-best-practices\artbitrary-code-execution.png" alt-text="Image of how M Programs that run on the cloud can execute arbitrary code and connect to untrusted data sources." lightbox="media\service-gateway-dataflow-best-practices\artbitrary-code-execution.png":::

### Cross-tenant data movement

The Mashup Engine requires data sources to be explicitly defined before making connections. The data sources are bound to programs with a kind and path key (for example, `SQL;contoso.database.windows.net`). This binding provides an opportunity for organizations to govern which data sources are permitted, by filtering based on the data source paths. However, there are some data sources where the path is common across all connections and data is segmented only by the tenant of the signed in user's OAuth credentials. This scenario creates a risk factor for data exfiltration, where a user signs into a higher security tenant and a lower security tenant and moves data between them. Typically, this exfiltration can be done in two ways:

* Outbound: A trusted user in a higher security tenant defines a dataflow in that environment and creates an output destination to a permitted data sink, but authenticates with the data sink using an account from a lower security tenant.
* Inbound: A user in a lower security tenant defines a dataflow that reads data from a sensitive data source in the higher security tenant. This definition can be achieved by authenticating against the sensitive data source using a trusted account in the higher security tenant.

:::image type="content" source="media\service-gateway-dataflow-best-practices\cross-tenant-movement.png" alt-text="Image of a high security tenant transferring data to a low security tenant that then has access to output data to untrusted data sources." lightbox="media\service-gateway-dataflow-best-practices\cross-tenant-movement.png":::

## Recommended best practices

DLP policies can operate at various OSI layers. In general, the more sensitive the data, the lower the layer where the policies must be applied. Lower layer protocols are typically more expensive to implement, harder to scale, and more difficult to operate. For example, organizations with lower governance requirements might only need to apply application layer policies. However, some organizations and entities processing highly sensitive data might require extreme measures such as physical isolation. We recommend that organizations handling sensitive data employ a combination of application and network-level policies to protect against insider threats.

### Network isolation

We recommend that all data stores containing sensitive data be network isolated to permit access only from selected networks. This isolation restriction must be defined and operated at the network layer or lower. For example, layer 3 firewalls, Network Security Groups (NSGs), and Azure Private Links are good examples of mechanisms that can be used. However, location-based conditional access policies in Microsoft Entra ID operate at the application layer and are considered insufficient for this purpose.

These network isolation policies must obstruct line of sight from dataflows' cloud execution engine to sensitive data stores (since the cloud engine runs on the public internet). Dataflows' connectivity to these data stores is then forced to originate from within one of the permitted networks by binding connections to an on-premises data gateway or VNet data gateway. An important execution characteristic of dataflows is that cloud-based evaluation and gateway-based evaluation are never blended. If a dataflow needs to access a network isolated data store (and is therefore bound to a gateway), all data access is then required to flow through the gateway. Additionally, since gateways physically reside in networks controlled by the user tenant, they comply with network level restrictions such as firewalls and DLP protection solutions. These restrictions make gateway environments as secure and safe as any corporate managed devices and mitigate risks associated with arbitrary code execution in a cloud environment.

:::image type="content" source="media\service-gateway-dataflow-best-practices\network-isolation.png" alt-text="Image of an architecture diagram in which the gateway's execution engine outbound access to an untrusted data source is denied and so is the inbound access of the cloud execution engine to a sensitive data store." lightbox="media\service-gateway-dataflow-best-practices\network-isolation.png":::

It's worth noting that network isolation must be applied to all data stores that might contain sensitive data. Consider an example where a user creates a dataflow to read data from OneDrive for Business into Power BI. Then the user later creates a linked dataflow to transform the data in Power BI into downstream entities. In this scenario, it's not sufficient to just isolate OneDrive for Business to trusted networks. Since sensitive data might also reside within Power BI, it's important to isolate such data by enabling private links and disabling public Internet access for Power BI. [Learn more about secure access to Power BI using private endpoints](/power-bi/enterprise/service-security-private-links).

### Force gateway execution

The goal for isolating sensitive data store to selected networks is to force the origin of access back to trusted networks, so that existing policies governing managed devices can be used to govern data movement from dataflows. In certain cases, a full network isolation solution might take time to develop, test, and deploy. As an alternative, you can file a dataflows support ticket to apply a tenant-wide policy that turns off the Mashup Engine. This policy affects all query evaluations that use the Power Query Online Mashup Engine. Impacted capabilities include:

* Fabric dataflows
* Power Platform dataflows
* Azure Data Factory wrangling dataflows
* Dataflows in Dynamics 365 (Customer Insights, Intelligent Order Management, and so on)
* Power BI Datamart
* Power BI Quick Import from SharePoint

After application of the policy, all cloud-based execution fails with the following error: `Cloud evaluation request denied based on tenant policies. Please use a data gateway and try again.` This error effectively forces all query evaluations in the tenant to occur on gateways, without first rolling out a full network isolation solution. Note that the policy is applied to the entire tenant and not a subset of workloads. This policy means existing workloads fail immediately and require manual intervention to convert to run on gateways. Organizations applying this policy should also ensure that they have enough capacity in their gateway clusters to accommodate all their workloads.

### Tenant isolation

For most software-as-a-service (SaaS) layer data stores, such as Fabric Lakehouse and Power Platform Dataverse, there's usually a multi-tenant endpoint that one communicates with to gain access to the data. These endpoints are common across all users of the service, so they can be difficult to isolate and protect solely using network (Layer 3) isolation techniques. The recommended approach for this kind of data store is to use Layer 7 policies, typically provided by Microsoft Entra ID:

* Allow only Microsoft Entra ID authentication. Remove anonymous and username/password authentication schemes from the data store.
* Use location policies to allow sign-in to the secured tenant only from managed devices. [Learn more](/azure/active-directory/conditional-access/location-condition).
* Disallow unknown tenant sign-ins from managed devices by using Microsoft Entra ID tenant restrictions. Use tenant restrictions to manage access to SaaS apps. [Learn more](/entra/identity/enterprise-apps/tenant-restrictions).

This approach restricts access to the tenant’s sensitive data stores to a set of managed devices where signing into another tenant isn't permitted, effectively isolating data movement across the tenant.

## Roadmap

The following list contains some of the features that are currently planned to help organizations better manage data exfiltration risks in Fabric:

* Data source connection allowlisting: Allows Fabric tenant admins to control the kinds of connectors that can be used within the tenant, and the endpoints the connectors can connect to.
* Connection usage auditing: Support for auditing logs that track connection creation, updating, deletion, and usage.
