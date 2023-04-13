---
title: Power Query Dynamics 365 Online (legacy) connector
description: Provides basic information, prerequisites, and instructions on how to connect to Dynamics 365 Online (legacy).
author: bezhan-msft
ms.topic: conceptual
ms.date: 04/12/2023
ms.author: bezhan
---

# Dynamics 365 Online (legacy)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel <br/> Power BI (Datasets)<br/> Analysis Services|
| Authentication Types Supported | Anonymous<br/>Windows<br/>Basic<br/>Web API<br/>Organizational account |
| Function Reference Documentation | |

## Capabilities Supported

- Import

## Connect to Dynamics 365 Online (legacy) from Excel and Power BI Desktop

To make the connection to **Dynamics 365 Online (legacy)**, follow these steps:

1. From **Get Data**, select the **Online Services** category, select **Dynamics 365 Online (legacy)**, and then select **Connect**. More information: [where to get data](../where-to-get-data.md)

   :::image type="content" source="./media/dynamics-365/get-data.png" alt-text="Screenshot of the Get Data dialog, showing the Dynamics 365 Online (legacy) database selection.":::

1. In the window that appears, enter the server name of your Dynamics 365 Online (legacy) instance. You can select **Advanced** to enter additional URL parts.

   :::image type="content" source="./media/dynamics-365/enter-web-api-url.png" alt-text="Screenshot of the Dynamics 365 Online (legacy) dialog, showing an example format web api url.":::

   >[!NOTE]
   > - The url format will be something like `https://<tenant>.crm.dynamics.com/api/data/v9.0.`
   > - The exact format of the URL you will use to connect depends on your region and the version of CDS for Apps you're using. For more information see: [Web API URL and versions (docs.com)](/power-apps/developer/data-platform/webapi/compose-http-requests-handle-errors#web-api-url-and-versions).
   > - If you select the Advanced option, you can append certain additional parameters to the query to control what data is returned. For more information see: [Query Data using the Web API (docs.com)](/power-apps/developer/data-platform/webapi/query-data-web-api).

1. Select **OK**.

1. To authenticate, you can can either select Anonymous, Windows, Basic, Web API, or Organizational account. Enter your credentials and select **Connect**.

    :::image type="content" source="./media/dynamics-365/access.png" alt-text="Screenshot of the Dynamics 365 Online (legacy) anonymous access dialog, showing the other options along the side.":::

1. In **Navigator**, select one or more files or folders to import and use in your application. Then select either **Load** to load the table, or **Transform Data** to open the Power Query Editor where you can filter and refine the set of data you want to use, and then load that refined set of data.
