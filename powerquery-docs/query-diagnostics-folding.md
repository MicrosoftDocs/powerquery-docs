---
title: Understanding folding with Query Diagnostics
description: Using Query Diagnostics to understand what operations are folding versus being performed locally
author: ptyx507x
ms.topic: conceptual
ms.date: 2/28/2022
ms.author: miescobar
---

# Understanding folding with Query Diagnostics

One of the most common reasons to use Query Diagnostics is to have a better understanding of what operations were 'pushed down' by Power Query to be performed by the back-end data source, which is also known as 'folding'. If we want to see what folded, we can look at what is the 'most specific' query, or queries, that get sent to the back-end data source. We can look at this for both ODATA and SQL.

The operation that was described in the [article](RecordingQueryDiagnostics.md) on Recording Diagnostics does essentially four things:

* Connects to the data source
* Grabs the customer table
* Filters the Customer ID role to 'Sales Representative'
* Groups by 'Country'

Since the ODATA connector doesn't currently support folding COUNT() to the endpoint, and since this endpoint is somewhat limited in its operations as well, we don't expect that final step to fold. On the other hand, filtering is relatively trivial. This is exactly what we see if we look at the most specific query emitted above:

```
Request:
GET https://services.odata.org/V4/Northwind/Northwind.svc/Customers?$filter=ContactTitle eq 'Sales Representative'&$select=CustomerID%2CCountry HTTP/1.1

Response:
https://services.odata.org/V4/Northwind/Northwind.svc/Customers?$filter=ContactTitle eq 'Sales Representative'&$select=CustomerID%2CCountry
HTTP/1.1 200 OK
```

We can see we're filtering the table for ContactTitle equallying 'Sales Representative', and we're only returning two columns--Customer ID and Country. Country, of course, is needed for the grouping operation, which since it isn't being performed by the ODATA endpoint must be performed locally. We can conclude what folds and doesn't fold here.

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

Here, we can see that Power Query creates a subselection where ContactTitle is filtered to 'Sales Representative', then groups by Country on this subselection. All of our operations folded.

Using Query Diagnostics, we can examine what kind of operations folded--in the future, we hope to make this capability easier to use.
