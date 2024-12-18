---
title: Power Query inwink connector (Beta)
description: Provides basic information and prerequisites for the connector, and descriptions on how to connect to the inwink connector.
author: paservois
ms.author: dougklo
ms.topic: conceptual
ms.date: 1/31/2023
ms.subservice: connectors
---

# inwink Connector (Beta)

>[!Note]
>The following connector article is provided by inwink, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the [inwink website](https://help.inwink.com/get-help) and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Organizational account |

## Prerequisites

Before you can sign in to the inwink connector, you must have an inwink account (username/password).

## Connect to inwink data

To connect to inwink data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, select **inwink**, and then select **Connect**.

   :::image type="content" source="./media/inwink/get-data.png" alt-text="Screenshot of the Get Data dialog with the inwink connector emphasized.":::

2. Provide your inwink customer ID, the scope you want to retrieve data from (Event, Community, or Audience), and the scope ID.

   :::image type="content" source="./media/inwink/select-scope.png" alt-text="Screenshot of the inwink source dialog.":::

3. Select **Sign in** to sign in to your inwink account.

   :::image type="content" source="./media/inwink/auth-1.png" alt-text="Screenshot of the first inwink authentication dialog.":::

4. Connect using your user email and password.

   :::image type="content" source="./media/inwink/auth-2.png" alt-text="screenshot of the second inwink authentication dialog.":::

5. Once the connection is established, you can preview and select Tables within the **Navigator**.

   :::image type="content" source="./media/inwink/navigate-data.png" alt-text="Screenshot of the tables to select in the Power Query navigator." lightbox="./media/inwink/navigate-data.png":::

You can select **Load** on the selected tables, which brings all the tables into Power BI Desktop, or you can select **Transform Data** to edit the query, which opens the Power Query editor. You can then filter and refine the set of data you want to use, and then load that refined set of data into Power BI Desktop.

## Limitations and issues

Table relationships might be automatically set by Power BI Desktop when loading the tables and induce errors. Delete all relationships on column 'Status'.
