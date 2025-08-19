---
title: Secure your Power Query deployment
description: Learn how to secure Power Query, with best practices for protecting your data, connections, and transformations.
author: DougKlopfenstein
ms.author: dougklo
ms.service: power-query
ms.topic: conceptual
ms.custom: horz-security
ms.date: 08/14/2025
ai-usage: ai-assisted
---

# Secure your Power Query deployment

Power Query provides capabilities to extract, transform, and load data from various sources into destinations like Power BI, Excel, Dataverse, and Azure Data Lake Storage. When deploying this service, it's important to follow security best practices to protect data, configurations, and connections.

This article provides guidance on how to best secure your Power Query deployment.

## Data protection

Power Query processes data from various sources, making it essential to implement proper data protection measures to prevent unauthorized access and data leakage between sources.

- **Configure privacy levels for each data source**: Set appropriate privacy levels (Private, Organizational, Public) to prevent accidental data transfer between sources with different sensitivity levels. Private data sources can't share data with other sources, ensuring sensitive information remains protected. For more information, go to [Privacy levels in Power Query](privacy-levels.md).

- **Avoid ignoring privacy levels**: Do not enable Fast Combine option ("Ignore the Privacy Levels") as it could expose sensitive or confidential data to unauthorized users. This setting might improve performance but compromises security safeguards. For more information, go to  [Setting privacy level options](privacy-levels.md#setting-the-privacy-level-options).

- **Use parameterized queries securely**: When using dynamic M query parameters, avoid string concatenation within queries and instead use M operations that fold to the source query to prevent potential injection attacks. Consider using parameter-passing mechanisms built into the source query language when available. For more information, go to [Mitigate security risks with parameters](/power-bi/connect-data/desktop-dynamic-m-query-parameters#potential-security-risk).

- **Encrypt data connections**: When connecting to data sources that support encryption, always enable secure connection options. For example, when connecting to databases, ensure "Use Encrypted Connection" is selected where available. For more information, go to [Connection settings in Power Query Online](/power-query/get-data-experience#connection-settings).

- **Validate certificate revocation status**: Ensure SSL connections include certificate revocation status checks to prevent connections to compromised servers. While it's possible to disable these checks, doing so can expose your data to security risks. For more information, go to [Certificate revocation](common-issues.md#certificate-revocation).

## Identity and access management

Securing Power Query begins with implementing robust identity and access controls to ensure only authorized users can access your data sources and transformations.

- **Use Microsoft Entra ID authentication when available**: Leverage Microsoft Entra ID (formerly Azure AD) for secure authentication to data sources, especially for cloud services. This provides centralized identity management and supports features like conditional access and multi-factor authentication. For more information, go to [Authentication in desktop apps](connector-authentication.md).

- **Implement least privilege access**: Assign only the necessary permissions to users connecting to data sources through Power Query. Avoid using administrative or high-privilege accounts for routine data connections. For more information, go to [Connections and authentication in Power Query Online](connection-authentication-pqo.md).

- **Restrict non-certified connectors**: By default, Power Query raises an error when attempting to load non-certified connectors. Maintain this setting to prevent the use of custom connectors that haven't been validated for security. For more information, go to [Data extension security options](/power-bi/connect-data/desktop-connector-extensibility).

- **Require user approval for native queries**: Keep the default setting that requires user approval before running native database queries, as they could potentially execute malicious SQL statements that modify or delete database records when the user has sufficient permissions. For more information, go to [Native database queries](native-database-query.md).

- **Manage credential storage securely**: Power Query encrypts and stores credentials separately from data models, facilitating credential reuse without exposing sensitive information. Ensure that only authorized users have access to manage these stored credentials. For more information, go to [Power BI implementation planning: Content creator security planning](/power-bi/guidance/powerbi-implementation-planning-security-content-creator-planning#create-and-publish-content).

## Network security

Implementing network security controls helps protect your Power Query connections and prevents unauthorized access to your data sources.

- **Use data gateways for on-premises data sources**: Implement on-premises data gateways or virtual network data gateways to securely connect to data sources in private networks without exposing them to the public internet. For more information, go to [Connect to a Power Query data source](/dynamics365/customer-insights/data/connect-power-query).

- **Implement network isolation for sensitive data sources**: Use virtual network data gateways to connect to Azure services within a virtual network without requiring an on-premises data gateway on a virtual machine. This provides an additional layer of network isolation for sensitive data. For more information, go to [Virtual network data gateways](/data-integration/vnet/overview).

- **Enable TLS encryption for all connections**: Ensure that connections to data sources use TLS encryption with modern cipher suites. Outdated cipher suites may not be supported and could pose security risks. For more information, go to [Power Query cipher suites](common-issues.md#power-query).

- **Configure firewalls for data source access**: When using Power Query with Azure Storage or other cloud services with firewall settings, ensure proper configuration to allow authenticated connections while blocking unauthorized access. For more information, go to [Azure Blob Storage limitations](connectors/azure-blob-storage.md#limitations).

- **Consider Azure ExpressRoute for critical deployments**: For enterprise environments with sensitive data, consider using Azure ExpressRoute to establish private connections between your on-premises network and Microsoft cloud services, bypassing the public internet entirely. For more information, go to [Network security](/power-platform/guidance/adoption/data-protection#network-security).

## Logging and monitoring

Implementing comprehensive logging and monitoring helps detect suspicious activities and troubleshoot issues with your Power Query deployments.

- **Enable Query Diagnostics for sensitive operations**: Use Query Diagnostics in Power BI Desktop to investigate Power Query performance and understand what queries are being sent to data sources. This helps identify potential security issues and ensures query folding is working correctly. For more information, go to [Query Diagnostics](/power-bi/guidance/powerbi-implementation-planning-auditing-monitoring-data-level-auditing#query-diagnostics).

- **Monitor native queries sent to data sources**: Regularly review the actual queries sent to your data sources to ensure they don't contain unexpected or potentially harmful operations. Query Diagnostics can help identify which queries are being sent. For more information, go to [Query evaluation and folding](/power-bi/guidance/powerbi-implementation-planning-auditing-monitoring-data-level-auditing#query-evaluation-and-folding).

- **Track data source connections**: Monitor which data sources are being accessed, how frequently, and by which users to identify unusual access patterns that might indicate security issues. For more information, go to [Performance monitoring](/power-bi/guidance/powerbi-implementation-planning-auditing-monitoring-overview#value-of-auditing-and-monitoring).

- **Implement Azure Log Analytics for Premium workspaces**: For Power BI Premium workspaces, integrate with Azure Log Analytics to capture semantic model events and monitor data access patterns at scale. For more information, go to [Azure Log Analytics](/power-bi/guidance/powerbi-implementation-planning-auditing-monitoring-data-level-auditing#azure-log-analytics).

- **Audit dataflow and datamart operations**: Track user activities for Power BI dataflows and datamarts using the Power BI activity log to maintain visibility into data transformation operations. For more information, go to [Dataflow monitoring](/power-bi/guidance/powerbi-implementation-planning-auditing-monitoring-data-level-auditing#dataflow-monitoring).

## Backup and recovery

Protecting your Power Query assets through proper backup and recovery strategies ensures business continuity and prevents data loss.

- **Back up dataflow definitions**: Since deleted dataflows can't be recovered, implement a backup strategy by exporting dataflow definitions to JSON files and storing them in SharePoint or Azure Data Lake Gen2. Consider using Power Automate or Azure Logic Apps to automate this process. For more information, go to [Dataflows best practices](/power-bi/transform-model/dataflows/dataflows-best-practices).

- **Enable Azure storage connections for automatic backups**: When using Power BI dataflows, enable Azure storage connections on your workspace to automatically store copies of your dataflow definitions and snapshots in a data lake. This allows recovery of deleted or modified dataflows. For more information, go to [Dataflows best practices](/power-bi/transform-model/dataflows/dataflows-best-practices#deleted-dataflows-cant-be-recovered).

- **Back up semantic models with XMLA endpoints**: For Power BI Premium or Premium Per User (PPU) licenses, utilize the Backup and Restore feature through XMLA endpoints to create backups of your semantic models. This provides protection against corruption or loss and enables migration scenarios. For more information, go to [Backup and restore semantic models with Power BI Premium](/fabric/enterprise/powerbi/service-premium-backup-restore-dataset).

- **Consider multi-geo backup requirements**: When using backup and restore features that rely on Azure Data Lake Gen2 storage, provision the storage account in the same region as your Power BI Premium capacity to avoid data transfer costs and comply with data residency requirements. For more information, go to [Multi-geo considerations](/fabric/enterprise/powerbi/service-premium-backup-restore-dataset#multi-geo-considerations).

- **Implement a disaster recovery plan**: Develop a comprehensive disaster recovery plan that includes the ability to access Power Query data through alternative methods such as the OneLake ADLS Gen2 API or tools like Azure Storage Explorer in case of service disruptions. For more information, go to [Set up disaster recovery](/azure/reliability/reliability-fabric#set-up-disaster-recovery).

## Service-specific security

Power Query includes specific security considerations related to its implementation across different Microsoft products and services.

- **Validate custom connectors**: If using custom connectors, ensure they come from trusted sources and have been properly reviewed for security vulnerabilities. Prefer using certified connectors whenever possible. For more information, go to [Custom connectors](/power-bi/guidance/powerbi-implementation-planning-security-content-creator-planning#create-and-publish-content).

- **Secure R and Python scripts**: When using R or Python scripts in Power Query, be aware that they execute with the permissions of the user and could potentially access sensitive data. Only use scripts from trusted sources and set appropriate privacy levels. For more information, go to [Use R in Power Query Editor](/power-bi/connect-data/desktop-r-in-query-editor#use-an-r-script-in-power-query-editor).

- **Implement Customer Lockbox for enterprise deployments**: For enterprise deployments where sensitive data is processed, consider implementing Customer Lockbox to control Microsoft access to your environments when resolving support issues. This provides temporary, just-in-time access with proper approvals. For more information, go to [Manage Microsoft access to customer data with Customer Lockbox](/power-platform/guidance/adoption/data-protection#manage-microsoft-access-to-customer-data-with-customer-lockbox).

- **Establish separate environments for development and production**: Create distinct environments for development and production to prevent accidental changes to production data pipelines. This separation also allows for proper testing of security controls before deployment. For more information, go to [Use this privacy setting for data sources in a controlled development environment](privacy-levels.md).

- **Consider gateway clustering for critical workloads**: For enterprise environments with critical data processing needs, implement gateway clusters to improve reliability and meet different compliance or security requirements for various data sources. For more information, go to [Network security](/power-platform/guidance/adoption/data-protection#network-security).

## Learn more

- [Data privacy levels in Power Query](privacy-levels.md)
- [Behind the scenes of the Data Privacy Firewall](data-privacy-firewall.md)
- [Connections and authentication in Power Query Online](connection-authentication-pqo.md)
- [Handling authentication in Power Query](handling-authentication.md)
