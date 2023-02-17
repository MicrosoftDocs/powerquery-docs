---
title: Power Query Assemble Views connector
description: Includes basic information, prerequisites, and information on how to connect to your Assemble Views data, along with a list of known issues and limitations.
author: hofax
ms.topic: conceptual
ms.date: 1/5/2023
ms.author: bezhan
---

# Assemble Views

>[!Note]
>The following connector article is provided by Autodesk, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Autodesk website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | GA |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows) |
| Authentication Types Supported | Autodesk Account |
| Function Reference Documentation | &mdash; |

## Prerequisites

To use the Assemble Views connector, you must have an Autodesk account with a username and password, and be a member of at least one project in Assemble.

You'll also need at least one view associated with the Assemble project.

## Capabilities supported

* Import

## Connect to Assemble Views from Power Query Desktop

To connect to Assemble data:

1. Select **Assemble Views** from the **Get Data** experience under the **Online Services** category, and then select **Connect**.

2. In **Assemble Views**, enter your site's URL to sign in. For example, use **`https://example.tryassemble.com`**.

   a. (Optional) Select a date from which you want to load the data. Leaving this entry blank results in the latest data being pulled each time you refresh.

      ![Enter your Assemble URL.](media/assemble-views/assemble-views-url.png)

   b. Once you've entered the URL, select **OK** to continue.

3. Select **Sign in** to sign in to your Autodesk account.

   ![Sign in to your Autodesk account.](media/assemble-views/assemble-views-sign-in.png)

   Once you've successfully signed in, select **Connect**.

4. In the **Navigator** dialog box, select the Assemble Views that you want to load. For each project, there's a single item for view images named **[Your Project] View Thumbnails**. Select this option if you want to include images in your report. Select **Transform Data** to continue to Power Query.

   ![Select which views to import.](media/assemble-views/assemble-views-selection.png)

5. In Power Query, you'll see a single column named **Rows**. On the header of the column, select the button with two arrows pointing in opposite directions to expand your rows.

   ![Data preview pre-transformation.](media/assemble-views/assemble-views-pre-transform.png)

   a. Uncheck **Use original column name as prefix** and select **OK** for each view data query you've selected.

      ![Don't keep original column name as prefix.](media/assemble-views/assemble-views-transform-1.png)

   b. Select **Close & Apply** to load the datasets.

6. (Optional) If you have chosen to load images, you'll need to update the **Data category** for the image field.

   a. Expand the **[Your Project] View Thumbnails** table, and then select the **Image** field.  This selection opens the **Column tools** tab.

   b. Open the **Data category** drop-down and select **Image URL**. You can now drag and drop the Image field into your report visuals.

   ![Change Data category for images.](media/assemble-views/assemble-views-change-data-category.png)

## Known issues and limitations

* Views with greater than 100,000 rows may not load depending on the number of fields included in the view. To avoid this limitation, we suggest breaking large views into multiple smaller views and appending the queries in your report, or creating relationships in your data model.

* The **view images** feature currently only supports thumbnail sized images because of a row size limitation in Power BI.
