---
title: Connector Certification
description: Guidelines on connector certification and implementation requirements
author: cpopell

ms.service: powerquery
ms.topic: conceptual
ms.date: 12/10/2019
ms.author: gepopell

LocalizationGroup: reference
---

# Connector Certification

When developing a custom connector, or if you've been given one by another developer or vendor, you'll notice that they require you to lower the security settings in Power BI to use them. This is due to the fact that M is a versatile language that (as seen in [Handling Authentication](HandlingAuthentication.md)) has the capacity to interact with stored credentials. This means that we needed to give end users a way to only allow certified connectors to run.

The 'Connector Certification' program is a program in which Microsoft works with vendors to extend the data connectivity capabilities of Power BI.

Certified connectors are:

* Certified by Microsoft
* Distributed by Microsoft
* Maintained by the developer
* Supported by the developer

We work with vendors to try to make sure that they have support in maintenance, but customer issues with the connector itself will be directed to the developer.

We have a certain set of requirements for certification. We recognize that not every developer can meet these requirements, and as above we're hoping to introduce a feature set that will handle their needs in short order.

Cut-off dates for certification are:
* Notification of a submission on the 15th of the month, two months before the targeted Power BI desktop release. In other words for April Power BI, the cut-off is February 15th.
* Submission must be done by the 1st of the month before the targeted Power BI desktop release. For April Power BI, the cut-off for submission would be March 1st.
* Technical review must be passed by the 15th of the month before the targeted Power BI desktop release. For April Power BI, the cut-off for technical review would be March 15th.

Due to backlogs, delays, rearchitecture, and testing issues, we highly recommend a long lead time for your initial release, and to very carefully read our requirements below. If you feel like your connector is important to deliver to a few connectors with minimal overhead, we recommend self signing and providing it that way.

## Certification Requirements

### Before starting
* Developer must own the data source or have recorded permission from the owner of the data source to develop a connector for it.
* The connector must be for a public product.
* The developer must provide an estimate for usage. We suggest that developers of connectors for very boutique products use our Connector Signing capabilities and provide them directly to the customer.
* Developer must submit to the Connector Certification Portal. In the future this will be available via standard Microsoft ISV channels. Currently you are required to reach out to dataconnectors@microsoft.com first to connect with the team.
  
### Artifacts
* PBIX file
  * Report should contain one or more queries to test each item in their navigation table.
  * If you don't have a set schema (as an example, databases), you should include a query for each 'type' of table you're concerned with.
* .mez file
  * The .mez file should follow style standards. For example, use Product.mez rather than Product_PowerBI_Connector.mez.
* Test account
  * The test account will be reused whenever we're troubleshooting or certifying updates, so if you have a persistent test account it would be best to find a way to share this.
* Link to external dependencies (ODBC drivers, for example)
* Documentation on how to use the connector if needed

### Features and Style
* Connector MUST use Section document format
* Connector MUST have [Version adornment](HandlingVersioning.md) on section
* Connector MUST provide function documentation metadata
* Connector MUST have [TestConnection handler](HandlingGatewaySupport.md)
* Connector MUST follow naming conventions (DataSourceKind.FunctionName)
* FunctionName should make sense for their domain - generally "Contents", "Tables", "Document", "Databases" …
* Connector SHOULD have icons
* Connector SHOULD provide a navigation table
* Connector SHOULD place strings in resources.resx file
 
### Security
* If using Extension.CurrentCredentials() …
  * Is the usage required? If so, where do the credentials get sent to?
  * Are the requests guaranteed to be made through HTTPS?
    * You can use the [HTTPS enforcement helper function](HelperFunctions.md#validateurlscheme).
  * If the credentials are sent using Web.Contents() via GET …
    * Can it be turned into a POST?
    * If GET is required, connector MUST use the CredentialQueryString record in the Web.Contents() options record to pass in sensitive credentials
* If [Diagnostics.* functions](https://docs.microsoft.com/powerquery-m/diagnostics-trace) are used …
  * Validate what is being traced&mdash;it MUST NOT
    * Contain PII
    * Contain large amounts of data
  * If you implemented significant tracing in development, you should attach it to a variable that checks if tracing should be on or not, and you should turn it off before shipping.
* If Expression.Evaluate() is used …
  * Validate where the expression is coming from / what it is (that is, can dynamically construct calls to Extension.CurrentCredentials(), and so on …
  * Expression should not be user provided / take user input
  * Expression should not be dynamic (i.e. retrieved from a web call)

## Getting your connector certified

If you'd like to reach out about connector certification, please contact us at dataconnectors@microsoft.com.
