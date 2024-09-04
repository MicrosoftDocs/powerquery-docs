---
title: Power Query Bloomberg Data and Analytics connector
description: Provides basic information and prerequisites for the Bloomberg Data and Analytics connector, descriptions of the optional input parameters, and discusses limitations and issues you might encounter.
author: Shrewbitz
ms.topic: conceptual
ms.date: 8/14/2024
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

Your organization must have a corresponding subscription to the Bloomberg product from which you wish to access data. You must also have a Bloomberg Anywhere license and either the Bloomberg B-Unit mobile app or a Bloomberg B-Unit device.

## Capabilities Supported

* Import

## Connect to Bloomberg Data and Analytics

To connect to Bloomberg Data and Analytics:

1. In Power BI Desktop, select **Home** > **Get Data**.

2. Select **Bloomberg Data and Analytics**, and then select **Connect**.

   :::image type="content" source="./media/bloomberg-data-and-analytics/get-data.png" alt-text="Screenshot that shows get data from Bloomberg Data and Analytics.":::

3. If this is the first time you're connecting to the Bloomberg Data and Analytics connector, a third-party notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

4. Once you have written your query, select **OK** to execute it. The Bloomberg Data and Analytics connector now supports both **Bloomberg Query Language (BQL)** and **SQL** for data retrieval. This enhancement enables the connector to intelligently select the appropriate data source based on the query type you use.

   With the introduction of SQL support, you gain the benefit of [Query Folding](../query-folding-examples.md) in the Query Editor. This performance optimization, which reduces data transfer, is available exclusively for SQL queries.

   > [!NOTE]
   >The latest version of the connector introduces a unified query function, Bloomberg.Query(), in the formula bar. This function accepts both BQL and SQL, providing a streamlined experience. For existing reports developed with earlier versions, the BQL.Query() function remains operational and fully supported. Each function has its own authentication. To avoid logging in more than once, it is best practice to use Bloomberg.Query().
   :::image type="content" source="./media/bloomberg-data-and-analytics/function-bar.png" alt-text="Function bar queries.":::

   - **Bloomberg Query Language (BQL) Example:**
   
    To learn more about BQL, contact your Bloomberg Sales representative.
    
    :::image type="content" source="./media/bloomberg-data-and-analytics/bql-example.png" alt-text="Screenshot of an example BQL query.":::

    - **SQL Query Example:**
    
    :::image type="content" source="./media/bloomberg-data-and-analytics/sql-example.png" alt-text="Example SQL query.":::

5. To sign in to your Bloomberg account, select **Sign in**.

   :::image type="content" source="./media/bloomberg-data-and-analytics/sign-in.png" alt-text="Select sign in button":::
6. In the window that appears, provide your credentials to sign in to your Bloomberg account. Enter a terminal username and password, then select **Next**.

    :::image type="content" source="./media/bloomberg-data-and-analytics/bb-sign-in.png" alt-text="Sign in to Bloomberg.":::

7. Enter your Bloomberg B-Unit Mobile App code or B-Unit code and select **Submit**.

    :::image type="content" source="./media/bloomberg-data-and-analytics/mobile-app.png" alt-text="Enter your auth code.":::

8. Once you've successfully signed in, select **Connect**.

   :::image type="content" source="./media/bloomberg-data-and-analytics/sign-in.png" alt-text="Select connect button.":::

9. After the connection is established, you will see data available for preview in the **Navigator**.

   **9a. Bloomberg Query Language (BQL) Example:**\
   :::image type="content" source="./media/bloomberg-data-and-analytics/bql-load.png" alt-text="Select BQL tables in the navigator view.":::\
   **9b. SQL Query Example:**\
   :::image type="content" source="./media/bloomberg-data-and-analytics/sql-load.png" alt-text="Select SQL tables in the navigator view.":::

   You can **Load** the data, or you can select **Transform Data**, which opens the Power Query Editor. The editor allows you to filter and refine the set of data before loading it into Power BI Desktop.

   :::image type="content" source="./media/bloomberg-data-and-analytics/load-transform.png" alt-text="Load or transform data.":::
