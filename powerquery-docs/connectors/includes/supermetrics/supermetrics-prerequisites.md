---
title: Include file for the Prerequisites section of the Power Query Supermetrics connector documentation
description: Include file for the Prerequisites section of the Power Query Supermetrics connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

Before using the connector, you need to create an account in the [Supermetrics Hub](https://hub.supermetrics.com)  and save at least one query.

Follow these steps to create and save a query:

1. [Sign in to the Supermetrics Hub.](https://hub.supermetrics.com/) using SSO (via either a Microsoft account or a Google Account).

2. If you don’t see the Power BI page, open the left-hand navigation and go to Destinations > Power BI.

3. Select **“Create new query”** to get started.
   :::image type="content" source="../../media/supermetrics/sm-get-started-with-query-manager.png" alt-text="Screenshot of the Get started with Supermetrics hub page.":::

4. Select a data source and sign in to your account to create a connection between your data source and Supermetrics. [Find detailed instructions in our support center](https://supermetrics.com/docs/product-power-bi-getting-started/)

   Some public data sources, including Facebook Public Data, don’t need you to sign in. If you’re using one of these, skip this step.

   > [!NOTE]
   > If you're trying to get data from popular data sources, such as Google Ads, Google Analytics 4, Facebook Insights, LinkedIn Ads, once you add a connection to the data source with Supermetrics, you can have a quick start with one of the [template reports](https://supermetrics.com/template-gallery?page=1&search=&destination=567736) we offer.

5. Define the query settings for the data you’d like to see in your reports:
    - Pick accounts to fetch data from.
    - Define a date range - use a flexible date range, for example “last 2 months”, and always get data for the previous two months. Note that you can change the date range for a particular report using the connector.
    - Enter metrics like Impressions or Clicks. [See our full list of metrics and dimensions](https://supermetrics.com/docs/).
    - Choose how to split the records, e.g. by date or campaign name.

6. Click **Run** to check if you get the expected records and select **Save**. Name your query and schema and confirm. Schema is like a folder to your queries.

The queries you save in the Hub are available to you in Power BI Desktop once you sign in to the Supermetrics connector. Feel free to connect multiple data sources and save queries in each to be able to create a combined report, say, from your Ads accounts across multiple marketing sources.

