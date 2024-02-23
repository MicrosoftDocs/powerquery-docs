---
title: Compare command
description: Regression testing with the compare command
author: ryan-syed
ms.topic: conceptual
ms.date: 02/14/2024
ms.author: v-ryansyed
---

# Regression testing with the compare command

## Basic queries

The simplest form of testing is to add a single query expression to a .query.pq file, which you can execute using the
**compare** command. PQTest evaluates the expression and generate a .pqout (output) file with the same name. For any
subsequent runs, it compares the output generated from evaluation of .query.pq file with the pqout (output) file with
the same name and returns the output of the evaluation.

### Example 1 - Running compare command for a query file when an output file doesn't exist

The following example executes a single query test file using the specified Power Query extension and generates output
file to compare.

```PowerShell
<Path to PQTest.exe>.\PQTest.exe compare -e contoso.mez -q contoso.query.pq
```

```json
[
  {
    "Details": "Contoso.Contents(\"TestEndpoint\")",
    "EndTime": "2020-12-11T18:04:14.8991822+00:00",
    "Method": "Compare.TestFiles",
    "Name": "contoso.query.pq",
    "StartTime": "2020-12-11T18:04:11.1532388+00:00",
    "Output": [
      {
        "SourceFilePath": "contoso.query.pq",
        "OutputFilePath": "contoso.query.pqout",
        "Status": "Output File Generated",
        "SerializedSource": null,
        "SourceError": null,
        "OutputError": null
      }
    ],
    "Status": "Passed",
    "Type": "PQTest.Expression"
  }
]
```

### Example 2 - Running compare command for a query file when an output file doesn't exist and FailOnMissingOutputFile flag is set

```PowerShell
<Path to PQTest.exe>.\PQTest.exe compare -e contoso.mez -q contoso.query.pq -fomof
```

```json
[
  {
    "Details": "Contoso.Contents(\"TestEndpoint\")",
    "EndTime": "2020-12-11T18:04:14.8991822+00:00",
    "Method": "Compare.TestFiles",
    "Name": "contoso.query.pq",
    "StartTime": "2020-12-11T18:04:11.1532388+00:00",
    "Output": [
      {
        "SourceFilePath": "contoso.query.pq",
        "OutputFilePath": "contoso.query.pqout",
        "Status": "Missing Output File",
        "SerializedSource": "Output of contoso.query.pq",
        "SourceError": null,
        "OutputError": null
      }
    ],
    "Status": "Failed"
    "Type": "PQTest.Expression"
  }
]
```

### Example 3 - Running compare command for a query file with an output file present

The following example executes a single query test file using the specified Power Query extension, compares it against
the output file and returns the result.

```PowerShell
<Path to PQTest.exe>.\PQTest.exe compare -e contoso.mez -q contoso.query.pq
```

```json
[
  {
    "Details": "Contoso.Contents(\"TestEndpoint\")",
    "EndTime": "2020-12-11T18:04:14.8991822+00:00",
    "Method": "Compare.TestFiles",
    "Name": "contoso.query.pq",
    "StartTime": "2020-12-11T18:04:11.1532388+00:00",
    "Output": [
      {
        "SourceFilePath": "contoso.query.pq",
        "OutputFilePath": "contoso.query.pqout",
        "Status": "Passed",
        "SerializedSource": null,
        "SourceError": null,
        "OutputError": null
      }
    ],
    "Status": "Passed",
    "Type": "PQTest.Expression"
  }
]
```

## Testing with parameter query

Parameter query is a query that is combined with a test query at runtime, with the parameter query running first. This functionality lets you split the PQ/test query file into two parts: the parameter query file, and the test query file.

### Agnostic data source testing with parameter and test query format

An example of a use case where this functionality would be useful is to create a data source agnostic test suite. The you can use your parameter query to retrieve data from the data source, and have the test query be generic M. If you would like to run the tests for another connector, you only need to add/update the parameter query to point to that specific data source.

A key difference when using a parameter query is that the test query follows a different format. Instead of being a formula expression, it must be an M function that takes one input parameter, which represents the table returned from the parameter query.

Let say you have the following test query:

```powerquery-m
let
    Source = Snowflake.Databases("...", "..."),
    Database = Source{[Name="...",Kind="Database"]}[Data],
    SelectColumns = Table.RemoveColumns(Database, { "Data" })
in
    SelectColumns
```

To convert it to a test and parameter query, you need to split them as follows:

Parameter Query:

```powerquery-m
let
    Source = Snowflake.Databases("...", "..."),
    Database = Source{[Name="...",Kind="Database"]}[Data],
    Schema = Database{[Name="...",Kind="Schema"]}[Data],
    Taxi_Table = Schema{[Name="...",Kind="Table"]}[Data],
in
    Taxi_Table
```

Test Query:

```powerquery-m
(Source) => let
    SelectColumns = Table.RemoveColumns(Source, { "VendorID" })
in
    SelectColumns
```

### Example 4 - Using both parameter query and test query with compare command

```PowerShell
<Path to PQTest.exe>.\PQTest.exe compare -e contoso.mez -q contoso.query.pq -pa contoso.parameter.pq
```

```json
[
  {
    "Details": "(Source) => let\r\n    Schemas = Table.RemoveColumns(Source, { \"Data\" })\r\nin\r\n    Schemas",
    "EndTime": "2020-12-11T18:04:14.8991822+00:00",
    "Method": "Compare.TestFiles",
    "Name": "contoso.query.pq",
    "StartTime": "2020-12-11T18:04:11.1532388+00:00",
    "Output": [
      {
        "SourceFilePath": "contoso.query.pq",
        "OutputFilePath": "contoso.query.pqout",
        "Status": "Passed",
        "SerializedSource": null,
        "SourceError": null,
        "OutputError": null
      }
    ],
    "Status": "Passed",
    "Type": "PQTest.Expression"
  }
]
```

## Comparing diagnostics

Extra diagnostic information can be evaluated when using the **compare** command by subscribing to a diagnostic channel. When the **compare** command is run, PQTest outputs a .diagnostics file for each subscribed channel that had an event. For any subsequent runs, it compares the diagnostic event with its .diagnostics file, similar to .pqout.

### Example 5 - Subscribing to the ODBC (Open Database Connectivity) diagnostic channel to validate query folding

The following example shows how to subscribe to the ODBC channel, which captures any SQL generated by the ODBC driver when query folding is used.

```PowerShell
<Path to PQTest.exe>.\PQTest.exe compare -e contoso.mez -q contoso.query.pq -dc "Odbc"
```

The ODBC diagnostic channel can be used to verify that a query is folding and that it's generating the correct SQL.

```powerquery-m
let
    Source = AzureSpark.Tables("...")
    T1 = Source{[Schema="default",Item="DATABASE"]}[Data],
    SelectColumns = Table.Group(T1, {}, {{"Maximum", each List.Max([number_column]), type number}}),
    FirstN = Table.FirstN(SelectColumns, 1)
in
    FirstN
```

The query now folds and generates the following ODBC command text in the .diagnostics file:

```json
[
  {
    "Command": "DESCRIBE default.DATABASE;"
  },
  {
    "Command": "select top 1 max(`number_column`) as `C1` from `SPARK`.`default`.`DATABASE`"
  }
]
```

## Using a settings file

Any command line input parameter for the **compare** command can also be passed via a JSON settings file. The JSON can have the following options:

| Option                  | Type   | Description                                                                                                                                                                                                                         |
| :---------------------- | :----- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ExtensionPaths          | array  | Array of paths that point to connector file (mez/pqx).                                                                                                                                                                              |
| FailOnMissingOutputFile | bool   | Compare doesn't generate a PQOut file and fails if it doesn't exist.                                                                                                                                                                |
| FailOnFoldingFailure    | bool   | Compare fails if a query folding error is thrown.                                                                                                                                                                                   |
| ParameterQueryFilePath  | string | Query file that contains M expressions, which is combined at runtime with the test query file. A common use case is to have a single parameter query file to specify an M expression to retrieve the data for multiple test queries.|
| QueryFilePath           | string | Query file that contains M expression (.pq) to be tested.                                                                                                                                                                           |
| TrxReportPath           | string | Generates a TRX (Visual Studio Test Results File) results file and separate JSON files for each test in a given path.                                                                                                               |
| DiagnosticChannels      | array  | Name of diagnostic channels to be attached to the test run (for example, Odbc for capturing query folding statements).                                                                                                              |

In the case that both command line input and settings option are provided, the command line input is prioritized.

### Example 6 - Using settings file instead of command line arguments

```PowerShell
<Path to PQTest.exe>.\PQTest.exe compare -e contoso.mez -q contoso.query.pq -fomof
```

The above command is equivalent to the following command:

```PowerShell
<Path to PQTest.exe>.\PQTest.exe compare -sf settings.json
```

Where settings.json is the following JSON file:

```json
{
  "ExtensionPaths": ["contoso.mez"],
  "QueryFilePath": "contoso.query.pq",
  "FailOnMissingOutputFile": true
}
```

## Test batteries with compare command

A test battery is a collection of tests that evaluate multiple aspects of your code. Place the query files in the same folder so that PQTest can locate them easily. Instead of passing a specific test filename, specify the folder path and PQTest executes all of the .query.pq test query files in a single pass.

### Example 7 - Running a battery of tests

Assuming a folder named test that contains the following files:

- contoso.testa.query.pq
- contoso.testb.query.pq
- contoso.testc.query.pq

The entire test battery can be run using the following command line:

```PowerShell
<Path to PQTest.exe>.\PQTest.exe compare -e contoso.mez -q .\test
```

#### Ignoring tests when running a battery of tests

A test can be ignored when running a battery of tests by changing the extension of the .query.pq file to .query.pq.ignore.

### Example 8 - Ignoring a test when running a battery of tests

Assuming a folder named test that contains the following files:

- contoso.testa.query.pq
- contoso.testb.query.pq.ignore
- contoso.testc.query.pq

The contoso.testa.query.pq and contoso.testc.query.pq files are run but contoso.testb.query.pq.ignore is ignored when the following command is executed to run the test battery:

```PowerShell
<Path to PQTest.exe>.\PQTest.exepqtest.exe compare -e contoso.mez -q .\test
```
