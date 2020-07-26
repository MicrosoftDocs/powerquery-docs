---
title: Promote or demote column headers
description: In Power Query, you can promote or demote headers from a table. This article demonstrates how to do these operations. 
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
---

# Promote or demote column headers

When creating a new query from unstructured data sources such as text files, Power Query will analyze the contents of the file. If Power Query identifies a different pattern for the first row, it will try to promote the first row of data as the column headers for your table. However, Power Query might not identify the pattern correctly 100% of the time, so this article explains how you can manually promote or demote column headers from rows. 

With Power Query, there are transformations to promote the rows to column headers as well as demote the column headers to rows.

## To promote rows to column headers

In this example, Power Query wasn't able to determine the headers of the table because the table contains a set of heading rows for the first three rows. The actual headers of the table begin on row 5.

![Sample table for promote rows to column headers](images/me-table-promote-demote-headers-promote-sample-table.png)

Before you can promote the headers, you need to remove the first four rows of the table. To make that happen, use the contextual table menu on the top-left corner of the preview window and select the option to **Remove top rows**.

![Remove top rows of sample table](images/me-table-promote-demote-headers-promote-remove-top-rows.png)

The **Remove top rows** window will appear. In this window, enter the number **4** to the number of rows that you want to remove from the top.

![Remove top rows window](images/me-table-promote-demote-headers-promote-remove-top-rows-window.png)

> [!Note] 
> To learn more about **Remove top rows** and other table operations, see [Filter by row position](filter-row-position.md).

The result of that operation will leave your headers as the first row of your table.

![Sample table before promoting row to headers](images/me-table-promote-demote-headers-promote-table-before-promote.png)

### Locations of the promote headers operation

From here, you have a number of places where you can select the promote headers operation:

* **Home tab**&mdash;inside the **Transform** group.

   ![Promote headers button in Home tab](images/me-table-promote-demote-headers-promote-home-tab.png)

* **Transform tab**&mdash;inside the **Table** group.

   ![Promote headers button in Transform tab](images/me-table-promote-demote-headers-promote-transform-tab.png)

* **Contextual table menu**&mdash;the first option from the dropdown menu.

   ![Promote headers button inside contextual table menu](images/me-table-promote-demote-headers-promote-table-menu.png)

After you do the promote headers operation, your table will look like the following image.

![Sample table after promoting row to headers](images/me-table-promote-demote-headers-promote-final-table.png)

>[!Note]
> Table column names must be unique. If the rows to be promoted to headers contain multiple instances of the same text string, Power Query will disambiguate the column names by adding a numeric suffix preceded by a dot to every text string instance that is not unique.

## To demote column headers to rows

In the following example, the table headers are incorrect and are, in fact, part of the table's data. You need to demote the headers to be part of the rows of the table.

![Sample table for demote header](images/me-table-promote-demote-headers-demote-sample-table.png)

### Locations of the demote headers operation

* **Home tab**&mdash;as an option from the drop-down menu of **Use first row as headers** in the **Transform** group.

   ![Demote headers button inside Home tab](images/me-table-promote-demote-headers-demote-home-tab.png)

* **Transform tab**&mdash;as an option from the drop-down menu of **Use first row as headers** in the **Table** group.

   ![Demote headers button inside Transform tab](images/me-table-promote-demote-headers-demote-transform-tab.png)

After you do this operation, your table will look like the one in the following image.

![Sample table after demoting headers to rows](images/me-table-promote-demote-headers-demote-almost-final-table.png)

As a last step, rename the columns by double-clicking on each column and typing a new name for each of the columns. The end result will look like the following image.

![Final table after renaming columns](images/me-table-promote-demote-headers-demote-final-table.png)
