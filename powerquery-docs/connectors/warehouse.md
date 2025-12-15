---
title: Power Query Warehouse (Beta) connector
description: Provides basic information and connection instructions for connecting to a Warehouse.
author: whhender
ms.topic: concept-article
ms.date: 1/24/2024
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Warehouse (Beta)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Semantic models)<br/>Fabric (Dataflow Gen2)|
| Authentication types | Organizational account |

> [!NOTE]
>Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

You must already have an existing Warehouse - [Create a Warehouse in Microsoft Fabric](/fabric/data-warehouse/create-warehouse).

## Capabilities supported

* Import

## Connect to a Warehouse in Power Query Desktop

To get data from a Warehouse in Power Query Desktop:

1. Select **Microsoft Fabric** > **Warehouses** in the connector selection, and then select **Connect**. More information: [Where to get data](../where-to-get-data.md)

   :::image type="content" source="media/warehouse/get-data-desktop.png" alt-text="Screenshot of the Get data dialog with the Warehouse connector emphasized.":::

2. In the **OneLake data hub**, select the Warehouse you want to connect to. Optionally, you can use the **All**, **My data**, or **Endorsed in your org** buttons to filter the Warehouses displayed in the dialog. Then select **Connect**.

   :::image type="content" source="media/warehouse/onelake-data-hub.png" alt-text="Screenshot of the OneLake data hub dialog with the all button selected, and a list of all the available Warehouses." lightbox="media/warehouse/onelake-data-hub.png":::

   > [!NOTE]
   > You can also select **Choose SQL endpoint** to select the SQL endpoint of the Warehouse.

3. Select the data you want to build visuals with from the **Data** pane in Power BI Desktop.

   :::image type="content" source="media/warehouse/desktop-data-pane.png" alt-text="Screenshot of Power BI Desktop with the Data pane emphasized." lightbox="media/warehouse/desktop-data-pane.png":::

## Connect to a Warehouse from Power Query Online

To get data from a Warehouse in Power Query Online:

1. From the **New source** page, select **Microsoft Fabric** > **Warehouse**. More information: [Where to get data](../where-to-get-data.md)

   :::image type="content" source="media/warehouse/select-data-source.png" alt-text="Screenshot of the new source page, with the Microsoft Fabric category selected, and the Warehouse connector emphasized." lightbox="media/warehouse/select-data-source.png":::

2. In **Connect to data source**, select **Sign in** to sign in to your organizational account.

   :::image type="content" source="media/warehouse/connect-data-source.png" alt-text="Screenshot of the connect to data source screen.":::

3. Once you've signed in, select **Next**.

4. In **Choose data**, select the data items that you want to transform, and then select **Create**.

   :::image type="content" source="media/warehouse/choose-data-item.png" alt-text="Screenshot of the choose data screen with the test examples item selected and the corresponding data on the right side." lightbox="media/warehouse/choose-data-item.png":::
