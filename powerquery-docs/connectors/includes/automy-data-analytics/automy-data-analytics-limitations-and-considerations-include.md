---
title: Include file for the Limitations and considerations section of the Power Query Automy Data Analytics connector documentation
description: Include file for the Limitations and considerations section of the Power Query Automy Data Analytics connector documentation
ms.reviewer: whhender
ms.date: 03/10/2026
ms.topic: include
---

Users should be aware of the following limitations and issues associated with accessing Automy Data Analytics data.

* Automy Data Analytics has a built-in limit of 100,000 rows returned per connection.

* The default rate limit for an Automy Data Analytics Company is 120 requests per minute per user.

Import from Automy Data Analytics will stop and display an error message whenever the Automy Data Analytics connector reaches any of the limits listed above.

For more guidelines on accessing Automy Data Analytics, contact [support@automy.global](mailto:support@automy.global).

### Credential error in the Navigator

If a credential error occurs in the Navigator, clear your recent data source settings.

1. In Power BI Desktop, select **File** > **Data source settings**.

   :::image type="content" source="./media/automy-data-analytics/datasource-ada-clear.png" alt-text="Select Automy sources.":::

2. Select the data source, and then select **Clear permissions**. Establish the connection to the navigation again.
