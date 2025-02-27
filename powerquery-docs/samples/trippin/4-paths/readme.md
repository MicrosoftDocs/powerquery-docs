---
title: TripPin 4 - Data Source Paths
description: Improving the navigation table of your TripPin REST connector
author: ptyx507x
ms.topic: tutorial
ms.date: 5/17/2024
ms.author: miescobar
ms.subservice: custom-connectors
---

# TripPin part 4 - Data source paths

This multi-part tutorial covers the creation of a new data source extension for Power Query. The tutorial is meant to be done sequentially&mdash;each lesson builds on the connector created in previous lessons, incrementally adding new capabilities to your connector.

In this lesson, you will:

> [!div class="checklist"]
> * Simplify the connection logic for your connector
> * Improve the navigation table experience

This lesson simplifies the connector built in the [previous lesson](../3-NavTables/README.md) by removing its required function parameters, and improving the user experience by moving to a dynamically generated navigation table.

For an in-depth explanation of how credentials are identified, see the [Data Source Paths section](../../../HandlingAuthentication.md#data-source-paths) of [Handling Authentication](../../../HandlingAuthentication.md).

## Data source paths

When invoking a [data source function](../../../HandlingDataAccess.md#data-source-functions), the M engine identifies which credentials to use during an evaluation by doing a lookup based on the [Data Source Kind](../../../HandlingDataAccess.md#data-source-kind) and [Data Source Path](../../../HandlingAuthentication.md#data-source-paths) values.

In the [previous lesson](../3-navtables/readme.md) you shared two data source functions, both with a single *Uri.Type* parameter.

```powerquery-m
[DataSource.Kind="TripPin"]
shared TripPin.Feed = Value.ReplaceType(TripPinImpl, type function (url as Uri.Type) as any);

[DataSource.Kind="TripPin", Publish="TripPin.Publish"]
shared TripPin.Contents =  Value.ReplaceType(TripPinNavTable, type function (url as Uri.Type) as any);
```

The first time you run a query that uses one of the functions, you'll receive a credential prompt with drop downs that lets you select a path and an authentication type.

![Credentials with Paths.](../../media/trippin4-paths.png)

If you run the same query again, with the same parameters, the M engine is able to locate the cached credentials, and no credential prompt is shown. If you modify the `url` argument to your function so that the base path no longer matches, a new credential prompt is displayed for the new path.

You can see any cached credentials on the Credentials table in the **M Query Output** window.

![Credentials tab.](../../media/trippin4-credentials-tab.png)

Depending on the type of change, modifying the parameters of your function will likely result in a credential error. 

## Simplifying the connector

You'll now simplify your connector by removing the parameters for your data source function (`TripPin.Contents`). You'll also remove the `shared` qualifier for `TripPin.Feed`, and leave it as an internal-only function. 

One of the design philosophies of Power Query is to keep the initial data source dialog as simple as possible. If at all possible, you should provide the user with choices at the Navigator level, rather on the connection dialog.
If a user provided value can be determined programmatically, consider adding it as the top level of your navigation table rather than a function parameter.

For example, when connecting to a relational database, you might need server, database, and table names.
Once you know the server to connect to, and credentials have been provided, you could use the database's API to fetch a list of databases, and a list of tables contained within each database.
In this case, to keep your initial connect dialog as simple as possible, only the server name should be a required parameter&mdash;`Database` and `Table` would be levels of your navigation table.

Since the TripPin service has a fixed URL endpoint, you don't need to prompt the user for any values. You'll remove the *url* parameter from your function, and define a *BaseUrl* variable in your connector.

```powerquery-m
BaseUrl = "https://services.odata.org/v4/TripPinService/";

[DataSource.Kind="TripPin", Publish="TripPin.Publish"]
shared TripPin.Contents = () => TripPinNavTable(BaseUrl) as table;
```

You'll keep the `TripPin.Feed` function, but no longer make it shared, no longer associate it with a Data Source Kind, and simplify its declaration. From this point on, you'll only use it internally within this section document.

```powerquery-m
TripPin.Feed = (url as text) =>
    let
        source = Web.Contents(url, [ Headers = DefaultRequestHeaders ]),
        json = Json.Document(source)
    in
        json;
```

If you update the `TripPin.Contents()` call in your `TripPin.query.pq` file and run it in Visual Studio Code, you'll see a new credential prompt. Note that there's now a single Data Source Path value&mdash;TripPin.

![Credentials with no path.](../../media/trippin4-new-prompt.png)

## Improving the navigation table

In the [first tutorial](../1-odata/readme.md) you used the built-in `OData` functions to connect to the TripPin service.
This gave you a nice looking navigation table, based on the TripPin service document, with no more code on your side.
The [OData.Feed](/powerquery-m/odata-feed) function automatically did the hard work for you.
Since you're "roughing it" by using [Web.Contents](/powerquery-m/web-contents) rather than [OData.Feed](/powerquery-m/odata-feed), you'll need to recreate this navigation table yourself.

![OData Navigator.](../../media/trippin4-navigator-odata.png)

You're going to make the following changes:

1. Define a list of items to show in your navigation table
2. Do away with the entity specific functions (`GetAirlineTables` and `GetAirportsTable`)

### Generating a navigation table from a list

You'll list the entities you want to expose in the navigation table, and build the appropriate URL to access them. 
Since all of the entities are under the same root path, you'll be able build these URLs dynamically.

To simplify the example, you'll only expose the three entity sets (Airlines, Airports, People), which would be exposed as Tables in M, and skip the singleton (Me) which would be exposed as a Record. You'll skip adding the functions until a later lesson.

```powerquery-m
RootEntities = {
    "Airlines",
    "Airports",
    "People"
};
```

You then update your `TripPinNavTable` function to build the table a column at a time.
The [Data] column for each entity is retrieved by calling `TripPin.Feed` with the full URL to the entity. 

```powerquery-m
TripPinNavTable = (url as text) as table =>
    let
        entitiesAsTable = Table.FromList(RootEntities, Splitter.SplitByNothing()),
        rename = Table.RenameColumns(entitiesAsTable, {{"Column1", "Name"}}),
        // Add Data as a calculated column
        withData = Table.AddColumn(rename, "Data", each TripPin.Feed(Uri.Combine(url, [Name])), Uri.Type),
        // Add ItemKind and ItemName as fixed text values
        withItemKind = Table.AddColumn(withData, "ItemKind", each "Table", type text),
        withItemName = Table.AddColumn(withItemKind, "ItemName", each "Table", type text),
        // Indicate that the node should not be expandable
        withIsLeaf = Table.AddColumn(withItemName, "IsLeaf", each true, type logical),
        // Generate the nav table
        navTable = Table.ToNavigationTable(withIsLeaf, {"Name"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        navTable;
```

When dynamically building URL paths, make sure you're clear where your forward slashes (/) are!
Note that [Uri.Combine](/powerquery-m/uri-combine) uses the following rules when combining paths:

* When the `relativeUri` parameter starts with a /, it will replace the entire path of the `baseUri` parameter
* If the `relativeUri` parameter _doesn't_ start with a / and `baseUri` ends with a /, the path is appended
* If the `relativeUri` parameter _doesn't_ start with a / and `baseUri` _doesn't_ end with a /, the last segment of the path is replaced

The following image shows examples of this:

![Uri.Combine example.](../../media/trippin4-uri-combine.png)

### Remove the entity specific functions

To make your connector easier to maintain, you'll remove the entity specific formatting functions you used in the previous lesson&mdash;`GetAirlineTables` and `GetAirportsTable`.
Instead, you'll update `TripPin.Feed` to process the JSON response in a way that will work for all of your entities.
Specifically, you take the `value` field of the returned OData JSON payload, and convert it from a list of records to a table.

```powerquery-m
TripPin.Feed = (url as text) =>
    let
        source = Web.Contents(url, [ Headers = DefaultRequestHeaders ]),
        json = Json.Document(source),
        // The response is a JSON record - the data we want is a list of records in the "value" field
        value = json[value],
        asTable = Table.FromList(value, Splitter.SplitByNothing()),
        // expand all columns from the record
        fields = Record.FieldNames(Table.FirstValue(asTable, [Empty = null])),
        expandAll = Table.ExpandRecordColumn(asTable, "Column1", fields)
    in
        expandAll;
```

> [!NOTE]
> A disadvantage of using a generic approach to process your entities is that you lose the nice formating and type information for your entities. A later section in this tutorial shows how to enforce schema on REST API calls.

## Conclusion

In this tutorial, you cleaned up and simplified your connector by fixing your Data Source Path value, and moving to a more flexible format for your navigation table. After completing these steps (or using the sample code in this directory), the `TripPin.Contents` function returns a navigation table in Power BI Desktop.

![Navigator.](../../media/trippin4-complete.png)

## Next steps

[TripPin Part 5 - Paging](../5-paging/readme.md)
