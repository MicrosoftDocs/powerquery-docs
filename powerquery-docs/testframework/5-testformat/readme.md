---
title: Test Format Specification
description: Understanding various file formats and their functionality within Power Query SDK Test Framework
author: ryan-syed

ms.topic: reference
ms.date: 01/19/2024
ms.author: v-ryansyed
ms.custom:
---

# Power Query SDK Test Framework part 5 - Test Format Specification

This multi-part reference covers the setup and running of a standard suite of tests for Power Query connector developers. The reference is meant to be done sequentially—to ensure that your environment is set up for testing your custom connector.

Now that you have setup the environment, uploaded the test data and set up the test suite, you're ready to start verifying your extension connector with the test suite. Before running the tests, you need to understand different types of files and formats within the test framework.

In this lesson, you will:

> [!div class="checklist"]
>
> * Learn the types of file formats used within the test framework and their functionality

## Specification for Tests in PQ/PQOut format

The tests for verifying extension connectors with the PQSDK Test Framework should be written in PQ/PQOut Format.  

Following are the types of files that you need to be aware of while working with Power Query SDK Test Framework:

* Query File also known as PQ file with *".query.pq"* extension
* Output File also known as PQOut file with *".query.pqout"* extension
* Optional Parameter Query file with *".parameterquery.pq"* extension
* Optional Settings file with *".settings"* extension
* Optional Diagnostics file with *".diagnostics"* extension.

### Test Query File also known as PQ file with .query.pq extension

The Test Query File (.query.pq) file contains a single Power Query M formula language query. The mashup query is composed of variables, expressions, and values encapsulated by a let expression with custom connector Data Source function name and required meta data to execute.

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

### Output File also known as PQOut file with *".query.pqout"* extension

The Output File (.query.pqout) contains the generated output as a result of running “compare” command for a test.

*Example for an Output File (PQOut) [Ex: SnowflakeFirstNTests.query.pqout]:*

```powerquery-m
#table(type table [TIMESTAMP = datetime], {{#datetime(2014, 1, 1, 16, 0, 0.12345)}})
```

### Optional Parameter Query file with *".parameterquery.pq"* extension

To make the test cases, run independently of the data source, support for PQ/test query file can be split into two parts: the parameter query file, and the test query file.  

The Parameter query is data source specific and retrieves test data from data source and is specific to a data source. If you would like to run the tests for another connector, the connector developer needs to update this file to point to that specific data source.

*Example for a Parameter Query File [Ex: Taxi.parameterquery.pq]:*

```powerquery-m
let
   Source = Snowflake.Databases("POWERBI.snowflakecomputing.com", "DEMO_WH"),
   Database = Source{[Name="NYCTAXIDB", Kind="Database"]}[Data],
   Schema = Database{[Name="PUBLIC", Kind="Schema"]}[Data],
   Table = Schema{[Name="NYCTAXIDATA", Kind="Table"]}[Data],
in
   Table
```

When the optional Parameter query file is provided, the test query only needs to contain transformations to the test data. These transformations are the M expressions required for tests and make it independent of the data source. The test query also then needs to declare an M lambda function that takes the results from the Parameter Query and runs the test logic on input results.

*Example for a Test Query [Ex: SnowflakeFirstNTest.query.pq]:*

```powerquery-m
(parameter) => 
let
   SelectColumns = Table.SelectColumns(parameter, {"lpep_pickup_datetime"}),
   FirstN = Table.FirstN(SelectColumns, 1)
in
   FirstN
```

### Optional Settings file with *".settings"* extension

The optional settings file is a Json file, which allows the command line parameters as key value pairs.

*Example for a Settings Files when the optional parameter query file is specified:*

```json
{
    'Extension': 'snowflake.mez',
    'ParameterQueryFilePath': 'contoso.parameterquery.pq'
    'QueryFilePath': 'contoso.query.pq',
    'FailOnMissingOutputFile': true
}
```

### Optional Diagnostics file with *".diagnostics"* extension

The optional diagnostic file contains a list of Command Text that gets generated when an M Query is folded. Use it for regression testing of Query folding.  

*Example for a diagnostic file [Ex: SnowflakeFirstNTestSettings.diagnostics]:*

```json
[
  {
    "Command": "select \"lpep_pickup_datetime\" from \"NYCTAXIDB\".\"PUBLIC\".\"NYCTAXIDATA\" LIMIT 1 OFFSET 0"
  }
]
```

## Conclusion

This lesson introduced you to various file formats that you need to be familiar while working with Power Query SDK Test Framework.

In the next lesson, you'll create queries and settings to work with your data source for your extension connector.

## Next steps

[Power Query SDK Test Framework part 6 - Testing your extension connector](../6-connector/readme.md)
