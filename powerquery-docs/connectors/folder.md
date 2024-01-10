---
title: Power Query Folder connector
description: Provides basic information and connection instructions, along with tips about combining data from multiple files and subfolders.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 1/8/2024
ms.author: dougklo
---

# Folder

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
|Authentication Types Supported | Windows |
| Function Reference Documentation | [Folder.Contents](/powerquery-m/folder-contents), [Folder.Files](/powerquery-m/folder-files) |

> [!NOTE]
>Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities supported

* Folder path
* Combine
  * Combine and load
  * Combine and transform

## Connect to a folder from Power Query Desktop

To connect to a folder from Power Query Desktop:

1. Select the **Folder** option in the connector selection.

2. Enter the path to the folder you want to load, or select **Browse** to browse to the folder you want to load. Then select **OK**.

   ![Folder selection.](./media/folder/folder-browse.png)

   When you select the folder you want to use, the file information about all of the files in that folder are displayed. Also, file information about any files in any subfolders is also displayed.

   ![Folder information.](./media/folder/folder-info.png)

3. Select **Combine & Transform Data** to combine the data in the files of the selected folder and load the data in the Power Query Editor for editing. Select **Combine & Load** to load the data from all of the files in the folder directly into your app. Or select **Transform Data** to load the folder data as-is in the Power Query Editor.

   ![Combine files from folder.](./media/folder/combine-folder-files.png)

> [!NOTE]
>The **Combine & Transform Data** and **Combine & Load** buttons are the easiest ways to combine data found in the files of the folder you specify. You could also use the **Load** button (in Power BI Desktop only) or the **Transform Data** buttons to combine the files as well, but that requires more manual steps.

## Connect to a folder from Power Query Online

To connect to a folder from Power Query Online:

1. Select the **Folder** option in the connector selection.

2. Enter the path to the folder you want to load.

   ![Folder selection online.](./media/folder/folder-browse-online.png)

3. Enter the name of an on-premises data gateway that you'll use to access the folder.

4. Select the authentication kind to connect to the folder. If you select the **Windows** authentication kind, enter your credentials.

5. Select **Next**.

6. In the **Navigator** dialog box, select **Combine** to combine the data in the files of the selected folder and load the data into the Power Query Editor for editing. Or select **Transform data** to load the folder data as-is in the Power Query Editor.

   ![Select what to do with the data displayed in the Navigator.](./media/folder/navigator-online.png)

## Troubleshooting

### Combining files

When you combine files using the folder connector, all the files in the folder and its subfolders are processed the same way, and the results are then combined. The way the files are processed is determined by the example file you select. For example, if you select an Excel file and choose a table called "Table1", then all the files will be treated as Excel files that contain a table called "Table1".

To ensure that combining the files works properly, make sure that all the files in the folder and its subfolders have the same file format and structure. If you need to exclude some of the files, first select **Transform data** instead of **Combine** and filter the table of files in the Power Query Editor before [combining](../combine-files-overview.md).

For more information about combining files, go to [Combine files in Power Query](../combine-files-overview.md).
