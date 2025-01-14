---
title: Troubleshooting an ODBC-based Power Query connector
description: Describes how to troubleshoot and test your ODBC-based Power Query connector
author: ptyx507x
ms.topic: conceptual
ms.date: 1/19/2022
ms.author: miescobar
ms.subservice: custom-connectors
---

# Test and troubleshoot an ODBC-based connector

While you're building your ODBC-based connector, it's a good idea to occasionally test and troubleshoot the connector. This section describes how to set up and use some test and troubleshooting tools.

## Use the tracing tool in Power BI Desktop

One of the basic tools for testing and troubleshooting an ODBC-based connector is the ability to use tracing in Power BI Desktop to determine why errors may be occurring.

To enable tracing in Power BI Desktop:

1. Go to **File > Options and settings > Options**.
2. Select the **Diagnostics** tab.
3. Select the **Enable tracing** option.
4. Select the **Open traces folder** link (should be `%LOCALAPPDATA%/Microsoft/Power BI Desktop/Traces`).
5. Delete existing trace files.
6. Do your tests.
7. Close Power BI Desktop to ensure all log files are flushed to disk.

Here are steps you can take for initial testing in Power BI Desktop:

1. Close Power BI Desktop.
2. Clear your trace directory.
3. Open Power BI desktop, and enable tracing.
4. Connect to your data source, and select Direct Query mode.
5. Select a table in the navigator, and select **Edit**.
6. Manipulate the query in various ways, including:
   - Take the First N rows (for example, 10).
   - Set equality filters on different data types (int, string, bool, and so on).
   - Set other range filters (greater than, less than).
   - Filter on NULL / NOT NULL.
   - Select a subset of columns.
   - Aggregate / Group By different column combinations.
   - Add a column calculated from other columns ([C] = [A] + [B]).
   - Sort on one column, multiple columns.
7. Expressions that fail to fold will result in a warning bar. Note the failure, remove the step, and move to the next test case. Details about the cause of the failure should be emitted to the trace logs.
8. Close Power BI Desktop.
9. Copy the trace files to a new directory.
10. Open the trace files in your text editor of choice.
11. Search for `OdbcQuery/FoldingWarning` entries in the trace files. These entries should contain more information as to why the query engine believes that query folding isn't possible for this operation.

Once you have simple queries working, you can then try DirectQuery scenarios (for example, building reports in the Report Views). The queries generated in DirectQuery mode are significantly more complex (that is, use of sub-selects, COALESCE statements, and aggregations).

<!--
## Common Problems

**TODO**

- In query editor, filter on each data type
- Filter on missing data types -- SEARCHABLE
- Filter on date -- timestamp precision incorrect
-->

## Concatenation of strings in DirectQuery mode

The M engine does basic type size limit validation as part of its query folding logic. If you're receiving a folding error when trying to concatenate two strings that potentially overflow the maximum size of the underlying database type:

1. Ensure that your database can support up-conversion to CLOB types when string concatenation overflow occurs.
2. Set the [TolerateConcatOverflow option](odbc-parameters.md#tolerate) for `Odbc.DataSource` to `true`.

>[!Note]
> The [DAX CONCATENATE function](/dax/concatenate-function-dax) isn't currently supported by Power Query/ODBC extensions.
> Extension authors should ensure string concatenation works through the query editor by adding calculated columns (`[stringCol1] & [stringCol2]`).
> When the capability to fold the CONCATENATE operation is added in the future, it should work seamlessly with existing extensions.
