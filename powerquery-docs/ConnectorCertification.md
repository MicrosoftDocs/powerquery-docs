---
title: Power Query Connector Certification
description: Guidelines on connector certification and implementation requirements for Power Query custom connectors
author: bezhan-msft

ms.service: powerquery
ms.topic: conceptual
ms.date: 10/13/2020
ms.author: bezhan
ms.custom: intro-internal

LocalizationGroup: reference
---

# Power Query Connector Certification

> [!Note]
> This article describes the requirements and process to submit a Power Query custom connector for certification. Read the entire article closely before starting the certification process.

## Introduction

Certifying a Power Query custom connector makes the connector available publicly, out-of-box, within Power BI Desktop. Certification is governed by Microsoft's Connector Certification Program, where Microsoft works with partner developers to extend the data connectivity capabilities of Power BI.

Certified connectors are:

* Maintained by the partner developer

* Supported by the partner developer

* Certified by Microsoft

* Distributed by Microsoft

We work with partners to try to make sure that they have support in maintenance, but customer issues with the connector itself will be directed to the partner developer.

Certified connectors are bundled out-of-box in Power BI Desktop. Custom connectors need to be loaded in Power BI Desktop, as described in [Loading your extension in Power BI Desktop](samples/TripPin/1-OData/README.md#loading-your-extension-in-power-bi-desktop). Both can be refreshed through Power BI Desktop or Power BI Service through using an on-premises data gateway by implementing a [TestConnection](samples/trippin/9-testconnection/readme.md).

Certified connectors with a `TestConnection` implementation also support end-to-end refresh through the cloud (Power BI Service) without the need of an on-premises data gateway. The Power BI service environment essentially hosts a “cloud gateway” that runs similar to the on-premises gateway. After certification, we will deploy your connector to this environment so that it's available to all Power BI customers. There are additional requirements for connectors that need to use additional components, such as an ODBC-based driver. Be sure to reach out to your Microsoft contact if your connector requires the use of additional components.

## Custom Connector Security and Signing

As M is a versatile language that, as seen in [Handling Authentication](HandlingAuthentication.md), has the capacity to interact with stored credentials, we need to give users a way to only allow trusted connectors to run.

From a developer's perspective, developers need to [self-sign](./handlingconnectorsigning.md) their custom connector and provide their users with the information (thumbprint) to securely load it.

From a user's perspective, users need to use the thumbprint from the developer to securely [trust and load the custom connector](/power-bi/connect-data/desktop-trusted-third-party-connectors) for use. Alternatively, users can opt to lower their security settings to allow loading of code not certified by Microsoft or another developer, but this is not recommended.

## Certification Overview

### Prerequisites

To ensure the best experience for our customers, we only consider connectors that meet a set of prerequisites for certification: 

* The connector must be for a public product.

* The connector must be considered code-complete for a initial release version. The program allows for frequent iterations and updates. Please note that Microsoft does not directly offer technical consulting for development of custom connectors, however as part of the program, Microsoft can recommend resources for developers to further engage with. Once registered with the program below, reach out to your Microsoft contact to learn more.

* The developer must provide an estimate for usage. We suggest that developers of connectors for very boutique products use our [connector self-signing capabilities](#custom-connector-security-and-signing) to provide them directly to the customer.

* The connector must be already made available to customers directly to fulfill a user need or business scenario. This can be done using a Private Preview program by distributing the completed connector directly to end users and organizations through [self-signing](#custom-connector-security-and-signing). Each user or organization should be able to provide feedback and validation that there is a business need for the connector and that the connector is working sucessfully to fulfill their business requirements. 

* The connector must be working successfully at an anticipated level of usage by customers.

* There must be a thread in the [Power BI Ideas forum](https://ideas.powerbi.com/) driven by customers to indicate demand to make the connector publicly available in Power BI Desktop. There is no set threshold of engagement, however the more engagement, the stronger the evidenced demand for the connector.

These prerequisites exist to ensure that connectors undergoing certification have significant customer and business need to be used and supported post-certification. 

### Process and Timelines

Certified connectors are released with monthly Power BI Desktop releases, so the deadlines for each release work back from each Power BI Desktop release date. The expected duration of the certification process from registration to release varies depending on the quality and complexity of the connector submission, and is outlined in the following steps:
* **Registration**: notification of intent to certify your custom connector. This must occur by the 15th of the month, two months before the targeted Power BI desktop release.
  * For example, for the April Power BI Desktop release, the deadline would be February 15th. 

* **Submission**: submission of connector files for Microsoft review. This must occur by the 1st of the month before the targeted Power BI desktop release.
  * For example, for the April Power BI Desktop release, the deadline would be March 1st.

* **Technical Review**: finalization of the connector files, passing Microsoft review and certification. This must occur by the 15th of the month before the targeted Power BI Desktop release.
  * For example, for the April Power BI Desktop release, the deadline would be March 15th.

Due to the complexity of the technical reviews and potential delays, rearchitecture, and testing issues, we highly recommend submitting early with a long lead time for the initial release and certification. If you feel like your connector is important to deliver to a few customers with minimal overhead, we recommend [self-signing](#custom-connector-security-and-signing) and providing it that way.

## Certification Requirements

We have a certain set of requirements for certification. We recognize that not every developer can meet these requirements, and we're hoping to introduce a feature set that will handle developer needs in short order.
  
### Submission Files (Artifacts)

Please ensure the connector files that you submit include all of the following:

* Connector (.mez) file
  * The .mez file should follow style standards and be named similarly to the product or service name. It should not include words like "Power BI", "Connector" or "API". 
  * Name the .mez file: ```ProductName.mez```

* Power BI Desktop (.pbix) file for testing
  * We require a sample Power BI report (.pbix) to test your connector with.
  * The report should include at least one query to test each item in your navigation table.
  * If there's no set schema (for example, databases), the report needs to include a query for each "type" of table that the connector may handle. 

* Test account to your data source
  * We will use the test account to test and troubleshoot your connector.
  * Provide a test account that is persistent, so we can use the same account to certify any future updates.

* Testing instructions
  * Provide any documentation on how to use the connector and test its functionality.

* Links to external dependencies (for example, ODBC drivers)

### Features and Style

The connector must follow a set of feature and style rules to meet a usability standard consistent with other certified connectors. 

* The connector MUST:

   * Use Section document format.
   * Have [version adornment](HandlingVersioning.md) on section.
   * Provide [function documentation metadata](HandlingDocumentation.md).
   * Have [TestConnection handler](HandlingGatewaySupport.md).
   * Follow naming conventions (for example, `DataSourceKind.FunctionName`). It should not include words like "Power BI", "Connector" or "API". 

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
    * You can use the [HTTPS enforcement helper function](HelperFunctions.md#validateurlscheme).
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

Ensure that your connector is code complete and has been tested in both authoring in Power BI Desktop and refreshing and consumption in Power BI Service. Ensure you have tested full end-to-end refresh in Power BI Service through the use of an on-premises data gateway. 

To get started, complete our [registration form](https://forms.microsoft.com/Pages/ResponsePage.aspx?id=v4j5cvGGr0GRqy180BHbR2DcOSp0ibhKolmfRqZYZ51UN1MzQ0ZYNVlIMUM4MUQ1SUpPTEo3SFg1VC4u), and a Microsoft contact will reach out to begin the process.

## Template Apps (Recommended)

Once you've developed a connector to a data source, consider helping customers get up and running quickly by creating a [template app](/power-bi/service-template-apps-overview). A template app provides customers a prebuilt report connected to their data that they can use out-of-the-box or customize as necessary.

>[!NOTE]
>Template apps do not support connectors that require a gateway.
