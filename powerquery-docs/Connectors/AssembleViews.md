---
title: Power Query Assemble Views connector.
description: Includes basic information, prerequisites, and information on how to connect to your data, along with a list of known issues and limitations.
author: hofax

ms.service: powerquery
ms.topic: conceptual
ms.date: 5/10/2021
ms.author: hofax

LocalizationGroup: reference
---

# Assemble Views
 
## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Power Apps (Dataflows)<br/>Excel<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Autodesk Account |
| Function Reference Documentation | AssembleViews.Contents |

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

 
## Prerequisites

To use the Assemble Views connector, you must have an Autodesk account username and password and be a member of at least one project in Assemble.

You will also need at least one view associated with the Assemble project.

## Capabilities Supported

* Ability to import data from existing views
   * Optional date parameter **View Date** to import data from a specific point in time
* Import view images

## Connect to Assemble Views from Power Query Desktop

To connect to Assemble data:

1. Select **Assemble Views** from the Online Services data connector list, and then select **Connect**.

2. In **Assemble Views**, enter your sites URL (https://example.tryassemble.com) to sign in.

   a. (Optional) Select a date for the point in time you want to load the data. Leaving this blank will result in the latest data being pulled each time you refresh.
   
   ![Enter your Assemble URL](media/assemble-views/assemble-views-url.png)

   b. Once you've entered the URL, select **OK** to continue.

3. Select **Sign in** to sign in to your Autodesk account.

   ![Sign in to your Autodesk account](media/assemble-views/assemble-views-sign-in.png)

   a. Once you've successfully signed in, select **Connect**.

4. In the **Navigator** dialog box, select the Assemble Views you want to load. For each project there is a single item for view images named **"<Your Project> View Thumbnails"**. Select this item if you wish to include images in your report. Select **Transform Data** to transform the data.

   ![Choose which views to import](media/assemble-views/assemble-views-selection.png)

5. Within the transform window you will see a single column named **Rows**. On the header of the column click the button with two arrows pointing in opposite directions to expand your rows.

   ![Data preview pre-transformation](media/assemble-views/assemble-views-pre-transform.png)

   a. Uncheck **Use original column name as prefix** and click **OK**. Do this for each view data query you have selected.

   ![Don't keep original column name as prefix](media/assemble-views/assemble-views-transform-1.png)

   b. Click **Close & Apply** to load the few datasets.

6. (Optional) If you have chosen to load images you will need to update the **Data category** for the image field by expanding the **"<Your Project> View Thumbnails"** table and selecting the **Image** field.
   
   a. This should have opened the **Column tools** tab. From here open the **Data category** drop down and select **Image URL**. You can now drag and drop the Image field into your report visuals. 

   ![Change Data category for images](media/assemble-views/assemble-views-change-data-category.png)

## Known issues and limitations

* Views with greater than 100,000 rows may fail to load depending on the number of fields included in the view. To avoid this limitation we suggest breaking large views into multiple views and either appending the queries within your report or creating relationships in your data model. 

* View images currently only supports thumbnail sized images due to a row size limitation in Power BI.

## Troubleshooting
