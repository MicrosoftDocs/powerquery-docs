---
title: Working with duplicate values
description: Working with duplicate values in Power Query. An article about how to remove and keep duplicates from one or multiple columns.
author: ptyx507
ms.date: 6/11/2024
ms.author: miescobar
ms.subservice: transform-data
---

# Working with duplicate values

You can work with duplicate sets of values through transformations that can remove duplicates from your data. Or you can filter your data to show duplicates only, so you can focus on them.

> [!WARNING]
> Power Query is case-sensitive. When working with duplicate values, Power Query considers the case of the text, which might lead to undesired results. As a workaround, users can apply an uppercase or lowercase transform prior to removing duplicates.

For this article, the examples use the following table with **ID**, **Category**, and **Total** columns.

:::image type="content" source="media/working-with-duplicates/initial-table.png" alt-text="Screenshot of the initial sample table containing the ID, Category, and Total columns.":::

## Remove duplicates

One of the operations that you can perform is to remove duplicate values from your table.

1. Select the columns that contain duplicate values.
2. Go to the **Home** tab.
3. In the **Reduce rows** group, select **Remove rows**.
4. From the drop-down menu, select **Remove duplicates**.

   :::image type="content" source="media/working-with-duplicates/remove-duplicates.png" alt-text="Screenshot showing the location of the Remove duplicates option under Remove rows." lightbox="media/working-with-duplicates/remove-duplicates.png":::

> [!WARNING]
> There's no guarantee that the first instance in a set of duplicates will be chosen when duplicates are removed. To learn more about how to preserve sorting, go to [Preserve sort](CommonIssues.md#preserving-sort).

### Remove duplicates from multiple columns

In this example, you want to identify and remove the duplicates by using all of the columns from your table.

:::image type="content" source="media/working-with-duplicates/table-row-duplicates.png" alt-text="Screenshot of initial table with duplicates in multiple columns emphasized.":::

You have four rows that are duplicates. Your goal is to remove those duplicate rows so there are only unique rows in your table. Select all columns from your table, and then select **Remove duplicates**.

The result of that operation gives you the table that you're looking for.

:::image type="content" source="media/working-with-duplicates/table-row-duplicates-final.png" alt-text="Screenshot of the final table with duplicates removed from all columns.":::

> [!NOTE]
>This operation can also be performed with a subset of columns.

### Remove duplicates from a single column

In this example, you want to identify and remove the duplicates by using only the **Category** column from your table.

:::image type="content" source="media/working-with-duplicates/column-row-duplicates.png" alt-text="Screenshot of the initial table that identifies duplicates in the Category column.":::

You want to remove those duplicates and only keep unique values. To remove duplicates from the **Category** column, select it, and then select **Remove duplicates**.

The result of that operation gives you the table that you're looking for.

:::image type="content" source="media/working-with-duplicates/remove-column-row-duplicates-final.png" alt-text="Screenshot of the final table with duplicates removed from the Category column.":::

## Keep duplicates

Another operation you can perform with duplicates is to keep only the duplicates found in your table.

1. Select the columns that contain duplicate values.
2. Go to the **Home** tab.
3. In the **Reduce rows** group, select **Keep rows**.
4. From the drop-down menu, select **Keep duplicates**.

   :::image type="content" source="media/working-with-duplicates/keep-duplicates.png" alt-text="Screenshot showing the location of the Keep duplicates option under Keep rows." lightbox="media/working-with-duplicates/keep-duplicates.png":::

### Keep duplicates from multiple columns

In this example, you want to identify and keep the duplicates by using all of the columns from your table.

:::image type="content" source="media/working-with-duplicates/table-row-duplicates.png" alt-text="Screenshot of the initial table for keeping duplicates from multiple columns.":::

You have four rows that are duplicates. Your goal in this example is to keep only the rows that are duplicated in your table. Select all the columns in your table, and then select **Keep duplicates**.

The result of that operation gives you the table that you're looking for.

:::image type="content" source="media/working-with-duplicates/keep-table-row-duplicates-final.png" alt-text="Screenshot of the final table with only duplicated rows from multiple columns.":::

### Keep duplicates from a single column

In this example, you want to identify and keep the duplicates by using only the **id** column from your table.

:::image type="content" source="media/working-with-duplicates/keep-column-row-duplicates-identify.png" alt-text="Initial table for keeping duplicates from a single column.":::

In this example, you have multiple duplicates and you want to keep only those duplicates from your table. To keep duplicates from the **id** column, select the **id** column, and then select **Keep duplicates**.

The result of that operation gives you the table that you're looking for.

:::image type="content" source="media/working-with-duplicates/keep-column-row-duplicates-final.png" alt-text="Final table with only duplicated rows from a single column.":::

### Related content

[Data profiling tools](data-profiling-tools.md)
