---
title: Wolters Kluwer CCH Tagetik connector
description: Provides prerequisites, capabilities supported, and connection instructions to your Wolters Kluwer CCH Tagetik data.
author: innovation-team
ms.topic: conceptual
ms.date: 07/25/2024
ms.author: dougklo
---

# Wolters Kluwer CCH Tagetik

> [!NOTE]
>The following connector article is provided by Wolters Kluwer CCH Tagetik, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Wolters Kluwer website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic Models)|
| Authentication Types Supported | Basic |

## Prerequisites

Verify the [system requirements](https://www.microsoft.com/download/details.aspx?id=58494) before you install Microsoft Power BI Desktop.

To use the Wolters Kluwer CCH Tagetik connector, you need to configure the CCH Tagetik environment from which you want to read data.

## Capabilities supported

* Import
* Data loading from CCH Tagetik financial and analytical layer

## Connect to Wolters Kluwer CCH Tagetik data

To connect to Wolters Kluwer CCH Tagetik data:

1. Select **Get data** from the **Home** ribbon in Power BI Desktop and select **More**.
2. Search for **Wolters Kluwer CCH Tagetik** in the list of connectors.

   :::image type="content" source="./media/wolters-kluwer-cch-tagetik/get-cchtagetik-data.png" alt-text="Screenshot of the Get Data dialog with Wolters Kluwer CCH Tagetik selected.":::

3. Select **Connect**.
4. Enter the parameters to connect to the CCH Tagetik environment:

   * **URL** is your Wolters Kluwer CCH Tagetik environment endpoint.
   * **Database** is the code of the database.
   * **Analytical Workspace** (optional) is the code of the analytical workspace.
   * **Analytical Workspace Dataset or Financial Model** (optional) is the code of the analytical workspace dataset or the code of the financial model.

   :::image type="content" source="./media/wolters-kluwer-cch-tagetik/window-parameters.png" alt-text="Screenshot of the Wolters Kluwer CCH Tagetik connector parameter dialog.":::

5. Enter the basic credentials and select **Connect**.

   The connector uses ad-hoc credentials (username and password) defined in CCH Tagetik to access and retrieve data through OData APIs.

   :::image type="content" source="./media/wolters-kluwer-cch-tagetik/authentication-credentials.png" alt-text="Screenshot of the connector authentication dialog where you enter the user name and password.":::

6. Once authentication is complete, the connector displays the **Navigator** dialog containing a list of sources based on the parameters previously entered.

   :::image type="content" source="./media/wolters-kluwer-cch-tagetik/navigator-dialog.png" alt-text="Screenshot of the navigator dialog with the list of sources." lightbox="./media/wolters-kluwer-cch-tagetik/navigator-dialog.png":::

7. Select a single source to display a preview.
8. **Check** the box for one or more sources.
9. Select **Load** to import the data into Power BI. 

   :::image type="content" source="./media/wolters-kluwer-cch-tagetik/load.png" alt-text="Screenshot of the load dialog indicating the status of the load operation.":::
   
10. Once loaded, the tables appear in the model view. Begin exploring the attributes in the Power BI Fields dialog.

   :::image type="content" source="./media/wolters-kluwer-cch-tagetik/data-model.png" alt-text="Screenshot of the data model view with the data that was previously loaded." lightbox="./media/wolters-kluwer-cch-tagetik/data-model.png":::

11. Start to build your report.

   :::image type="content" source="./media/wolters-kluwer-cch-tagetik/dashboard.png" alt-text="Screenshot of the dashboard showing analysis of various types of data." lightbox="./media/wolters-kluwer-cch-tagetik/dashboard.png":::
