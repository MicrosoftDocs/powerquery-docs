---
title: Power Query Dynamics 365 (online) connector
description: Provides basic information, prerequisites, and instructions on how to connect to Dynamics 365 (online).
author: bezhan-msft
ms.topic: conceptual
ms.date: 04/12/2023
ms.author: bezhan
---

# Dynamics 365 (online)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel <br/> Power BI (Datasets)<br/> Analysis Services|
| Authentication Types Supported | Anonymous<br/>Windows<br/>Basic<br/>Web API<br/>Organizational account |
| Function Reference Documentation | |

## Capabilities Supported

- Import

## Connect to Dynamics 365 (online) from Power Query Desktop

Power Query desktop includes Excel and Power BI as experiences.

To make the connection to **Dynamics 365**, follow these steps:

1. From **Get Data**, select the **Online Services** category, select **Dynamics 365 Online (legacy)**, and then select **Connect**. More information: [where to get data](../where-to-get-data.md)

   :::image type="content" source="./media/dynamics-365/get-data.png" alt-text="Screenshot of the Get Data dialog, showing the Dynamics 365 database selection.":::

1. In the window that appears, enter the server name of your Dynamics 365 instance. You can select **Advanced** to enter additional URL parts.

   :::image type="content" source="./media/dynamics-365/enter-web-api-url.png" alt-text="Screenshot of the Dynamics 365 dialog, showing an example format web api url.":::

1. Select **OK**.

1. To authenticate, you can can either select Anonymous, Windows, Basic, Web API, or Organizational account. Enter your credentials and select **Connect**.

    :::image type="content" source="./media/dynamics-365/access.png" alt-text="Screenshot of the Dynamics 365 Online anonymous access dialog, showing the other options along the side.":::

1. In **Navigator**, select one or more files or folders to import and use in your application. Then select either **Load** to load the table, or **Transform Data** to open the Power Query Editor where you can filter and refine the set of data you want to use, and then load that refined set of data.
