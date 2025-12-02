---
title: Creating Excel documents with navigation tables
description: Learn how to create Excel documents programmatically using Power Query navigation tables
author: jorgegom
ms.topic: concept-article
ms.date: 12/01/2025
ms.author: jorgegom
ms.subservice: dataflows
---

# Creating Excel documents with navigation tables

When saving data as Excel in a SharePoint Output Destination, you define the structure and content of your Excel workbook using a navigation table. This table serves as a blueprint that specifies worksheets, charts, data, and their relationships.

This article explains how to construct these navigation tables to generate Excel documents programmatically from your Dataflow.

## Overview

Excel documents in Power Query are represented as navigation tables—standard M tables with specific columns that describe the document structure. Each row in the navigation table represents a part of the Excel document, such as a worksheet containing data or a chart visualizing that data.

When you configure an Excel Output Destination in a Dataflow, the system reads this navigation table and generates the corresponding Excel file. This approach provides flexibility in defining complex workbooks with multiple sheets, charts, and data relationships.

## Minimal example

The simplest way to create an Excel document is to provide a navigation table with just the data you want to export. All columns except `Data` and `PartType` are optional—the connector can infer missing properties and build a functional document.

The following example defines a `SalesData` table that will be used throughout this article:

```powerquery-m
let
    // Define your data with columns used throughout this article
    SalesData = #table(
        type table [
            Region = text, 
            Category = text, 
            Product = text, 
            Quarter = text,
            Revenue = number,
            Units = number
        ],
        {
            {"North", "Electronics", "Laptop", "Q1", 45000, 150},
            {"North", "Electronics", "Phone", "Q1", 32000, 400},
            {"North", "Furniture", "Desk", "Q1", 18000, 60},
            {"South", "Electronics", "Laptop", "Q1", 38000, 120},
            {"South", "Electronics", "Phone", "Q1", 28000, 350},
            {"South", "Furniture", "Chair", "Q1", 12000, 200},
            {"East", "Electronics", "Tablet", "Q2", 22000, 180},
            {"East", "Furniture", "Desk", "Q2", 15000, 50},
            {"West", "Electronics", "Phone", "Q2", 41000, 520},
            {"West", "Furniture", "Chair", "Q2", 9000, 150}
        }
    ),

    // Create the navigation table with minimal structure
    // Only Data and PartType are required
    excelDocument = #table(
        type table [PartType = nullable text, Data = any],
        {
            {"SheetData", SalesData}
        }
    )
in
    excelDocument
```

When you don't specify sheet names or part names, the system automatically generates appropriate defaults.

### Referencing other queries

In a Dataflow, you can reference other existing queries in your navigation table. The `Data` column accepts any table value, including references to queries defined elsewhere in your Dataflow:

```powerquery-m
let
    // Reference existing queries named "MonthlySales" and "CurrentInventory"
    excelDocument = #table(
        type table [PartType = nullable text, Data = any],
        {
            {"SheetData", MonthlySales},
            {"SheetData", CurrentInventory}
        }
    )
in
    excelDocument
```

## Navigation table structure

The navigation table follows a specific schema with the following columns:

| Column | Type | Required | Description |
|--------|------|----------|-------------|
| Sheet | nullable text | No | The parent worksheet name for the part. If not specified, a default name is generated. |
| Name | nullable text | No | A unique identifier for the part, used for referencing data between parts. |
| PartType | nullable text | No | The type of part being created: `Workbook`, `SheetData`, or `Chart`. |
| Properties | nullable record | No | Configuration options specific to the part type. |
| Data | any | Yes | The actual data content. Can be a table, or a reference to another part. |

### Supported part types

- **Workbook**: Document-level configuration. Must be the first row if used.
- **SheetData**: A worksheet containing tabular data.
- **Chart**: A chart visualization. Can be placed on its own sheet or combined with data.

### Example with full structure

```powerquery-m
let
    // Helper function to create a reference to another part
    buildReference = (name as text) => #table({}, {}) meta [Name = name],

    excelDocument = #table(
        type table [Sheet = nullable text, Name = nullable text, PartType = nullable text, Properties = nullable record, Data = any],
        {
            {"DataSheet", "SalesTable", "SheetData", [], SalesData},
            {"ChartSheet", "SalesChart", "Chart", [ChartType = "Column"], buildReference("SalesTable")}
        }
    )
in
    excelDocument
```

## Charts and data placement

When you create a chart part, you can control where the chart and its data appear in the workbook.

### Chart with separate data sheet

When a chart references data from a different part using the `meta [Name = "..."]` syntax, the data and chart are placed on separate sheets.

> [!IMPORTANT]
> When using references, the `Name` column is mandatory. The reference is resolved by matching the value in `meta [Name = "..."]` to the `Name` column of another row in the navigation table.

```powerquery-m
let
    // Helper function to create a reference to another part
    buildReference = (name as text) => #table({}, {}) meta [Name = name],

    excelDocument = #table(
        type table [Sheet = nullable text, Name = nullable text, PartType = nullable text, Properties = nullable record, Data = any],
        {
            // Data on its own sheet
            {"DataSheet", "SalesTable", "SheetData", [], SalesData},
            // Chart on a different sheet, referencing the data
            {"ChartSheet", "SalesChart", "Chart", [ChartType = "Line"], buildReference("SalesTable")}
        }
    )
in
    excelDocument
```

### Chart with inline data

When a chart part includes data directly (without referencing another part), both the data and the chart are created on the same sheet:

```powerquery-m
let
    excelDocument = #table(
        type table [Sheet = nullable text, Name = nullable text, PartType = nullable text, Properties = nullable record, Data = any],
        {
            // Data and chart appear together on the same sheet
            {"SalesSheet", "SalesChart", "Chart", [ChartType = "Column"], SalesData}
        }
    )
in
    excelDocument
```

This approach is convenient when you want users to see the data alongside its visualization.

## Workbook properties

The `Workbook` part type allows you to configure document-level settings. If used, it must be the first row in the navigation table.

| Property | Type | Description |
|----------|------|-------------|
| ChartInferenceFunction | function | A function that automatically determines chart properties when not explicitly specified. Use `Office.InferChartPropertiesGenerator()` for the built-in inference engine. |
| StrictNameHandling | logical | When `true`, throws an error if sheet or part names contain invalid characters. When `false` (default), names are automatically sanitized. |
| UseSharedStrings | logical | When `true` (default), uses Excel's shared string table for text cells, resulting in smaller files. |

### Example with workbook properties

```powerquery-m
let
    excelDocument = #table(
        type table [Sheet = nullable text, Name = nullable text, PartType = nullable text, Properties = nullable record, Data = any],
        {
            // Workbook configuration (must be first)
            {"Workbook", "Workbook", "Workbook", 
                [
                    ChartInferenceFunction = Office.InferChartPropertiesGenerator([
                        Allow3DCharts = false,
                        PreferMultilevelChartInference = true
                    ]),
                    StrictNameHandling = false
                ], 
                null
            },
            // Data and charts follow
            {"Sales", "SalesTable", "SheetData", [], SalesData}
        }
    )
in
    excelDocument
```

## Multiple charts with shared data

Charts can reference the same data source, allowing you to create multiple visualizations of the same dataset without duplicating the data in the workbook.

Use the `meta [Name = "..."]` syntax to create references. The `Name` column must be specified for the data part so that charts can resolve the reference.

> [!IMPORTANT]
> When charts reference data, you must provide the `DataSeries` configuration with `AxisColumns` and `ValueColumns`. Without a `ChartInferenceFunction` configured in the Workbook properties, omitting these required parameters results in an error.

```powerquery-m
let
    // Helper function to create a reference
    buildReference = (name as text) => #table({}, {}) meta [Name = name],

    excelDocument = #table(
        type table [Sheet = nullable text, Name = nullable text, PartType = nullable text, Properties = nullable record, Data = any],
        {
            // Single data source - Name is required for reference resolution
            {"Data", "SalesTable", "SheetData", [], SalesData},
            
            // Multiple charts referencing the same data
            // Each chart must specify DataSeries with AxisColumns and ValueColumns
            {"LineChart", "TrendChart", "Chart", 
                [
                    ChartType = "Line", 
                    ChartTitle = "Sales Trend",
                    DataSeries = [AxisColumns = {"Quarter"}, ValueColumns = {"Revenue"}]
                ],
                buildReference("SalesTable")
            },
            {"PieChart", "DistributionChart", "Chart",
                [
                    ChartType = "Pie", 
                    ChartTitle = "Sales Distribution",
                    DataSeries = [AxisColumns = {"Region"}, ValueColumns = {"Revenue"}]
                ],
                buildReference("SalesTable")
            },
            {"BarChart", "ComparisonChart", "Chart",
                [
                    ChartType = "Bar", 
                    ChartTitle = "Product Comparison",
                    DataSeries = [AxisColumns = {"Product"}, ValueColumns = {"Revenue", "Units"}]
                ],
                buildReference("SalesTable")
            }
        }
    )
in
    excelDocument
```

References work in both forward and backward directions—a chart can reference data defined later in the table, and multiple charts can reference the same data source.

## Type facets and cell formatting

Power Query data types and their facets directly influence how cells are formatted in the generated Excel file. The type system provides rich formatting capabilities that translate to appropriate Excel number formats.

### Basic type mappings

| Power Query Type | Excel Format |
|-----------------|--------------|
| `Text.Type` | Text (@) |
| `Int32.Type`, `Int64.Type` | General |
| `Decimal.Type`, `Number.Type` | Number with 2 decimal places |
| `Currency.Type` | Number with thousands separator and 2 decimal places |
| `Percentage.Type` | Percentage with 2 decimal places |
| `Date.Type` | Date format |
| `Time.Type` | Time format with AM/PM |
| `DateTime.Type` | Date and time format |
| `DateTimeZone.Type` | Date and time format |
| `Duration.Type` | Duration format (d.hh:mm:ss) |
| `Logical.Type` | General (TRUE/FALSE) |

### Using type facets for precise formatting

Type facets allow you to specify precision and scale for numeric values:

```powerquery-m
let
    // Define types with specific facets
    currencyType = Type.ReplaceFacets(Currency.Type, 
        [NumericPrecision = 19, NumericScale = 4]),
    
    percentageType = Type.ReplaceFacets(Percentage.Type, 
        [NumericPrecision = 5, NumericScale = 2]),
    
    decimalType = Type.ReplaceFacets(Decimal.Type, 
        [NumericPrecision = 10, NumericScale = 4]),

    // Create table with typed columns
    tableType = type table [
        Product = Text.Type,
        Price = currencyType,           // Displays as currency with 4 decimal places
        Discount = percentageType,       // Displays as percentage with 2 decimal places
        TaxRate = decimalType           // Displays as number with 4 decimal places
    ],

    pricingData = #table(tableType, {
        {"Widget", 29.9999, 0.15, 0.0825},
        {"Gadget", 49.9500, 0.20, 0.0825}
    }),

    // Create navigation table with the typed data
    excelDocument = #table(
        type table [PartType = nullable text, Data = any],
        {
            {"SheetData", pricingData}
        }
    )
in
    excelDocument
```

### DateTime precision

You can control the precision of time components using the `DateTimePrecision` facet:

```powerquery-m
let
    // Time with millisecond precision
    timeWithMs = Type.ReplaceFacets(Time.Type, [DateTimePrecision = 3]),
    
    // DateTime with microsecond precision (Excel maximum is 3 digits)
    dateTimeWithPrecision = Type.ReplaceFacets(DateTime.Type, [DateTimePrecision = 7]),

    tableType = type table [
        EventName = Text.Type,
        EventTime = timeWithMs,
        Timestamp = dateTimeWithPrecision
    ],

    eventsData = #table(tableType, {
        {"Start", #time(9, 30, 15.123), #datetime(2025, 1, 15, 9, 30, 15.1234567)},
        {"End", #time(17, 45, 30.456), #datetime(2025, 1, 15, 17, 45, 30.9876543)}
    }),

    // Create navigation table with the typed data
    excelDocument = #table(
        type table [PartType = nullable text, Data = any],
        {
            {"SheetData", eventsData}
        }
    )
in
    excelDocument
```

> [!NOTE]
> Excel supports a maximum of 3 digits of fractional second precision. Higher precision values are truncated.

## Chart configuration

Charts are configured through the `Properties` record. You can explicitly specify chart settings or rely on the inference engine to determine appropriate values.

### Chart properties

| Property | Type | Description |
|----------|------|-------------|
| ChartType | text | The type of chart to create. |
| ChartTitle | text | The title displayed on the chart. |
| DataSeries | record | Configuration for data series, axes, and values. |

### Supported chart types

| Chart Type | Description |
|------------|-------------|
| `Area` | Area chart |
| `Area3D` | 3D area chart |
| `Bar` | Horizontal bar chart |
| `Bar3D` | 3D horizontal bar chart |
| `Column` | Vertical column chart |
| `Column3D` | 3D vertical column chart |
| `Doughnut` | Doughnut chart (ring-shaped) |
| `Line` | Line chart |
| `Line3D` | 3D line chart |
| `Pie` | Pie chart |
| `Pie3D` | 3D pie chart |
| `Radar` | Radar (spider) chart |
| `StackedBar` | Stacked horizontal bar chart |
| `StackedBar100` | 100% stacked horizontal bar chart |
| `StackedColumn` | Stacked vertical column chart |
| `StackedColumn100` | 100% stacked vertical column chart |

### DataSeries configuration

The `DataSeries` record defines how your data maps to chart elements:

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| AxisColumns | list or text | Yes* | Column name(s) to use as the chart axis (categories). |
| ValueColumns | list or text | Yes* | Column name(s) to use as chart values (series). |
| PrimaryAxisColumn | text | No | When using multiple axis columns, specifies which one serves as the primary axis label. |

\* Required unless a `ChartInferenceFunction` is configured in the Workbook properties. Without inference, omitting `AxisColumns` throws a "No axis columns provided" error, and omitting `ValueColumns` throws a "No value columns provided" error.

### Example with explicit chart configuration

```powerquery-m
let
    // Quarterly data by region
    quarterlyData = #table(
        type table [Quarter = text, North = number, South = number, East = number, West = number],
        {
            {"Q1", 95000, 78000, 37000, 50000},
            {"Q2", 102000, 85000, 42000, 58000}
        }
    ),

    excelDocument = #table(
        type table [Sheet = nullable text, Name = nullable text, PartType = nullable text, Properties = nullable record, Data = any],
        {
            {"SalesChart", "QuarterlySales", "Chart",
                [
                    ChartType = "StackedColumn",
                    ChartTitle = "Quarterly Revenue by Region",
                    DataSeries = [
                        AxisColumns = {"Quarter"},
                        ValueColumns = {"North", "South", "East", "West"}
                    ]
                ],
                quarterlyData
            }
        }
    )
in
    excelDocument
```

### Multilevel axis charts

For hierarchical category data, you can specify multiple axis columns:

```powerquery-m
let
    excelDocument = #table(
        type table [Sheet = nullable text, Name = nullable text, PartType = nullable text, Properties = nullable record, Data = any],
        {
            {"ProductChart", "Sales", "Chart",
                [
                    ChartType = "Column",
                    ChartTitle = "Product Sales by Category",
                    DataSeries = [
                        AxisColumns = {"Category", "Product"},
                        ValueColumns = {"Revenue"},
                        PrimaryAxisColumn = "Product"  // Use Product as the label
                    ]
                ],
                SalesData
            }
        }
    )
in
    excelDocument
```

## Using Office.InferChartPropertiesGenerator

The `Office.InferChartPropertiesGenerator` function creates an inference engine that automatically determines chart properties based on your data. This is useful when you want sensible defaults without specifying every chart configuration detail.

> [!IMPORTANT]
> Without a chart inference function, you must explicitly provide `DataSeries` with both `AxisColumns` and `ValueColumns` for every chart. Omitting these required parameters results in an error:
>
> - Missing `AxisColumns`: "No axis columns provided for part '{PartName}'. Please specify 'AxisColumns' in the DataSeries."
> - Missing `ValueColumns`: "No value columns provided for part '{PartName}'. Please specify 'ValueColumns' in the DataSeries."

### Basic usage

```powerquery-m
let
    excelDocument = #table(
        type table [Sheet = nullable text, Name = nullable text, PartType = nullable text, Properties = nullable record, Data = any],
        {
            {"Workbook", "Workbook", "Workbook",
                [ChartInferenceFunction = Office.InferChartPropertiesGenerator()],
                null
            },
            // Charts without explicit ChartType will use inference
            {"Chart1", "AutoChart", "Chart", [], SalesData}
        }
    )
in
    excelDocument
```

### Inference options

`Office.InferChartPropertiesGenerator` accepts an optional record with the following options:

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| Allow3DCharts | logical | false | When `true`, the inference engine may select 3D chart types for appropriate data. |
| PreferMultilevelChartInference | logical | false | When `true`, uses all leading non-numeric columns as axis columns for multilevel charts. |

### Example with inference options

```powerquery-m
let
    chartInference = Office.InferChartPropertiesGenerator([
        Allow3DCharts = true,
        PreferMultilevelChartInference = true
    ]),

    excelDocument = #table(
        type table [Sheet = nullable text, Name = nullable text, PartType = nullable text, Properties = nullable record, Data = any],
        {
            {"Workbook", "Workbook", "Workbook",
                [ChartInferenceFunction = chartInference],
                null
            },
            {"Sales", "SalesChart", "Chart", 
                [DataSeries = [AxisColumns = {"Region"}, ValueColumns = {"Revenue"}]],
                SalesData
            }
        }
    )
in
    excelDocument
```

### How inference works

The inference engine returns a record with three functions:

- **ChartType**: Analyzes the data schema and determines the optimal chart type based on:
  - Number of data series
  - Number of categories
  - Whether axis columns are datetime, numeric, or categorical
  - Row count

- **ChartTitle**: Generates a descriptive title based on the chart type and column names.

- **DataSeries**: Infers axis and value columns from the table schema:
  - Datetime columns are preferred as axis columns
  - Categorical (text) columns are considered for axis columns
  - Numeric columns become value columns

### Chart type selection logic

The inference engine selects chart types based on data characteristics:

| Data Characteristics | Inferred Chart Type |
|---------------------|---------------------|
| Single series, ≤6 categories, categorical axis | Pie |
| Single series, 7-15 categories, categorical axis | Doughnut |
| DateTime axis | Line or Area |
| ≥3 series, ≤15 categories, categorical | Radar |
| Multiple series, 3-25 categories | Stacked Bar |
| Single series, few categories | Column |
| Many categories | Bar |

### Custom inference function

You can provide your own inference function that follows the same interface:

```powerquery-m
let
    customInference = () as record => [
        ChartType = (partName, columns, dataSeries, rowCount) => 
            if rowCount < 10 then "Pie" else "Column",
        
        ChartTitle = (partName, chartType, dataSeries) => 
            partName & " Chart",
        
        DataSeries = (partName, columns) => [
            AxisColumns = {"Category"},
            ValueColumns = {"Revenue"}
        ]
    ],

    excelDocument = #table(
        type table [Sheet = nullable text, Name = nullable text, PartType = nullable text, Properties = nullable record, Data = any],
        {
            {"Workbook", "Workbook", "Workbook",
                [ChartInferenceFunction = customInference],
                null
            },
            {"Data", "CustomChart", "Chart", [], SalesData}
        }
    )
in
    excelDocument
```

## Advanced scenarios

This section covers programmatic approaches for generating navigation tables dynamically.

### Partitioning data into multiple sheets

You can use Power Query's list and table functions to dynamically create sheets based on data values.

#### Using Table.Group

Group data by a column and create a sheet for each group:

```powerquery-m
let
    groupedData = Table.Group(
        SalesData, 
        {"Region"}, 
        {{"RegionData", each _, type table}}
    ),

    excelDocument = Table.FromRecords(
        List.Transform(
            Table.ToRecords(groupedData),
            (row) => [
                Sheet = row[Region],
                PartType = "SheetData",
                Data = row[RegionData]
            ]
        )
    )
in
    excelDocument
```

#### Using Table.Partition

Partition a table into a fixed number of parts based on a hash of region names:

```powerquery-m
let
    partitions = Table.Partition(SalesData, 3, 0, 
        each Number.Mod(Text.Length([Region]), 3)),

    excelDocument = Table.FromRecords(
        List.Transform(
            List.Positions(partitions),
            (i) => [
                Sheet = "Partition " & Text.From(i + 1),
                PartType = "SheetData",
                Data = partitions{i}
            ]
        )
    )
in
    excelDocument
```

#### Custom partitioning function

For more control, use a custom partitioning function:

```powerquery-m
let
    partitionByColumn = (table as table, columnName as text, maxPartitions as number) as table =>
        let
            distinctValues = List.Distinct(Table.Column(table, columnName)),
            limitedValues = List.FirstN(distinctValues, maxPartitions),
            partitionedTable = Table.FromRecords(
                List.Transform(
                    limitedValues, 
                    (value) => [
                        Sheet = columnName & " - " & Text.From(value),
                        PartType = "SheetData",
                        Data = Table.SelectRows(table, each Record.Field(_, columnName) = value)
                    ]
                )
            )
        in
            partitionedTable,

    // Create sheets for each unique Region value (up to 10)
    excelDocument = partitionByColumn(SalesData, "Region", 10)
in
    excelDocument
```

### Dynamic charts for partitioned data

Combine partitioning with charts to create visualizations for each group:

```powerquery-m
let
    buildReference = (name as text) => #table({}, {}) meta [Name = name],

    createPartitionWithChart = (table as table, columnName as text) as table =>
        let
            distinctValues = List.Distinct(Table.Column(table, columnName)),
            rows = List.Transform(
                distinctValues,
                (value) => 
                    let
                        partitionData = Table.SelectRows(table, each Record.Field(_, columnName) = value),
                        sheetName = Text.From(value),
                        dataName = "Data_" & sheetName,
                        chartName = "Chart_" & sheetName
                    in
                        {
                            // Data row
                            {sheetName, dataName, "SheetData", [], partitionData},
                            // Chart row
                            {sheetName & " Chart", chartName, "Chart", 
                                [ChartType = "Column", ChartTitle = sheetName & " Analysis"],
                                buildReference(dataName)}
                        }
            )
        in
            #table(
                type table [Sheet = nullable text, Name = nullable text, PartType = nullable text, Properties = nullable record, Data = any],
                List.Combine(rows)
            ),

    excelDocument = createPartitionWithChart(SalesData, "Region")
in
    excelDocument
```

## Notes and limitations

### Excel limits

Excel has inherent limitations that affect document generation:

- **Maximum rows per worksheet**: 1,048,576 rows
- **Maximum columns per worksheet**: 16,384 columns
- **Maximum characters per cell**: 32,767 characters
- **Sheet name maximum length**: 31 characters
- **Sheet names cannot contain**: `\ / ? * [ ]` or start/end with `'`

When your data exceeds these limits, consider partitioning it across multiple sheets.

### Error handling

Cell-level errors in your data will cause document generation to fail. The connector validates data as it processes each row, and encountering an error value (such as a division by zero or type conversion error) throws an exception.

To prevent failures:

- Use `try...otherwise` expressions to handle potential errors before exporting
- Replace error values with appropriate defaults or null values
- Validate data quality before constructing your navigation table

```powerquery-m
let
    cleanData = Table.TransformColumns(
        RawData,
        {
            {"Amount", each try _ otherwise null, type number}
        }
    ),
    
    excelDocument = #table(
        type table [PartType = nullable text, Data = any],
        {
            {"SheetData", cleanData}
        }
    )
in
    excelDocument
```

### Name handling

Sheet and part names are automatically sanitized to comply with Excel naming rules. Invalid characters are removed, and names are truncated to 31 characters. If `StrictNameHandling` is enabled in the Workbook properties, an error is thrown instead of automatic sanitization.

Duplicate sheet names are automatically made unique by appending a numeric suffix.

## Related content

- [Power Query M language specification](/powerquery-m/)
- [Table functions reference](/powerquery-m/table-functions)
- [Power Query dataflows](/power-query/dataflows/overview-dataflows-across-power-platform-dynamics-365)
