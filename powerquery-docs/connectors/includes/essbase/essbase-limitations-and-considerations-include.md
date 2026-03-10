---
title: Include file for the Limitations and considerations section of the Power Query Essbase connector documentation
description: Include file for the Limitations and considerations section of the Power Query Essbase connector documentation
ms.reviewer: whhender
ms.date: 03/10/2026
ms.topic: include
---

The Essbase connector doesn't support measure hierarchies. All measures are displayed at the same level. You can still select all the measures that you need. The search field can be used to narrow down the displayed measures if there are large numbers of measures.

### Performance considerations

Interacting with Power BI in DirectQuery mode is very dynamic. When selecting a checkbox to include a measure or dimension level in the visualization, Power BI Desktop generates a query and sends it to the Oracle Essbase server to get the results. Power BI is optimized to cache any repeated queries to improve performance. But if any new query is generated, it's sent to the Oracle Essbase server to produce a new result. Depending on the number of selected measures, dimension levels, and the filters applied, the query might get sent more quickly than the Oracle Essbase server can respond. To improve performance and increase responsiveness, consider the following three methods to optimize your interaction with the Oracle Essbase server.
