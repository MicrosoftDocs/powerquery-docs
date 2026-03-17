---
title: Include file for the Limitations and considerations section of the Power Query Assemble Views connector documentation
description: Include file for the Limitations and considerations section of the Power Query Assemble Views connector documentation
ms.date: 03/10/2026
ms.topic: include
---

* Views with greater than 100,000 rows might not load depending on the number of fields included in the view. To avoid this limitation, we suggest breaking large views into multiple smaller views and appending the queries in your report, or creating relationships in your data model.

* The **view images** feature currently only supports thumbnail sized images because of a row size limitation in Power BI.

* When you create a query using **Models** data, a maximum of 200 properties can be selected.
