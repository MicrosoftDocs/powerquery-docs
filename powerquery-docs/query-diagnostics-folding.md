---
title: Understand Folding by using Query Diagnostics
description: Use Query Diagnostics to see what operations Power Query pushes down to your data source. Discover how folding works with ODATA and SQL endpoints.
author: ptyx507x
ms.topic: concept-article
ms.date: 07/01/2026
ms.author: miescobar
ms.subservice: transform-data
---

# Understand folding by using Query Diagnostics

One of the most common reasons to use Query Diagnostics is to better understand what operations Power Query *pushes down* to the back-end data source to perform. This process is also known as *folding*. To see what operations fold, look at the *most specific* query or queries that Power Query sends to the back-end data source. You can examine this process for both ODATA and SQL.

The operation described in [Recording query diagnostics in Power BI](RecordingQueryDiagnostics.md) performs four steps:

* Connects to the data source
* Retrieves the customer table
* Filters the Customer ID role to `Sales Representative`
* Groups by `Country`

Since the ODATA connector doesn't currently support folding COUNT() to the endpoint, and since this endpoint is limited in its operations as well, we don't expect that final step to fold. On the other hand, filtering is relatively trivial. This is exactly what we see if we look at the most specific query emitted:

```
Request:
GET https://services.odata.org/V4/Northwind/Northwind.svc/Customers?$filter=ContactTitle eq 'Sales Representative'&$select=CustomerID%2CCountry HTTP/1.1

Response:
https://services.odata.org/V4/Northwind/Northwind.svc/Customers?$filter=ContactTitle eq 'Sales Representative'&$select=CustomerID%2CCountry
HTTP/1.1 200 OK
```

We can see that we're filtering the table for `ContactTitle` that equals `Sales Representative`, and we're only returning two columns: `Customer ID` and `Country`. `Country` is needed for the grouping operation, which must be performed locally because it's not performed by the ODATA endpoint. We can conclude what folds and doesn't fold here.

Similarly, if we look at the specific and final query emitted in the SQL diagnostics, we see something slightly different:

```select [rows].[Country] as [Country],
    count(1) as [Count]
from 
(
    select [_].[Country]
    from [dbo].[Customers] as [_]
    where [_].[ContactTitle] = 'Sales Representative' and [_].[ContactTitle] is not null
) as [rows]
group by [Country]
```

You can see that Power Query creates a subselection where `ContactTitle` is filtered to `Sales Representative`, then groups by `Country` on this subselection. All of our operations folded.

Using Query Diagnostics, we can examine what kind of operations folded. In the future, we hope to make this capability easier to use.
