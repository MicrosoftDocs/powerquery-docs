---
title: Split columns by number of characters
description: An article on how to Split columns by number of characters into new columns or rows using Power Query.
author: ptyx507
ms.date: 11/7/2025
ms.author: miescobar
ms.subservice: transform-data
---

# Split columns by number of characters

In Power Query, you can split a column through different methods.
In this case, the column(s) selected can be split by the number of characters.

## Where to find Split Columns > By Number of Characters

You can find the **Split Columns > By Number of Characters** option in three places:

* **Home tab**&mdash;under the **Split Column** dropdown menu inside the **Transform** group.

   :::image type="content" source="media/split-columns-number-characters/icon-home.png" alt-text="Screenshot of the split column button in the Home tab.":::

* **Transform tab**&mdash;under the **Split Column** dropdown menu inside the **Text Column** group.

   :::image type="content" source="media/split-columns-number-characters/icon-transform.png" alt-text="Screenshot of the split column button in the Transform tab.":::

* **Right-click a column**&mdash;inside the **Split Column** option.

   :::image type="content" source="media/split-columns-number-characters/right-click-icon.png" alt-text="Screenshot of the split column button found in column right click contextual menu.":::

## Split columns by number of characters into columns

The following table is the initial table for this example, with only one column for **Column1**.

:::image type="content" source="media/split-columns-number-characters/into-columns-split-column-initial.png" alt-text="Screenshot of the sample initial table.":::

This column holds three values:

* **Account Name**&mdash;in the first six characters
* **Date**&mdash;in the following eight characters with the format yyyymmdd
* **Units**&mdash;the remaining characters

In this example, you want to split this column into three columns containing the values described in the list above.

To do this split, select the column and then select the option to split the column by the number of characters. In **Split column by Number of Characters**, apply the following configuration:

* **Number of characters**: 6
* **Split**: Once, as far left as possible

:::image type="content" source="media/split-columns-number-characters/into-columns-split-column-window.png" alt-text="Screenshot of the split column into columns by number of characters window.":::

The result of that operation gives you a table with two columns. One for the account name and the other one that contains the combined values for the date and units.

:::image type="content" source="media/split-columns-number-characters/into-columns-split-column-first.png" alt-text="Screenshot of the sample transformed table after splitting column into columns by number of characters.":::

> [!NOTE]
>Power Query splits the column into only two columns. The name of the new columns contain the same name as the original column. A suffix containing a dot and a number that represents the split section of the column are appended to the names of the new columns.

Now continue to do the same operation over the new Column1.2 column, but with the following configuration:

* **Number of characters**: 8
* **Split**: Once, as far left as possible

:::image type="content" source="media/split-columns-number-characters/into-columns-split-column-last.png" alt-text="Screenshot of the new split operation over the Column1.2 column.":::

The result of that operation yields a table with three columns. Notice the new names of the two columns on the far right. **Column1.2.1** and **Column1.2.2** were automatically created by the split column operation.

:::image type="content" source="media/split-columns-number-characters/into-columns-split-column-pre-final.png" alt-text="Screenshot of the result of splitting the Column1.2 column.":::

You can now change the name of the columns and also define the data types of each column as follows:

Original Column Name | New Column name | Data type
---------------------|-----------------|----------
Column1.1|Account Name|Text
Column1.2.1|Date|Date
Column1.2.2|Units|Whole Number

Your final table looks like the one in the following image.

:::image type="content" source="media/split-columns-number-characters/into-columns-split-column-final.png" alt-text="Screenshot of the final sample table after new column names.":::

## Split columns by number of characters into rows

The following table is the initial table for this example, with the columns **Group** and **Account**.

:::image type="content" source="media/split-columns-number-characters/into-columns-split-rows-initial.png" alt-text="Screenshot of the sample initial table for split into rows.":::

The **Account** column can hold multiple values in the same cell. Each value has the same length in characters, with a total of six characters. In this example, you want to split these values so you can have each account value in its own row.

To do that, select the **Account** column and then select the option to split the column by the number of characters. In **Split column by Number of Characters**, apply the following configuration:

* **Number of characters**: 6
* **Split**: Repeatedly
* **Split into**: Rows

:::image type="content" source="media/split-columns-number-characters/into-columns-split-rows-window.png" alt-text="Screenshot of the split into rows by number of characters window.":::

The result of that operation gives you a table with the same number of columns, but many more rows because the fragments inside the original cell values in the **Account** column are now split into multiple rows.

:::image type="content" source="media/split-columns-number-characters/into-columns-split-rows-final.png" alt-text="Screenshot of the final table after the split into rows operation.":::
