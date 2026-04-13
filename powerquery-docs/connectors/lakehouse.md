---
title: Power Query Lakehouse (Beta) connector
description: Provides basic information and connection instructions for connecting to a Lakehouse.
author: whhender
ms.topic: concept-article
ms.date: 2/7/2024
ms.author: whhender
ms.subservice: connectors
---

# Lakehouse (Beta)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Semantic models)<br/>Fabric (Dataflow Gen2)|
| Authentication types | Organizational account |

## Prerequisites

[!INCLUDE [Includes_lakehouse_prerequisites](includes/lakehouse/lakehouse-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_lakehouse_capabilities-supported](includes/lakehouse/lakehouse-capabilities-supported.md)]

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

[!INCLUDE [Includes_lakehouse_connect-to-power-query-online](includes/lakehouse/lakehouse-connect-to-power-query-online.md)]

