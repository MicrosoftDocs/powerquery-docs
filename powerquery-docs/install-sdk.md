---
title: Develop a connector using the Power Query SDK
description: 
author: ptyx507x

ms.topic: quickstart
ms.date: 5/15/2024
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

While you can use either the Visual Studio Code or the Visual Studio Power Query SDK, both use a similar process for the development of a connector at a high level.

The following sections describe, at a high level, the most common process to create a Power Query connector using the SDK.

### Creating a new extension

When creating a new project (Visual Studio Power Query SDK) or a new workspace (Visual Studio Code Power Query SDK), you start with the following core files:

* Connector definition file (\<connectorName>.pq)
* A query file (\<connectorName>.query.pq)
* A string resource file (resources.resx)
* PNG files of various sizes used to create icons

Your connector definition file will start with an empty data source description. You can learn more about a data source in the context of the Power Query SDK from the article on [handling data access](HandlingDataAccess.md#data-source-kind).

### Testing

The Power Query SDK provides basic query execution capabilities, allowing you to test your extension without having to switch over to Power BI Desktop.

#### Query test file

In addition to the extension file, Data Connector projects can have a query file (name.query.pq). This file can be used to run test queries within Visual Studio. The query evaluation will automatically include your extension code, without having to register your.pqx file, allowing you to call or test any shared functions in your extension code.

The query file can contain a single expression (for example, `HelloWorld.Contents()`), a `let` expression (such as what Power Query would generate), or a section document.

### Build and deploy

Building your project produces your .mez file or extension file.

Power Query extensions are bundled in a ZIP file and given a .mez file extension. At runtime, Power BI Desktop loads extensions from [Documents]\Microsoft Power BI Desktop\Custom Connectors.

>[!NOTE]
> Data Connector projects don't support custom post build steps to copy the extension file to your [Documents]\Microsoft Power BI Desktop\Custom Connectors directory. If this is something you want to do, you might want to use a third party extension.

Extensions are defined within an M section document. A section document has a slightly different format from the query document(s) generated in Power Query. Code you import from Power Query typically requires modification to fit into a section document, but the changes are minor. Section document differences you should be aware of include:

* They begin with a section declaration (for example, `section HelloWorld;`).
* Each expression ends with a semi-colon (for example, `a = 1;` or `b = let c = 1 + 2 in c;`).
* All functions and variables are local to the section document, unless they're marked as shared. Shared functions become visible to other queries/functions, and can be thought of as the exports for your extension (that is, they become callable from Power Query).

More information about M section documents can be found in the [M Language specification](/powerquery-m/m-spec-sections).

## Distribution of data connectors

Power Query connectors can be used in Power BI Desktop or the Power Query Online experience, such as Power BI dataflows, Power BI datamarts, and other experiences.

### Power BI Desktop

Power BI Desktop users can follow the steps below to consume a Power Query custom connector:

1. Copy the extension file (.mez or.pqx) into [Documents]/Power BI Desktop/Custom Connectors.
2. In Power BI Desktop, select the **(Not Recommended) Allow any extension to load without validation or warning** option under **File** > **Options and settings** > **Options** > **Security** > **Data Extensions**.
3. Restart Power BI Desktop.

Power BI Desktop will automatically load the extensions on restart.

Alternatively, as the owner of the data source and connector, you can submit your connector to the [Power Query Connector Certification](ConnectorCertification.md) program so it ships with Power BI Desktop on every release.

### Power Query Online

Only Power Query certified connectors are shown in the Power Query Online experience. To learn more about the Power Query connector certification program, go to [Power Query Connector Certification](ConnectorCertification.md).

## More links and resources

* [M Library Functions](/powerquery-m/power-query-m-function-reference)
* [M Language Specification](/powerquery-m/power-query-m-language-specification)
* [Power BI Developer Center](https://powerbi.microsoft.com/developers/)
* [Data Connector Tutorial](samples/trippin/readme.md)
