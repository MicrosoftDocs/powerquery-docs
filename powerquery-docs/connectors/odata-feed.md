---
title: Power Query OData Feed connector
description: Provides basic information and prerequisites for the connector, and instructions on how to connect to your data using the connector.
author: whhender
ms.topic: concept-article
ms.date: 11/13/2025
ms.author: whhender
ms.subservice: connectors
---

# OData Feed

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Anonymous<br/>Windows (requires Gateway)<br/>Basic (requires Gateway)<br/>Web API<br/>Organizational Account |
| Function Reference Documentation | [OData.Feed](/powerquery-m/odata-feed), [ODataOmitValues.Nulls](/powerquery-m/odataomitvalues-type) |

> [!NOTE]
>Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities supported

[!INCLUDE [Includes_odata-feed_capabilities-supported](includes/odata-feed/odata-feed-capabilities-supported.md)]

## Load data from an OData Feed in Power Query Desktop

To load data from an OData Feed in Power Query Desktop:

1. Select **OData** or **OData Feed** in the get data experience. The get data experience in Power Query Desktop varies between apps. For more information about the Power Query Desktop get data experience for your app, go to [Where to get data](../where-to-get-data.md).

2. Choose the **Basic** button and enter a URL address in the text box. This URL should be the root of the OData service you want to connect to. For example, enter `https://services.odata.org/V4/northwind/northwind.svc/`. Then select **OK**.

   :::image type="content" source="media/odata-feed/odata-basic-url.png" alt-text="Screenshot of the OData Feed connection dialog with the OData example URL entered.":::

   If the URL address you enter is invalid, a :::image type="icon" source="./media/odata-feed/web-warning.png"::: warning icon appears next to the **URL** textbox.

3. If you're connecting using the OData Feed for the first time, select the authentication type, input your credentials (if necessary), and select the level to apply the authentication settings to. Then select **Connect**.

   :::image type="content" source="media/odata-feed/odata-sign-in.png" alt-text="Screenshot of the authentication dialog where you enter your OData credentials.":::

4. From the **Navigator** dialog, you can select a table, then either transform the data in the Power Query editor by selecting **Transform Data**, or load the data by selecting **Load**.

   :::image type="content" source="media/odata-feed/odata-navigator.png" alt-text="Screenshot of the Navigator with the alphabetical list of products selected." lightbox="media/odata-feed/odata-navigator.png":::

   If you have multiple tables that have a direct relationship to one or more of the already selected tables, you can select the **Select Related Tables** button. When you do, all tables that have a direct relationship to one or more of the already selected tables are imported as well.

## Load data from an OData Feed in Power Query Online

To load data from an OData Feed in Power Query Online:

1. Select the **OData** or **OData Feed** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../where-to-get-data.md).

   :::image type="content" source="media/odata-feed/get-data-online.png" alt-text="Screenshot of the get data window with OData emphasized.":::

2. In the OData dialog that appears, enter a URL in the text box.

   :::image type="content" source="media/odata-feed/odata-online-sign-in.png" alt-text="Screenshot of the OData online sign in page.":::

3. If you're connecting using the OData Feed for the first time, select the authentication kind and enter your credentials (if necessary). Then select **Next**.

4. From the **Navigator** dialog, you can select a table, then transform the data in the Power Query editor by selecting **Transform Data**.

   :::image type="content" source="media/odata-feed/odata-navigator.png" alt-text="Screenshot of the online navigator with the alphabetical list of products selected and displayed." lightbox="media/odata-feed/odata-navigator.png":::

   If you have multiple tables that have a direct relationship to one or more of the already selected tables, you can select the **Select Related Tables** button. When you do, all tables that have a direct relationship to one or more of the already selected tables are imported as well.

## Connecting to Microsoft Graph

Connecting to [Microsoft Graph](/graph/overview) REST [APIs](https://graph.microsoft.com) from Power Query isn't recommended or supported. For more information, go to [Lack of support for Microsoft Graph in Power Query](../connecting-to-graph.md).

## Limitations and considerations

[!INCLUDE [Includes_odata-feed_limitations-and-considerations](includes/odata-feed/odata-feed-limitations-and-considerations-include.md)]
