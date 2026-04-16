---
title: Run-compare command
description: Regression testing with the run-compare command
author: KazimMir
ms.topic: concept-article
ms.date: 04/14/2026
ms.author: v-kmir
ms.subservice: custom-connectors
---

# Regression testing with the run-compare command

The PQTest ***run-compare*** command is a powerful tool for regression testing, enabling you to thoroughly evaluate the functions of the connector and the generation of command text. To illustrate its versatility, the subsequent sections will provide a variety of examples tailored to different scenarios.

> [!NOTE]
> The ***run-compare*** command replaces the previous ***compare*** command.

## Test input formats

The **run-compare** command supports two test input formats:

- **Expression format**: A single M expression (for example, a `let` expression or function invocation). This is the simplest format and is suitable for most test scenarios.
- **Section document format**: An M [section document](/powerquery-m/m-spec-sections) that contains one or more section members. This format is useful for tests that require helper functions, shared values, or more complex setups.

When a test file uses the expression format, PQTest automatically converts it into a section document internally before evaluation. You can also write your test input directly as a section document.

### Expression format example

```powerquery-m
let
    Source = Contoso.Contents("TestEndpoint"),
    Result = Table.RowCount(Source)
in
    Result
```

### Section document format example

```powerquery-m
section Test;

shared Helper = (x) => x + 1;
shared Query = let
    Source = Contoso.Contents("TestEndpoint"),
    Result = Helper(Table.RowCount(Source))
in
    Result;
```

When a parameter query is provided, it's appended to the section document as an additional section member. This means the parameter query is evaluated as part of the same section, enabling the test query to reference it directly.

## Basic queries

The simplest form of testing is to add a single query expression to a .query.pq file, which you can execute using the
***run-compare*** command. PQTest evaluates the expression and generates a .pqout (output) file with the same name. For any
subsequent runs, it compares the output generated from evaluation of .query.pq file with the pqout (output) file with
the same name and returns the output of the evaluation.

### Example 1 - Running run-compare command for a query file when an output file doesn't exist

The following example executes a single query test file using the specified Power Query extension and generates output
file to compare.

```PowerShell
<Path to PQTest.exe>.\PQTest.exe run-compare -e contoso.mez -q contoso.query.pq
```

```json
[
  {
    "Details": "Contoso.Contents(\"TestEndpoint\")",
    "EndTime": "2025-12-11T18:04:14.8991822+00:00",
    "Method": "Compare.TestFiles",
    "Name": "contoso.query.pq",
    "StartTime": "2025-12-11T18:04:11.1532388+00:00",
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

### Example 2 - Running run-compare command for a query file when an output file doesn't exist and FailOnMissingOutputFile flag is set

```PowerShell
<Path to PQTest.exe>.\PQTest.exe run-compare -e contoso.mez -q contoso.query.pq -fomof
```

```json
[
  {
    "Details": "Contoso.Contents(\"TestEndpoint\")",
    "EndTime": "2025-12-11T18:04:14.8991822+00:00",
    "Method": "Compare.TestFiles",
    "Name": "contoso.query.pq",
    "StartTime": "2025-12-11T18:04:11.1532388+00:00",
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
    "Status": "Failed",
    "Type": "PQTest.Expression"
  }
]
```

### Example 3 - Running run-compare command for a query file with an output file present

The following example executes a single query test file using the specified Power Query extension, compares it against
the output file and returns the result.

```PowerShell
<Path to PQTest.exe>.\PQTest.exe run-compare -e contoso.mez -q contoso.query.pq
```

```json
[
  {
    "Details": "Contoso.Contents(\"TestEndpoint\")",
    "EndTime": "2025-12-11T18:04:14.8991822+00:00",
    "Method": "Compare.TestFiles",
    "Name": "contoso.query.pq",
    "StartTime": "2025-12-11T18:04:11.1532388+00:00",
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

When a parameter query is provided, it's appended to the end of the test's section document as an additional section member. The test and parameter inputs are then evaluated together as a single Mashup section document.

> [!NOTE]
> If the parameter query file contains errors (for example, syntax errors or evaluation errors), PQTest reports a descriptive error indicating the issue with the parameter file rather than producing an unclear failure.

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

### Example 4 - Using both parameter query and test query with run-compare command

```PowerShell
<Path to PQTest.exe>.\PQTest.exe run-compare -e contoso.mez -q contoso.query.pq -pa contoso.parameter.pq
```

```json
[
  {
    "Details": "(Source) => let\r\n    Schemas = Table.RemoveColumns(Source, { \"Data\" })\r\nin\r\n    Schemas",
    "EndTime": "2025-12-11T18:04:14.8991822+00:00",
    "Method": "Compare.TestFiles",
    "Name": "contoso.query.pq",
    "StartTime": "2025-12-11T18:04:11.1532388+00:00",
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

Extra diagnostic information can be evaluated when using the **run-compare** command by subscribing to a diagnostic channel. When the **run-compare** command is run, PQTest outputs a .diagnostics file for each subscribed channel that had an event. For any subsequent runs, it compares the diagnostic event with its .diagnostics file, similar to .pqout.

### Example 5 - Subscribing to the ODBC (Open Database Connectivity) diagnostic channel to validate query folding

The following example shows how to subscribe to the ODBC channel, which captures any SQL generated by the ODBC driver when query folding is used.

```PowerShell
<Path to PQTest.exe>.\PQTest.exe run-compare -e contoso.mez -q contoso.query.pq -dc "Odbc"
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

Any command line input parameter for the **run-compare** command can also be passed via a JSON settings file. The JSON can have the following options:

| Option                          | Type   | Description                                                                                                                                                                                                                         |
| :------------------------------ | :----- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ExtensionPaths                  | array  | Array of paths that point to connector file (mez/pqx).                                                                                                                                                                              |
| FailOnMissingOutputFile         | bool   | Run-compare doesn't generate a PQOut file and fails if it doesn't exist.                                                                                                                                                            |
| FailOnFoldingFailure            | bool   | Run-compare fails if a query doesn't completely fold. When enabled, queries that can't be fully folded to the data source raise an error instead of falling back to local evaluation.                                                |
| ParameterQueryFilePath          | string | Query file that contains M expressions, which is combined at runtime with the test query file. A common use case is to have a single parameter query file to specify an M expression to retrieve the data for multiple test queries. |
| QueryFilePath                   | string | Query file that contains M expression (.pq) to be tested.                                                                                                                                                                           |
| TrxReportPath                   | string | Generates a TRX (Visual Studio Test Results File) results file and separate JSON files for each test in a given path.                                                                                                               |
| DiagnosticChannels              | array  | Name of diagnostic channels to be attached to the test run (for example, Odbc for capturing query folding statements).                                                                                                              |
| IntermediateTestResultsFolder   | string | Custom folder path for storing intermediate test results.                                                                                                                                                                           |
| PersistIntermediateTestResults  | bool   | Keeps intermediate test results after test execution completes.                                                                                                                                                                     |

In the case that both command line input and settings option are provided, the command line input is prioritized.

### Example 6 - Using settings file instead of command line arguments

```PowerShell
<Path to PQTest.exe>.\PQTest.exe run-compare -e contoso.mez -q contoso.query.pq -fomof
```

The above command is equivalent to the following command:

```PowerShell
<Path to PQTest.exe>.\PQTest.exe run-compare -sf settings.json
```

Where settings.json is the following JSON file:

```json
{
  "ExtensionPaths": ["contoso.mez"],
  "QueryFilePath": "contoso.query.pq",
  "FailOnMissingOutputFile": true
}
```

## Test batteries with run-compare command

A test battery is a collection of tests that evaluate multiple aspects of your code. Place the query files in the same folder so that PQTest can locate them easily. Instead of passing a specific test filename, specify the folder path and PQTest executes all of the .query.pq test query files in a single pass.

### Example 7 - Running a battery of tests

Assuming a folder named test that contains the following files:

- contoso.testa.query.pq
- contoso.testb.query.pq
- contoso.testc.query.pq

The entire test battery can be run using the following command line:

```PowerShell
<Path to PQTest.exe>.\PQTest.exe run-compare -e contoso.mez -q .\test
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
<Path to PQTest.exe>.\PQTest.exe run-compare -e contoso.mez -q .\test
```

## Filtering tests

The `--testFilter` option allows you to selectively include or exclude test files when running test batteries. This option uses glob patterns to match file paths and can be specified multiple times to create complex filtering rules.

### Inclusion filters

Specify which files to include in the test run using standard glob patterns.

```PowerShell
<Path to PQTest.exe>.\PQTest.exe run-compare -e contoso.mez -q .\test --testFilter "Suite1/**/*.pq"
```

### Exclusion filters

Specify which files to exclude from the test run using the `!` prefix to denote exclusion patterns.

```PowerShell
<Path to PQTest.exe>.\PQTest.exe run-compare -e contoso.mez -q .\test --testFilter "!BrokenTests/*"
```

### Multiple filters

Multiple `--testFilter` options can be combined to create complex filtering logic:

```PowerShell
<Path to PQTest.exe>.\PQTest.exe run-compare -e contoso.mez -q .\test --testFilter "**/*.pq" --testFilter "!BrokenTests/*" --testFilter "!**/*donotrun*.pq"
```

### Filter behavior

- **Implicit inclusion**: When no inclusion filters are specified, `**/*.query.pq` is automatically applied.
- **Case-insensitive**: All patterns match case-insensitively.
- **Order independent**: The order of filters doesn't affect the result.
- **Path format**: Use forward slashes (`/`) in patterns for cross-platform compatibility.

### Glob pattern examples

| Pattern | Description |
|---------|-------------|
| `**/*.pq` | All .pq files in any directory |
| `**/*.query.pq` | All .query.pq files in any directory |
| `Suite1/**/*.pq` | All .pq files under Suite1 directory |
| `**/test*.pq` | All .pq files starting with "test" |
| `!BrokenTests/*` | Exclude all files in BrokenTests directory |
| `!**/*temp*.pq` | Exclude all .pq files containing "temp" |
| `SpecificTest.pq` | Include only the specific file |

> [!NOTE]
> Filters apply to the relative path from the specified query directory. An error is returned if filters are provided and the query file path points to a specific file rather than a directory. Use quotes around patterns to prevent shell expansion.

## Listing test files without execution

The `--listOnly` option allows you to preview which test files would be executed by the **run-compare** command without actually running the tests. This is useful for verifying test discovery and filter behavior.

### Example 9 - Listing test files

```PowerShell
<Path to PQTest.exe>.\PQTest.exe run-compare -e contoso.mez -q .\test --listOnly
```

```json
{
    "SourcePath": "C:\\MyProject\\test",
    "TestFilters": [],
    "Tests": [
        {
            "Test": "MyTest.query.pq",
            "RelativePath": "Suite1\\MyTest.query.pq",
            "AbsolutePath": "C:\\MyProject\\test\\Suite1\\MyTest.query.pq"
        },
        {
            "Test": "AnotherTest.query.pq",
            "RelativePath": "Suite2\\AnotherTest.query.pq",
            "AbsolutePath": "C:\\MyProject\\test\\Suite2\\AnotherTest.query.pq"
        }
    ]
}
```

The output contains the following fields:

- **SourcePath**: The QueryFilePath value that was provided to the command (from `-q` option).
- **TestFilters**: A list of all TestFilter values that were applied (from `--testFilter` options).
- **Tests**: An array of test file objects, where each object contains:
  - **Test**: The filename of the test file.
  - **RelativePath**: The path relative to the base test directory specified by `-q`.
  - **AbsolutePath**: The full absolute path to the test file.

### Combining with test filters

The `--listOnly` option respects all `--testFilter` options, allowing you to preview the effect of your filters:

```PowerShell
<Path to PQTest.exe>.\PQTest.exe run-compare -e contoso.mez -q .\test --testFilter "Suite1/**/*.pq" --listOnly
```

> [!NOTE]
> All test filters are applied before listing. No actual test execution occurs when using `--listOnly`.

## Managing intermediate test results

The **run-compare** command generates intermediate files during test execution, including actual test output files (`.pqout`) and diagnostic files (`.diagnostics`). By default, these files are created in a temporary location with a date-based subfolder structure and are automatically cleaned up after the test run completes.

You can control this behavior using two options:

- `--intermediateTestResultsFolder | -itrf`: Specifies a custom folder path for storing intermediate test results.
- `--persistIntermediateTestResults | -pitr`: Keeps the intermediate results after test execution completes.

### Example 10 - Using a custom intermediate folder and persisting results

```PowerShell
<Path to PQTest.exe>.\PQTest.exe run-compare -e contoso.mez -q .\test -itrf "C:\TestResults" -pitr
```

### Intermediate folder structure

When you specify an intermediate test results folder, PQTest creates a date-based subfolder structure to organize test results:

```
<IntermediateTestResultsFolder>\
  └── YYYYMMDD_HHmmss_ffffff\
      ├── Test1.query.pqout
      ├── Test2.query.pqout
      ├── Test3.query.odbc.diagnostics
      └── ...
```

### Cleanup behavior

The cleanup behavior depends on whether you specify an intermediate folder and whether you use the persist flag:

| Scenario | Intermediate Folder Specified | Persist Flag | Behavior |
|----------|------------------------------|--------------|----------|
| 1 | No | No | Files created in temp location, date-based subfolder deleted after tests |
| 2 | Yes | No | Files created in specified folder, date-based subfolder deleted after tests |
| 3 | No | Yes | Files created in temp location, date-based subfolder deleted after tests |
| 4 | Yes | Yes | Files created in specified folder, date-based subfolder preserved |

> [!NOTE]
> To persist intermediate results, you **must** specify both `--intermediateTestResultsFolder` and `--persistIntermediateTestResults`. The `--persistIntermediateTestResults` flag alone without specifying a folder doesn't persist results. If the specified intermediate folder doesn't exist, PQTest attempts to create it. Relative paths are supported and are resolved relative to the current working directory.