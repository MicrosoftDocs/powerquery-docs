---
title: "Combine Files in Power Query: Overview" 
description: How to combine files in Power Query and Power Query Online
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 06/30/2020
ms.author: v-miesco
---

# Combine Files in Power Query: Overview

One powerful capability to import data using Power Query is to combine multiple files, which have the same schema, into a single logical table. 

These files can come from a variety of sources such as but not limited to:
* Local Folder
* SharePoint site
* Azure Blob Storage
* Azure Data Lake (Gen 1 and Gen2)

When connecting to one of the previously mentioned data sources, you will notice that they share the same table schema which is commonly called the *File system view* and looks like this:

![File system view](images/me-combine-files-overview-file-system-view.png)

In the *File system view* you will get a column called **Content** which represents the binary representation of a file.

>[!Note]
> Clicking on any of the *Binary* values inside the **Content** column will automatically create a series of navigation steps to that specific file. Power Query will try to interpret the binary using one of the available connectors such as the TXT / CSV, Excel Workbook, JSON, XML or other connector as it sees fit.

The Combine files feature has the following steps or phases in order to reach its desired goal:
1. Table preview dialog
2. Combine files dialog
3. Combine files output

## 1. Table preview dialog

Upon connecting to a data source using any of the previously mentioned connectors, you'll be taken into the table preview dialog where you can opt into the “Combine” option at the bottom right section of the screen.

![Table preview with combine option](images/combinefiles1.png)

Alternatively, you can select **Transform Data** to access the Power Query Editor where the list of files can be subset (for example, using filters within the Folder Path or any of the other columns in this table) and then *Combine Files* by selecting the column containing the binaries (for example, Content) and selecting the **Combine Files** button from any of the following places:
* **Combine files button** - inside the *Combine* group in the *Home* tab.

![Combine files button in Home tab](images/me-combine-files-overview-combine-files-button-home.png)

* **Combine files icon** - next to the column header of the column with *binary* values.

![Combine files icon in column header](images/me-combine-files-overview-combine-files-button-header.png)

## 2. Combine files Dialog

After selecting the option to Combine files, a new window will prompt called the *Combine Files* dialog.

For this step, the combine files experience behaves as follows:
* Power Query analyzes the first file from the list and determines the correct file connector to use in order to open the file contents, such as text, Excel workbook, JSON file or other connector as it sees fit.
* Within the **Combine Files** dialog, Power Query will provide the file connector experience exactly as if you were to connect directly to that sample file
  * You can also pick a different sample file instead of the first file, by using the **Example File** dropdown menu.
  * Optionally, you can exclude files that result in errors from the final output.

In the following sample image Power Query detects that the first file has a csv file type extension, so it uses the CSV connector to interpret the file.

![Combine files dialog](images/me-combine-files-overview-combine-files-dialog.png)

## 3. Combine files output

After going through the Combine files dialog and finishing this process, Power Query then automatically performs the following actions:
1. Creates an exemplar query that performs all the required extraction steps for a single file. It uses the file that was selected as the sample file in the **Combine Files** dialog.
    * This exemplar query will have the name of *Transform Sample file* in the queries pane.
2. Creates a function query that parameterizes the file/binary input to the exemplar query. The exemplar query and the function query are linked, so that changes to the exemplar query are reflected in the function query.
    * These queries will be organized under the *Helper queries* queries Group.
3. Applies the function query to the original query with input binaries (for example, the Folder query) so it applies the function query for binary inputs on each row, then expands the resulting data extraction as top-level columns.
4. Note that in addition to the above queries, a new group with the prefix “Transform file from” and with the initial query as the suffix is created with all the components that drive this Combine files experience.

![Combine files output](images/me-combine-files-overview-combine-files-output.png)

Using “Combine Files”, you can easily combine all files within a given folder, as long as they have the same file type and structure (such as the same columns).
In addition, you can easily apply additional transformation or extraction steps by modifying the automatically generated exemplar query, without having to worry about modifying or creating additional function query steps. Any changes to the exemplar query are automatically propagated to the linked function query.

>[!Note]
>You can modify the steps inside the exemplar query to modify the function applied to each binary in your query. The exemplar query is linked to the function, so any changes made to the exemplar query will be reflected to the function query. If any of the changes affect the column names or column data types, be sure to check the last step of your output query in the event that a *"Change column type"* step was added and is preventing you from visualizing your table.  