---
title: Visualize and Interpret Query Diagnostics in Power BI
description: Learn how to read and interpret Query Diagnostics, and how to properly build visuals that can give insight on performance.
author: ptyx507x
ms.topic: concept-article
ms.date: 07/13/2026
ms.update-cycle: 1095-days
ms.author: miescobar
ms.subservice: transform-data
---

# Visualize and interpret Query Diagnostics in Power BI

After you [record](record-query-diagnostics.md) the diagnostics you want to use, the next step is to understand what they say.

It's helpful to have a good understanding of what each column in the query diagnostics schema means. This tutorial doesn't cover that information. For a full description, see [Query diagnostics](query-diagnostics.md).

In general, when you build visualizations, use the full detailed table. Regardless of how many rows it contains, you're probably looking at some kind of depiction of how the time spent in different resources adds up, or what the native query emitted was.

As mentioned in the article on recording the diagnostics, this example works with the OData and SQL traces for the Customers table from Northwind. In particular, the focus is on a common ask from customers, and on one of the easier-to-interpret sets of traces: full refresh of the data model.

## Build the visualizations

When you review traces, you can evaluate them in many ways. This article describes two visualizations. The first visualization shows the details you care about, and the other shows the time contributions of various factors. For the first visualization, use a table. You can pick any fields you like, but for an easy, high-level look at what's going on, use the following fields:

* [Id](query-diagnostics.md#id)
* [Start time](query-diagnostics.md#start-time)
* [Query](query-diagnostics.md#query)
* [Step](query-diagnostics.md#step)
* [Data source query](query-diagnostics.md#data-source-query)
* [Exclusive duration (%)](query-diagnostics.md#exclusive-duration-)
* [Row count](query-diagnostics.md#row-count)
* [Category](query-diagnostics.md#category)
* [Is user query](query-diagnostics.md#is-user-query)
* [Path](query-diagnostics.md#path)

For the second visualization, use a stacked column chart. In the **Axis** parameter, use **Id** or [Step](query-diagnostics.md#step). If you're looking at the Refresh, because it doesn't have anything to do with steps in the Editor itself, you probably just want to look at [Id](query-diagnostics.md#id). For the **Legend** parameter, set [Category](query-diagnostics.md#category) or [Operation](query-diagnostics.md#operation) (depending on the granularity you want). For the **Value** parameter, set [Exclusive Duration](query-diagnostics.md#exclusive-duration) and make sure it's not the %, so that you get the raw duration value. Finally, for the **Tooltip** parameter, set earliest [Start Time](query-diagnostics.md#start-time).

After you build your visualization, make sure you sort by **Earliest [Start Time](query-diagnostics.md#start-time)** ascending so you can see the order in which events occur.

:::image type="content" source="media/read-query-diagnostics/query-diagnostics-odata-high-level.png" alt-text="Screenshot of query diagnostics with traces table and stacked bar chart of duration by category and ID.":::

While your exact needs might differ, this combination of charts is a good place to start for looking at numerous diagnostics files and for many purposes.

## Interpret the visualizations

As mentioned earlier, query diagnostics can help you answer many questions. The two most common questions are how time is spent and what query is sent to the source.

Understanding how time is spent is straightforward and is similar for most connectors. However, as mentioned elsewhere, you see drastically different capabilities depending on the connector. For example, many ODBC-based connectors don't provide an accurate record of the query that Power Query sends to the ODBC driver.

To see how time is spent, review the visualizations you built earlier.

Because the time values for the sample queries used here are so small, if you want to work with how Power BI reports time, it's better to convert the [Exclusive Duration](query-diagnostics.md#exclusive-duration) column to seconds in the Power Query editor. After you make this conversion, you can look at your chart and get a clear idea of where time is spent.

For the OData results, the following image shows that most of the time is spent retrieving the data from the source. If you select the **Data Source** item on the legend, it shows all of the different operations related to sending a query to the data source.

:::image type="content" source="media/read-query-diagnostics/query-diagnostics-odata-emitted.png" alt-text="Screenshot of OData query diagnostics with Detailed Traces Table and duration chart highlighting Data Source time.":::

If you perform all the same operations and build similar visualizations, but use the SQL traces instead of the ODATA ones, you can see how the two data sources compare.

:::image type="content" source="media/read-query-diagnostics/query-diagnostics-sql-high-level.png" alt-text="Screenshot of Detailed Traces Table showing SQL evaluations and a chart comparing exclusive duration by Id and category.":::

If you select the data source table, like with the ODATA diagnostics, you see that the first evaluation (2.3 in this image) sends metadata queries, and the second evaluation retrieves the data you care about. This example retrieves small amounts of data, so the data retrieval takes a small amount of time (less than a tenth of a second for the entire second evaluation, with less than a twentieth of a second for data retrieval itself), but that speed isn't true in all cases.

As earlier, select the **Data Source** category on the legend to see the emitted queries.

### Dig into the data

**Looking at paths**

When you examine this data, you might notice that the time spent seems unusual. For example, on the OData query, you might see that there's a data source query with the following value:

```
Request:
https://services.odata.org/V4/Northwind/Northwind.svc/Customers?$filter=ContactTitle%20eq%20%27Sales%20Representative%27&$select=CustomerID%2CCountry HTTP/1.1
Content-Type: application/json;odata.metadata=minimal;q=1.0,application/json;odata=minimalmetadata;q=0.9,application/atomsvc+xml;q=0.8,application/atom+xml;q=0.8,application/xml;q=0.7,text/plain;q=0.7

<Content placeholder>

Response:
Content-Type: application/json;odata.metadata=minimal;q=1.0,application/json;odata=minimalmetadata;q=0.9,application/atomsvc+xml;q=0.8,application/atom+xml;q=0.8,application/xml;q=0.7,text/plain;q=0.7
Content-Length: 435

<Content placeholder>
```

This data source query is associated with an operation that only takes up, for example, 1% of the exclusive duration. Meanwhile, there's a similar one:

```
Request:
GET https://services.odata.org/V4/Northwind/Northwind.svc/Customers?$filter=ContactTitle eq 'Sales Representative'&$select=CustomerID%2CCountry HTTP/1.1

Response:
https://services.odata.org/V4/Northwind/Northwind.svc/Customers?$filter=ContactTitle eq 'Sales Representative'&$select=CustomerID%2CCountry
HTTP/1.1 200 OK
```

This data source query is associated with an operation that takes up nearly 75% of the exclusive duration. If you turn on the [Path](query-diagnostics.md#path), you discover the latter is actually a child of the former. This finding means that the first query basically adds a small amount of time on its own, with the actual data retrieval being tracked by the *inner* query.

These values are extreme, but they're within the bounds of what you might see.
