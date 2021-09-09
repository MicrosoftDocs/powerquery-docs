---
title: Enabling DirectQuery for an ODBC-based Power Query connector
description: Use DirectQuery for an ODBC-based Power Query connector
author: cpopell

ms.service: powerquery
ms.topic: conceptual
ms.date: 12/11/2018
ms.author: gepopell

LocalizationGroup: reference
---

# Enabling Direct Query for an ODBC based connector

## Overview

Using M's built-in [Odbc.DataSource](/powerquery-m/odbc-datasource) function is the recommended way to
create custom connectors for data sources that have an existing ODBC
driver and/or support a SQL query syntax. Wrapping the [Odbc.DataSource](/powerquery-m/odbc-datasource)
function will allow your connector to inherit default query folding
behavior based on the capabilities reported by your driver. This will
enable the M engine to generate SQL statements based on filters and
other transformations defined by the user within the Power Query
experience, without having to provide this logic within the connector
itself.

ODBC extensions can optionally enable Direct Query mode, allowing Power
BI to dynamically generate queries at runtime without pre-caching the
user's data model.

>[!Note]
> Enabling Direct Query support raises the difficulty and complexity level of your connector. When Direct Query is enabled, Power BI will prevent the M engine from compensating for operations that cannot be fully pushed to the underlying data source.

This section builds on the concepts presented in the M Extensibility
Reference, and assumes familiarity with the creation of a basic Data
Connector.

Refer to the [SqlODBC sample](https://github.com/Microsoft/DataConnectors/tree/master/samples/ODBC/SqlODBC)
for most of the code examples in the sections below. Additional samples
can be found in the ODBC samples directory.

## ODBC Extensibility Functions

The M engine provides two ODBC related data source functions:
[Odbc.DataSource](/powerquery-m/odbc-datasource), and [Odbc.Query](/powerquery-m/odbc-query).

The [Odbc.DataSource](/powerquery-m/odbc-datasource) function provides a default navigation table with
all databases, tables, and views from your system, supports query
folding, and allows for a range of customization options. The majority
of ODBC based extensions will use this as their primary extensibility
function. The function accepts two arguments&mdash;a connection string, and
an options record to provide behavior overrides.

The [Odbc.Query](/powerquery-m/odbc-query) function allows you to execute SQL statements through an
ODBC driver. It acts as a passthrough for query execution. Unlike the
[Odbc.DataSource](/powerquery-m/odbc-datasource) function, it doesn't provide query folding
functionality, and requires that SQL queries be provided by the
connector (or end user). When building a custom connector, this function
is typically used internally to run queries to retrieve metadata that
might not be exposed through regular ODBC channels. The function accepts
two arguments&mdash;a connection string, and a SQL query.

## Parameters for your Data Source Function

Custom connectors can accept any number of function arguments, but to
remain consistent with the built-in data source functions shipped with
Power Query, the following guidelines are recommended:

  - Require the minimal set of parameters used to establish a connection
    to your server. The less parameters end users need to provide, the
    easier your connector will be to use.

  - Although you can define parameters with a fixed number of values
    (that is, a dropdown list in the UI), parameters are entered before the
    user is authenticated. Any values that can be discovered
    programmatically after the user is authenticated (such as catalog or
    database name) should be selectable through the Navigator. The
    default behavior for the [Odbc.DataSource](/powerquery-m/odbc-datasource) function will be to return
    a hierarchical navigation table consisting of Catalog (Database),
    Schema, and Table names, although this can be overridden within your
    connector.

  - If you feel your users will typically know what values to enter for
    items they would select from the Navigator (such as the database
    name), make these parameters optional. Parameters that can be
    discovered programmatically should not be made required.

  - The last parameter for your function should be an optional record
    called "options". This parameter typically allows advanced users to
    set common ODBC related properties (such as CommandTimeout), set
    behavior overrides specific to your connector, and allows for future
    extensibility without impacting backwards compatibility for your
    function.

  - Security/credential related arguments MUST never be part of your
    data source function parameters, as values entered in the connect
    dialog will be persisted to the user's query. Credential related
    parameters should be specified as part of the connector's supported
    Authentication methods.

By default, all required parameters for your data source function are
factored into the Data Source Path value used to identify user credentials.

Note that while the UI for the built-in [Odbc.DataSource](/powerquery-m/odbc-datasource) function
provides a dropdown that allows the user to select a DSN, this
functionality is not available through extensibility. If your data source
configuration is complex enough to require a fully customizable
configuration dialog, it's recommended you require your end users to
pre-configure a system DSN, and have your function take in the DSN name
as a text field.

## Parameters for Odbc.DataSource

The [Odbc.DataSource](/powerquery-m/odbc-datasource) function takes two parameters&mdash;a connectionString
for your driver, and an options record that lets you override various
driver behaviors. Through the options record you can override
capabilities and other information reported by the driver, control the
navigator behavior, and affect the SQL queries generated by the M
engine.

The supported options records fields fall into two categories&mdash;those
that are public / always available, and those that are only available in
an extensibility context.

The following table describes the public fields in the options record.

<table>
<thead>
<tr class="header">
<th>Field</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>CommandTimeout</td>
<td><p>A duration value that controls how long the server-side query is allowed to run before it's cancelled.</p>
<p>Default: 10 minutes</p></td>
</tr>
<tr class="even">
<td>ConnectionTimeout</td>
<td><p>A duration value that controls how long to wait before abandoning an attempt to make a connection to the server.</p>
<p>Default: 15 seconds</p></td>
</tr>
<tr class="odd">
<td>CreateNavigationProperties</td>
<td><p>A logical value that sets whether to generate navigation properties on the returned tables. Navigation properties are based on foreign key relationships reported by the driver, and show up as “virtual” columns that can be expanded in the query editor, creating the appropriate join.</p>
<p>If calculating foreign key dependencies is an expensive operation for your driver, you may want to set this value to false.</p>
<p>Default: true</p></td>
</tr>
<tr class="even">
<td>HierarchicalNavigation</td>
<td><p>A logical value that sets whether to view the tables grouped by their schema names. When set to false, tables will be displayed in a flat list under each database.</p>
<p>Default: false</p></td>
</tr>
<tr class="odd">
<td>SqlCompatibleWindowsAuth</td>
<td><p>A logical value that determines whether to produce a SQL Server compatible connection string when using Windows Authentication&mdash;Trusted_Connection=Yes.</p>
<p>If your driver supports Windows Authentication, but requires additional or alternative settings in your connection string, you should set this value to false and use the CredentialConnectionString option record field described below.</p>
<p>Default: true</p></td>
</tr>
</tbody>
</table>

The following table describes the options record fields that are only
available through extensibility. Fields that aren't simple literal values
are described in subsequent sections.

<table>
<thead>
<tr class="header">
<th>Field</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>AstVisitor</td>
<td><p>A record containing one or more overrides to control SQL query generation. The most common usage of this field is to provide logic to generate a LIMIT/OFFSET clause for drivers that don't support TOP.</p>
<p>Fields include:</p>
<ul>
<li><p>Constant</p></li>
<li><p>LimitClause</p></li>
</ul>
<p>See the AstVisitor section for more information.</p></td>
<tr class="even">
<td>CancelQueryExplicitly</td>
<td><p>A logical value that instructs the M engine to explicitly cancel any running calls through the ODBC driver before terminating the connection to the ODBC server.</p>
<p>This is useful in situations where query execution is managed independently of the network connections to the server, for example in some Spark deployments. In most cases this value doesn't need to be set as the query in the server is cancelled when the network connection to the server is terminated.</p>
<p>Default: false</p></td>
</tr>
<tr class="odd">
<td>ClientConnectionPooling</td>
<td><p>A logical value that enables client-side connection pooling for the ODBC driver. Most drivers will want to set this value to true.</p>
<p>Default: false</p></td>
</tr>
<tr class="even">
<td>CredentialConnectionString</td>
<td><p>A text or record value used to specify credential related connection string properties.</p>
<p>See the Credential section for more information.</p></td>
</tr>
<tr class="odd">
<td>HideNativeQuery</td>
<td><p>A logical value that controls whether your connector allows native SQL statements to be passed in by a query using the Value.NativeQuery() function.</p>
<p>Note: this functionality is currently not exposed in the Power Query user experience. Users would need to manually edit their queries to take advantage of this capability.</p>
<p>Default: false</p></td>
</tr>
<tr class="even">
<td>ImplicitTypeConversions</td>
<td><p>A table value containing implicit type conversions supported by your driver or backend server. Values in this table are additive to the conversions reported by the driver itself.</p>
<p>This field is typically used in conjunction with the SQLGetTypeInfo field when overriding data type information reported by the driver.</p>
<p>See the ImplicitTypeConversions section for more information.</p></td>
</tr>
<tr class="odd">
<td>OnError</td>
<td><p>An error handling function that receives an errorRecord parameter of type record.</p>
<p>Common uses of this function include handling SSL connection failures, providing a download link if your driver isn't found on the system, and reporting authentication errors.</p>
<p>See the OnError section for more information.</p></td>
</tr>
<tr class="even">
<td>SoftNumbers</td>
<td><p>Allows the M engine to select a compatible data type when conversion between two specific numeric types isn't declared as supported in the SQL_CONVERT_* capabilities.</p>
<p>Default: false</p></td>
</tr>
<tr class="odd">
<td>SqlCapabilities</td>
<td><p>A record providing various overrides of driver capabilities, and a way to specify capabilities that aren't expressed through ODBC 3.8.</p>
<p>See the SqlCapabilities section for more information.</p></td>
</tr>
<tr class="even">
<td>SQLColumns</td>
<td><p>A function that allows you to modify column metadata returned by the SQLColumns function.</p>
<p>See the SQLColumns section for more information.</p></td>
</tr>
<tr class="odd">
<td>SQLGetFunctions</td>
<td><p>A record that allows you to override values returned by calls to SQLGetFunctions.</p>
<p>A common use of this field is to disable the use of parameter binding, or to specify that generated queries should use CAST rather than CONVERT.</p>
<p>See the SQLGetFunctions section for more information.</p></td>
</tr>
<tr class="even">
<td>SQLGetInfo</td>
<td><p>A record that allows you to override values returned by calls to SQLGetInfo.</p>
<p>See the SQLGetInfo section for more information.</p></td>
</tr>
<tr class="odd">
<td>SQLGetTypeInfo</td>
<td><p>A table, or function that returns a table, that overrides the type information returned by SQLGetTypeInfo.</p>
<p>When the value is set to a table, the value completely replaces the type information reported by the driver. SQLGetTypeInfo won't be called.</p>
<p>When the value is set to a function, your function will receive the result of the original call to SQLGetTypeInfo, allowing you to modify the table.</p>
<p>This field is typically used when there's a mismatch between data types reported by SQLGetTypeInfo and SQLColumns.</p>
<p>See the SQLGetTypeInfo section for more information.</p></td>
</tr>
<tr class="even">
<td>SQLTables</td>
<td><p>A function that allows you to modify the table metadata returned by a call to SQLTables.</p>
<p>See the SQLTables section for more information.</p></td>
</tr>
<tr class="odd">
<td>TolerateConcatOverflow</td>
<td><p>Allows conversion of numeric and text types to larger types if an operation would cause the value to fall out of range of the original type.</p>
<p>For example, when adding Int32.Max + Int32.Max, the engine will cast the result to Int64 when this setting is set to true. When adding a VARCHAR(4000) and a VARCHAR(4000) field on a system that supports a maximize VARCHAR size of 4000, the engine will cast the result into a CLOB type.</p>
<p>Default: false</p></td>
</tr>
<tr class="even">
<td>UseEmbeddedDriver</td>
<td><p><strong>(internal use):</strong> A logical value that controls whether the ODBC driver should be loaded from a local directory (using new functionality defined in the ODBC 4.0 specification). This is generally only set by connectors created by Microsoft that ship with Power Query.</p>
<p>When set to false, the system ODBC driver manager will be used to locate and load the driver.</p>
<p>Most connectors should not need to set this field.</p>
<p>Default: false</p></td>
</tr>
</tbody>
</table>

### Overriding AstVisitor

The AstVisitor field is set through the [Odbc.DataSource](/powerquery-m/odbc-datasource) options record.
It's used to modify SQL statements generated for specific query
scenarios.

>[!Note]
> Drivers that support `LIMIT` and `OFFSET` clauses (rather than `TOP`)
will want to provide a LimitClause override for AstVisitor.

#### Constant

Providing an override for this value has been deprecated and may be
removed from future implementations.

#### LimitClause

This field is a function that receives two `Int64.Type` arguments (skip,
take), and returns a record with two text fields (Text, Location).

```
LimitClause = (skip as nullable number, take as number) as record => ...
```

The skip parameter is the number of rows to skip (that is, the argument to
OFFSET). If an offset is not specified, the skip value will be null. If
your driver supports `LIMIT`, but does not support `OFFSET`, the LimitClause
function should return an unimplemented error (...) when skip is greater
than 0.

The take parameter is the number of rows to take (that is, the argument to
LIMIT).

The `Text` field of the result contains the SQL text to add to the
generated query.

The `Location` field specifies where to insert the clause. The following
table describes supported values.

<table>
<thead>
<tr class="header">
<th>Value</th>
<th>Description</th>
<th>Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>AfterQuerySpecification</td>
<td><p>LIMIT clause is put at the end of the generated SQL.</p>
<p>This is the most commonly supported LIMIT syntax.</p></td>
<td><p>SELECT a, b, c</p>
<p>FROM table</p>
<p>WHERE a &gt; 10</p>
<p><strong>LIMIT 5</strong></p></td>
</tr>
<tr class="even">
<td>BeforeQuerySpecification</td>
<td>LIMIT clause is put before the generated SQL statement.</td>
<td><p><strong>LIMIT 5 ROWS</strong></p>
<p>SELECT a, b, c</p>
<p>FROM table</p>
<p>WHERE a &gt; 10</p></td>
</tr>
<tr class="odd">
<td>AfterSelect</td>
<td>LIMIT goes after the SELECT statement, and after any modifiers (such as DISTINCT).</td>
<td><p>SELECT DISTINCT <strong>LIMIT 5</strong> a, b, c</p>
<p>FROM table</p>
<p>WHERE a &gt; 10</p></td>
</tr>
<tr class="even">
<td>AfterSelectBeforeModifiers</td>
<td>LIMIT goes after the SELECT statement, but before any modifiers (such as DISTINCT).</td>
<td><p>SELECT <strong>LIMIT 5</strong> DISTINCT a, b, c</p>
<p>FROM table</p>
<p>WHERE a &gt; 10</p></td>
</tr>
</tbody>
</table>

The following code snippet provides a LimitClause implementation for a
driver that expects a LIMIT clause, with an optional OFFSET, in the
following format: `[OFFSET <offset> ROWS] LIMIT <row_count>`

```
LimitClause = (skip, take) =>
    let
        offset = if (skip > 0) then Text.Format("OFFSET #{0} ROWS", {skip}) else "",
        limit = if (take <> null) then Text.Format("LIMIT #{0}", {take}) else ""
    in
        [
            Text = Text.Format("#{0} #{1}", {offset, limit}),
            Location = "AfterQuerySpecification"
        ]
```

The following code snippet provides a LimitClause implementation for a
driver that supports LIMIT, but not OFFSET. Format: `LIMIT <row_count>`.

```
LimitClause = (skip, take) =>
    if (skip > 0) then error "Skip/Offset not supported"
    else
    [
        Text = Text.Format("LIMIT #{0}", {take}),
        Location = "AfterQuerySpecification"
    ]
```
<!--
### Overriding ImplicitTypeConversions

**TODO**

### Providing an OnError handler

**TODO**
-->
### Overriding SqlCapabilities

<table>
<thead>
<tr class="header">
<th>Field</th>
<th>Details</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>FractionalSecondsScale</td>
<td><p>A number value ranging from 1 to 7 that indicates the number of decimal places supported for millisecond values. This value should be set by connectors that want to enable query folding over datetime values.</p>
<p>Default: null</p></td>
</tr>
<tr class="even">
<td>PrepareStatements</td>
<td><p>A logical value that indicates that statements should be prepared using <a href="/sql/odbc/reference/syntax/sqlprepare-function">SQLPrepare</a>.</p>
<p>Default: false</p></td>
</tr>
<tr class="odd">
<td>SupportsTop</td>
<td><p>A logical value that indicates the driver supports the TOP clause to limit the number of returned rows.</p>
<p>Default: false</p></td>
</tr>
<tr class="even">
<td>StringLiteralEscapeCharacters</td>
<td><p>A list of text values that specify the character(s) to use when escaping string literals and LIKE expressions.</p>
<p>Ex. {&quot;&quot;}</p>
<p>Default: null</p></td>
</tr>
<tr class="odd">
<td>SupportsDerivedTable</td>
<td><p>A logical value that indicates the driver supports derived tables (sub-selects).</p>
<p>This value is assumed to be true for drivers that set their conformance level to SQL_SC_SQL92_FULL (reported by the driver or overridden with the Sql92Conformance setting (see below)). For all other conformance levels, this value defaults to false.</p>
<p>If your driver doesn't report the SQL_SC_SQL92_FULL compliance level, but does support derived tables, set this value to true.</p>
<p>Note that supporting derived tables is required for many Direct Query scenarios.</p></td>
</tr>
<tr class="even">
<td>SupportsNumericLiterals</td>
<td><p>A logical value that indicates whether the generated SQL should include numeric literals values. When set to false, numeric values will always be specified using Parameter Binding.</p>
<p>Default: false</p></td>
</tr>
<tr class="odd">
<td>SupportsStringLiterals</td>
<td><p>A logical value that indicates whether the generated SQL should include string literals values. When set to false, string values will always be specified using Parameter Binding.</p>
<p>Default: false</p></td>
</tr>
<tr class="even">
<td>SupportsOdbcDateLiterals</td>
<td><p>A logical value that indicates whether the generated SQL should include date literals values. When set to false, date values will always be specified using Parameter Binding.</p>
<p>Default: false</p></td>
</tr>
<tr class="odd">
<td>SupportsOdbcTimeLiterals</td>
<td><p>A logical value that indicates whether the generated SQL should include time literals values. When set to false, time values will always be specified using Parameter Binding.</p>
<p>Default: false</p></td>
</tr>
<tr class="even">
<td>SupportsOdbcTimestampLiterals</td>
<td><p>A logical value that indicates whether the generated SQL should include timestamp literals values. When set to false, timestamp values will always be specified using Parameter Binding.</p>
<p>Default: false</p></td>
</tr>
</tbody>
</table>

### Overriding SQLColumns

`SQLColumns` is a function handler that receives the results of an ODBC call
to [SQLColumns](/sql/odbc/reference/syntax/sqlcolumns-function). The source parameter contains a table with the data type information. This override is typically used to fix up data type mismatches between calls to `SQLGetTypeInfo` and `SQLColumns`.

For details of the format of the source table parameter, go to [SQLColumns Function](/sql/odbc/reference/syntax/sqlcolumns-function).

### Overriding SQLGetFunctions

This field is used to override SQLFunctions values returned by an ODBC
driver. It contains a record whose field names are equal to the
FunctionId constants defined for the ODBC
[SQLGetFunctions](/sql/odbc/reference/syntax/sqlgetfunctions-function)
function. Numeric constants for each of these fields can be found in the
[ODBC
specification](https://github.com/Microsoft/ODBC-Specification/blob/master/Windows/inc/sqlext.h).

<table>
<thead>
<tr class="header">
<th>Field</th>
<th>Details</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>SQL_CONVERT_FUNCTIONS</td>
<td>Indicates which function(s) are supported when doing type conversions. By default, the M Engine will attempt to use the CONVERT function. Drivers that prefer the use of CAST can override this value to report that only SQL_FN_CVT_CAST (numeric value of 0x2) is supported.</td>
</tr>
<tr class="even">
<td>SQL_API_SQLBINDCOL</td>
<td><p>A logical (true/false) value that indicates whether the Mashup Engine should use the <a href="/sql/odbc/reference/syntax/sqlbindcol-function">SQLBindCol API</a> when retrieving data. When set to false, <a href="/sql/odbc/reference/syntax/sqlgetdata-function">SQLGetData</a> is used instead.</p>
<p>Default: false</p></td>
</tr>
</tbody>
</table>

The following code snippet provides an example explicitly telling the M
engine to use CAST rather than CONVERT.

```
SQLGetFunctions = [
    SQL_CONVERT_FUNCTIONS = 0x2 /* SQL_FN_CVT_CAST */
]
```

### Overriding SQLGetInfo

This field is used to override SQLGetInfo values returned by an ODBC
driver. It contains a record whose fields are names equal to the
InfoType constants defined for the ODBC
[SQLGetInfo](/sql/odbc/reference/syntax/sqlgetinfo-function)
function. Numeric constants for each of these fields can be found in the
[ODBC
specification](https://github.com/Microsoft/ODBC-Specification/blob/master/Windows/inc/sqlext.h).
The full list of InfoTypes that are checked can be found in the Mashup
Engine trace files.

The following table contains commonly overridden SQLGetInfo properties:

<table>
<thead>
<tr class="header">
<th>Field</th>
<th>Details</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>SQL_SQL_CONFORMANCE</td>
<td><p>An integer value that indicates the level of SQL-92 supported by the driver:</p>
<p>(1) SQL_SC_SQL92_ENTRY = Entry level SQL-92 compliant.</p>
<p>(2) SQL_SC_FIPS127_2_TRANSITIONAL = FIPS 127-2 transitional level compliant.</p>
<p>(4) SQL_SC_ SQL92_INTERMEDIATE = Intermediate level SQL-92 compliant.</p>
<p>(8) SQL_SC_SQL92_FULL = Full level SQL-92 compliant.</p>
<p>Note that in Power Query scenarios, the connector will be used in a Read Only mode. Most drivers will want to report a SQL_SC_SQL92_FULL compliance level, and override specific SQL generation behavior using the SQLGetInfo and SQLGetFunctions properties.</p></td>
</tr>
<tr class="even">
<td>SQL_SQL92_PREDICATES</td>
<td><p>A bitmask enumerating the predicates supported in a SELECT statement, as defined in SQL-92.</p>
<p>See the <a href="https://github.com/Microsoft/ODBC-Specification/blob/master/Windows/inc/sqlext.h#L1765">SQL_SP_* constants</a> in the ODBC specification.</p></td>
</tr>
<tr class="odd">
<td>SQL_AGGREGATE_FUNCTIONS</td>
<td><p>A bitmask enumerating support for aggregation functions.</p>
<p>SQL_AF_ALL</p>
<p>SQL_AF_AVG</p>
<p>SQL_AF_COUNT</p>
<p>SQL_AF_DISTINCT</p>
<p>SQL_AF_MAX</p>
<p>SQL_AF_MIN</p>
<p>SQL_AF_SUM</p>
<p>See the <a href="https://github.com/Microsoft/ODBC-Specification/blob/master/Windows/inc/sqlext.h#L1523">SQL_AF_* constants</a> in the ODBC specification.</p></td>
</tr>
<tr class="even">
<td>SQL_GROUP_BY</td>
<td><p>A integer value that specifies the relationship between the columns in the GROUP BY clause and the non-aggregated columns in the select list:</p>
<p>SQL_GB_COLLATE = A COLLATE clause can be specified at the end of each grouping column.</p>
<p>SQL_GB_NOT_SUPPORTED = GROUP BY clauses are not supported.</p>
<p>SQL_GB_GROUP_BY_EQUALS_SELECT = The GROUP BY clause must contain all non-aggregated columns in the select list. It cannot contain any other columns. For example, SELECT DEPT, MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT.</p>
<p>SQL_GB_GROUP_BY_CONTAINS_SELECT = The GROUP BY clause must contain all non-aggregated columns in the select list. It can contain columns that are not in the select list. For example, SELECT DEPT, MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT, AGE.</p>
<p>SQL_GB_NO_RELATION = The columns in the GROUP BY clause and the select list are not related. The meaning of non-grouped, non-aggregated columns in the select list is data source–dependent. For example, SELECT DEPT, SALARY FROM EMPLOYEE GROUP BY DEPT, AGE.</p>
<p>See the <a href="https://github.com/Microsoft/ODBC-Specification/blob/master/Windows/inc/sqlext.h#L1421">SQL_GB_* constants</a> in the ODBC specification.</p></td>
</tr>
</tbody>
</table>

The following helper function can be used to create bitmask values from
a list of integer
values:

```
Flags = (flags as list) =>
    let
        Loop = List.Generate(
                  ()=> [i = 0, Combined = 0],
                  each [i] < List.Count(flags),
                  each [i = [i]+1, Combined =*Number.BitwiseOr([Combined], flags{i})],
                  each [Combined]),
        Result = List.Last(Loop, 0)
    in
        Result;
```

### Overriding SQLGetTypeInfo

`SQLGetTypeInfo` can be specified in two ways:

* A fixed `table` value that contains the same type information as an ODBC call to `SQLGetTypeInfo`.
* A function that accepts a table argument, and returns a table. The argument will contain the original results of the ODBC call to `SQLGetTypeInfo`. Your function implementation can modify/add to this table.

The first approach is used to completely override the values returned by the ODBC driver. The second approach is used if you want to add to or modify these values.

For details of the format of the types table parameter and expected return value,
see the [SQLGetTypeInfo function reference](/sql/odbc/reference/syntax/sqlgettypeinfo-function).

#### SQLGetTypeInfo using a static table

The following code snippet provides a static implementation for SQLGetTypeInfo.

```
SQLGetTypeInfo = #table(
    { "TYPE_NAME",      "DATA_TYPE", "COLUMN_SIZE", "LITERAL_PREF", "LITERAL_SUFFIX", "CREATE_PARAS",           "NULLABLE", "CASE_SENSITIVE", "SEARCHABLE", "UNSIGNED_ATTRIBUTE", "FIXED_PREC_SCALE", "AUTO_UNIQUE_VALUE", "LOCAL_TYPE_NAME", "MINIMUM_SCALE", "MAXIMUM_SCALE", "SQL_DATA_TYPE", "SQL_DATETIME_SUB", "NUM_PREC_RADIX", "INTERNAL_PRECISION", "USER_DATA_TYPE" }, {

    { "char",           1,          65535,          "'",            "'",              "max. length",            1,          1,                3,            null,                 0,                  null,                "char",            null,            null,            -8,              null,               null,             0,                    0                }, 
    { "int8",           -5,         19,             "'",            "'",              null,                     1,          0,                2,            0,                    10,                 0,                   "int8",            0,               0,               -5,              null,               2,                0,                    0                },
    { "bit",            -7,         1,              "'",            "'",              null,                     1,          1,                3,            null,                 0,                  null,                "bit",             null,            null,            -7,              null,               null,             0,                    0                },
    { "bool",           -7,         1,              "'",            "'",              null,                     1,          1,                3,            null,                 0,                  null,                "bit",             null,            null,            -7,              null,               null,             0,                    0                },
    { "date",           9,          10,             "'",            "'",              null,                     1,          0,                2,            null,                 0,                  null,                "date",            null,            null,            9,               1,                  null,             0,                    0                }, 
    { "numeric",        3,          28,             null,           null,             null,                     1,          0,                2,            0,                    0,                   0,                  "numeric",         0,               0,               2,               null,               10,               0,                    0                },
    { "float8",         8,          15,             null,           null,             null,                     1,          0,                2,            0,                    0,                   0,                  "float8",          null,            null,            6,               null,               2,                0,                    0                },
    { "float8",         6,          17,             null,           null,             null,                     1,          0,                2,            0,                    0,                   0,                  "float8",          null,            null,            6,               null,               2,                0,                    0                },
    { "uuid",           -11,        37,             null,           null,             null,                     1,          0,                2,            null,                 0,                  null,                "uuid",            null,            null,            -11,             null,               null,             0,                    0                },
    { "int4",           4,          10,             null,           null,             null,                     1,          0,                2,            0,                    0,                   0,                  "int4",            0,               0,               4,               null,               2,                0,                    0                },
    { "text",           -1,         65535,          "'",            "'",              null,                     1,          1,                3,            null,                 0,                  null,                "text",            null,            null,            -10,             null,               null,             0,                    0                },
    { "lo",             -4,         255,            "'",            "'",              null,                     1,          0,                2,            null,                 0,                  null,                "lo",              null,            null,            -4,              null,               null,             0,                    0                }, 
    { "numeric",        2,          28,             null,           null,             "precision, scale",       1,          0,                2,            0,                    10,                 0,                   "numeric",         0,               6,               2,               null,               10,               0,                    0                },
    { "float4",         7,          9,              null,           null,             null,                     1,          0,                2,            0,                    10,                 0,                   "float4",          null,            null,            7,               null,               2,                0,                    0                }, 
    { "int2",           5,          19,             null,           null,             null,                     1,          0,                2,            0,                    10,                 0,                   "int2",            0,               0,               5,               null,               2,                0,                    0                }, 
    { "int2",           -6,         5,              null,           null,             null,                     1,          0,                2,            0,                    10,                 0,                   "int2",            0,               0,               5,               null,               2,                0,                    0                }, 
    { "timestamp",      11,         26,             "'",            "'",              null,                     1,          0,                2,            null,                 0,                  null,                "timestamp",       0,               38,              9,               3,                  null,             0,                    0                }, 
    { "date",           91,         10,             "'",            "'",              null,                     1,          0,                2,            null,                 0,                  null,                "date",            null,            null,            9,               1,                  null,             0,                    0                }, 
    { "timestamp",      93,         26,             "'",            "'",              null,                     1,          0,                2,            null,                 0,                  null,                "timestamp",       0,               38,              9,               3,                  null,             0,                    0                }, 
    { "bytea",          -3,         255,            "'",            "'",              null,                     1,          0,                2,            null,                 0,                  null,                "bytea",           null,            null,            -3,              null,               null,             0,                    0                }, 
    { "varchar",        12,         65535,          "'",            "'",              "max. length",            1,          0,                2,            null,                 0,                  null,                "varchar",         null,            null,           -9,               null,               null,             0,                    0                }, 
    { "char",           -8,         65535,          "'",            "'",              "max. length",            1,          1,                3,            null,                 0,                  null,                "char",            null,            null,           -8,               null,               null,             0,                    0                }, 
    { "text",           -10,        65535,          "'",            "'",              "max. length",            1,          1,                3,            null,                 0,                  null,                "text",            null,            null,           -10,              null,               null,             0,                    0                }, 
    { "varchar",        -9,         65535,          "'",            "'",              "max. length",            1,          1,                3,            null,                 0,                  null,                "varchar",         null,            null,           -9,               null,               null,             0,                    0                },
    { "bpchar",         -8,         65535,           "'",            "'",              "max. length",            1,          1,                3,            null,                 0,                  null,                "bpchar",          null,            null,            -9,               null,               null,            0,                    0                } }
);
```

#### SQLGetTypeInfo using a function

The following code snippets append the `bpchar` type to the existing types returned by the driver.

```
SQLGetTypeInfo = (types as table) as table =>
   let
       newTypes = #table(
           {
               "TYPE_NAME",
               "DATA_TYPE",
               "COLUMN_SIZE",
               "LITERAL_PREF",
               "LITERAL_SUFFIX",
               "CREATE_PARAS",
               "NULLABLE",
               "CASE_SENSITIVE",
               "SEARCHABLE",
               "UNSIGNED_ATTRIBUTE",
               "FIXED_PREC_SCALE",
               "AUTO_UNIQUE_VALUE",
               "LOCAL_TYPE_NAME",
               "MINIMUM_SCALE",
               "MAXIMUM_SCALE",
               "SQL_DATA_TYPE",
               "SQL_DATETIME_SUB",
               "NUM_PREC_RADIX",
               "INTERNAL_PRECISION",
               "USER_DATA_TYPE"
            },
            // we add a new entry for each type we want to add
            {
                {
                    "bpchar",
                    -8,
                    65535,
                    "'",
                    "'",
                    "max. length",
                    1,
                    1,
                    3,
                    null,
                    0,
                    null,
                    "bpchar",
                    null,
                    null,
                    -9,
                    null,
                    null,
                    0,
                    0
                }
            }),
        append = Table.Combine({types, newTypes})
    in
        append;
```
<!--
### Overriding SQLTables

**TODO**

## Creating Your Connector

**Checklist: TODO**
-->
### Setting the Connection String

The connection string for your ODBC driver is set using the first
argument to the [Odbc.DataSource](/powerquery-m/odbc-datasource) and/or [Odbc.Query](/powerquery-m/odbc-query) functions. The value
can be text, or an M record. When using the record, each field in the
record will become a property in the connection string. All connection
strings will require a Driver field (or DSN field if you require users
to pre-configure a system level DSN). Credential related properties will
be set separately (see below). Other properties will be driver specific.

The code snippet below shows the definition of a new data source
function, creation of the ConnectionString record, and invocation of the
[Odbc.DataSource](/powerquery-m/odbc-datasource) function.

```
[DataSource.Kind="SqlODBC", Publish="SqlODBC.Publish"]
shared SqlODBC.Contents = (server as text) =>
    let
        ConnectionString = [
            Driver = "SQL Server Native Client 11.0",
            Server = server,
            MultiSubnetFailover = "Yes",
            ApplicationIntent = "ReadOnly",
            APP = "PowerBICustomConnector"
        ],
        OdbcDatasource = Odbc.DataSource(ConnectionString)
    in
        OdbcDatasource;
```
<!--
### Setting credentials

**TODO**

### Disable Parameter Binding (if required)

**TODO**
-->
## Troubleshooting and Testing

**To enable tracing in Power BI Desktop:**

1. Go to **File > Options and settings > Options**.
2. Select on the **Diagnostics** tab.
3. Select the **Enable tracing** option.
4. Select the **Open traces folder** link (should be `%LOCALAPPDATA%/Microsoft/Power BI Desktop/Traces`).
5. Delete existing trace files.
6. Perform your tests.
7. Close Power BI Desktop to ensure all log files are flushed to disk.

Here are steps you can take for initial testing in Power BI Desktop:

1. Close Power BI Desktop.
2. Clear your trace directory.
3. Open Power BI desktop, and enable tracing.
4. Connect to your data source, and select Direct Query mode.
5. Select a table in the navigator, and select **Edit**.
6. Manipulate the query in various ways, including:
>*  Take the First N rows (for example, 10).
>*  Set equality filters on different data types (int, string, bool, and so on).
>*  Set other range filters (greater than, less than).
>*  Filter on NULL / NOT NULL.
>*  Select a sub-set of columns.
>*  Aggregate / Group By different column combinations.
>*  Add a column calculated from other columns ([C] = [A] + [B]).
>*  Sort on one column, multiple columns.
7. Expressions that fail to fold will result in a warning bar. Note the
    failure, remove the step, and move to the next test case. Details
    about the cause of the failure should be emitted to the trace logs.
8. Close Power BI Desktop.
9. Copy the trace files to a new directory.
10. Use the recommend Power BI workbook to parse and analyze the trace files.

Once you have simple queries working, you can then try Direct Query
scenarios (for example, building reports in the Report Views). The queries
generated in Direct Query mode will be significantly more complex (that is,
use of sub-selects, COALESCE statements, and aggregations).
<!--
## Common Problems

**TODO**

- In query editor, filter on each data type
- Filter on missing data types -- SEARCHABLE
- Filter on date -- timestamp precision incorrect
-->
### Concatenation of strings in Direct Query mode

The M engine does basic type size limit validation as part of its query folding logic. If you are receiving a folding error when trying to concatenate two strings that potentially overflow the maximum size of the underlying database type:

1. Ensure that your database can support up-conversion to CLOB types when string concat overflow occurs.
2. Set the `TolerateConcatOverflow` [option](#parameters-for-odbcdatasource) for Odbc.DataSource to `true`.

> The [DAX CONCATENATE function](/dax/concatenate-function-dax) is currently not supported by Power Query/ODBC extensions.
> Extension authors should ensure string concatenation works through the query editor by adding calculated columns (`[stringCol1] & [stringCol2]`).
> When the capability to fold the CONCATENATE operation is added in the future, it should work seamlessly with existing extensions.
