---
title: Helper functions for M extensions for Power Query connectors
description: Use helper functions for Power Query connectors
author: ptyx507x
ms.topic: conceptual
ms.date: 8/22/2024
ms.author: miescobar
---

# Helper functions

This article contains a number of helper functions commonly used in M extensions. These functions might eventually be moved to the official M library, but for now can be copied into your extension file code. You shouldn't mark any of these functions as `shared` within your extension code.

## Navigation tables

### Table.ToNavigationTable

This function adds the table type metadata needed for your extension to return a table value that Power Query can recognize as a navigation tree. For more information, go to [Navigation tables](HandlingNavigationTables.md).

```powerquery-m
Table.ToNavigationTable = (
    table as table,
    keyColumns as list,
    nameColumn as text,
    dataColumn as text,
    itemKindColumn as text,
    itemNameColumn as text,
    isLeafColumn as text
) as table =>
    let
        tableType = Value.Type(table),
        newTableType = Type.AddTableKey(tableType, keyColumns, true) meta 
        [
            NavigationTable.NameColumn = nameColumn, 
            NavigationTable.DataColumn = dataColumn,
            NavigationTable.ItemKindColumn = itemKindColumn, 
            Preview.DelayColumn = itemNameColumn, 
            NavigationTable.IsLeafColumn = isLeafColumn
        ],
        navigationTable = Value.ReplaceType(table, newTableType)
    in
        navigationTable;
```

| Parameter      | Details         |
|:---------------|:----------------|
| table          | Your navigation table.   |
| keyColumns     | List of column names that act as the primary key for your navigation table.      |
| nameColumn     | The name of the column that should be used as the display name in the navigator. |
| dataColumn     | The name of the column that contains the table or function to display.           |
| itemKindColumn | The name of the column to use to determine the type of icon to display. Valid values for the column are listed in the [handling navigation article](handlingnavigationtables.md#values-for-itemkind).    |
| itemNameColumn | The name of the column to use to determine the type of tooltip to display. Valid values for the column are `Table` and `Function`. |
| isLeafColumn   | The name of the column used to determine if this is a leaf node, or if the node can be expanded to contain another navigation table. |

**Example usage:**

```powerquery-m
shared MyExtension.Contents = () =>
    let
        objects = #table(
            {"Name",       "Key",        "Data",                           "ItemKind", "ItemName", "IsLeaf"},{
            {"Item1",      "item1",      #table({"Column1"}, {{"Item1"}}), "Table",    "Table",    true},
            {"Item2",      "item2",      #table({"Column1"}, {{"Item2"}}), "Table",    "Table",    true},
            {"Item3",      "item3",      FunctionCallThatReturnsATable(),  "Table",    "Table",    true},            
            {"MyFunction", "myfunction", AnotherFunction.Contents(),       "Function", "Function", true}
            }),
        NavTable = Table.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        NavTable;
```

## URI manipulation

### Uri.FromParts

This function constructs a full URL based on individual fields in the record. It acts as the reverse of [Uri.Parts](/powerquery-m/uri-parts).

```powerquery-m
Uri.FromParts = (parts) =>
    let
        port = if (parts[Scheme] = "https" and parts[Port] = 443) or (parts[Scheme] = "http" and parts[Port] = 80) then "" else ":" & Text.From(parts[Port]),
        div1 = if Record.FieldCount(parts[Query]) > 0 then "?" else "",
        div2 = if Text.Length(parts[Fragment]) > 0 then "#" else "",
        uri = Text.Combine({parts[Scheme], "://", parts[Host], port, parts[Path], div1, Uri.BuildQueryString(parts[Query]), div2, parts[Fragment]})
    in
        uri;
```

### Uri.GetHost

This function returns the scheme, host, and default port (for HTTP/HTTPS) for a given URL. For example, `https://bing.com/subpath/query?param=1&param2=hello` would become `https://bing.com:443`.

This is particularly useful for building `ResourcePath`.

```powerquery-m
Uri.GetHost = (url) =>
    let
        parts = Uri.Parts(url),
        port = if (parts[Scheme] = "https" and parts[Port] = 443) or (parts[Scheme] = "http" and parts[Port] = 80) then "" else ":" & Text.From(parts[Port])
    in
        parts[Scheme] & "://" & parts[Host] & port;
```

### ValidateUrlScheme

This function checks if the user entered an HTTPS URL and raises an error if they don't. This is required for user entered URLs for certified connectors.

```powerquery-m
ValidateUrlScheme = (url as text) as text => if (Uri.Parts(url)[Scheme] <> "https") then error "Url scheme must be HTTPS" else url;
```

To apply it, just wrap your `url` parameter in your data access function.

```powerquery-m
DataAccessFunction = (url as text) as table =>
    let
        _url = ValidateUrlScheme(url),
        source = Web.Contents(_url)
    in
        source;
```

## Retrieving data

### Value.WaitFor

This function is useful when making an asynchronous HTTP request and you need to poll the server until the request is complete.

```powerquery-m
Value.WaitFor = (producer as function, interval as function, optional count as number) as any =>
    let
        list = List.Generate(
            () => {0, null},
            (state) => state{0} <> null and (count = null or state{0} < count),
            (state) => if state{1} <> null then {null, state{1}} else {1 + state{0}, Function.InvokeAfter(() => producer(state{0}), interval(state{0}))},
            (state) => state{1})
    in
        List.Last(list);
```

### Table.GenerateByPage

This function is used when an API returns data in an incremental/paged format, which is common for many REST APIs. The `getNextPage` argument is a function that takes in a single parameter, which is the result of the previous call to `getNextPage`, and should return a `nullable table`.

```powerquery-m
getNextPage = (lastPage) as nullable table => ...;
```

`getNextPage` is called repeatedly until it returns `null`. The function collate s all pages into a single table. When the result of the first call to `getNextPage` is null, an empty table is returned.

```powerquery-m
// The getNextPage function takes a single argument and is expected to return a nullable table
Table.GenerateByPage = (getNextPage as function) as table =>
    let        
        listOfPages = List.Generate(
            () => getNextPage(null),            // get the first page of data
            (lastPage) => lastPage <> null,     // stop when the function returns null
            (lastPage) => getNextPage(lastPage) // pass the previous page to the next function call
        ),
        // concatenate the pages together
        tableOfPages = Table.FromList(listOfPages, Splitter.SplitByNothing(), {"Column1"}),
        firstRow = tableOfPages{0}?
    in
        // if we didn't get back any pages of data, return an empty table
        // otherwise set the table type based on the columns of the first page
        if (firstRow = null) then
            Table.FromRows({})
    // check for empty first table
        else if (Table.IsEmpty(firstRow[Column1])) then
            firstRow[Column1]
        else
            Value.ReplaceType(
                Table.ExpandTableColumn(tableOfPages, "Column1", Table.ColumnNames(firstRow[Column1])),
                Value.Type(firstRow[Column1])
            );
```

Additional notes:

- The `getNextPage` function needs to retrieve the next page URL (or page number, or whatever other values are used to implement the paging logic). This process is generally done by adding `meta` values to the page before returning it.
- The columns and table type of the combined table (that is, all pages together) are derived from the first page of data. The `getNextPage` function should normalize each page of data.
- The first call to `getNextPage` receives a null parameter.
- `getNextPage` must return null when there are no pages left.

An example of using this function can be found in the [GitHub sample](samples/github/readme.md), and the [TripPin paging sample](samples/trippin/5-paging/readme.md).

```powerquery-m
Github.PagedTable = (url as text) => Table.GenerateByPage((previous) =>
    let
        // If we have a previous page, get its Next link from metadata on the page.
        next = if (previous <> null) then Value.Metadata(previous)[Next] else null,
        // If we have a next link, use it, otherwise use the original URL that was passed in.
        urlToUse = if (next <> null) then next else url,
        // If we have a previous page, but don't have a next link, then we're done paging.
        // Otherwise retrieve the next page.
        current = if (previous <> null and next = null) then null else Github.Contents(urlToUse),
        // If we got data back from the current page, get the link for the next page
        link = if (current <> null) then Value.Metadata(current)[Next] else null
    in
        current meta [Next=link]);
```

### SchemaTransformTable

```powerquery-m
EnforceSchema.Strict = 1;               // Add any missing columns, remove extra columns, set table type
EnforceSchema.IgnoreExtraColumns = 2;   // Add missing columns, don't remove extra columns
EnforceSchema.IgnoreMissingColumns = 3; // Don't add or remove columns

SchemaTransformTable = (table as table, schema as table, optional enforceSchema as number) as table =>
    let
        // Default to EnforceSchema.Strict
        _enforceSchema = if (enforceSchema <> null) then enforceSchema else EnforceSchema.Strict,

        // Applies type transforms to a given table
        EnforceTypes = (table as table, schema as table) as table =>
            let
                map = (t) => if Type.Is(t, type list) or Type.Is(t, type record) or t = type any then null else t,
                mapped = Table.TransformColumns(schema, {"Type", map}),
                omitted = Table.SelectRows(mapped, each [Type] <> null),
                existingColumns = Table.ColumnNames(table),
                removeMissing = Table.SelectRows(omitted, each List.Contains(existingColumns, [Name])),
                primativeTransforms = Table.ToRows(removeMissing),
                changedPrimatives = Table.TransformColumnTypes(table, primativeTransforms)
            in
                changedPrimatives,

        // Returns the table type for a given schema
        SchemaToTableType = (schema as table) as type =>
            let
                toList = List.Transform(schema[Type], (t) => [Type=t, Optional=false]),
                toRecord = Record.FromList(toList, schema[Name]),
                toType = Type.ForRecord(toRecord, false)
            in
                type table (toType),

        // Determine if we have extra/missing columns.
        // The enforceSchema parameter determines what we do about them.
        schemaNames = schema[Name],
        foundNames = Table.ColumnNames(table),
        addNames = List.RemoveItems(schemaNames, foundNames),
        extraNames = List.RemoveItems(foundNames, schemaNames),
        tmp = Text.NewGuid(),
        added = Table.AddColumn(table, tmp, each []),
        expanded = Table.ExpandRecordColumn(added, tmp, addNames),
        result = if List.IsEmpty(addNames) then table else expanded,
        fullList =
            if (_enforceSchema = EnforceSchema.Strict) then
                schemaNames
            else if (_enforceSchema = EnforceSchema.IgnoreMissingColumns) then
                foundNames
            else
                schemaNames & extraNames,

        // Select the final list of columns.
        // These are ordered according to the schema table.
        reordered = Table.SelectColumns(result, fullList, MissingField.Ignore),
        enforcedTypes = EnforceTypes(reordered, schema),
        withType = if (_enforceSchema = EnforceSchema.Strict) then Value.ReplaceType(enforcedTypes, SchemaToTableType(schema)) else enforcedTypes
    in
        withType;
```

### Table.ChangeType

```powerquery-m
let
    // table should be an actual Table.Type, or a List.Type of Records
    Table.ChangeType = (table, tableType as type) as nullable table =>
        // we only operate on table types
        if (not Type.Is(tableType, type table)) then error "type argument should be a table type" else
        // if we have a null value, just return it
        if (table = null) then table else
        let
            columnsForType = Type.RecordFields(Type.TableRow(tableType)),
            columnsAsTable = Record.ToTable(columnsForType),
            schema = Table.ExpandRecordColumn(columnsAsTable, "Value", {"Type"}, {"Type"}),
            previousMeta = Value.Metadata(tableType),

            // make sure we have a table
            parameterType = Value.Type(table),
            _table =
                if (Type.Is(parameterType, type table)) then table
                else if (Type.Is(parameterType, type list)) then
                    let
                        asTable = Table.FromList(table, Splitter.SplitByNothing(), {"Column1"}),
                        firstValueType = Value.Type(Table.FirstValue(asTable, null)),
                        result =
                            // if the member is a record (as expected), then expand it. 
                            if (Type.Is(firstValueType, type record)) then
                                Table.ExpandRecordColumn(asTable, "Column1", schema[Name])
                            else
                                error Error.Record("Error.Parameter", "table argument is a list, but not a list of records", [ ValueType = firstValueType ])
                    in
                        if (List.IsEmpty(table)) then
                            #table({"a"}, {})
                        else result
                else
                    error Error.Record("Error.Parameter", "table argument should be a table or list of records", [ValueType = parameterType]),

            reordered = Table.SelectColumns(_table, schema[Name], MissingField.UseNull),

            // process primitive values - this calls Table.TransformColumnTypes
            map = (t) => if Type.Is(t, type table) or Type.Is(t, type list) or Type.Is(t, type record) or t = type any then null else t,        
            mapped = Table.TransformColumns(schema, {"Type", map}),
            omitted = Table.SelectRows(mapped, each [Type] <> null),
            existingColumns = Table.ColumnNames(reordered),
            removeMissing = Table.SelectRows(omitted, each List.Contains(existingColumns, [Name])),
            primativeTransforms = Table.ToRows(removeMissing),
            changedPrimatives = Table.TransformColumnTypes(reordered, primativeTransforms),
        
            // Get the list of transforms we use for Record types
            recordColumns = Table.SelectRows(schema, each Type.Is([Type], type record)),
            recordTypeTransformations = Table.AddColumn(recordColumns, "RecordTransformations", each (r) => Record.ChangeType(r, [Type]), type function),
            recordChanges = Table.ToRows(Table.SelectColumns(recordTypeTransformations, {"Name", "RecordTransformations"})),

            // Get the list of transforms we use for List types
            listColumns = Table.SelectRows(schema, each Type.Is([Type], type list)),
            listTransforms = Table.AddColumn(listColumns, "ListTransformations", each (t) => List.ChangeType(t, [Type]), Function.Type),
            listChanges = Table.ToRows(Table.SelectColumns(listTransforms, {"Name", "ListTransformations"})),

            // Get the list of transforms we use for Table types
            tableColumns = Table.SelectRows(schema, each Type.Is([Type], type table)),
            tableTransforms = Table.AddColumn(tableColumns, "TableTransformations", each (t) => @Table.ChangeType(t, [Type]), Function.Type),
            tableChanges = Table.ToRows(Table.SelectColumns(tableTransforms, {"Name", "TableTransformations"})),

            // Perform all of our transformations
            allColumnTransforms = recordChanges & listChanges & tableChanges,
            changedRecordTypes = if (List.IsEmpty(allColumnTransforms)) then changedPrimatives else Table.TransformColumns(changedPrimatives, allColumnTransforms, null, MissingField.Ignore),

            // set final type
            withType = Value.ReplaceType(changedRecordTypes, tableType)
        in
            if (List.IsEmpty(Record.FieldNames(columnsForType))) then table else withType meta previousMeta,

    // If given a generic record type (no predefined fields), the original record is returned
    Record.ChangeType = (record as record, recordType as type) =>
        let
            // record field format is [ fieldName = [ Type = type, Optional = logical], ... ]
            fields = try Type.RecordFields(recordType) otherwise error "Record.ChangeType: failed to get record fields. Is this a record type?",
            fieldNames = Record.FieldNames(fields),
            fieldTable = Record.ToTable(fields),
            optionalFields = Table.SelectRows(fieldTable, each [Value][Optional])[Name],
            requiredFields = List.Difference(fieldNames, optionalFields),
            // make sure all required fields exist
            withRequired = Record.SelectFields(record, requiredFields, MissingField.UseNull),
            // append optional fields
            withOptional = withRequired & Record.SelectFields(record, optionalFields, MissingField.Ignore),
            // set types
            transforms = GetTransformsForType(recordType),
            withTypes = Record.TransformFields(withOptional, transforms, MissingField.Ignore),
            // order the same as the record type
            reorder = Record.ReorderFields(withTypes, fieldNames, MissingField.Ignore)
        in
            if (List.IsEmpty(fieldNames)) then record else reorder,

    List.ChangeType = (list as list, listType as type) =>
        if (not Type.Is(listType, type list)) then error "type argument should be a list type" else
        let
            listItemType = Type.ListItem(listType),
            transform = GetTransformByType(listItemType),
            modifiedValues = List.Transform(list, transform),
            typed = Value.ReplaceType(modifiedValues, listType)
        in
            typed,

    // Returns a table type for the provided schema table
    Schema.ToTableType = (schema as table) as type =>
        let
            toList = List.Transform(schema[Type], (t) => [Type=t, Optional=false]),
            toRecord = Record.FromList(toList, schema[Name]),
            toType = Type.ForRecord(toRecord, false),
            previousMeta = Value.Metadata(schema)
        in
            type table (toType) meta previousMeta,

    // Returns a list of transformations that can be passed to Table.TransformColumns, or Record.TransformFields
    // Format: {"Column", (f) => ...} .... ex: {"A", Number.From}
    GetTransformsForType = (_type as type) as list =>
        let
            fieldsOrColumns = if (Type.Is(_type, type record)) then Type.RecordFields(_type)
                            else if (Type.Is(_type, type table)) then Type.RecordFields(Type.TableRow(_type))
                            else error "GetTransformsForType: record or table type expected",
            toTable = Record.ToTable(fieldsOrColumns),
            transformColumn = Table.AddColumn(toTable, "Transform", each GetTransformByType([Value][Type]), Function.Type),
            transformMap = Table.ToRows(Table.SelectColumns(transformColumn, {"Name", "Transform"}))
        in
            transformMap,

    GetTransformByType = (_type as type) as function =>
                if (Type.Is(_type, type number)) then Number.From
        else if (Type.Is(_type, type text)) then Text.From
        else if (Type.Is(_type, type date)) then Date.From
        else if (Type.Is(_type, type datetime)) then DateTime.From
        else if (Type.Is(_type, type duration)) then Duration.From
        else if (Type.Is(_type, type datetimezone)) then DateTimeZone.From
        else if (Type.Is(_type, type logical)) then Logical.From
        else if (Type.Is(_type, type time)) then Time.From
        else if (Type.Is(_type, type record)) then (t) => if (t <> null) then @Record.ChangeType(t, _type) else t
        else if (Type.Is(_type, type table)) then (t) => if (t <> null) then @Table.ChangeType(t, _type) else t
        else if (Type.Is(_type, type list)) then (t) => if (t <> null) then @List.ChangeType(t, _type) else t
        else (t) => t
in
    Table.ChangeType
```
