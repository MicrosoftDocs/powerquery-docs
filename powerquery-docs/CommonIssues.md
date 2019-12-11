# Common Issues

## Preserving Sort

In Power Query, a use-case that arises not uncommonly is a desire to maintain sort order through some aggregation or join operation. However, due to how operation application works, sort order is not preserved through aggregations or joins. For example, if you had a table that you wanted to sort by some column (like a store id or customer name) and then do a secondary sort (for example sales at that location or with that customer), this would be done easily by applying sequential sorts.

However, if you then tried to apply a distinct to the original sort operation, you might be surprised to find out that you had lost both the first and the second sort. In other words, if you had two rows with sales for a single store, and you had them sorted descending so that the first row had a greater dollar value than the second, you might find that the second row was preserved when you ran a distinct on the store id.

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

We want the entire record with the highest SalesYTD in each TerritoryID. If we only wanted the max, this would be a simple aggregation – but we want the entire input record. To get this, we need to group by TerritoryID and then sort inside each group, keeping the first record.

## Data Type Inference

When you import a table, you may find that Power Query sometimes incorrectly detects a column’s data type. One reason this can happen is that PQ infers data types using only the first 200 rows of data. If the data in the first 200 rows is somehow different than the data after row 200, PQ may detect an incorrect column type. This may or may not result in errors, which can make the incorrect type inference tricky to detect in some cases.
                                                                                                          
For example, imagine a column that contains integers in the first 200 rows (such as all zeroes), but contains decimal numbers after row 200. In this case, Power Query will infer the data type of the column to be Whole Number (Int64.Type). This will result in the decimal portions of any non-integer numbers being truncated.

Or imagine a column that contains textual date values in the first 200 rows, and other kinds of text values after row 200. In this case, Power Query will infer the data type of the column to be Date. This will result in the non-date text values being treated as type conversion errors.

Because type detection works on the first 200 rows, but Data Profiling can operate over the entire dataset, you can consider using the Data Profiling functionality to get an early indication in the Query Editor about Errors (from type detection or any number of other reasons) beyond the top N rows.

## Case Sensitivity

Users may find that they have certain aggregation operations that perform differently in the Power Query editor and in Power BI. This is due to slightly different whitespace handling in the two engines.

Power Query is case and whitespace (both leading and trailing) sensitive, while Analysis Services (which Power BI is operating on top of) is case-insensitive and will treat values with different leading and trailing whitespace as the same value. If you're running into issues with this, you can use a 'contains' on the problematic piece of data to find all rows in Power Query returning that data. 

Once you've done this, use a data cleaning transform such as "lowercase", "UPPERCASE", "Capitalize Every Word", "Trim", or "Clean" to make sure that you've removed any case or whitespace differences between rows.

