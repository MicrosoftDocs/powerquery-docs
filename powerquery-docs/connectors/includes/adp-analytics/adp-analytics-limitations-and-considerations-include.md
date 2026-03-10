---
title: Include file for the Limitations and considerations section of the Power Query Adp Analytics connector documentation
description: Include file for the Limitations and considerations section of the Power Query Adp Analytics connector documentation
ms.reviewer: whhender
ms.date: 03/10/2026
ms.topic: include
---

You should be aware of the following limitations and issues associated with accessing ADP Analytics data.

* ADP Analytics has a built-in limit of 25 metrics that can be imported into Power BI in a single connection.
* ADP Analytics has a built-in limit of 100k rows returned per API call.
* ADP Analytics has daily maintenance between 6:00 and 6:15 AM EST. Ensure scheduled refreshes aren't set up at this time to avoid intermittent failures.
* Signing into Power BI Desktop after scheduling an automatic refresh in Power BI cloud expires the session established at Power BI cloud, which requires the user to sign in again.
