---
title: Power Query Samsara connector
description: Provides basic information and prerequisites for the Samsara connector, supported authentication types, outlines limitations and issues.
author: DougKlopfenstein
ms.topic: concept-article
ms.date: 09/11/2025
ms.author: dougklo
ms.subservice: connectors
---

# Samsara Power Query custom connector

>[!Note]
>This connector is owned and provided by Samsara.

## Summary

|Item         |Description|
|-------------|-----------|
|Release State|General Availability|
|Products     |Power BI (datasets) & Power BI (dataflow)|
|Authentication Types Supported|Web API|
|Function Reference Documentation|[Power Query M Formula Language](/powerquery-m/)| 

Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

Before you can sign in to Samsara, you must have a Samsara account.

## Capabilities supported

- Import

## Connect to Samsara data

To connect to Samsara data:

1. Select Get Data from the Home ribbon in Power BI Desktop. Select Online Services from the categories on the left, select Samsara, and then select Connect.
2. If this is the first time you're getting data through the Samsara connector, a third-party notice is displayed. Select Don't warn me again with this connector if you don't want this message to be displayed again, and then select Continue.
3. Enter in a region and time range for the Samsara data you want to utilize in Power BI.
4. To connect to your Samsara data, enter your Samsara API token.
5. Once the connection is established, you can preview and select multiple tables available in the connector.
   1. You can Load the selected table, which brings the entire table into Power BI Desktop, or you can select Transform Data to edit the query, which opens Power Query Editor. You can then filter and refine the set of data you want to use, and then load that refined set of data into Power BI Desktop.

## Limitations and known issues

You should be aware of the following limitations and issues associated with accessing Samsara data.

- The initial data sync that grabs historical data might take some time to process.
- The data tables are created using Samsara APIs behind the scenes. If one of the APIs returns a 5xx or 4xx error (except 429s) when the connector is trying to refresh the data tables, the matching table isn't created and is skipped.
- Limit on how far back you can retrieve Samsara data in Power BI: last six months.

For more guidelines on accessing Samsara data, see Samsara's [Developer Guide](https://developers.samsara.com/docs/rest-api-overview).

## Additional information

You might also find the following Samsara information useful:

- [Samsara Power BI Connector Product Guide](https://kb.samsara.com/hc/en-us/articles/19262879010189-Integrate-with-Power-BI)
- [Samsara Data Connectors guide](https://developers.samsara.com/docs/data-connectors)
- [Submit and view feedback](/power-query/feedback)
