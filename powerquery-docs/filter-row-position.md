---
title: Filter a table by row position
description: With Power Query you can filter a table based on the positions of its rows, either by keeping or removing those rows. This article covers all of the methods available in Power Query to filter a table by row position.
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
ms.custom: edited
---

# Filter a table by row position
<!--The same image is used six times in this article, which is too many. I suggest naming the one ideal image "Table 1" and harkening back to it five times. What do you think?-->
Power Query has multiple options to filter a table based on the positions of its rows, either by keeping or removing those rows. This article covers all the available methods.<!--This a prime example of a good opportunity to figure out which use cases would be helpful to the user, and rewrite this article along with table-promote-demote.md, so they cover common tasks rather than the entire UI.-->

## Keep rows

The keep rows set of functions will select a set of rows from the table and remove any other rows that don't meet the criteria.

There are two places where you can find the **Keep rows** buttons:

- On the **Home** tab, in the **Reduce Rows** group.

   ![Keep rows button on the Home tab](images/me-filter-row-position-keep-rows-home-tab.png "Keep rows button on the Home tab")

- On the table menu. 

   ![Keep rows buttons on the table menu](images/me-filter-row-position-keep-rows-contextual-menu.png "Keep rows buttons on the table menu")

>[!NOTE]
>In the data preview section in the middle of the Power Query window, you can see the position of your rows on the left side of the table. Each row position is represented by a number. The top row starts with position 1.

### Keep top rows

Imagine the following table that comes out of a system with a fixed layout.

![Initial sample table for Keep top rows](images/me-filter-row-position-keep-top-rows-start.png "needs detailed alt text")

This report always contains seven rows of data, and below those it has a section for comments with an unknown number of rows. You only want to keep the first seven rows of data. To do that, select **Keep top rows** from the table menu. In the **Keep top rows** dialog box, enter **7** in the **Number of rows** box.

![Keep top rows dialog box](images/me-filter-row-position-keep-top-rows-window.png "Keep top rows dialog box")

The result of that change will give you the output table you're looking for. After you set the data types for your columns, your table will look like the following image.

*Table 1. Final table for the filter a table by row position examples*<br>
![Final sample table for keep top rows](images/me-filter-row-position-keep-rows-final.png "needs detailed alt text")

### Keep bottom rows

Imagine the following table that comes out of a system with a fixed layout.

![Initial sample table for Keep bottom rows](images/me-filter-row-position-keep-bottom-rows-start.png "needs detailed alt text")

This report always contains seven rows of data at the end of the report page. Above that, the report has a section for comments with an unknown number of rows. You only want to keep those last seven rows of data and the header row.

To do that, select **Keep bottom rows** from the table menu. In the **Keep bottom rows** dialog box, enter **8** in the **Number of rows** box.

![Keep bottom rows dialog box](images/me-filter-row-position-keep-bottom-rows-window.png "Keep bottom rows dialog box")

The result of that operation will give you eight rows, but now our header row is part of the table.

![Sample table after performing Keep bottom rows operation](images/me-filter-row-position-keep-bottom-rows-non-promoted-headers.png "needs detailed alt text")

You need to promote the column headers from the first row of your table. To do this, select **Use first row as headers** from the table menu. After you define data types for your columns, you'll create a table that looks like Table 1, shown earlier in this article.
<!--
![Final sample table for Keep bottom rows after promoting first row to headers](images/me-filter-row-position-keep-rows-final.png "needs detailed alt text")
-->
More information: [Promote or demote column headers](table-promote-demote-headers.md)

### Keep a range of rows

Imagine the following table that comes out of a system with a fixed layout.

![Initial sample table for Keep range of rows](images/me-filter-row-position-keep-range-rows-start.png "needs detailed alt text")

This report always contains five rows for the header, one row of column headings below that, seven rows of data below that, and then an unknown number of rows for its comments section. You want to get the eight rows after the header section of the report, and only those eight rows.

To do that, select **Keep range of rows** from the table menu. In the **Keep range of rows** dialog box, enter **6** in the **First row** box and **8** in the **Number of rows** box.

![Keep range of rows dialog box](images/me-filter-row-position-keep-range-rows-window.png "Keep range of rows dialog box")

Similar to the previous example for keeping bottom rows, the result of this operation gives you eight rows with your column headers as part of the table. Any rows above the **First row** that you defined (row 6) are removed.

![Sample table after performing the Keep range of rows operation](images/me-filter-row-position-keep-bottom-rows-non-promoted-headers.png "needs detailed alt text")

You can perform the same operation as described in "Keep bottom rows" to promote the column headers from the first row of your table. After you set data types for your columns, your table will look like Table 1, shown earlier in this article.
<!--
![Final sample table for Keep range of rows](images/me-filter-row-position-keep-rows-final.png "needs detailed alt text") -->

## Remove rows

This set of functions will select a set of rows from the table, remove them, and keep the rest of the rows in the table. 

There are two places where you can find the **Remove rows** buttons:

- On the **Home** tab, in the **Reduce Rows** group.

   ![Remove rows button on the Home tab](images/me-filter-row-position-remove-rows-home-tab.png "Remove rows button on the Home tab")

- On the table menu. 

   ![Remove rows operations on the table menu](images/me-filter-row-position-remove-rows-contextual-menu.png "Remove rows operations on the table menu")

### Remove top rows

Imagine the following table that comes out of a system with a fixed layout.

![Initial sample table for Remove top rows](images/me-filter-row-position-remove-top-rows-start.png "needs detailed alt text")

This report always contains a fixed header from row 1 to row 5 of the table. You want to remove these first five rows and keep the rest of the data.

To do that, select **Remove top rows** from the table menu. In the **Remove top rows** dialog box, enter **5** in the **Number of rows** box.

![Remove top rows dialog box](images/me-filter-row-position-remove-top-rows-window.png "Remove top rows dialog box")

In the same way as the previous examples for "Keep bottom rows" and "Keep a range of rows," the result of this operation gives you eight rows with your column headers as part of the table.

![Sample table after performing the Remove top rows operation](images/me-filter-row-position-keep-bottom-rows-non-promoted-headers.png "needs detailed alt text")

You can perform the same operation as in described in previous examples to promote the column headers from the first row of your table. After you set data types for your columns, your table will look like Table 1, shown earlier in this article.
<!--
![Final sample table for Remove top rows](images/me-filter-row-position-keep-rows-final.png "needs detailed alt text") -->

### Remove bottom rows

Imagine the following table that comes out of a system with a fixed layout.

![Initial sample table for Remove bottom rows](images/me-filter-row-position-remove-bottom-rows-start.png "needs detailed alt text")

This report always contains a fixed section or footer that occupies the last five rows of the table. You want to remove those last five rows and keep the rest of the data.

To do that, select **Remove bottom rows** from the table menu. In the **Remove top rows** dialog box, enter **5** in the **Number of rows** box.

![Remove bottom rows dialog box](images/me-filter-row-position-remove-bottom-rows-window.png "Remove bottom rows dialog box")

The result of that change will give you the output table that you're looking for. After you set data types for your columns, your table will look like Table 1, shown earlier in this article.
<!--
![Final sample table for Remove bottom rows](images/me-filter-row-position-keep-rows-final.png "needs detailed alt text") -->

### Remove alternate rows

Imagine the following table that comes out of a system with a dynamic layout:

![Initial sample table for Remove alternate rows](images/me-filter-row-position-remove-alternate-rows-start.png "needs detailed alt text")

The way this report is structured is that you have elements in pairs of rows<!--Suggested.-->. Every odd row (1, 3, 5...) contains the data that you need. Every even row, directly underneath each odd row, contains comments about each of those records. You don't need the comments, and you want to remove all of them.

To do that, select **Remove alternate rows** from the table menu. In the **Remove alternate rows** dialog box, enter the following values:

- In the **First row to remove** box, enter **2**.<br>
  You want to start counting from the second row. Any rows above this **First row to remove** will be kept.
- In the **Number of rows to remove** box, enter **1**.<br>
  Here you start defining the pattern for removing rows. After you find the second row, you only want to remove that specific row, so you specify that you only need to remove one row.
- In the **Number of rows to keep** box, enter **1**.<br>
  After you remove one row, you keep the next row. The process starts again for the next row.

![Remove alternate rows dialog box](images/me-filter-row-position-remove-alternate-rows-window.png "Remove alternate rows dialog box")

The result of that selection will give you the output table that you're looking for. After you set the data types to your columns, your table will look like Table 1, shown earlier in this article.
<!--
![Final sample table for Remove alternate rows](images/me-filter-row-position-keep-rows-final.png "needs detailed alt text") -->
