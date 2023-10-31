---
title: Power Query Lakehouse (Beta) connector
description: Provides basic information and connection instructions for connecting to a Lakehouse.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 10/30/2023
ms.author: dougklo
---

# Lakehouse (Beta)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Datasets)<br/>Fabric (Dataflow Gen2)|
| Authentication types | Organizational account |

## Prerequisites

You must already have an existing Lakehouse - [Create a Lakehouse in Microsoft Fabric](/fabric/data-engineering/create-lakehouse).

## Capabilities supported

* Import

## Connect to a Lakehouse in Power BI Desktop

To get data from a Lakehouse in Power BI Desktop:

1. Select the **Lakehouses** connector in the connector selection, and then select **Connect**. More information: [Where to get data](../where-to-get-data.md)

   :::image type="content" source="media/lakehouse/get-data-desktop.png" alt-text="Screenshot of the Get data dialog with the Lakehouse connector emphasized.":::

2. In the **OneLake data hub**, select the lakehouse you want to connect to. Optionally, you can use the **All**, **My data**, or **Endorsed in your org** buttons to filter the Lakehouses displayed in the dialog. Then select **Connect**.

   :::image type="content" source="media/lakehouse/onelake-data-hub.png" alt-text="Screenshot of the OneLake data hub dialog with the all button selected, and a list of all the available Lakehouses." lightbox="media/lakehouse/onelake-data-hub.png":::

   > [!NOTE]
   > You can also select **Choose SQL endpoint** to select the SQL endpoint of the Lakehouse.

3. Select the data you want to build visuals with from the **Data** pane in Power BI Desktop.

   :::image type="content" source="media/lakehouse/power-bi-data-pane.png" alt-text="Screenshot of Power BI Desktop with the Data pane emphasized." lightbox="media/lakehouse/power-bi-data-pane.png":::

## Connect to a Lakehouse from Power Query Online

To get data from a Lakehouse in Power Query Online:

1. From the **New source** page, select **Microsoft Fabric** > **Lakehouse**. More information: [Where to get data](../where-to-get-data.md)

   :::image type="content" source="media/lakehouse/pqo-select-data-source.png" alt-text="Screenshot of the new source page, with the Microsoft Fabric category selected, and the Lakehouse connector emphasized." lightbox="media/lakehouse/pqo-select-data-source.png":::

2. In **Connect to data source**, select **Sign in** to sign in to your organizational account.

   :::image type="content" source="media/lakehouse/connect-data-source.png" alt-text="Screenshot of the connect to data source screen.":::

3. Once you've signed in, select **Next**.

4. In **Choose data**, select the data items that you want to transform, and then select **Create**.

   :::image type="content" source="media/lakehouse/choose-data-item.png" alt-text="Screenshot of the choose data screen with the test examples item selected and the corresponding data on the right side." lightbox="media/lakehouse/choose-data-item.png":::
