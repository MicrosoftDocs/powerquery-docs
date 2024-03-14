---
title: Fill values in a column
description: With Power Query, you can use the values in a column to fill down or fill up any empty spaces in the column. This article demonstrates how to perform these transformations in Power Query.
author: ptyx507
ms.date: 12/9/2022
ms.author: miescobar
ms.custom: edited
---

# Fill values in a column

You can use fill up and fill down to replace null values with the last non-empty value in a column. For example, imagine the following table where you'd like to fill down in the **Date** column and fill up in the **Comments** column.

![Source table with null cells in the Date, Units, and Total columns and empty cells in the Item, Unit Price, and Comments columns.](media/fill-values-column/final-source.png "Source table with null and empty cells")

The outcome that you'd expect is shown in the following image.

![Output table that no longer contains any null or empty cells, and the comment column renamed to Sales Person.](media/fill-values-column/final-table.png "Output table that no longer contains any null or empty cells, and the comment column renamed to Sales Person")

## Fill down

The fill down operation takes a column and traverses through the values in it to fill any null values in the next rows until it finds a new value. This process continues on a row-by-row basis until there are no more values in that column.

In the following example, you want to fill down on the **Date** column. To do that, you can right-click to select the **Date** column, and then select **Fill** > **Down**.

:::image type="content" source="media/fill-values-column/right-click.png" alt-text="Column shortcut menu for the fill down operation.":::

The result of that operation will look like the following image.

:::image type="content" source="media/fill-values-column/date-filled-down.png" alt-text="Sample table after performing the fill down operation with null cells below the two original date values now filled with the dates.":::

## Fill up

In the same way as the fill down operation, fill up works on a column. But by contrast, fill up finds the last value of the column and fills any null values in the previous rows until it finds a new value. Then the same process occurs for that value. This process continues until there are no more values in that column.

In the following example, you want to fill the **Comments** column from the bottom up. You'll notice that your **Comments** column doesn't have null values. Instead it has what appears to be empty cells. Before you can do the fill up operation, you need to transform those empty cells into null values: select the column, go to the **Transform** tab, and then select **Replace values**.

:::image type="content" source="media/fill-values-column/replace-values.png" alt-text="Replace values button on the Transform tab.":::

In the **Replace values** dialog box, leave **Value to find** blank. For **Replace with**, enter **null**.

:::image type="content" source="media/fill-values-column/replace-values-window.png" alt-text="Replace values dialog box.":::

More information: [Replace values](replace-values.md)

After all empty cells are replaced with **null**, select the **Comments** column, go to the **Transform** tab, and then select **Fill** > **Up**.

:::image type="content" source="media/fill-values-column/fill-up-icon.png" alt-text="Fill up on the Transform tab.":::

The result of that operation will look like the following image.

:::image type="content" source="media/fill-values-column/fill-up-final.png" alt-text="Sample table after performing the fill up operation with null cells above the two original comment values now filled with comments.":::

## Cleaning up your table

1. Filter the **Units** column to show only rows that aren't equal to **null**.

   :::image type="content" source="media/fill-values-column/filter-null-values.png" alt-text="Filter the table for non-null values.":::

2. Rename the **Comments** column as **Sales Person**.

   :::image type="content" source="media/fill-values-column/rename-column.png" alt-text="Column renamed.":::

3. Remove the **Sales Person:** values from the **Sales Person** column so you only get the names of the salespeople.

   ![Using the Replace values operation to replace the Sales Person: text string inside Sales Person column with a blank.](media/fill-values-column/replace-sales-person.png "Using the Replace values operation to replace the Sales Person: text string inside Sales Person column with a blank")

Now you should have exactly the table you were looking for.

![Sample output table with the Sales Person: text string removed from each cell of the Sales Person column.](media/fill-values-column/final-table.png "Sample output table with the Sales Person: text string removed from each cell of the Sales Person column")

### See also

[Replace values](replace-values.md)
