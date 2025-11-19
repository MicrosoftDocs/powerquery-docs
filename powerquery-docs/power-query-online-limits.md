---
title: Power Query Online Usage Limits
description: Authoring and refresh limits for Power Query Online in its various product integrations.
author: Luitwieler
ms.topic: conceptual
ms.date: 3/22/2024
ms.author: jeluitwi
ms.subservice: user-assistance
---

# Power Query Online limits

Power Query Online is integrated into various Microsoft products. Since these products target different scenarios, they might set different limits for Power Query Online usage.

Limits are enforced at the beginning of query evaluations. Once an evaluation is underway, only timeout limits are imposed.

## Limit types

Hourly Evaluation Count: The maximum number of evaluation requests a user can issue during any 60-minute period.

Daily Evaluation Time: The net time a user can spend evaluating queries during any 24 hour period.

Concurrent Evaluations: The maximum number of evaluations a user can have running at any given time.

## Authoring limits

*Authoring* is the act of everything the user does while developing in the Power Query editor, such as creating, modifying, or testing queries. The data that's shown in the editor is a preview that might not reflect the full data set. The data isn't persisted until the user saves or applies the query. Authoring limits are the same across all products.

Hourly Evaluation Count: 1000

Daily Evaluation Time: Currently unrestricted

Per Query Timeout: 10 minutes

> [!NOTE]
> Performing Data Definition Language (DDL) operations to the data source is **not supported** in Power Query, examples of such operations are "DROP TABLE", "CREATE TABLE", and "ALTER TABLE" for instance. Attempting to use such commands can result in multiple failures and errors.

## Refresh limits

During refresh (either scheduled or on-demand), query evaluations return complete results. Data is typically persisted in storage.

| Product Integration | Hourly Evaluation Count (#) | Daily Evaluation Time (Hours) | Concurrent Query Evaluations (#) |
|--|--|--|--|
| Microsoft Flow (SQL Connector&mdash;Transform Data Using Power Query) | 500 | 2 | 5 |
| Dataflows in PowerApps.com (Trial)| 500 | 2 | 8 |
| Dataflows in PowerApps.com (Production) | 1000 | 8 | 20 |
| Data Integration in PowerApps.com Admin Portal | 1000 | 24 | 20 |
| Power BI Dataflows in PowerBI.com | 1000 | 100 | 20 |
| Data Factory Dataflow Gen2 in Microsoft Fabric | 5000 | 100 | [SKU Limits](/power-bi/enterprise/service-premium-what-is#dataflows-gen1) |
| Dataflows in Dynamics 365 Customer Insights | 1000 | 100 | 20 |

## Dataflow limits

Dataflow is a workload that leverages Power Query Online. Dataflow is integrated into Power BI, PowerApps, Microsoft Fabric, and Dynamics 365 Customer Insights.

A single dataflow has a limit of 50 tables. If you need more than 50 tables, you can create multiple dataflows. If you exceed the limit, an error message occurs during publishing and refreshing.

There is no maximum size limit for a single dataflow table. However, when a table gets too big, a possible timeout could occur when accessing the table. In this case, use the Table.*xxx*N functions (such as [Table.FirstN](/powerquery-m/table-firstn), [Table.LastN](/powerquery-m/table-lastn), [Table.RemoveFirstN](/powerquery-m/table-removefirstn), [Table.RemoveLastN](/powerquery-m/table-removelastn), and so on) or other filters to reduce the scope and size of the data.

We suggest not having more than 100 dataflows (Gen1 or Gen2) per workspace.

## Mashup script limits

The size limit for the mashup script is 512KB. An error may occur when trying to open or edit dataflows with queries that exceed this size limit.

If you encounter such error:
1. Simplify queries by removing unused steps
2. Consider breaking large dataflows into smaller, linked dataflows
3. Use parameters to optimize query performance