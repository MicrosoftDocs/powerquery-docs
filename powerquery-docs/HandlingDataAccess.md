---
title: Handling Data Access
description: How to use connectors to access data using M data source functions
author: ptyx507x
ms.topic: conceptual
ms.date: 8/3/2022
ms.author: miescobar
---

# Handling Data Access

## Data Source Functions

A Data Connector wraps and customizes the behavior of a [data source function in the M Library](/powerquery-m/odbc-datasource).
For example, an extension for a REST API would make use of the [Web.Contents](/powerquery-m/web-contents) function to make HTTP requests.
Currently, a limited set of data source functions have been enabled to support extensibility.

- [Web.Contents](/powerquery-m/web-contents)
- [OData.Feed](/powerquery-m/odata-feed)
- [Odbc.DataSource](/powerquery-m/odbc-datasource)
- [AdoDotNet.DataSource](/powerquery-m/adodotnet-datasource)
- [OleDb.DataSource](/powerquery-m/oledb-datasource)

**Example:**

```
[DataSource.Kind="HelloWorld", Publish="HelloWorld.Publish"]
shared HelloWorld.Contents = (optional message as text) =>
    let
        message = if (message <> null) then message else "Hello world"
    in
        message;
```

## Data Source Kind

Functions marked as `shared` in your extension can be associated with a specific data source by including a `DataSource.Kind` literal attribute on the function with the name of a Data Source definition record. 
The Data Source record defines the authentication types supported by your data source, and basic branding information (like the display name / label).
The name of the record becomes its unique identifier. 

Each function associated with the same data source must have the same required function parameters, including name, type, and order. (For purposes of Data Source Kind, a parameter is not considered required if it is marked `optional` or if its metadata contains `DataSource.Path = false`.)

Functions for a specific Data Source Kind can only use credentials associated with that Kind.
Credentials are identified at runtime by performing a lookup based on the combination of the function's required parameters.
For more information about how credentials are identified, see [Data Source Paths](HandlingAuthentication.md#data-source-paths).

**Example:**

```
HelloWorld = [
    Authentication = [
        Implicit = []
    ],
    Label = Extension.LoadString("DataSourceLabel")
];
```

### Properties

The following table lists the fields for your Data Source definition record.

| Field              | Type     | Details |
|:-------------------|:---------|:-----------------------------------------|
| Authentication     | record   | Specifies one or more types of authentication supported by your data source. At least one kind is required. Each kind will be displayed as an option in the Power Query credential prompt. For more information, see [Authentication Kinds](HandlingAuthentication.md#authentication-kinds). |
| Label              | text     | **(optional)** Friendly display name for this extension in credential dialogs. |
| SupportsEncryption | logical  | **(optional)** When true, the UI will present the option to connect to the data source using an encrypted connection. This is typically used for data sources with a non-encrypted fallback mechanism (generally ODBC or ADO.NET based sources). |
| | | |


## Publish to UI

Similar to the [Data Source](#data-source-kind) definition record, the Publish record provides the Power Query UI the information it needs to expose this extension in the **Get Data** dialog.

**Example:**

```
HelloWorld.Publish = [
    Beta = true,
    ButtonText = { Extension.LoadString("FormulaTitle"), Extension.LoadString("FormulaHelp") },
    SourceImage = HelloWorld.Icons,
    SourceTypeImage = HelloWorld.Icons
];

HelloWorld.Icons = [
    Icon16 = { Extension.Contents("HelloWorld16.png"), Extension.Contents("HelloWorld20.png"), Extension.Contents("HelloWorld24.png"), Extension.Contents("HelloWorld32.png") },
    Icon32 = { Extension.Contents("HelloWorld32.png"), Extension.Contents("HelloWorld40.png"), Extension.Contents("HelloWorld48.png"), Extension.Contents("HelloWorld64.png") }
];
```

### Properties

The following table lists the fields for your Publish record.

| Field               | Type    | Details |
|:--------------------|:--------|:-----------------------------------------|
| ButtonText          | list    | List of text items. The first item defines the name displayed next to the data source's icon in the Power BI **Get Data** dialog. The second item (optional) defines the tool tip that will be displayed when the preceding name is moused-over. |
| Category            | text    | Where the extension should be displayed in the **Get Data** dialog. Currently the only category values with special handing are `Azure` and `Database`. All other values will end up under the Other category. |
| Beta                | logical | **(optional)** When set to true, the UI will display a Preview/Beta identifier next to your connector name and a warning dialog that the implementation of the connector is subject to breaking changes. |
| LearnMoreUrl        | text    | **(optional)** Url to website containing more information about this data source or connector. |
| SupportsDirectQuery | logical | **(optional)** Enables Direct Query for your extension. |
| SourceImage         | record  | **(optional)** A record containing a list of binary images (sourced from the extension file using the **Extension.Contents** method). The record contains two fields (Icon16, Icon32), each with its own list. Each icon should be a different size. |
| SourceTypeImage     | record  | **(optional)** Similar to SourceImage, except the convention for many out of the box connectors is to display a sheet icon with the source specific icon in the bottom right corner. Having a different set of icons for SourceTypeImage is optional&mdash;many extensions simply reuse the same set of icons for both fields. |
| | | |
