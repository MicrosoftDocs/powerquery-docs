---
title: Connector Certification
description: Guidelines on connector certification and implementation requirements
author: cpopell
manager: kfile
ms.reviewer: ''

ms.service: powerquery
ms.component: power-query
ms.topic: conceptual
ms.date: 08/16/2018
ms.author: gepopell

LocalizationGroup: reference
---

# Connector Certification

When developing a custom connector, or if you've been given one by another developer or vendor, you'll notice that they require you to lower the security settings in Power BI to use them. This is due to the fact that M is a versatile language that (as seen in [Handling Authentication](HandlingAuthentication.md)) has the capacity to interact with stored credentials. This means that we needed to give end users a way to only allow certified connectors to run.

While we are working on a way to give vendors and IT departments a way to handle signing connectors with a certificate independent of Microsoft, in the mean time we have the 'Connector Certification' program.

The 'Connector Certification' program, which will start GA in October 2018, is a program in which Microsoft works with vendors to extend the data connectivity capabilities of Power BI.

Certified connectors are:

* Certified by Microsoft
* Distributed by Microsoft
* Maintained by the developer
* Supported by the developer

We work with vendors to try to make sure that they have support in maintenance, but customer issues with the connector itself will be directed to the developer.

We have a certain set of requirements for certification. We recognize that not every developer can meet these requirements, and as above we're hoping to introduce a feature set that will handle their needs in short order.

## Certification Requirements

### Before starting
* Developer must own the data source or have recorded permission from the owner of the data source to develop a connector for it.
* Developer must sign an NDA
* Developer must sign a business partner agreement with our team
* Data source must not be an internal only data source
  
### Artifacts
* PBIX file
  * Report should contain one or more queries to test each item in their navigation table
* .mez file
* Test account
* Link to external dependencies (ODBC driver)
* Documentation on how to use the connector if needed
 
### Security
* If using Extension.CurrentCredentials() …
  * Is the usage required? If so, where do the credentials get sent to?
  * Are the requests guaranteed to be made via HTTPS?
  * If the credentials are sent using Web.Contents() via GET …
    * Can it be turned into a POST?
    * If GET is required, connector MUST use the CredentialQueryString record in the Web.Contents() options record to pass in sensitive credentials
* If Diagnostics.* functions are used …
  * Validate what is being traced - it MUST NOT
    * Contain PII
    * Contain large amounts of data
* If Expression.Evaluate() is used …
  * Validate where the expression is coming from / what it is (i.e. can dynamically construct calls to Extension.CurrentCredentials() etc…
  * Expression should not be user provided / take user input
  * Expression should not be dynamic (i.e. retrieved from a web call)
  
### Features and Style
* Connector MUST use Section document format
* Connector MUST have Version adornment on section
* Connector MUST provide function documentation metadata
* Connector MUST have TestConnection handler
* Connector MUST follow naming conventions (DataSourceKind.FunctionName)
* FunctionName should make sense for their domain - generally "Contents", "Tables", "Document", "Databases" …
* Connector SHOULD have icons
* Connector SHOULD provide a navigation table
* Connector SHOULD place strings in resources.resx file

## Getting your connector certified

If you'd like to reach out about connector certification, please contact us at dataconnectors@microsoft.com

## Community Connectors and Office Store

While we don't currently have an ETA for support in the Office Store, we are looking at the problem. We're also examining support for a way to list 'community connectors' in a sanctioned, central, Microsoft website.
