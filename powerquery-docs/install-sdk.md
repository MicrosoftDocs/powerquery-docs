---
title: Develop a connector using the Power Query SDK
description: Using the Power Query SDK to create new Power Query connectors
author: ptyx507x

ms.topic: quickstart
ms.date: 9/16/2024
ms.author: miescobar
---

# Develop a connector using the Power Query SDK

The Power Query SDK is a set of tools designed to help you create Power Query connectors. These connectors are often referred to as custom connectors or Power Query extensions.

Custom connectors let you create new data sources or customize and extend an existing source. Common use cases include:

* Creating a business analyst-friendly view for a REST API.
* Providing branding for a source that Power Query supports with an existing connector (such as an OData service or ODBC driver).
* Implementing OAuth v2 authentication flow for a SaaS offering.
* Exposing a limited or filtered view over your data source to improve usability.
* Enabling DirectQuery for a data source using an ODBC driver.

## Installing the Power Query SDK

Install the Visual Studio Code Power Query SDK from the [Visual Studio Code section of the Visual Studio Marketplace](https://aka.ms/powerquerysdk). Select **Install** to install the SDK.

## Connector development process

The following sections describe, at a high level, the most common process to create a Power Query connector using the SDK.

### Creating a new extension

When creating a new workspace (Visual Studio Code Power Query SDK), you start with the following core files:

* Connector definition file (\<connectorName>.pq)
* A query file (\<connectorName>.query.pq)
* A string resource file (resources.resx)
* PNG files of various sizes used to create icons

Your connector definition file starts with an empty data source description. You can learn more about a data source in the context of the Power Query SDK from the article on [handling data access](HandlingDataAccess.md#data-source-kind).

### Testing

The Power Query SDK provides basic query execution capabilities, allowing you to test your extension without having to switch over to a different client application. You can further test your connector in an application such as:

* [Power BI Desktop](power-bi/connect-data/desktop-connector-extensibility)

#### Query test file

In addition to the extension file, Data Connector projects can have a query file (name.query.pq). This file can be used to run test queries within Visual Studio Code. The query evaluation will automatically include your extension code, without having to register your.pqx file, allowing you to call or test any shared functions in your extension code.

The query file can contain a single expression (for example, `HelloWorld.Contents()`), a `let` expression (such as what Power Query would generate), or a section document.

### Build and deploy

Building your project produces your .mez file or extension file. Power Query extensions are bundled in a ZIP file and given a .mez file extension. 

Extensions are defined within an M section document. A section document has a slightly different format from the query document(s) generated in Power Query. Code you import from Power Query typically requires modification to fit into a section document, but the changes are minor. Section document differences you should be aware of include:

* They begin with a section declaration (for example, `section HelloWorld;`).
* Each expression ends with a semi-colon (for example, `a = 1;` or `b = let c = 1 + 2 in c;`).
* All functions and variables are local to the section document, unless they're marked as shared. Shared functions become visible to other queries/functions, and can be thought of as the exports for your extension (that is, they become callable from Power Query).

More information about M section documents can be found in the [M Language specification](/powerquery-m/m-spec-sections).

## Distribution of Power Query connectors

You have 2 paths in which you can distribute your connector:
* Self-distribution
* Connector certification

### Self-distribution

A self-service mechanism where you can apply Power Query custom connectors in applicable product experiences

With your connector created, you can send this file as you wish to your users and they can use the connector in applicable product experiences such as Microsoft Power BI.

#### Microsoft Power BI
 You can use your own custom connector in the Microsoft Power BI Desktop and the Microsoft Power BI Service for Semantic models for refresh and connectivity in the cloud.

Power Query connectors can be loaded into two three experiences:
* **On-Premises Data Gateway**: Your connector can be loaded through the gateway to be used in the Microsoft Fabric and Microsoft Power BI services
* **Power Query Online**: within experiences such as Power BI Datamarts, Fabric Dataflow Gen2, and many others
* **Power Query Desktop**: within experiences like Power BI Desktop.

You can learn more about how to use your custom connector for self-distribution using the articles below:
* [Load a Power Query custom connector in Power BI Desktop](https://learn.microsoft.com/power-bi/connect-data/desktop-connector-extensibility)
* [Enable and use custom connectors in the Power BI Service](https://learn.microsoft.com/power-bi/connect-data/service-gateway-custom-connectors)

### Connector Certification

The Data Factory connector certification program allows you to submit your connector to Microsoft for certification where Microsoft takes care of publishing and distributing your connector within both Microsoft Fabric and Microsoft Power BI for applicable products and experiences:
* **Power Query Desktop**:  Microsoft Power BI Desktop.
* **Power Query Online**: Microsoft Fabric Dataflow Gen2, Microsoft Fabric Warehouse, Microsoft Power BI Datamarts, Microsoft Power BI Dataflow Gen1, and others
* **On-premises Data Gateway**: For both Microsoft Fabric and Microsoft Power BI that use a gateway for authenticated refresh or connectivity.

Learn more about the [Data Factory Connector Certification program](https://learn.microsoft.com/fabric/data-factory/connector-certification)

## More links and resources

* [M Library Functions](/powerquery-m/power-query-m-function-reference)
* [M Language Specification](/powerquery-m/power-query-m-language-specification)
* [Power BI Developer Center](https://powerbi.microsoft.com/developers/)
* [Data Connector Tutorial](samples/trippin/readme.md)
