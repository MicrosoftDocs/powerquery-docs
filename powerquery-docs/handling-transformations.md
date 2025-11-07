---
title: Handling transformations with Web.Contents for Power Query connectors
description: Manage transformations with Web.Contents for Power Query connectors
author: ptyx507x
ms.topic: conceptual
ms.date: 11/7/2025
ms.author: miescobar
ms.subservice: custom-connectors
---

# Handling transformations

For situations where the data source response isn't presented in a format that Power BI can consume directly, Power Query can be used to perform a series of transformations.

## Static transformations

In most cases, the data is presented in a consistent way by the data source: column names, data types, and hierarchical structure are consistent for a given endpoint. In this situation it's appropriate to always apply the same set of transformations to get the data in a format acceptable to Power BI.

An example of static transformation can be found in the [TripPin Part 2 - Data Connector for a REST Service](samples/trippin/2-rest/readme.md) tutorial when the data source is treated as a standard REST service:

```powerquery-m
let
    Source = TripPin.Feed("https://services.odata.org/v4/TripPinService/Airlines"),
    value = Source[value],
    toTable = Table.FromList(value, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    expand = Table.ExpandRecordColumn(toTable, "Column1", {"AirlineCode", "Name"}, {"AirlineCode", "Name"})
in
    expand
```

The transformations in this example are:

1. `Source` is a Record returned from a call to `TripPin.Feed(...)`.
2. You pull the value from one of `Source`'s key-value pairs. The name of the key is `value`, and you store the result in a variable called `value`.
3. `value` is a list, which you convert to a table. Each element in `value` becomes a row in the table, which you can call `toTable`.
4. Each element in `value` is itself a Record. `toTable` has all of these in a single column: `"Column1"`. This step pulls all data with key `"AirlineCode"` into a column called `"AirlineCode"` and all data with key `"Name"` into a column called `"Name"`, for each row in `toTable`. `"Column1"` is replaced by these two new columns.

At the end of the day you're left with data in a simple tabular format that Power BI can consume and easily render:

:::image type="content" source="samples/media/trippin2-airlines.png" alt-text="Screenshot of the data in tabular form.":::

It's important to note that a sequence of static transformations of this specificity are only applicable to a *single* endpoint. In the example above, this sequence of transformations will only work if `"AirlineCode"` and `"Name"` exist in the REST endpoint response, since they are hard-coded into the M code. Thus, this sequence of transformations may not work if you try to hit the `/Event` endpoint.

This high level of specificity may be necessary for pushing data to a navigation table, but for more general data access functions it's recommended that you only perform transformations that are appropriate for all endpoints.

> [!NOTE]
> Be sure to test transformations under a variety of data circumstances. If the user doesn't have any data at the `/airlines` endpoint, do your transformations result in an empty table with the correct schema? Or is an error encountered during evaluation? See [TripPin Part 7: Advanced Schema with M Types](samples/trippin/7-advancedschema/readme.md) for a discussion on unit testing.

## Dynamic Transformations

More complex logic is sometimes needed to convert API responses into stable and consistent forms appropriate for Power BI data models.

### Inconsistent API Responses

Basic M control flow (if statements, HTTP status codes, try...catch blocks, and so on) are typically sufficient to handle situations where there are a handful of ways in which the API responds.

### Determining Schema On-The-Fly

Some APIs are designed such that multiple pieces of information must be combined to get the correct tabular format. Consider Smartsheet's `/sheets` [endpoint response], which contains an array of column names and an array of data rows. The Smartsheet Connector is able to parse this response in the following way:

```powerquery-m
raw = Web.Contents(...),
columns = raw[columns],
columnTitles = List.Transform(columns, each [title]),
columnTitlesWithRowNumber = List.InsertRange(columnTitles, 0, {"RowNumber"}),
                
RowAsList = (row) =>
    let
        listOfCells = row[cells],
        cellValuesList = List.Transform(listOfCells, each if Record.HasFields(_, "value") then [value]
                else null),
        rowNumberFirst = List.InsertRange(cellValuesList, 0, {row[rowNumber]})
    in
        rowNumberFirst,

listOfRows = List.Transform(raw[rows], each RowAsList(_)),
result = Table.FromRows(listOfRows, columnTitlesWithRowNumber)
```

1. First deal with column header information. You can pull the `title` record of each column into a List, prepending with a `RowNumber` column that you know will always be represented as this first column.
2. Next you can define a function that allows you to parse a row into a List of cell `value`s. You can again prepend `rowNumber` information.
3. Apply your `RowAsList()` function to each of the `row`s returned in the API response.
4. Convert the List to a table, specifying the column headers.

[endpoint response]: https://smartsheet-platform.github.io/api-docs/#sheets
