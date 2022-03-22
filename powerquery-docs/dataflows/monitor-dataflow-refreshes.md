---
title: Monitor your Dataflow refreshes with Power BI
description: How to monitor dataflow refreshes with Power BI.
author: luitwieler


ms.reviewer: dougklo
ms.topic: conceptual
ms.date: 03/21/2022
ms.author: jeluitwi
---

# Monitor your Dataflow refreshes with Power BI

When working with any kind dataflows except Power BI dataflows you have the ability to monitor dataflow refreshes using Power BI. We'll guide you step by step to setup your own dashboard to share with everyone within your team. This will provide insights into success rate of refreshes, duration and much more.

[![Image of a gear.](media/refreshhistory-dashboard/dashboard-preview.PNG)](media/refreshhistory-dashboard/dashboard-preview.PNG)

## Setup your dashboard

To setup your monitoring dashboard for dataflow refresh history:

1. Navigate to [Power Apps](https://make.preview.powerapps.com/).
1. Select the environment you want to monitor.
1. Open [![Image of a gear.](media/refreshhistory-dashboard/gear-icon.PNG)](media/refreshhistory-dashboard/gear-icon.PNG) **Settings**  >  **Session Details**.
1. Copy the Instance URL, which should look something like this: _"contoso.crm.dynamics.com"_.
1. Download the [Power BI Template](https://download.microsoft.com/download/f/1/9/f195fb57-495a-4487-9317-fe00816afd88/dataflow%20refresh%20history%20metrics%20template.pbit).
1. Open the Template file with Power BI Desktop and provide your instance url.
    [![Image of a screen to input your dataverse org URL.](media/refreshhistory-dashboard/template-parameter.PNG)](media/refreshhistory-dashboard/template-parameter.PNG)
1. Select **Load**.
1. Inside the dashboard you will find 2 tabs with information about errors, duration and count of rows inserted/upserted/failed.
    * Dataflow monitoring
    * Table monitoring
1. From this point on you can change it however you like and publish it to a workspace of your liking.

## Power BI Dataflows monitoring

When working with Power BI dataflows you may want to check out the following pages for setting up your monitoring solution:

* [Use Dataverse to build a dataflows monitoring report](./load-dataflow-metadata-into-dataverse-table.md)
* [Use a Power BI dataset to build a dataflows monitoring report](./load-dataflow-metadata-into-power-bi-dataset.md)
* [Use Excel to build a dataflows monitoring report](./load-dataflow-metadata-into-excel-online.md)