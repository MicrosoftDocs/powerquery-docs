---
title: Power Query Supermetrics connector
description: Provides basic information and prerequisites for the Supermetrics connector, supported authentication types, outlines limitations and issues.
author: diegomotasuper
ms.topic: concept-article
ms.date: 09/11/2025
ms.author: whhender
ms.subservice: connectors
---

# Supermetrics Power Query custom connector

>[!Note]
>This connector is owned and provided by Supermetrics.

## Summary

| Item | Description                                                                       |
| ---- |-----------------------------------------------------------------------------------|
| Release State | Preview                                                                     |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/> Power Apps (Dataflows) |
| Authentication Types Supported | OAuth                                  |
| Function reference docs | N/A |

> [!NOTE]
>Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

[!INCLUDE [Includes_supermetrics_prerequisites](includes/supermetrics/supermetrics-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_supermetrics_capabilities-supported](includes/supermetrics/supermetrics-capabilities-supported.md)]

## Connection instructions

To connect to Supermetrics:

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

[!INCLUDE [Includes_supermetrics_limitations](includes/supermetrics/supermetrics-limitations.md)]

## Known issues

*Query authentication "email@domain.com" is no longer available.*

Possible reasons:

- The connection between Supermetrics and the data source expired. You need to reconnect in Supermetrics Hub.

## Next steps

You might also find the following Supermetrics information useful:

- [Supermetrics for Power BI: Getting started](https://supermetrics.com/docs/product-power-bi-getting-started/)
