---
title: Enabling DirectQuery for an ODBC-based Power Query connector
description: Provides an overview of how to use DirectQuery for an ODBC-based Power Query connector
author: ptyx507x
ms.topic: concept-article
ms.date: 8/20/2024
ms.author: miescobar
ms.subservice: custom-connectors
---

# Enabling DirectQuery for an ODBC-based connector

Using M's built-in [Odbc.DataSource](/powerquery-m/odbc-datasource) function is the recommended way to create custom connectors for data sources that have an existing ODBC driver and/or support a SQL query syntax. Wrapping the [Odbc.DataSource](/powerquery-m/odbc-datasource) function allows your connector to inherit default query folding
behavior based on the capabilities reported by your driver. This behavior enables the M engine to generate SQL statements based on filters and other transformations defined by the user within the Power Query experience, without having to provide this logic within the connector itself.

ODBC extensions can optionally enable DirectQuery mode, allowing Power BI to dynamically generate queries at runtime without precaching the user's data model.

> [!NOTE]
> Enabling DirectQuery support raises the difficulty and complexity level of your connector. When DirectQuery is enabled, Power BI prevents the M engine from compensating for operations that can't be fully pushed to the underlying data source.

This article assumes familiarity with the creation of a basic custom connector.

Refer to the [SqlODBC sample](https://github.com/Microsoft/DataConnectors/tree/master/samples/ODBC/SqlODBC) for most of the code examples in the following sections. Other samples can be found in the ODBC samples directory.

## ODBC extensibility functions

The M engine provides two ODBC-related data source functions: [Odbc.DataSource](/powerquery-m/odbc-datasource) and [Odbc.Query](/powerquery-m/odbc-query).

The [Odbc.DataSource](/powerquery-m/odbc-datasource) function provides a default navigation table with all databases, tables, and views from your system. This function also supports query folding, and allows for a range of customization options. Most ODBC-based extensions use this function as their primary extensibility function. The function accepts two arguments&mdash;a connection string, and an options record to provide behavior overrides.

The [Odbc.Query](/powerquery-m/odbc-query) function allows you to execute SQL statements through an ODBC driver. It acts as a passthrough for query execution. Unlike the [Odbc.DataSource](/powerquery-m/odbc-datasource) function, it doesn't provide query folding functionality, and requires that SQL queries be provided by the connector (or end user). When you build a custom connector, this function is typically used internally to run queries to retrieve metadata that might not be exposed through regular ODBC channels. The function accepts two arguments&mdash;a connection string, and a SQL query.

## Data source function guidelines

Custom connectors can accept any number of function arguments. But to remain consistent with the built-in data source functions shipped with Power Query, the following guidelines are recommended:

- Require the minimal set of parameters used to establish a connection to your server. The fewer parameters end users need to provide, the easier your connector is to use.

- Although you can define parameters with a fixed number of values (for example, a dropdown list in the UI), parameters are entered before the user is authenticated. Any values that can be discovered programmatically after the user is authenticated (such as catalog or database name) should be selectable through the Navigator. The default behavior for the [Odbc.DataSource](/powerquery-m/odbc-datasource) function is to return a hierarchical navigation table consisting of Catalog (Database), Schema, and Table names. However, this behavior can be overridden within your connector.

- If you feel your users typically know what values to enter for items they would select from the Navigator (such as the database name), make these parameters optional. Parameters that can be discovered programmatically shouldn't be made required.

- The last parameter for your function should be an optional record called "options". This parameter typically allows advanced users to set common ODBC-related properties (such as `CommandTimeout`), set behavior overrides specific to your connector, and allows for future extensibility without impacting backwards compatibility for your function.

- Security/credential related arguments MUST never be part of your data source function parameters, as values entered in the connect dialog are persisted to the user's query. Credential-related parameters should be specified as part of the connector's supported Authentication methods.

By default, all required parameters for your data source function are factored into the Data Source Path value used to identify user credentials.

While the UI for the built-in [Odbc.DataSource](/powerquery-m/odbc-datasource) function provides a dropdown that allows the user to select a DSN, this functionality isn't available through extensibility. If your data source configuration is complex enough to require a fully customizable configuration dialog, we recommend that you require your end users to preconfigure a system DSN, and have your function take in the DSN name as a text field.

## Related content

- [Parameters for Odbc.DataSource](odbc-parameters.md)
