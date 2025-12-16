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

To use the Funnel connector, you need a Funnel subscription. Funnel helps you collect data from all your marketing platforms, transform it, and send it to the destinations you want, like Power BI (<https://funnel.io/>).

In the Funnel App, go to your Workspace and navigate to the Microsoft Power BI page in the left navigation (if you can't see it, contact us). Follow the instructions on the page. You need to create a "Data Share" that contains the fields you want to expose in Power BI.

## Capabilities Supported

* Import

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

## Known issues and limitations

* If a Data Share contains too much data for one month, the connector gets a TOO_MANY_ROWS error.

For more information, read our [Power BI knowledge base articles](https://help.funnel.io/en/?q=powerbi).
