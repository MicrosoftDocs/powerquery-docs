---
title: Power Query Connector Certification
description: Guidelines on connector certification and implementation requirements for Power Query custom connectors
author: bezhan-msft
ms.topic: conceptual
ms.date: 1/9/2023
ms.author: bezhan
ms.custom: intro-internal
---

# Power Query Connector Certification

> [!NOTE]
> This article describes the requirements and process to submit a Power Query custom connector for certification. Read the entire article closely before starting the certification process.

## Introduction

With the [Power Query SDK](InstallingSDK.md), everyone is empowered to create a custom Power Query connector to connect to a data source from Power Query. Currently, custom connectors are only supported in Power BI datasets (Power BI Desktop and Power BI service), and require the use of an on-premises data gateway to refresh through Power BI service. Custom connectors need to be individually distributed by the developer.

Data source owners who develop a custom connector for their data source might want to distribute their custom connector more broadly to Power Query users. Once a custom connector has been created, used, and validated by end users, the data source owner can submit it for Microsoft certification.

Certifying a Power Query custom connector makes the connector available publicly, out-of-box, within Power BI datasets (Power BI Desktop and Power BI service), Power BI dataflows, and Power BI datamarts. Certified connectors are supported in PowerBI.com and all versions of Power BI Premium.

Certified connectors are:

* Maintained by the partner developer

* Supported by the partner developer

* Certified by Microsoft

* Distributed by Microsoft

We work with partners to try to make sure that they have support in maintenance, but customer issues with the connector itself will be directed to the partner developer.

## Certified connector and custom connector differences

Certified connectors are bundled out-of-box in Power BI Desktop, and deployed to Power BI Service, Power BI dataflows, and Power BI datamarts. Custom connectors are only supported in Power BI datasets and need to be loaded in Power BI Desktop, as described in [Loading your extension in Power BI Desktop](samples/trippin/1-odata/readme.md#loading-your-extension-in-power-bi-desktop). Both certified and custom connectors can be refreshed through Power BI Desktop or Power BI Service through using an on-premises data gateway by implementing a [TestConnection](samples/trippin/9-testconnection/readme.md). The on-premises data gateway is required for custom connectors.

Certified connectors in Power BI Desktop with a `TestConnection` implementation also support end-to-end refresh through the cloud (Power BI Service) without the need of an on-premises data gateway. The Power BI service environment essentially hosts a “cloud gateway” that runs similar to the on-premises gateway. After certification, we'll deploy your connector to this environment so that it's available to all Power BI customers.

Both custom and certified connectors with extra components (for example, ODBC driver) need the extra component to be installed on the end user machine and require the on-premises data gateway, unless the extra component is deployed to Power BI cloud. Currently, we aren't certifying and deploying any new extra components to Power BI cloud, so the certification of connectors with a dependency on an extra component won't remove the on-premises data gateway requirement.

## Custom connector distribution

Custom connectors can and should be distributed to end users before certification.

As M is a versatile language that, as seen in [Handling Authentication](handlingauthentication.md), has the capacity to interact with stored credentials, we need to give users a way to only allow trusted connectors to run.

From a developer's perspective, developers need to [self-sign](./handlingconnectorsigning.md) their custom connector and provide their users with the information (thumbprint) to securely load it.

From a user's perspective, users need to use the thumbprint from the developer to securely [trust and load the custom connector](/power-bi/connect-data/desktop-trusted-third-party-connectors) for use. Alternatively, users can opt to lower their security settings to allow loading of code not certified by Microsoft or another developer, but this isn't recommended.

## Certification Overview

### Prerequisites

To ensure the best experience for our customers, we only consider connectors that meet a set of prerequisites for certification: 

* The connector must be for a public product.

* The connector must be considered code-complete for an initial release version. The program allows for frequent iterations and updates. Note that Microsoft doesn't offer technical assistance or custom connector development consulting. We recommend leveraging public resources such as our SDK documentation and samples repository. If you require further assistance, we can share a list of known 3rd-party industry custom connector development consultants that you may want to engage directly, separate from any Microsoft program or partnership. Note that Microsoft isn't affiliated with any of these consultants and isn't responsible for your use of their services. Microsoft provides the list for your convenience and without any assurances, recommendations, or guarantees. Reach out to your Microsoft certification contact to learn more. 

* The developer must provide an estimate for usage. We suggest that developers of connectors for very boutique products use our [connector self-signing capabilities](#custom-connector-distribution) to provide them directly to the customer.

* The connector must be already made available to customers directly to fulfill a user need or business scenario. This can be done using a Private Preview program by distributing the completed connector directly to end users and organizations through [self-signing](#custom-connector-distribution). Each user or organization should be able to provide feedback and validation that there's a business need for the connector and that the connector is working successfully to fulfill their business requirements.

* The connector must be working successfully at an anticipated level of usage by customers.

* There must be a thread in the [Power BI Ideas forum](https://ideas.powerbi.com/) driven by customers to indicate demand to make the connector publicly available in Power BI Desktop. There's no set threshold of engagement. However the more engagement, the stronger the evidenced demand for the connector.

These prerequisites exist to ensure that connectors undergoing certification have significant customer and business need to be used and supported post-certification.

### Process and Timelines

Certified connectors are released with monthly Power BI Desktop releases, so the deadlines for each release work back from each Power BI Desktop release date. The expected duration of the certification process from registration to release varies depending on the quality and complexity of the connector submission. Microsoft doesn't provide any specific timeline guarantees with regard to any connector review and approval. The hard deadlines for each connector review is outlined in the following steps, but Microsoft doesn't guarantee adherence to these timelines. 

* **Registration**: notification of intent to certify your custom connector. This must occur by the 15th of the month, two months before the targeted Power BI desktop release.
  * For example, for the April Power BI Desktop release, the deadline would be February 15th.

* **Submission**: submission of connector files for Microsoft review. This submission must occur by the 1st of the month before the targeted Power BI desktop release.
  * For example, for the April Power BI Desktop release, the deadline would be March 1st.

* **Technical Review**: finalization of the connector files, passing Microsoft review and certification. This review must occur by the 15th of the month before the targeted Power BI Desktop release.
  * For example, for the April Power BI Desktop release, the deadline would be March 15th.

Due to the complexity of the technical reviews and potential delays, rearchitecture, and testing issues, **we highly recommend submitting early with a long lead time for the initial release and certification**. If you feel like your connector is important to deliver to a few customers with minimal overhead, we recommend [self-signing](#custom-connector-distribution) and providing it that way.

## Certification Requirements

We have a certain set of requirements for certification. We recognize that not every developer can meet these requirements, and we're hoping to introduce a feature set that will handle developer needs in short order.
  
### Submission Files (Artifacts)

Ensure the connector files that you submit include all of the following:

* Connector (.mez) file
  * The .mez file should follow style standards and be named similarly to the product or service name. It shouldn't include words like "Power BI", "Connector" or "API".
  * Name the .mez file: ```ProductName.mez```

* Power BI Desktop (.pbix) file for testing
  * We require a sample Power BI report (.pbix) to test your connector with.
  * The report should include at least one query to test each item in your navigation table.
  * If there's no set schema (for example, databases), the report needs to include a query for each "type" of table that the connector may handle.

* Test account to your data source
  * We'll use the test account to test and troubleshoot your connector.
  * Provide a test account that is persistent, so we can use the same account to certify any future updates.

* Testing instructions
  * Provide any documentation on how to use the connector and test its functionality.

* Links to external dependencies (for example, ODBC drivers)

### Features and Style

The connector must follow a set of feature and style rules to meet a usability standard consistent with other certified connectors.

* The connector MUST:

  * Use Section document format.
  * Contain a [version header/adornment](HandlingVersioning.md) above the section document.
  * Provide [function documentation metadata](HandlingDocumentation.md).
  * Have [TestConnection handler](HandlingGatewaySupport.md).
  * Follow naming conventions (for example, `DataSourceKind.FunctionName`). It shouldn't include words like "Power BI", "Connector" or "API".
  * Have the Beta flag set to True on initial release.

* The ```FunctionName``` should make sense for the domain (for example "Contents", "Tables", "Document", "Databases", and so on).

* The connector SHOULD:
  * Have icons.
  * Provide a navigation table.
  * Place strings in a `resources.resx` file. URLs and values should be hardcoded in the connector code and not be placed in the `resources.resx` file.

### Security

There are specific security considerations that your connector must handle.

* If `Extension.CurrentCredentials()` is used:
  * Is the usage required? If so, where do the credentials get sent to?
  * Are the requests guaranteed to be made through HTTPS?
    * You can use the [HTTPS enforcement helper function](helper-functions.md#validateurlscheme).
  * If the credentials are sent using `Web.Contents()` via GET:
    * Can it be turned into a POST?
    * If GET is required, the connector MUST use the `CredentialQueryString` record in the `Web.Contents()` options record to pass in sensitive credentials.

* If [Diagnostics.* functions](/powerquery-m/diagnostics-trace) are used:
  * Validate what is being traced; data **must not contain PII or large amounts of unnecessary data**.
  * If you implemented significant tracing in development, you should implement a variable or feature flag that determines if tracing should be on. This must be **turned off** prior to submitting for certification.

* If ```Expression.Evaluate()``` is used:
  * Validate where the expression is coming from and what it is (that is, can dynamically construct calls to `Extension.CurrentCredentials()` and so on).
  * The ```Expression``` should not be user provided nor take user input.
  * The ```Expression``` should not be dynamic (that is, retrieved from a web call).

## Registering for Certification

If you're interested in pursuing certification of your custom connector, ensure that your scenario and connector meet the [prerequisites](#prerequisites) and [requirements](#certification-requirements) outlined in this article. Failure to do so will cause delays in certification as our team will require you to fix any issues or inconsistencies prior to moving forward with certification.

Ensure that your connector is code complete and has been tested in both authoring in Power BI Desktop, and refreshing and consumption in Power BI Service. Ensure you have tested full end-to-end refresh in Power BI Service through the use of an on-premises data gateway.

To get started, complete our [registration form](https://forms.microsoft.com/Pages/ResponsePage.aspx?id=v4j5cvGGr0GRqy180BHbR2DcOSp0ibhKolmfRqZYZ51UN1MzQ0ZYNVlIMUM4MUQ1SUpPTEo3SFg1VC4u), and a Microsoft contact will reach out to begin the process.

## After Certification

After your connector has been certified and released through Power BI Desktop and Power BI Service, there are a few things that you should do to ensure you can correctly use the production-deployed publicly-available certified connector. 
* You and end users should use the certified connector version included in Power BI Desktop, and the on-premises data gateway, and remove any existing .mez or .pqx files (custom connectors) used prior to certification. Failure to do so may result in your testing custom connector being used by Power Query inadvertently instead of the newly certified connector.
* Custom connectors should only be used to test new versions of the connector.
* When working with end users and customers, ensure that they understand the custom connector version used in testing prior to certification should be removed after testing is complete and the new certified connector version is available.

## Template Apps (Recommended)

Once you've developed a connector to a data source, consider helping customers get up and running quickly by creating a [template app](/power-bi/service-template-apps-overview). A template app provides customers a prebuilt report connected to their data that they can use out-of-the-box or customize as necessary.

>[!NOTE]
>Template apps do not support connectors that require a gateway.
