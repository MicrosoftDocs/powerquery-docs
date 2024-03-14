---
title: Power Query Bloomberg Data and Analytics connector
description: Provides basic information and prerequisites for the Bloomberg Data and Analytics connector, descriptions of the optional input parameters, and discusses limitations and issues you might encounter.
author: kanstantsin-chernik
ms.topic: conceptual
ms.date: 1/24/2024
ms.author: dougklo
---

# Bloomberg Data and Analytics

> [!NOTE]
>The following connector article is provided by Bloomberg, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Bloomberg website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Organizational account |

## Prerequisites

Your organization must subscribe to Bloomberg PORT Enterprise and you must be a Bloomberg Anywhere user and have a Bloomberg biometric authentication device (B-Unit).

## Capabilities Supported

* Import

## Connect to Bloomberg Data and Analytics

To connect to Bloomberg Data and Analytics:

1. In Power BI Desktop, select **Home** > **Get Data**.

2. Select **Other** from the categories on the left, select **Bloomberg Data and Analytics**, and then select **Connect**.

   :::image type="content" source="./media/bloomberg-data-and-analytics/get-bql-data.png" alt-text="Get Data from Bloomberg Data and Analytics.":::

3. If this is the first time you're connecting to the Bloomberg Data and Analytics connector, a third-party notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

4. Enter a Bloomberg Query Language (BQL) query to specify what data you want to get. To learn more about BQL, contact your Bloomberg Sales representative. Select **OK**.

   :::image type="content" source="./media/bloomberg-data-and-analytics/bql-query.png" alt-text="Enter BQL query.":::

5. To sign in to your Bloomberg account, select **Sign in**.

   :::image type="content" source="./media/bloomberg-data-and-analytics/sign-in.png" alt-text="Select sign in button.":::

6. In the window that appears, provide your credentials to sign in to your Bloomberg account. If you entered an email address and a password, select **Next**.

   :::image type="content" source="./media/bloomberg-data-and-analytics/bloomberg-sign-in.png" alt-text="Sign in to Bloomberg.":::

7. Enter your B-Unit code and select **Log In**.

   :::image type="content" source="./media/bloomberg-data-and-analytics/bunit.png" alt-text="Enter your BUnit code.":::

8. Once you've successfully signed in, select **Connect**.

   :::image type="content" source="./media/bloomberg-data-and-analytics/connect.png" alt-text="Signed in and ready to connect.":::

Once the connection is established, you will see data available for preview in **Navigator**.

:::image type="content" source="./media/bloomberg-data-and-analytics/navigator-view.png" alt-text="Select tables in Navigator View.":::

You can **Load** the selected table, or you can select **Transform Data** to edit the query, which opens Power Query Editor. You can then filter and refine the set of data you want to use, and then load that refined set of data into Power BI Desktop.

:::image type="content" source="./media/bloomberg-data-and-analytics/button-select.png" alt-text="Load or transform data.":::
