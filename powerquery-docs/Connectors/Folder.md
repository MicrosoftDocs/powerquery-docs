---
title: Folder
description: Power Query Folder connector reference
author: DougKlopfenstein
ms.service: powerquery
ms.topic: conceptual
ms.date: 4/30/2020
ms.author: v-douklo
LocalizationGroup: reference
---

# Folder

## Summary

Release State: General Availability

Products: Power BI Desktop, Power BI Service (Enterprise Gateway), Dataflows in PowerBI.com (Enterprise Gateway), Dataflows in PowerApps.com (Enterprise Gateway), Excel

Function Reference Documentation: [Folder.Contents](https://docs.microsoft.com/powerquery-m/folder-contents), [Folder.Files](https://docs.microsoft.com/powerquery-m/folder-files)

## Capabilities supported

* Folder path
* Combine
   * Combine and load
   * Combine and transform

## Connect to a folder

**To connect to a folder**

1. Select **Get Data > Folder** in Power BI or **Get Data > From File > From Folder** from the **Data** ribbon in Excel.

2. Enter the path to the folder you want to load, or select **Browse** to browse to the folder you want to load, and then select **OK**.

   ![Folder selection](../images/folderbrowse.png)

   When you select the folder you want to use, the file information about all of the files in that folder are displayed. In addition, file information about any files in any subfolders is also displayed.

   ![Folder information](../images/folderinfo.png)

3. Select **Combine & Transform Data** to combine the data in the files of the selected folder and load the data into the Power Query Editor for editing. Or select **Combine & Load** to load the data from all of the files in the folder directly into your app.

   ![Combine files from folder](../images/combinefolderfiles.png)

>[!Note]
>The **Combine & Transform Data** and **Combine & Load** buttons are the easiest ways to combine data found in the files of the folder you specify. You could also use the **Load** button (in Power BI Desktop only) or the **Transform Data** buttons to combine the files as well, but that requires more manual steps.

## Troubleshooting

### Combining files

All of the files in the folder you select will be included in the data to be combined. If you have data files located in a subfolder of the folder you select, all of these files will also be included. To ensure that combining the file data works properly, ensure that all of the files in the folder and the subfolders have the same schema.

