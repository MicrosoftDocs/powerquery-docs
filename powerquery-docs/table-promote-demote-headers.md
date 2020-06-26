---
title: Promote or demote column headers
description: Promote or demote column headers
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
---

# Promote or demote column headers

When creating a new query from unstructured data sources such as text files, Power Query will try to analyze the contents of the file and promote the first row of data to become the column headers of your table, should it deem necessary. In some cases, this suggestion by Power Query will be correct. In some other cases, it might not be correct because of the structure of the file.

With Power Query, there are transformations to promote the rows to column headers as well as demote the column headers to rows.

## To promote rows to column headers

In this example, Power Query wasn't able to determine the headers of the table because the table contains a set of heading rows for the first three rows. The actual headers of the table begin on row 5.

![](images/me-table-promote-demote-headers-promote-sample-table.png)

Before you can promote the headers, you need to remove the first four rows of the table. To make that happen, use the contextual table menu on the top-left corner of the preview window and select the option to **Remove top rows**.

![](images/me-table-promote-demote-headers-promote-remove-top-rows.png)

The **Remove top rows** window will appear. In this window, enter the number **4** to the number of rows that you want to remove from the top.

![](images/me-table-promote-demote-headers-promote-remove-top-rows-window.png)

> [!Note] 
> To learn more about **Remove top rows** and other table operations, see [article title] (url).

The result of that operation will leave your headers as the first row of your table.

![](images/me-table-promote-demote-headers-promote-table-before-promote.png)

### Locations of the promote headers operation

From here, you have a number of places where you can select the promote headers operation:

* **Home tab**&mdash;inside the **Transform** group.

   ![](images/me-table-promote-demote-headers-promote-home-tab.png)

* **Transform tab**&mdash;inside the **Table** group.

   ![](images/me-table-promote-demote-headers-promote-transform-tab.png)

* **Contextual table menu**&mdash;the first option from the dropdown menu.

   ![](images/me-table-promote-demote-headers-promote-table-menu.png)

After you perform the promote headers operation, your table will look like the following image.

![](images/me-table-promote-demote-headers-promote-final-table.png)

## To demote column headers to rows

In the following example, the table headers are incorrect and are, in fact, part of the table's data. You need to demote the headers to be part of the rows of the table.

![](images/me-table-promote-demote-headers-demote-sample-table.png)

### Locations of the demote headers operation

* **Home tab**&mdash;as an option from the drop-down menu of **Use first row as headers** in the **Transform** group.

   ![](images/me-table-promote-demote-headers-demote-home-tab.png)

* **Transform tab**&mdash;as an option from the drop-down menu of **Use first row as headers** in the **Table** group.

   ![](images/me-table-promote-demote-headers-demote-transform-tab.png)

After you perform this operation, your table will look like the one in the following image.

![](images/me-table-promote-demote-headers-demote-almost-final-table.png)

As a last step, rename the columns by double-clicking on each column and typing a new name for each of the columns. The end result will look like the following image.

![](images/me-table-promote-demote-headers-demote-final-table.png)
