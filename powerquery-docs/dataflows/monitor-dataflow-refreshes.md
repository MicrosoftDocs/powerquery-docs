---
title: Monitor your dataflow refreshes with Power BI
description: How to monitor dataflow refreshes with Power BI.
author: luitwieler
ms.reviewer: whhender
ms.topic: concept-article
ms.date: 12/1/2025
ms.author: jeluitwi
ms.subservice: dataflows
---

# Monitor your dataflow refreshes with Power BI

When working with any kind dataflows other than Power BI dataflows, you have the ability to monitor dataflow refreshes using Power BI. This article includes step by step instructions on how to set up your own dashboard to share with everyone on your team. This dashboard provides insights into the success rate of refreshes, duration, and much more.

:::image type="content" source="media/monitor-dataflow-refreshes/dashboard-preview.png" alt-text="Screenshot of the dashboard with dataflow duration, refresh count, and refresh success rate graphs." lightbox="media/monitor-dataflow-refreshes/dashboard-preview.png":::

## Set up your dashboard

To set up your monitoring dashboard for dataflow refresh history:

1. Navigate to [Power Apps](https://make.powerapps.com/).
1. Select the environment you want to monitor.
1. Open :::image type="icon" source="media/monitor-dataflow-refreshes/gear-icon.png"::: **Settings** > **Session Details**.
1. Copy the **Instance url**, which should look something like `contoso.crm.dynamics.com`.
1. Download the [Power BI Template](https://download.microsoft.com/download/f/1/9/f195fb57-495a-4487-9317-fe00816afd88/dataflow%20refresh%20history%20metrics%20template.pbit).
1. Open the template file with Power BI Desktop and provide your instance URL.

    :::image type="content" source="media/monitor-dataflow-refreshes/template-parameter.png" alt-text="Screenshot of the template file dialog where you input your Dataverse org URL.":::

1. Select **Load**.
1. If you're using this dashboard for the first time, you might need to enter your credentials to sign in.
1. Inside the dashboard, there are two tabs with information about errors, duration, and the count of rows that were inserted, upserted, or failed:
    * Dataflow monitoring
    * Table monitoring
1. From this point on, you can change the dashboard however you like and publish it to a workspace of your choice.

## Where to find the Dataverse tables

The new tables are available in your environment right away. To find the tables in your environment, do the following steps:

1. Navigate to [Power Apps](https://make.powerapps.com/).
1. Open the Dataverse tables overview.

   :::image type="content" source="media/monitor-dataflow-refreshes/tables-tab.png" alt-text="Screenshot of the Power Apps where you open the Dataverse tables overview section.":::

1. Navigate to the managed tables section.

   :::image type="content" source="media/monitor-dataflow-refreshes/managed-tables.png" alt-text="Screenshot indicating how to select the managed table section.":::

1. Scroll down to the dataflow refresh history tables.

   :::image type="content" source="media/monitor-dataflow-refreshes/refresh-history-tables.png" lightbox="media/monitor-dataflow-refreshes/refresh-history-tables.png" alt-text="Screenshot of the two Dataverse tables containing refresh history.":::

These tables store history for at least the last 50 refreshes. Refresh history records older than 90 days might be removed by the system. To use these tables, we suggest that you use Power BI to get data through the Dataverse connector. We also suggest that you extract this data into a self-managed table if you would like to perform analysis over a longer period of time.

## Power BI dataflows monitoring

When working with Power BI dataflows, you might want to check out the following pages for setting up your monitoring solution:

* [Use Dataverse to build a dataflows monitoring report](./load-dataflow-metadata-into-dataverse-table.md)
* [Use a Power BI semantic model to build a dataflows monitoring report](./load-dataflow-metadata-into-power-bi-dataset.md)
* [Use Excel to build a dataflows monitoring report](./load-dataflow-metadata-into-excel-online.md)

## Known issues

In some cases when you try to connect to the Dataverse tables manually through Power BI, the tables might appear to be empty. To solve this issue, just refresh the preview and you should be good to go.
