---
title: Power Query CData Connect Cloud connector
description: Provides basic information, prerequisites, and connection steps for CData Connect Cloud.
author: DougKlopfenstein

ms.date: 11/11/2025 
ms.author: dougklo
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# CData Connect Cloud

> [!NOTE]
>This connector is owned and provided by CData.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products Supported | Power BI (Semantic models) </br> Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | CData account (OAuth) |
| Function Reference Docs | &mdash; |

## Prerequisites

* A [CData Connect Cloud](https://cloud.cdata.com/) account
* At least one [connection](https://cloud.cdata.com/docs/Connections.html) configured in your CData Connect Cloud account

## Capabilities supported

* Import

## Connect to CData Connect Cloud

Follow these steps to connect to your CData Connect Cloud account:

1. In Power BI Desktop, select **Get Data**.

2. In the search field, enter **CData**.

3. Select **CData Connect Cloud** in the list and then select **Connect**.

    :::image type="content" source="./media/cdata-connect-cloud/cdata-1.png" alt-text="Screenshot of the Get data dialog where you select CData Connect Cloud.":::

4. In the **CData Connect Cloud** connection window, select **Sign in**.

    :::image type="content" source="./media/cdata-connect-cloud/cdata-2.png" alt-text="Screenshot of the authentication dialog where you sign in to your CData Connect account.":::

5. In the sign-in window, enter your CData Connect Cloud sign-in information, and then select **Continue**.

    :::image type="content" source="./media/cdata-connect-cloud/cdata-3.png" alt-text="Screenshot of the CData sign-in window.":::

6. Select **Connect** in the connection window.

    :::image type="content" source="./media/cdata-connect-cloud/cdata-4.png" alt-text="Screenshot of the authentication dialog where the connection is finalized.":::

The **Navigator** window appears and allows you to import your data.

## Import data

With the **Navigator** window open, follow these steps to access your CData Connect Cloud data:

1. Expand the **CData Connect Cloud** tree. Your connections appear as subtrees.

2. Select the data from each connection that you want to import.

3. Select **Load** or **Transform Data**.

    * **Load** instructs the connector to execute the underlying query to CData Connect Cloud.
    * **Transform Data** launches the Power Query editor and allows you to adjust the query before loading the data. When you're finished using the Power Query editor, select **Close & Apply** in the navigation ribbon to apply your changes and load the data.
