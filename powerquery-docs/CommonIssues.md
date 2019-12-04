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

You may find yourself occasionally having type errors when you import a table. One common cause of this is if the first 200 rows of your table have one type of data, and then there's a broader or different type of data, type inference will fail. This is due to the fact that type inference is only based on the first 200 rows of data.

To address this, manually type the column towards the type of data that it will actually hold.
