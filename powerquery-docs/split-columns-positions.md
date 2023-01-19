---
title: Split columns by positions
description: An article on how to Split columns by positions into new columns or rows using Power Query.
author: ptyx507
ms.date: 12/13/2022
ms.author: miescobar
---

# Split columns by positions

In Power Query, you can split a column through different methods.
In this case, the column(s) selected can be split by positions.

## Where to find Split Columns > By Positions

You can find the **Split Columns > By Positions** option in three places:

* **Home tab**&mdash;under the **Split Column** dropdown menu inside the **Transform** group.

   ![Split column button in Home tab.](media/split-columns-positions/icon-home.png)

* **Transform tab**&mdash;under the **Split Column** dropdown menu inside the **Text Column** group.

   ![Split column button in Transform tab.](media/split-columns-positions/icon-transform.png)

* **Right-click a column**&mdash;inside the **Split Column** option.

   ![Split column button found in column right click contextual menu.](media/split-columns-positions/right-click-icon.png)

## Split columns by positions into columns

The initial table for this example will be the one shown in the image below, with only one column for **Column1**.

![Sample initial table.](media/split-columns-positions/into-columns-split-column-initial.png)

This column holds three values:

* **Account Name**&mdash;in the first six characters
* **Date**&mdash;in the next eight characters with the format yyyymmdd
* **Units**&mdash;the rest of the characters

In this example, you want to split this column into the three columns made from the values in the list above. To do this split, select the column and then select the option to split the column by positions. In **Split Column by Positions**, apply the following configuration:

* **Positions**: 0,6,14
  * Positions are zero-based and comma-separated, where position zero is the start of the string.

![Split column into columns by positions window.](media/split-columns-positions/into-columns-split-column-window.png)

>[!Note]
>This operation will first start creating a column from position 0 to position 6, then from position 7 to position 14. There will be another column should there be values with a length of 16 or more characters in the current data preview contents.

The result of that operation will give you a table with three columns.

![Sample transformed table after splitting column into columns by positions.](media/split-columns-positions/into-columns-split-column-pre-final.png)

>[!Note]
>Power Query will split the column into only two columns. The name of the new columns will contain the same name as the original column. A suffix created by a dot and a number that represents the split section of the column will be appended to the name of the new columns.

You can now change the name of the columns, and also define the data types of each column as follows:

Original Column Name | New Column name | Data type
---------------------|-----------------|----------
Column1.1|Account Name|Text
Column1.2|Date|Date
Column1.3|Units|Whole Number

Your final table will look the one in the following image.

![Final output table after renaming and defining data types of columns.](media/split-columns-positions/into-columns-split-column-final.png)

## Split columns by positions into rows

The initial table for this example will be like the one in the image below, with the columns **Group** and **Account**.

![Initial sample table for split into rows.](media/split-columns-positions/into-columns-split-rows-initial.png)

The **Account** column can only hold two values in the same cell. Each value has the same length in characters, with a total of six characters. In this example, you want to split these values so you can have each account value in its own row.
To do that, select the **Account** column and then select the option to split the column by positions. In **Split Column by Positions**, apply the following configuration:

* **Positions**: 0, 6
* **Split into**: Rows

![Split column into rows by positions window.](media/split-columns-positions/into-columns-split-row-window.png)

>[!Note]
>This operation will first start creating a column from position 0 to position 6. There will be another column should there be values with a length of 8 or more characters in the current data preview contents.

The result of that operation will give you a table with the same number of columns, but many more rows because the values inside the cells are now in their own cells.

![Final output table after splitting into rows.](media/split-columns-positions/into-columns-split-rows-final.png)
