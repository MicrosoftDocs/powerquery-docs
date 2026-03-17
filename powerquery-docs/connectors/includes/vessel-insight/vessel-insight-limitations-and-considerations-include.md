---
title: Include file for the Limitations and considerations section of the Power Query Vessel Insight connector documentation
description: Include file for the Limitations and considerations section of the Power Query Vessel Insight connector documentation
author: whhender
ms.author: whhender
ms.date: 03/10/2026
ms.topic: include
---

You should be aware of the following limitations and issues associated with accessing Vessel Insight data.

* There's a general limit of 1-GB data that's imported into Power BI, unless the workspace is in a Power BI Premium capacity. We recommend that you aggregate and choose a short date range when importing time series data, as it can become heavy.

* Each time series tag with associated values is outputted in a separate table in Power BI. If it's necessary to combine tags and values into one table, the tags and their values need to be merged in the Power Query editor or with TQL queries.

* The time series data is currently stored in Couchbase, which might have weaknesses that impact the Power BI connector.

* The API request time-out is, by default, one minute.

For more guidelines on accessing Vessel Insight data, go to [The Getting started guide](https://view.officeapps.live.com/op/view.aspx?src=https%3A%2F%2Fwww.kongsberg.com%2Fglobalassets%2Fdigital%2Fsolutions%2Fvessel-insight%2Fpowerbi-gsx.pptx&wdOrigin=BROWSELINK).
