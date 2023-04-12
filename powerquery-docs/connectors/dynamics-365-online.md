---
title: Power Query Dynamics 365 (online) connector
description: Provides basic information, prerequisites, and instructions on how to connect to Dynamics 365 (online), along with native query folding instructions and troubleshooting tips.
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
| Authentication Types Supported | Anonymous<br/>Windows<br/>Microsoft account |
| Function Reference Documentation | |

## Capabilities Supported

- Import

## Connect to Dynamics 365 (online) from Power Query Desktop

Power Query desktop includes Excel and Power BI as experiences.

To make the connection to **Dynamics 365**, follow these steps:

1. From **Get Data**, select the **Other** category, select **Dynamics 365**, and then select **Connect**. More information: [where to get data](../where-to-get-data.md)

   :::image type="content" source="./media/dynamics-365/get-data.png" alt-text="Screenshot of the Get Data dialog, showing the Dynamics 365 database selection.":::

1. In the window that appears, enter the server name of your Dynamics 365 instance.

   :::image type="content" source="./media/dynamics-365/enter-server-name.png" alt-text="Screenshot of the Dynamics 365 dialog, showing the name of the server added.":::

1. Select **OK**.

1. You can either select anonymous access, windows access, or Microsoft account.

1. If you select **Anonymous**, select the level to apply the settings on your system, then select **Connect**.

   :::image type="content" source="./media/dynamics-365/anonymous-access.png" alt-text="Screenshot of the Dynamics 365 anonymous access dialog.":::

1. If you select **Windows**, select the level to apply your Windows credentials on the system, the select **Connect**.

   :::image type="content" source="./media/dynamics-365/windows-access.png" alt-text="Screenshot of the Dynamics 365 Windows access dialog.":::

1. If you select **Microsoft account**, then you'll first need to sign in.

1. Select the level to apply your Microsoft account credentials on the system, the select **Connect**.

   :::image type="content" source="./media/dynamics-365/microsoft-account-access.png" alt-text="Screenshot of the Dynamics 365 Microsoft account access dialog.":::

1. In **Navigator**, select one or more files or folders to import and use in your application. Then select either **Load** to load the table, or **Transform Data** to open the Power Query Editor where you can filter and refine the set of data you want to use, and then load that refined set of data.