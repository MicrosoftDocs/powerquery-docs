---
title: Step Folding Indicators
description: #Needs to be added 
author: cpopell
ms.service: powerquery
ms.date: 01/01/2021
ms.author: George.Popell
---

# Step Folding Indicators

## Introduction

>[!NOTE]
> It is highly recommended that you read the article on [Query Folding in Power Query](query-folding-basics.md) before reading this article to better understand how folding works in Power Query.

Step folding indicators allow you to understand which steps fold, and which steps don't. 

Using step folding indicators, when you make a change that breaks folding, it will become obvious. This will allow you to more easily resolve issues quickly, avoid performance issues in the first place, and have better insight into your queries. In most cases you run into, steps will simply fold or not fold. There are a number of cases where the outcome isn't as obvious, discussed in the section on Indicators (Dynamic, Opaque, and Unknown).

>[!NOTE]
> The step folding indicators feature is only available for Power Query Online.

## Enabling Step Diagnostics


## Interpreting Step Diagnostics

When looking at step diagnostics, the most important thing to understand is that the diagnostic state isn't sequential. In other words, the indicator for that step describes whether the query as a whole, up to that point, folds or not. If you have an indicator that shows that the query doesn't fold, followed by an indicator that shows it does fold, that means that every step up to that point does fold.

You can see an example of this even with a very simple query against a SQL source.

Using the Northwind sample database, I've connected to the Products table and loaded data. Doing this through the Navigation experience gives me the following query:

```
let
  Source = Sql.Databases("localhost"),
  #"Navigation 1" = Source{[Name = "AdventureWorksLT"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Schema = "SalesLT", Item = "Product"]}[Data]
in
  #"Navigation 2"
```

If you look at how this shows up in step folding indicators, you can see that the first step doesn't fold, the second step is inconclusive, and that the third step folds.

![Source, Navigation 1, and Navigation 2 steps in Folding Indicator pane](images/interpreting-step-diagnostics-1.png)

You can see that the initial steps don't fold, but the final step generated when you load data initially does fold. How the first few steps (**Source**, sometimes **Navigation**) are handled depends on the connector. With SQL, for example, it's handled as a catalog table value, which doesn't fold. However, as soon as you select data for that connector it will.

Conversely, this can also mean that your query folds up to a point and then stops folding. Unlike in the case where you have a folding indicator for the step, which shows that everything folds, when you have a not folding indicator it doesn't mean that everything doesn't fold - instead it means that "not everything" folds. Generally, everything up to the last folding indicator will fold, with additional operations happening after.

Modifying the example from above, you can give a transform that never folds - *Capitalize Each Word*.

```
let
  Source = Sql.Databases("localhost"),
  #"Navigation 1" = Source{[Name = "AdventureWorksLT"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Schema = "SalesLT", Item = "Product"]}[Data],
  #"Capitalized each word" = Table.TransformColumns(#"Navigation 2", {{"ProductID", each Text.Proper(Text.From(_)), type text}})
in
  #"Capitalized each word"
  ```
  
In step folding indicators, you will see that you have the exact same indicators as above, except the final step doesn't fold. Everything up to this final step will be performed on the data source, while the final step will be performed locally.

![Source, Navigation 1, Navigation 2, and Capitalize Each Word steps in Folding Indicator pane](images/interpreting-step-diagnostics-2.png)

## Step Diagnostics Indicators

Step folding indicators use an underlying query plan, and require it to be able to get information about the query to report it. Currently the query plan only supports tables, so some cases (lists, records, primitives) will not report as folding or not. Similarly, constant tables will report as opaque. 

|Indicator|Icon|Description|
|---------|----|-------|
|**Folding**|-----|The folding indicator tells you that the query up to this step will be evaluated by the data source.|
|**Not folding**|-----|The not folding indicator tells you that some part of the query up to this step will be evaluated outside the data source. You can compare it with the last folding indicator, if there is one, to see if you can rearrange your query to be more performant.|
|**Might fold**|-----|Might fold indicators are uncommon. They mean that a query 'might' fold. They indicate either that folding/not folding will be determined at runtime, when pulling results from the query, and that the query plan is dynamic. These will likely only appear with ODBC or OData connections. |
|**Opaque**|-----|Opaque indicators tell you that the resulting query plan is inconclusive for some reason. It generally indicates that there is a true 'constant' table, or that that transform or connector is not supported by the indicators and query plan tool.|
|**Unknown**|-----|Unknown indicators represent an absence of query plan, either due to an error or attempting to run the query plan evaluation on something other than a table (such as a record, list, or primitive).|


>[!NOTE]
> In the future the Power Query team will be exposing the ability to examine the query plan in greater depth more directly, for advanced users.