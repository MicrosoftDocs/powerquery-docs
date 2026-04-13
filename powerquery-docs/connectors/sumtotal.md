---
title: Power Query SumTotal connector
description: Provides basic information and prerequisites for the SumTotal connector, and outlines limitations and issues.
author: whhender
ms.topic: concept-article
ms.date: 9/11/2025
ms.author: whhender
ms.subservice: connectors
---

# SumTotal

>[!Note]
>This connector is owned and provided by SumTotal.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication types | SumTotal credentials using OAuth 2.0 |

## Prerequisites

[!INCLUDE [Includes_sumtotal_prerequisites](includes/sumtotal/sumtotal-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_sumtotal_capabilities-supported](includes/sumtotal/sumtotal-capabilities-supported.md)]

## Finding your SumTotal hosted URL

Copy the SumTotal hosted root URL in full. This root URL is the unique URL specific to your instance. The URL will be in the format of `https://<*yourcustomerdomain*>.sumtotal.host/`. Make sure not to copy the rest of the URL. Keep this URL somewhere handy so you can use it later.

## Connect to SumTotal BI from Power BI Desktop

> [!NOTE]
>The Power Query SumTotal connector is currently only suited towards OData API endpoints. For more information, go to [SumTotal's OData API functionality](https://marketplace.sumtotalsystems.com/Home/ODataAPI).

To connect to SumTotal from Power BI Desktop:

1. Select **Get data** from the **Home** tab.

2. In the **Get Data** dialog box, select **Other > SumTotal**, and then select **Connect**.

   :::image type="content" source="media/sumtotal/sumtotal-get-data.png" alt-text="Screenshot.":::

3. Enter the server URL address of the data you want to load.

   > [!NOTE]
   >You'll be prompted with a script error, which loads JS/CSS scripts the login form uses. Select **Yes**.

4. When the table is loaded in **Navigator**, you'll be presented with the list of OData API entities that are currently supported by the connector. You can select to load one or multiple entities.

5. When you've finished selecting entities, select **Load** or **Transform Data**.

> [!NOTE]
>If this is the first time you're connecting to this site, select **Sign in** and input your credentials. Then select **Connect**.

## Limitations and considerations

[!INCLUDE [Includes_sumtotal_limitations-and-considerations](includes/sumtotal/sumtotal-limitations-and-considerations-include.md)]
