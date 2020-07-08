---
title: Working with duplicate values
description: Working with duplicate values in Power Query. An article on how to remove and keep duplicate from one or multiple columns.
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
---

# Working with duplicate values
In Power Query, you can easily work with duplicate sets of values through transformations that can remove duplicates from your data or can easily filter to duplicates only so you can focus on those.

For this article, we will be using the following table with the columns id, Category and Total to demonstrate how to perform the Remove and Keep duplicates operations in Power Query:

![Initial sample table](images/me-working-with-duplicates-initial-table.png)

## Remove duplicates
One of the operations that you can have Power Query do with duplicates is to remove them from your table.

To remove duplicates:

1. Select the columns used to identify the duplicates.
2. Go to the **Home** tab.
3. In the **Reduce Rows** group, select the **Remove Rows** option.
4. From the dropdown menu for **Remove Rows**, select the option to **Remove duplicates**.

![Remove duplicate button in Home tab](images/me-working-with-duplicates-remove-duplicates.png)

> [!WARNING]
> Power Query doesn't guarantee that it chooses the first instance of a set of duplicates when removing duplicates.

### From multiple columns
From your initial table, in this example you want to identify and remove the duplicates by using all of the columns from your table. 

![Initial sample table with duplicates in multiple columns](images/me-working-with-duplicates-table-row-duplicates.png)

You can tell that you have four rows that are duplicates. Your goal in this example is to remove those duplicate rows so there are only distinct rows in your table. Select all columns from your table and then select the **Remove duplicates** button. 

The result of that operation will give you the table that you're looking for.

![Final table with duplicates removed on all columns](images/me-working-with-duplicates-table-row-duplicates-final.png)

### From a single column
From your initial table, in this example you want to identify and remove the duplicates by using only the **Category** column from your table.

![Initial sample with duplicates on Category column](images/me-working-with-duplicates-column-row-duplicates.png)

You have multiple duplicates and you want to remove those duplicates to only keep distinct values. To remove duplicates from the Category column, select the **Category** column and then apply the **Remove duplicates** transformation.

The result of that operation will give you the table that you're looking for.

![Final sample table with duplicates removed from Category column](images/me-working-with-duplicates-remove-column-row-duplicates-final.png)

## Keep duplicates
One of the operations that you can have Power Query do with duplicates is to keep only the duplicates found in your table.

To keep duplicates:

1. Select the columns used to identify the duplicates.
2. Go to the **Home** tab.
3. In the **Reduce Rows** group, select the **Keep Rows** option.
4. From the dropdown menu for **Keep Rows**, select the option to **Keep duplicates**.

![Keep duplicates button in Home tab](images/me-working-with-duplicates-keep-duplicates.png)

### From multiple columns
From your initial table, in this example you want to identify and keep the duplicates by using all of the columns from your table. 

![Initial sample table for keep duplicates from multiple columns](images/me-working-with-duplicates-table-row-duplicates.png)

You can tell that you have four rows that are duplicates. Your goal in this example is to keep only the rows that are duplicated in your table. Select all the columns from your table and then select the **Keep duplicates** button. 

The result of that operation will give you the table that you're looking for.

![Final sample table with only duplicated rows from multiple columns](images/me-working-with-duplicates-keep-table-row-duplicates-final.png)

### From a single column
From your initial table, in this example you want to identify and keep the duplicates by using only the **id** column from your table.

![Initial sample table for keep duplicates from a single column](images/me-working-with-duplicates-keep-column-row-duplicates-identify.png)

In this example, you have multiple duplicates and you want to keep only those duplicates from your table. To keep duplicates from the **id** column, select the **id** column and then apply the **Keep duplicates** transformation.

The result of that operation will give you the table that you're looking for.

![Final sample table with only duplicated rows from a single column](images/me-working-with-duplicates-keep-column-row-duplicates-final.png)

>[!Note]
> The Data Preview tools in Power Query are a great tool to keep or remove duplicates from a column. You can learn more about how to enable and use the Data Preview tools from the article [Data Preview tools](data-preview-tools.md).
