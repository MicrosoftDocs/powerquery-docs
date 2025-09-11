---
title: Power Query ADP Analytics connector
description: Provides basic information and connection instructions to get analytics data.
author: Upendra
ms.date: 9/11/2025
ms.author: dougklo
ms.subservice: connectors
---

# ADP Analytics

> [!NOTE]
>This connector is owned and provided by ADP Analytics.

## Summary

| Item                             | Description                                                           |
| -------------------------------- | --------------------------------------------------------------------- |
| Release State                    | General Availability                                                  |
| Version                          | 1.0.1                                                                 |
| Products                         | Power BI (Semantic models)<br />Power BI (Dataflows)<br />Fabric (Dataflow Gen2) |
| Authentication Types Supported   | Organizational account                                                |

## Prerequisites

Before you can sign in to ADP Analytics, you must have an ADP account in:

* ADP Workforce Now®
* ADP Vantage HCM®
* ADP Enterprise HR® V5 and V6

You must have a subscription to ADP® DataCloud Enhanced Insights and Microsoft Power BI Connector for ADP® DataCloud Enhanced Insights in the ADP marketplace.

## Capabilities Supported

* Import

## Connect to ADP Analytics data

To connect to ADP Analytics data:

1. Sign in to any of the following HCM solutions from ADP using your ADP username and password.

   * ADP Workforce Now®
   * ADP Vantage HCM®
   * ADP Enterprise HR® V5 and V6

2. Navigate into the **Reports & Analytics** > **Analytics** > **Dashboards** > **Data Mashup** page.

3. Select the **SUBSCRIBE NOW** link in the Power BI tile to subscribe to the ADP Analytics connector from the ADP marketplace .

   :::image type="content" source="./media/adp-analytics/subscribe-now.png" alt-text="Screenshot of the Power BI title with the Subscribe Now to ADP Analytics emphasized.":::

4. Once you've subscribed to the ADP analytics connector, select the **CONNECT NOW** link in the Power BI tile to select and configure metrics to be imported into Power BI .

   :::image type="content" source="./media/adp-analytics/connect-now.png" alt-text="Screenshot of the Power BI title with the Connect Now to ADP Analytics emphasized.":::

5. Select metrics to be imported into Power BI from the list of ADP Analytics metrics.

   :::image type="content" source="./media/adp-analytics/select-metrics.png" alt-text="Screenshot of the Power BI Data Manager with the Select metrics in ADP Analytics step displayed." lightbox="./media/adp-analytics/select-metrics.png":::

6. Configure selected metrics to select whether to import Metric Detail and/or Employee Detail table into Power BI.

   :::image type="content" source="./media/adp-analytics/configured-metrics.png" alt-text="Screenshot of the Power BI Data Manager with the Configured metrics in ADP Analytics step displayed." lightbox="./media/adp-analytics/configured-metrics.png":::

7. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **ADP Analytics**, and then select **Connect**.

   :::image type="content" source="./media/adp-analytics/get-data.png" alt-text="Screenshot of the Get Data dialog with ADP Analytics emphasized.":::

8. If you're receiving data through the ADP Analytics connector for the first time, a third-party notice is displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

9. To sign in to your ADP Analytics account, select **Sign in**.

   :::image type="content" source="./media/adp-analytics/sign-in.png" alt-text="Screenshot of the authentication dialog where you sign in to ADP Analytics.":::

10. In the ADP Analytics window that appears, provide your credentials to sign in to your ADP Analytics account.

    :::image type="content" source="./media/adp-analytics/user-id.png" alt-text="Screenshot of the ADP window where you enter your User ID in ADP Analytics.":::

11. Enter your ADP Analytics password and select **Sign in**.

    :::image type="content" source="./media/adp-analytics/password.png" alt-text="Screenshot of the ADP window where you enter your Password in ADP Analytics.":::

12. Once you successfully sign in, select **Connect**.

    :::image type="content" source="./media/adp-analytics/sign-in-success.png" alt-text="Screenshot of the authentication dialog where you connect to ADP Analytics.":::

13. Once the connection is established, you can preview and select the Metric Detail and/or Employee Detail tables of the selected metrics within the **Navigator** dialog to import into Power BI.

    :::image type="content" source="./media/adp-analytics/navigator.png" alt-text="Screenshot of the Navigator dialog where you select the ADP Analytics tables to use." lightbox="./media/adp-analytics/navigator.png":::

14. You can **Load** the selected table, which brings the entire table into Power BI Desktop, or you can select **Transform Data** to edit the query, which opens the Power Query editor. You can then filter and refine the set of data you want to use, and then load that refined set of data into Power BI Desktop.

    :::image type="content" source="./media/adp-analytics/load.png" alt-text="Screenshot of the Navigator dialog with the Load button emphasized." lightbox="./media/adp-analytics/load.png":::

## Limitations and issues

You should be aware of the following limitations and issues associated with accessing ADP Analytics data.

* ADP Analytics has a built-in limit of 25 metrics that can be imported into Power BI in a single connection.
* ADP Analytics has a built-in limit of 100k rows returned per API call.
* ADP Analytics has daily maintenance between 6:00 and 6:15 AM EST. Ensure scheduled refreshes aren't set up at this time to avoid intermittent failures.
* Signing into Power BI Desktop after scheduling an automatic refresh in Power BI cloud expires the session established at Power BI cloud, which requires the user to sign in again.
