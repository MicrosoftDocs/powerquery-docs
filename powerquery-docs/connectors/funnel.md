---
title: Power Query Funnel connector
description: Provides basic information, prerequisites, and information on how to connect to your data using the Funnel connector, along with a list of known issues and limitations.
author: whhender
ms.topic: concept-article
ms.date: 11/12/2025
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Funnel

>[!Note]
>This connector is owned and provided by Funnel.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Funnel Workspace |

## Prerequisites

[!INCLUDE [Includes_funnel_prerequisites](includes/funnel/funnel-prerequisites.md)]

## Capabilities Supported

[!INCLUDE [Includes_funnel_capabilities-supported](includes/funnel/funnel-capabilities-supported.md)]

## Connect to Funnel from Power Query Desktop

To connect to Funnel:

1. Select Online Services, find **Funnel** from the product-specific data connector list, and then select **Connect**.

   :::image type="content" source="./media/funnel/funnel-connector.png" alt-text="Screenshot of the Get data dialog with the Funnel connector selected.":::

1. Select **Sign in** to sign in to your Funnel Workspace.

   :::image type="content" source="media/funnel/funnel-sign-in-1.png" alt-text="Screenshot of the authentication dialog where you sign in to your Funnel Workspace.":::

1. Sign in with your Google user connected to Funnel or use your Funnel credentials.

   :::image type="content" source="media/funnel/funnel-sign-in-2.png" alt-text="Screenshot of the sign in dialog where you again sign in to your Funnel Workspace.":::

1. Once you successfully sign in, select **Connect** to continue.

   :::image type="content" source="media/funnel/funnel-sign-in-3.png" alt-text="Screenshot of the authentication dialog after you successfully signed in to your Funnel Workspace.":::

1. In the **Navigator** dialog, choose one or more **Data Shares** from your **Workspaces** to import your data.

   :::image type="content" source="media/funnel/funnel-navigation-table.png" alt-text="Screenshot of the Navigator dialog where you can choose Data Shares from the workspaces." lightbox="media/funnel/funnel-navigation-table.png":::

   For each Data Share, you can enter the number of rolling months of data you want.

   > [!NOTE]
   > The default number of months is 12. If today is 22.03.2022, then you get data for the period 01.04.2021 - 22.03.2022.

   You can then either select **Load** to load the data or select **Transform Data** to transform the data.

## Connect to Funnel from Power Query Online

[!INCLUDE [Includes_funnel_connect-to-power-query-online](includes/funnel/funnel-connect-to-power-query-online.md)]

## Limitations and considerations

[!INCLUDE [Includes_funnel_limitations-and-considerations](includes/funnel/funnel-limitations-and-considerations-include.md)]
