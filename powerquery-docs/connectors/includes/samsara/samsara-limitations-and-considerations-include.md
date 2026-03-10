---
title: Include file for the Limitations and considerations section of the Power Query Samsara connector documentation
description: Include file for the Limitations and considerations section of the Power Query Samsara connector documentation
ms.reviewer: whhender
ms.date: 03/10/2026
ms.topic: include
---

You should be aware of the following limitations and issues associated with accessing Samsara data.

- The initial data sync that grabs historical data might take some time to process.
- The data tables are created using Samsara APIs behind the scenes. If one of the APIs returns a 5xx or 4xx error (except 429s) when the connector is trying to refresh the data tables, the matching table isn't created and is skipped.
- Limit on how far back you can retrieve Samsara data in Power BI: last six months.

For more guidelines on accessing Samsara data, see Samsara's [Developer Guide](https://developers.samsara.com/docs/rest-api-overview).
