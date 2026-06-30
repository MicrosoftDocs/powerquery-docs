---
title: Power Query Dataflow connector
description: Provides basic information and connection instructions for connecting to a Dataflow.
author: Luitwieler
ms.topic: concept-article
ms.date: 06/29/2026
ms.author: jeluitwi
ms.subservice: connectors
---

# Dataflows

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights (Dataflows)|
| Authentication types | Organizational account |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

[!INCLUDE [Includes_dataflows_prerequisites](includes/dataflows/dataflows-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_dataflows_capabilities-supported](includes/dataflows/dataflows-capabilities-supported.md)]

## Get data from Dataflows in Power Query Desktop

To get data from Dataflows in Power Query Desktop:

1. Select **Dataflows** in the get data experience. The get data experience in Power Query Desktop varies between apps. For more information about the Power Query Desktop get data experience for your app, go to [Where to get data](../where-to-get-data.md).

2. If you're connecting to this site for the first time, select **Sign in** and input your credentials. Then select **Connect**.

   :::image type="content" source="media/dataflows/sign-in.png" alt-text="Sign in to this site.":::

3. In **Navigator**, select the Dataflow you require, then either load or transform the data.

   :::image type="content" source="media/dataflows/navigate.png" alt-text="Load or transform from navigator.":::

## Get data from Dataflows in Power Query Online

[!INCLUDE [Includes_dataflows_get-data-power-query-online](includes/dataflows/dataflows-get-data-power-query-online.md)]

## Limitations and considerations

[!INCLUDE [Includes_dataflows_limitations-and-considerations](includes/dataflows/dataflows-limitations-and-considerations-include.md)]

## Frequently asked questions

_**DirectQuery isn't working for me in Power BI&mdash;what should I do?**_

To get DirectQuery to run, you need to have Power BI Premium and adjust a few configuration items in your Power BI workspace. These actions are explained in the [dataflows premium features](/power-bi/transform-model/dataflows/dataflows-premium-features) article.

_**My dataflow table doesn't show up in the dataflow connector in Power BI**_

You're probably using a Dataverse table as the destination for your standard dataflow. Use the [Dataverse/CDS connector](../connectors/dataverse.md) instead or consider switching to an analytical dataflow.

_**There's a difference in the data when I remove duplicates in dataflows&mdash;how can I resolve this?**_

There could be a difference in data between design-time and refresh-time. The instance kept during refresh time isn't guaranteed. For information on how to avoid inconsistencies in your data, see [Working with duplicates](../working-with-duplicates.md).

_**I'm using the Dataflow connector in DirectQuery mode&mdash;is case insensitive search supported?**_

No, case insensitive search on columns isn't supported in DirectQuery mode. If you need to use case insensitive search, you can use import mode instead. For more information, go to [DirectQuery in Power BI](/power-bi/connect-data/desktop-directquery-about).

_**I'm getting data via the dataflow connector, but I'm receiving a 429 error code&mdash;how can I resolve this?**_

When you receive an error code 429, you possibly exceeded the limit of 1,000 requests per minute. This error typically resolves by itself if you wait a minute or two after the cooldown period ended. This limit is in place to prevent dataflows and other Power BI functionality from having degraded performance. Continued high load on the service might result in degraded performance, so reduce the number of requests to fewer than 1,000 or fix your script/model to this specific limit (1,000) to avoid further issues. You should also avoid nested joins that re-request dataflow data. Instead, stage data and perform merges within your dataflow instead of your semantic model.

### See also

* [Using the output of Dataflows from other Power Query experiences](../dataflows/using-output-power-platform-dataflows-other-azure.md)
* [Best practices for designing and developing complex dataflows](../dataflows/best-practices-developing-complex-dataflows.md)
* [Best practices for reusing dataflows across environments and workspaces](../dataflows/best-practices-reusing-dataflows.md)
