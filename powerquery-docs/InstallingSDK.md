---
title: Installing the Power Query SDK
description: Installation and explanation of the Power Query SDK and how to use Custom Connectors
author: ptyx507x

ms.topic: quickstart
ms.date: 9/12/2022
ms.author: miescobar
---

# Installing the Power Query SDK

The Power Query SDK is a set of tools designed to help you create Power Query connectors. These connectors are often referred to as custom connectors or Power Query extensions.

There are currently two versions of the Power Query SDK available:

* **Visual Studio Power Query SDK**: Released in 2017 and its an extension for Visual Studio 2017 and 2019
* **Visual Studio Code Power Query SDK (Preview)**: Released in 2022 is the new and recommended way to create Power Query connectors.

## Visual Studio Power Query SDK

1. Install the [Power Query SDK](https://aka.ms/powerquerysdk) from the Visual Studio Marketplace.
2. Create a new data connector project.
3. Define your connector logic.
4. Build the project to produce an extension file.
 
![Preview Feature.](images/newProject.png)


## Visual Studio Code Power Query SDK (Preview)

>[!NOTE]
>This new Power Query SDK is currently in public preview as of September of 2022.

The new Power Query SDK can be installed in Visual Studio Code as a Visual Studio Code extension. During the installation process, the extension will try to download and load some dependencies in order to provide the full functionality.

Follow the steps found in the [official GitHub repository](https://github.com/Microsoft/vscode-powerquery-sdk) for the VIsual Studio Code Power Query SDK to install and provide feedback.

## Connector development process

While you can use either the Visual Studio Code or the Visual Studio SDK, both use a similar process for the development of a connector at a high-level.

The following sections describe at a high-level the most common process to create a Power Query connector using the SDK.

### Creating a new extension 

When creating a new project (Visual Studio Power Query SDK) or a new workspace (Visual Studio Code Power Query SDK), you start with the following files:

* Connector definition file (\<connectorName>.pq)
* A query file (\<connectorName>.query.pq)
* A string resource file (resources.resx)
* PNG files of various sizes used to create icons

Your connector definition file will start with an empty Data Source description. You can learn more information about a Data Source in the context of the Power Query SDK from the the article on [handling data access](/powerquery-docs/HandlingDataAccess.md#data-source-kind).

### Testing

The Power Query SDK provides basic query execution capabilities, allowing you to test your extension without having to switch over to Power BI Desktop.

#### Additional query test file

In addition to the extension file, Data Connector projects can have a query file (name.query.pq). This file can be used to run test queries within Visual Studio. The query evaluation will automatically include your extension code, without having to register your .pqx file, allowing you to call/test any shared functions in your extension code.

The query file can contain a single expression (for example, `HelloWorld.Contents()`), a `let` expression (such as what Power Query would generate), or a section document.

### Build and deploy

Building your project will produce your .mez file or extension file.

Power Query extensions are bundled in a ZIP file and given a .mez file extension. At runtime, Power BI Desktop will load extensions from the [Documents]\Microsoft Power BI Desktop\Custom Connectors.

>[!NOTE]
> Data Connector projects don't support custom post build steps to copy the extension file to your [Documents]\Microsoft Power BI Desktop\Custom Connectors directory. If this is something you want to do, you may want to use a third party extension.

Extensions are defined within an M section document. A section document has a slightly different format from the query document(s) generated in Power Query. Code you import from Power Query typically requires modification to fit into a section document, but the changes are minor. Section document differences you should be aware of include:

* They begin with a section declaration (for example, `section HelloWorld;`).
* Each expression ends with a semi-colon (for example, `a = 1;` or `b = let c = 1 + 2 in c;`).
* All functions and variables are local to the section document, unless they are marked as shared. Shared functions become visible to other queries/functions, and can be thought of as the exports for your extension (that is, they become callable from Power Query).

More information about M section documents can be found in the [M Language specification](https://docs.microsoft.com/powerquery-m/m-spec-sections).

## Enabling custom connectors in Power BI Desktop

1. Copy the extension file into [Documents]/Power BI Desktop/Custom Connectors.
2. Check the option **(Not Recommended) Allow any extension to load without validation or warning** in Power BI Desktop (under *File | Options and settings | Options | Security | Data Extensions*).
3. Restart Power BI Desktop.
4. Open the Get Data dialog and search for your custom connector in the list.

## Distribution of Data Connectors

Power BI Desktop users can download extension files and place them in a known directory (steps described in previous section). Power BI Desktop will automatically load the extensions on restart.

Alternatively, as the owner of the data source and connector, you can submit your connector through the [Power Query Connector Certification](/powerquery-docs/ConnectorCertification.md) so it ships with Power BI Desktop on every release.

## Additional links and resources

* [M Library Functions](/powerquery-m/power-query-m-function-reference)
* [M Language Specification](/powerquery-m/power-query-m-language-specification)
* [Power BI Developer Center](https://powerbi.microsoft.com/developers/)
* [Data Connector Tutorial](samples/TripPin/README.md)
