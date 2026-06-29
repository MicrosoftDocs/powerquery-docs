---
title: Working with duplicate values
description: Working with duplicate values in Power Query. An article about how to remove and keep duplicates from one or multiple columns.
author: ptyx507
ms.date: 06/29/2026
ms.author: miescobar
ms.subservice: transform-data
---

# Working with duplicate values

You can work with duplicate sets of values through transformations that can remove duplicates from your data. Or you can filter your data to show duplicates only, so you can focus on them.

> [!WARNING]
> Power Query is case-sensitive. When working with duplicate values, Power Query considers the case of the text, which might lead to undesired results. As a workaround, you can apply an uppercase or lowercase transform before removing duplicates.

For this article, the examples use the following table with **ID**, **Category**, and **Total** columns.

:::image type="content" source="media/working-with-duplicates/initial-table.png" alt-text="Screenshot of the initial sample table containing the ID, Category, and Total columns.":::

## Remove duplicate rows in Power Query

Use **Remove duplicates** to delete rows where selected columns contain repeated values. Power Query is case-sensitive when comparing values, so apply an uppercase or lowercase transform first if case shouldn't affect the comparison.

1. Select the columns that contain duplicate values.
1. Go to the **Home** tab.
1. In the **Reduce rows** group, select **Remove rows**.
1. From the dropdown menu, select **Remove duplicates**.

   :::image type="content" source="media/working-with-duplicates/remove-duplicates.png" alt-text="Screenshot showing the location of the Remove duplicates option under Remove rows." lightbox="media/working-with-duplicates/remove-duplicates.png":::

> [!WARNING]
> Power Query doesn't guarantee that it keeps the first instance in a set of duplicates when it removes duplicates. To learn more about how to preserve sorting, see [Preserve sort](CommonIssues.md#preserving-sort).

### Remove duplicates from multiple columns

Using the sample table with **ID**, **Category**, and **Total** columns, this example removes duplicate rows based on all columns.

:::image type="content" source="media/working-with-duplicates/table-row-duplicates.png" alt-text="Screenshot of initial table with duplicates in multiple columns emphasized.":::

You have four rows that are duplicates. Your goal is to remove those duplicate rows so there are only unique rows in your table. Select all columns from your table, and then select **Remove duplicates**.

The output table contains only rows with unique combinations across all columns.

:::image type="content" source="media/working-with-duplicates/table-row-duplicates-final.png" alt-text="Screenshot of the final table with duplicates removed from all columns.":::

> [!NOTE]
> You can also perform this operation with a subset of columns.

### Remove duplicates from a single column

Using the same sample table, this example removes duplicate rows based on only the **Category** column.

:::image type="content" source="media/working-with-duplicates/column-row-duplicates.png" alt-text="Screenshot of the initial table that identifies duplicates in the Category column.":::

You want to remove those duplicates and only keep unique values. To remove duplicates from the **Category** column, select it, and then select **Remove duplicates**.

The output table retains only the first row for each unique **Category** value.

:::image type="content" source="media/working-with-duplicates/remove-column-row-duplicates-final.png" alt-text="Screenshot of the final table with duplicates removed from the Category column.":::

## Keep duplicate rows in Power Query

Use **Keep duplicates** to filter your table so it shows only rows that have repeated values in the selected columns. Power Query is case-sensitive when comparing values.

1. Select the columns that contain duplicate values.
1. Go to the **Home** tab.
1. In the **Reduce rows** group, select **Keep rows**.
1. From the dropdown menu, select **Keep duplicates**.

   :::image type="content" source="media/working-with-duplicates/keep-duplicates.png" alt-text="Screenshot showing the location of the Keep duplicates option under Keep rows." lightbox="media/working-with-duplicates/keep-duplicates.png":::

### Keep duplicates from multiple columns

Using the sample table with **ID**, **Category**, and **Total** columns, this example keeps only rows that appear more than once across all columns.

:::image type="content" source="media/working-with-duplicates/table-row-duplicates.png" alt-text="Screenshot of the initial table for keeping duplicates from multiple columns.":::

You have four rows that are duplicates. Your goal in this example is to keep only the rows that are duplicated in your table. Select all the columns in your table, and then select **Keep duplicates**.

The output table contains only the rows that had matching values in another row.

:::image type="content" source="media/working-with-duplicates/keep-table-row-duplicates-final.png" alt-text="Screenshot of the final table with only duplicated rows from multiple columns.":::

### Keep duplicates from a single column

Using the same sample table, this example keeps only rows where the **ID** column value appears more than once.

:::image type="content" source="media/working-with-duplicates/keep-column-row-duplicates-identify.png" alt-text="Initial table for keeping duplicates from a single column.":::

In this example, you have multiple duplicates that you want to keep in your table. To keep duplicates from the **ID** column, select the **ID** column, and then select **Keep duplicates**.

The output table contains all rows where the **ID** value appeared more than once.

:::image type="content" source="media/working-with-duplicates/keep-column-row-duplicates-final.png" alt-text="Final table with only duplicated rows from a single column.":::

## Related content

[Data profiling tools](data-profiling-tools.md)
