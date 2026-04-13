---
title: Power Query Folder Connector
description: Provides basic information and connection instructions, along with tips about combining data from multiple files and subfolders.
author: whhender
ms.author: whhender
ms.date: 04/08/2026
ms.subservice: connectors
ms.topic: concept-article
---

# Folder

## Summary

| Item | Description |
| --- | --- |
| Release State | General Availability |
| Products | Excel<br />Power BI (Semantic models)<br />Power BI (Dataflows)<br />Fabric (Dataflow Gen2)<br />Power Apps (Dataflows)<br />Dynamics 365 Customer Insights<br />Analysis Services |
| Authentication Types Supported | Windows |
| Function Reference Documentation | [Folder.Contents](/powerquery-m/folder-contents), [Folder.Files](/powerquery-m/folder-files) |

> [!NOTE]  
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities supported

[!INCLUDE [Includes_folder_capabilities-supported](includes/folder/folder-capabilities-supported.md)]

## Connect to a folder from Power Query Desktop

To connect to a folder from Power Query Desktop:

1. Select the **Folder** option in the connector selection.

1. Enter the path to the folder you want to load, or select **Browse** to browse to the folder you want to load. Then select **OK**.

   :::image type="content" source="media/folder/folder-browse.png" alt-text="Screenshot of folder selection.":::

   When you select the folder you want to use, the file information about all of the files in that folder are displayed. Also, file information about any files in any subfolders is also displayed.

   :::image type="content" source="media/folder/folder-info.png" alt-text="Screenshot of folder information." lightbox="media/folder/folder-info.png":::

1. Select **Combine & Transform Data** to combine the data in the files of the selected folder and load the data in the Power Query Editor for editing. Select **Combine & Load** to load the data from all of the files in the folder directly into your app. Or select **Transform Data** to load the folder data as-is in the Power Query Editor.

   :::image type="content" source="media/folder/combine-folder-files.png" alt-text="Screenshot of the option to combine files from folders." lightbox="media/folder/combine-folder-files.png":::

> [!NOTE]  
> The **Combine & Transform Data** and **Combine & Load** buttons are the easiest ways to combine data found in the files of the folder you specify. You could also use the **Load** button (in Power BI Desktop only) or the **Transform Data** buttons to combine the files as well, but that requires more manual steps.

## Connect to a folder from Power Query Online

[!INCLUDE [Includes_folder_connect-to-power-query-online](includes/folder/folder-connect-to-power-query-online.md)]

## Troubleshooting

### Combining files

When you combine files using the folder connector, all the files in the folder and its subfolders are processed the same way, and the results are then combined. The way the files are processed is determined by the example file you select. For example, if you select an Excel file and choose a table called "Table1", then all the files will be treated as Excel files that contain a table called "Table1".

To ensure that combining the files works properly, make sure that all the files in the folder and its subfolders have the same file format and structure. If you need to exclude some of the files, first select **Transform data** instead of **Combine** and filter the table of files in the Power Query Editor before [combining](../combine-files-overview.md).

For more information about combining files, go to [Combine files overview](../combine-files-overview.md).


