---
title: Intersystems Health Insight
description: Provides basic details about using the Intersystems Health Insight connector.
author: jbolinsky
ms.topic: concept-article
ms.date: 9/11/2025
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Intersystems Health Insight

>[!Note]
>This connector is owned and provided by Intersystem.

## Summary

|**Item**                              |**Description**                                        |
|:-------------------------------------|:------------------------------------------------------|
| Release State                        | General Availability                                  |
| Products Supported                   | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication types supported       | Health Insight IRIS account                           |

## Prerequisites

[!INCLUDE [Includes_intersystems-healthinsight_prerequisites](includes/intersystems-healthinsight/intersystems-healthinsight-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_intersystems-healthinsight_capabilities-supported](includes/intersystems-healthinsight/intersystems-healthinsight-capabilities-supported.md)]

## Connect to an Intersystems Health Insight database in Power BI Desktop

1. Identify the Health Insight server connection details&mdash;Server, Super server port, and Namespace.

2. Open Power BI Desktop, select **Get Data** and then **More**.

   :::image type="content" source="./media/intersystem-healthinsight/initial-desktop.png" alt-text="Screenshot of the initial desktop with the Get data steps emphasized." lightbox="./media/intersystem-healthinsight/initial-desktop.png":::

3. When the **Get Data** dialog opens, select **Database** and then search the listing to find Intersystems Health Insight. Then select the **Connect** button.

   :::image type="content" source="./media/intersystem-healthinsight/get-data.png" alt-text="Screenshot of the Get data dialog with the connector emphasized.":::

4. The connection screen opens. Here, Host (IP Address) is the IP address of the host for your InterSystems Health Insight instance, Port is the instance’s superserver port, and Namespace is the namespace where your Health Insight data is located. Answer **Yes** or **No** to the questions related to connecting via SSL and hiding system tables. Then select the desired connectivity.

   :::image type="content" source="./media/intersystem-healthinsight/connection-screen.png" alt-text="Screenshot of the InterSystems Health Insight connection screen.":::

5. Upon your first connection to the Health Insight instance, an authentication dialog appears. Choose **Basic** and enter your InterSystems Health Insight credentials.

   :::image type="content" source="./media/intersystem-healthinsight/authentication-screen.png" alt-text="Screenshot of the InterSystem Health Insight authentication screen.":::

6. The navigation window opens and presents a Table folder (this folder is where the HSAA tables reside) and a Cube folder (this folder is where you find the cubes).

Visit the [documentation](https://docs.intersystems.com/hslatest/csp/docbook/DocBook.UI.Page.cls?KEY=HSAA_powerbi) for connection, usage, and troubleshooting instructions.

## Limitations and considerations

[!INCLUDE [Includes_intersystems-healthinsight_limitations-and-considerations](includes/intersystems-healthinsight/intersystems-healthinsight-limitations-and-considerations-include.md)]

## Further assistance

For further assistance, contact InterSystems' [Worldwide Response Center](https://wrc.intersystems.com).
