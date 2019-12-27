---
title: Common Authoring Issues in Power Query
description: How to address common authoring issues in Power Query
author: cpopell

ms.service: powerquery
ms.topic: conceptual
ms.date: 12/19/2019
ms.author: gepopell

LocalizationGroup: reference
---


# Common Issues

## Preserving Sort

In Power Query, you'll often want to sort your data before you perform some other operation. For example, if you wanted to sort a sales table by the Store ID and the sale amount, and then you wanted to perform a group, you might expect sort order to be preserved. However, due to how operation application works, sort order is not preserved through aggregations or joins. 

If you sorted your table, applied an aggregation, and then you tried to apply a distinct to the original sort operation, you might be surprised to find out that you had lost both the first and the second sort. In other words, if you had two rows with sales for a single store, and you had them sorted in descending order so that the first row had a greater dollar value than the second, you might find that the second row was preserved when you ran a distinct on the Store ID.

There are ways to make this work via a smart combination of aggregations, but these aren't exposed by the user experience. Unfortunately, there are a sufficiently large number of possible transformations here that we can't give an example for all outcomes, but here is how you might address the problem above.

```
let
    Source = Sql.Database("Server", "AdventureWorks"),
    Sales_SalesPerson = Source{[Schema="Sales",Item="SalesPerson"]}[Data],
    #"Grouped Rows" = Table.Group(Sales_SalesPerson, {"TerritoryID"}, {{"Rows", each _}}),
    Custom1 = Table.TransformColumns(#"Grouped Rows", {{"Rows", each Table.FirstN(Table.Sort(_, {"SalesYTD", Order.Descending}), 1)}})
in
    Custom1
```

We want the entire record with the highest SalesYTD in each TerritoryID. If we only wanted the max, this would be a simple aggregation&mdash;but we want the entire input record. To get this, we need to group by TerritoryID and then sort inside each group, keeping the first record.

## Data Type Inference

When you import a table, you may find that Power Query sometimes incorrectly detects a column’s data type. One reason this can happen is that Power Query infers data types using only the first 200 rows of data. If the data in the first 200 rows is somehow different than the data after row 200, Power Query may detect an incorrect column type. This may or may not result in errors, which can make the incorrect type inference tricky to detect in some cases.
                                                                                                          
For example, imagine a column that contains integers in the first 200 rows (such as all zeroes), but contains decimal numbers after row 200. In this case, Power Query will infer the data type of the column to be Whole Number (Int64.Type). This will result in the decimal portions of any non-integer numbers being truncated.

Or imagine a column that contains textual date values in the first 200 rows, and other kinds of text values after row 200. In this case, Power Query will infer the data type of the column to be Date. This will result in the non-date text values being treated as type conversion errors.

Because type detection works on the first 200 rows, but Data Profiling can operate over the entire dataset, you can consider using the Data Profiling functionality to get an early indication in the Query Editor about Errors (from type detection or any number of other reasons) beyond the top N rows.

