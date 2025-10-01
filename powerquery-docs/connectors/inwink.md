---
title: inwink connector (Beta)
description: Provides basic information and prerequisites for the connector, and descriptions on how to connect to the inwink connector.
author: paservois
ms.author: dougklo
ms.topic: conceptual
ms.date: 9/11/2025
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# inwink Connector (Beta)

>[!Note]
>This connector is owned and provided by inwink.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Organizational account |

## Prerequisites

Before you can sign in to the connector, you must have an inwink account (username/password).

## Connect to inwink data

Follow the next steps to connect to your data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, select **inwink**, and then select **Connect**.

   :::image type="content" source="./media/inwink/get-data.png" alt-text="Screenshot of the Get Data dialog with the inwink connector emphasized.":::

2. Provide your inwink customer ID, the scope you want to retrieve data from (Event, Community, or Audience), and the scope ID.

   :::image type="content" source="./media/inwink/select-scope.png" alt-text="Screenshot of the inwink source dialog.":::

3. Select **Sign in** to provide your credentials and authenticate to your data.

   :::image type="content" source="./media/inwink/auth-1.png" alt-text="Screenshot of the first inwink authentication dialog.":::

4. Connect using your user email and password.

   :::image type="content" source="./media/inwink/auth-2.png" alt-text="screenshot of the second inwink authentication dialog.":::

5. Once the connection is established, you can preview and select Tables within the **Navigator**.

   :::image type="content" source="./media/inwink/navigate-data.png" alt-text="Screenshot of the tables to select in the Power Query navigator." lightbox="./media/inwink/navigate-data.png":::

You can select **Load** on the selected tables, which brings all the tables into Power BI Desktop, or you can select **Transform Data** to edit the query, which opens the Power Query editor. You can then filter and refine the set of data you want to use, and then load that refined set of data into Power BI Desktop.

## Limitations and issues

Power BI Desktop might automatically set table relationships during data load, which can lead to errors. To prevent such behavior, delete all relationships involving the *Status* column.
