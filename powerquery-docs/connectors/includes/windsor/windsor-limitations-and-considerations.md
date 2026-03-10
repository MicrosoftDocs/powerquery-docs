---
title: Include file for the Limitations and considerations section of the Power Query Windsor connector documentation
description: Include file for the Limitations and considerations section of the Power Query Windsor connector documentation
ms.reviewer: whhender
ms.date: 03/10/2026
ms.topic: include
---

* Windsor Onboard must be used to create and manage queries.
* The timeout limit for polling the query results is 30 minutes.

*Expression.Error: Empty response, please check your query at onboard.windsor.ai/app/data-preview*

Reason:

* The data is missing for selected query. Check that this query works and shows data in Windsor Onboard.

*Expression.Error: Error*

Possible reasons:

& The data source was disconnected. Check that the data source is connected at `https://onboard.windsor.ai/`. Select **Show only connected** to show the data sources you have connected.
