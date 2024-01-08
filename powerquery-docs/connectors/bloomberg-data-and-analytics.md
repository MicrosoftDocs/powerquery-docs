---
title: Power Query Bloomberg Data and Analytics connector
description: Provides basic information and prerequisites for the Bloomberg Data and Analytics connector, descriptions of the optional input parameters, and discusses limitations and issues you might encounter.
author: kanstantsin-chernik
ms.topic: conceptual
ms.date: 1/8/2024
ms.author: dougklo
---

# Bloomberg Data and Analytics

> [!NOTE]
>The following connector article is provided by Bloomberg, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Bloomberg website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Organizational account |

## Prerequisites

Your organization must subscribe to Bloomberg PORT Enterprise and you must be a Bloomberg Anywhere user and have a Bloomberg biometric authentication device (B-Unit).

## Capabilities Supported

* Import

## Connect to Bloomberg Data and Analytics

To connect to Bloomberg Data and Analytics:

1. In Power BI Desktop, select **Home** > **Get Data**.

2. Select **Other** from the categories on the left, select **Bloomberg Data and Analytics**, and then select **Connect**.

   ![Get Data from Bloomberg Data and Analytics.](./media/bloomberg-data-and-analytics/get-bql-data.png)

3. If this is the first time you're connecting to the Bloomberg Data and Analytics connector, a third-party notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

4. Enter a Bloomberg Query Language (BQL) query to specify what data you want to get. To learn more about BQL, contact your Bloomberg Sales representative. Select **OK**.

   ![Enter BQL query.](./media/bloomberg-data-and-analytics/bql-query.png)

5. To sign in to your Bloomberg account, select **Sign in**.

   ![Select sign in button.](./media/bloomberg-data-and-analytics/sign-in.png)

6. In the window that appears, provide your credentials to sign in to your Bloomberg account. If you entered an email address and a password, select **Next**.

   ![Sign in to Bloomberg.](./media/bloomberg-data-and-analytics/bloomberg-sign-in.png)

7. Enter your B-Unit code and select **Log In**.

   ![Enter your BUnit code.](./media/bloomberg-data-and-analytics/bunit.png)

8. Once you've successfully signed in, select **Connect**.

   ![Signed in and ready to connect.](./media/bloomberg-data-and-analytics/connect.png)

Once the connection is established, you will see data available for preview in **Navigator**.

![Select tables in Navigator View.](./media/bloomberg-data-and-analytics/navigator-view.png)

You can **Load** the selected table, or you can select **Transform Data** to edit the query, which opens Power Query Editor. You can then filter and refine the set of data you want to use, and then load that refined set of data into Power BI Desktop.

![Load or transform data.](./media/bloomberg-data-and-analytics/button-select.png)
