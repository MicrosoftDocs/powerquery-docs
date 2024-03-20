---
title: Test format specification
description: Understanding various file formats and their functionality within the Power Query SDK test framework.
author: ryan-syed
ms.topic: reference
ms.date: 01/19/2024
ms.author: v-ryansyed
---

# Power Query SDK test framework part 4 - Test format specification

This multi-part reference covers the set-up and running of a standard suite of tests for Power Query connector developers. The reference is meant to be done sequentially to ensure that your environment is set-up for testing your custom connector.

Now that you've set-up the environment, uploaded the test data, and set-up the test suite, you're ready to start verifying your extension connector with the test suite. Before running the tests, you need to understand different types of files and formats within the test framework.

In this section, you:

> [!div class="checklist"]
>
> * Learn the types of file formats used within the test framework and their functionality

## Specification for tests in PQ/PQOut format

The tests for verifying extension connectors with the Power Query SDK test framework are written in PQ/PQOut Format.  

The following list describes the types of files that you need to be aware of while working with the Power Query SDK test framework:

* Test query file, also known as a PQ file, with a \.query.pq extension.
* Output file, also known as a PQOut file, with a \.query.pqout extension.
* Optional parameter query file with a \.parameterquery.pq extension.
* Optional settings file with a \.settings extension.
* Optional diagnostics file with a \.diagnostics extension.

### Test query file, also known as a PQ file, with a \.query.pq extension

The test query file (.query.pq) contains a single Power Query M formula language query. The mashup query is composed of variables, expressions, and values encapsulated by a `let` expression with a custom connector data source function name and required metadata to execute.

```powerquery-m
let
   Source = Snowflake.Databases("POWERBI.snowflakecomputing.com", "DEMO_WH"),
   Database = Source{[Name="NYCTAXIDB”, Kind="Database"]}[Data],
   Schema = Database{[Name="PUBLIC”, Kind="Schema"]}[Data],
   Table = Schema{[Name="NYCTAXIDATA”, Kind="Table"]}[Data],
   SelectColumns = Table.SelectColumns(Table, {"lpep_pickup_datetime"}),
   FirstN = Table.FirstN(SelectColumns, 1)
in
   FirstN
```

### Output file, also known as a PQOut file, with a \.query.pqout extension

The output file (.query.pqout) contains the generated output as a result of running the **compare** command for a test.

The following sample shows an example of an output file (PQOut), for example, SnowflakeFirstNTests.query.pqout:

```powerquery-m
#table(type table [TIMESTAMP = datetime], {{#datetime(2014, 1, 1, 16, 0, 0.12345)}})
```

### Optional parameter query file with a \.parameterquery.pq extension

To make the test cases run independently of the data source, support for the PQ/test query file can be split into two parts: the parameter query file, and the test query file.  

The parameter query is data source specific and retrieves test data from the data source. If you would like to run the tests for another connector, then you need to update this file to point to that specific data source.

The following sample shows an example of a parameter query file, for example, Taxi.parameterquery.pq:

```powerquery-m
let
   Source = Snowflake.Databases("POWERBI.snowflakecomputing.com", "DEMO_WH"),
   Database = Source{[Name="NYCTAXIDB", Kind="Database"]}[Data],
   Schema = Database{[Name="PUBLIC", Kind="Schema"]}[Data],
   Table = Schema{[Name="NYCTAXIDATA", Kind="Table"]}[Data],
in
   Table
```

When the optional parameter query file is provided, the test query only needs to contain transformations to the test data. These transformations are the M expressions required for tests and make it independent of the data source. The test query also then needs to declare an M lambda function that takes the results from the parameter query and runs the test logic on input results.

The following sample shows an example for a test query, for example, SnowflakeFirstNTest.query.pq:

```powerquery-m
(parameter) => 
let
   SelectColumns = Table.SelectColumns(parameter, {"lpep_pickup_datetime"}),
   FirstN = Table.FirstN(SelectColumns, 1)
in
   FirstN
```

### Optional settings file with a \.settings extension

The optional settings file is a JSON file, which contains the configuration parameters as key value pairs.

The following sample shows an example for a settings file when the optional parameter query file is specified:

```json
{
    'Extension': 'snowflake.mez',
    'ParameterQueryFilePath': 'contoso.parameterquery.pq'
    'QueryFilePath': 'contoso.query.pq',
    'FailOnMissingOutputFile': true
}
```

### Optional diagnostics file with a \.diagnostics extension

The optional diagnostics file currently contains a list of command text that gets generated when an M Query is folded. Use it for regression testing of query folding.  

The following sample shows an example for a diagnostic file, for example, SnowflakeFirstNTestSettings.diagnostics:

```json
[
  {
    "Command": "select \"lpep_pickup_datetime\" from \"NYCTAXIDB\".\"PUBLIC\".\"NYCTAXIDATA\" LIMIT 1 OFFSET 0"
  }
]
```

## Conclusion

This section introduced you to various file formats that you need to be familiar while working with the Power Query SDK test framework.

In the next section, you create queries and settings to work with your data source for your extension connector.

## Next steps

[Power Query SDK test framework part 5 - Testing your extension connector](./5-connector.md)
