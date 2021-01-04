Source:
For the SQL Connector, Source is opaque.
Why is it opaque? Because it’s represented in the engine as a catalog table value.

Opaque: it’s either:
1. A connector that’s not yet supported in the query plan (i.e. OData, and even for some of the OData cases we won’t end up here)
2. A transformation on top of a table that is not reflected in the query plan. This will improve with SU12 engine for several table operators. 
3. A true constant table. 

Unknown is either:
1. A non table value (record, list, primitive, ...)
2. An error while running step analysis (should be very rare)

1) Not folding: “This step will not be evaluated by the data source”.
2) Folding: “This step will be evaluated by the data source”.
3) Variable outcome: “This step might be evaluated by the data source”.

we are now previewing step folding indicators. These indicators will allow you to understand which steps fold, and which steps don't. If you want a better understanding of how folding in Power Query works, you should review https://docs.microsoft.com/en-us/power-query/query-folding-basics, which will explain what it means for a step to fold or not. 
Using step folding indicators, when you make a change that breaks folding, it will become obvious. This will allow you to more easily resolve issues quickly, avoid performance issues in the first place, and have better insight into your queries.

In most cases you run into, steps will simply fold or not fold. There are a number of cases where we can't so easily tell - I address that in the 'Upcoming Changes' and 'Issues' at the bottom of the mail.

Currently, this feature is only available for Power Query Online

## Enabling Step Diagnostics

## Interpreting Step Diagnostics

When looking at step diagnostics, the most important thing to understand is that the diagnostic state isn't sequential. In other words, the indicator for that step describes whether the query as a whole, up to that point, folds or not. If you have an indicator that shows that the query doesn't fold, followed by an indicator that shows it does fold, that means that every step up to that point does fold.

You can see an example of this even with a very simple query against a SQL source.

Using the Northwind sample database, I've connected to the Products table and loaded data. Doing this through the Navigation experience gives me the following query:

```
let
  Source = Sql.Databases("montegoref6.database.windows.net"),
  #"Navigation 1" = Source{[Name = "AdventureWorksLT"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Schema = "SalesLT", Item = "Product"]}[Data]
in
  #"Navigation 2"
```

If we look at how this shows up in step folding indicators, we can see that the first step doesn't fold, the second step is inconclusive, and that the third step folds (the meaning of these is discussed more below).

![Source, Navigation 1, and Navigation 2 steps in Folding Indicator pane](interpreting-step-diagnostics-1.png)

We can see that our initial steps don't fold, but the final step generated when we load data initially does fold. How the first few steps (Source, sometimes Navigation) are handled depends on the connector. With SQL, for example, it's handled as a catalog table value, which doesn't fold. However, as soon as you select data for that connector it will.

Conversely, this can also mean that your query folds up to a point and then stops folding. Unlike in the case where we have a folding indicator for the step, which shows that everything folds, when we have a not folding indicator it doesn't mean that everything doesn't fold - instead it means that "not everything" folds. Generally, everything up to the last folding indicator will fold, with additional operations happening after.

Modifying the example from above, we can give a transform that never folds - 'Capitalize Each Word'.

```
let
  Source = Sql.Databases("montegoref6.database.windows.net"),
  #"Navigation 1" = Source{[Name = "AdventureWorksLT"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Schema = "SalesLT", Item = "Product"]}[Data],
  #"Capitalized each word" = Table.TransformColumns(#"Navigation 2", {{"ProductID", each Text.Proper(Text.From(_)), type text}})
in
  #"Capitalized each word"
  ```
  
In step folding indicators, we will see that we have the exact same indicators as above, except the final step doesn't fold. Everything up to this final step will be performed on the data source, while the final step will be performed locally.

![Source, Navigation 1, Navigation 2, and Capitalize Each Word steps in Folding Indicator pane](interpreting-step-diagnostics-2.png)

## Step Diagnostics Indicators

**Folding**



**Not folding**

**Dynamic**

**Opaque**

**Unknown**
