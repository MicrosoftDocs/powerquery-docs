---
title: Why does my query run multiple times
description: This article provides information about the various reasons that a Power Query query will sometimes run multiple times.
author: dougklopfenstein
ms.service: powerquery
ms.reviewer: kvivek
ms.date: 10/19/2021
ms.author: dougklo
ms.custom: intro-internal
---

# Why does my query run multiple times

When refreshing in the Power Query editor, there's a lot done behind the scenes to attempt to give you a fluent user experience. However, in some cases you might notice that multiple API requests are being triggered from Power BI Desktop and Power BI service when data is refreshed. In normal operation, connectors can make multiple calls to the backend for various reasons, including metadata, caching of results, pagination, and so on.

## Multiple queries from a single table

You might come across a time when multiple queries occur when refreshing a single table only. There's no single answer for why the exact same query might be run more than once, and the conditions that cause it vary between Power BI Desktop and Power BI service refresh.

In a cloud environment, if the query doesn't have a "top 1000" and the multiple requests happen in cloud refresh, the most likely explanation is that the same data source is being used to populate multiple tables in the data model. This is because each table in the data model is a separate evaluation of the underlying M query. In non-desktop environments, those evaluations each start out with an empty data cache, and so don't benefit from the same query having been run for a different table.

In a desktop environment, a single refresh of all the tables in the data model is run using a single shared cache. Even here, though, you can get multiple requests either because the cache is too small (which is relatively unlikely) or because the queries are running at roughly the same time and the cache is "write-behind".

In general, disabling data privacy&mdash;assuming that's acceptable&mdash;would eliminate the "TOP 1000" queries in refresh.

## Multiple queries for AS refresh

In a desktop environment, AS does refresh with two evaluations&mdash;one to check for schema changes and one to fetch data&mdash;and sometimes has to fetch data for both.

## Multiple queries from query diagnostics

The editor runs multiple queries as described in [Explaining multiple evaluations](/power-query/querydiagnostics#explaining-multiple-evaluations) in the Query Diagnostics article. These queries have the same timing issue for the persistent cache.

## Multiple queries for data privacy analysis

Analysis for data privacy also runs multiple queries.