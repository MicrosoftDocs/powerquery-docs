---
title: Power Query Supermetrics connector
description: Provides basic information and prerequisites for the Supermetrics connector, supported authentication types, outlines limitations and issues.
author: diegomotasuper
ms.topic: conceptual
ms.date: 04/05/2024
ms.author: jburchel
---

# Supermetrics Power Query custom connector

>[!Note]
>The following connector article is provided by Supermetrics, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the https://supermetrics.com/ website and use the support channels there.

## Summary
| Item | Description                                                                       |
| ---- |-----------------------------------------------------------------------------------|
| Release State | Preview                                                                     |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/> Power Apps (Dataflows) |
| Authentication Types Supported | OAuth                                  |
| Function reference docs | N/A |

>[!Note]
>Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.


## Prerequisites
>Before using the connector, you need to create an account in the [Supermetrics Hub](https://hub.supermetrics.com)  and save at least one query.

Follow these steps to create and save a query:

1. [Sign in to the Supermetrics Hub.](https://hub.supermetrics.com/) using SSO (via either a Microsoft account or a Google Account).

2. If you don’t see the Power BI page, open the left-hand navigation and go to Destinations > Power BI.

3. Select **“Create new query”** to get started.
   :::image type="content" source="media/supermetrics/sm-get-started-with-query-manager.png" alt-text="Get started with Supermetrics hub.":::

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



## Capabilities supported
* Import 
* Data import from multiple sources

## Connection instructions
To connect to Supermetrics
1. Open Power BI Desktop.

2. Navigate to the **Home** ribbon and select **Get Data**.

3. Search for Supermetrics. Select it, and select **Connect**.  The first time you use the connector, sign in with the same Microsoft account or Google Account that you used in Supermetrics Hub.
   :::image type="content" source="media/supermetrics/sm-connectors-list.png" alt-text="Select the connector from list.":::

4. If you’re connecting to Supermetrics for the first time, you see a third-party notice. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

5. Select **Sign in** to sign in to your Supermetrics account.  

   :::image type="content" source="media/supermetrics/sm-connect-to-supermetrics.png" alt-text="Connecting to Supermetrics.":::

6. Use single sign-on (SSO) in the Supermetrics window that appears: Select **Sign in with Microsoft** or **Sign in with Google** and choose the account that you used to sign in to the Supermetrics Hub.

   :::image type="content" source="media/supermetrics/sm-signin-page.png" alt-text="Screenshot showing the connection selector.":::

7. Once you sign in, select **Continue**.

   :::image type="content" source="media/supermetrics/sm-thanks-page.png" alt-text="Screenshot showing the thank you message.":::

8. Select **Connect**.  

   :::image type="content" source="media/supermetrics/sm-signed-in.png" alt-text="Screenshot of sign-in confirmation.":::

9. Once the Navigator dialog box loads, you're able to preview all the queries you saved in your Supermetrics account on the Hub. They'll be organized in folders by the data source on the left. Select the checkboxes next to any queries with data you’d like to use for your report.  
   :::image type="content" source="media/supermetrics/sm-navigator.png" alt-text="Navigator view with the list of teams, groups and queries.":::  
   The preview loads with the saved query settings, however, you can make some changes before loading the data to your report by using the settings above the preview:
   - Under **Connection - Account** you can choose a different set of accounts for the same query settings. If you have multiple connections, you can change it here as well.  Make sure you always select accounts within only one data source connection. Select **Ok** and **Apply** to load data with the changes.
   - If you want to check the data for a different time period than the one specified in the saved query, select the necessary option in the “Date range type” field and select **Apply**. When you select options like “This month” or “Year to date”, the refreshes always bring the latest data to your report.
   - You can choose a new set of metrics or change how you split the records using the “Metrics” or “Dimensions” fields respectively. Remember to select **Ok** and **Apply** the changes.

    If you make changes to only one of the fields, other settings remain the same as you saved them on the Hub.

    Once you see the dataset you’d like to use, select **Load** to use it in Power BI Desktop, or **Transform** to refine it in the Power Query Editor first.

## Limitations
- Query manager must be used to create and manage queries
- The timeout limit for polling the query results is 30 minutes

## Known issues

*Query authentication "email@domain.com" is no longer available.*

Possible reasons:
- The connection between Supermetrics and the data source expired. You need to reconnect in Supermetrics Hub.

## Next steps

You might also find the following Supermetrics information useful:

* [Supermetrics for Power BI: Getting started](https://supermetrics.com/docs/product-power-bi-getting-started/)
