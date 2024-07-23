---
title: Add an index column
description: An article on how to add an index column in Power Query and practical uses for Index columns.
author: ptyx507
ms.date: 7/15/2024
ms.author: miescobar
---

# Add an index column

The **Index column** command adds a new column to the table with explicit position values, and is usually created to support other transformation patterns.

:::image type="content" source="media/add-index-column/add-index-column-icon.png" alt-text="Screenshot of the add index column command on the Add column tab.":::

By default, the starting index starts from the value 0 and has an increment of 1 per row.

:::image type="content" source="media/add-index-column/add-index-column-new-index.png" alt-text="Screenshot of a table with nine rows with a new index column with nine rows containing values 0 (top row) through 8 (bottom row).":::

You can also configure the behavior of this step by selecting the **Custom** option and configuring two parameters:

* **Starting index**: Specifies the initial index value.
* **Increment**: Specifies how much to increment each index value.

:::image type="content" source="media/add-index-column/add-index-column-window.png" alt-text="Screenshot of the Add index column dialog with the starting index set to 0 and the increment set to 1.":::

For the example in this article, you start with the following table that has only one column, but notice the data pattern in the column.

:::image type="content" source="media/add-index-column/add-index-column-start-table.png" alt-text="Screenshot of the sample initial table with a recurring pattern every third row.":::

Let's say that your goal is to transform that table into the one shown in the following image, with the columns **Date**, **Account**, and **Sale**.

:::image type="content" source="media/add-index-column/add-index-column-sample-output-table.png" alt-text="Sample output table with three columns created from the recurring pattern of every third row in the initial single column table.":::

## Step 1. Add an index column

You first need to add a new **Index** column to your table that starts from 0.

:::image type="content" source="media/add-index-column/add-index-column-new-index.png" alt-text="Screenshot with the Index column that starts from zero emphasized.":::

## Step 2. Add a modulo column from the index column

The next step is to select the newly added index column, and then on the **Add column** tab, select **Standard** > **Modulo**.

In the **Modulo** dialog box, enter the number from which to find the remainder for each value in the column. In this case, your pattern repeats itself every three rows, so enter **3**.

:::image type="content" source="media/add-index-column/add-index-column-add-modulo-window.png" alt-text="Screenshot of the Modulo dialog with the value set to 3.":::

The result of that operation gives you a new column named **Modulo**.

:::image type="content" source="media/add-index-column/add-index-column-add-modulo-column.png" alt-text="Screenshot with the Modulo column added to the table that repeats a 0 to 2 pattern through the nine rows.":::

## Step 3. Add an integer-divide column from the index column

Select the **Index** column, go to the **Add column** tab, and then select **Standard** > **Divide (Integer)**.

:::image type="content" source="media/add-index-column/add-index-column-add-divide-integer-icon.png" alt-text="Screenshot of the Divide (Integer) button on the Add column tab.":::

In the **Integer-divide** dialog box, enter a number by which to divide each value in the column. In this case, your pattern repeats itself every three rows, so enter the value **3**.

:::image type="content" source="media/add-index-column/add-index-column-add-integer-divide-window.png" alt-text="Screenshot of the Divide (Integer) dialog with the value 3 added.":::

Remove the **Index** column, because you no longer need it. Your table now looks like the following image.

:::image type="content" source="media/add-index-column/add-index-column-add-divide-integer-column.png" alt-text="Screenshot of the table with an Integer-division column with 0 in the first 3 rows, 1 in the next 3, and 2 in the last 3.":::

## Step 4. Pivot a column

Your table now has three columns where:

* **Column1** contains the values that should be in the final table.
* **Modulo** provides the column position of the value (similar to the y coordinates of an xy chart).
* **Integer-division** provides the row position of the value (similar to the x coordinates of an xy chart).

To achieve the table you want, you need to pivot the **Modulo** column by using the values from **Column1** where these values don't get aggregated.

1. Select the **Modulo** column.

1. On the **Transform** tab, select **Pivot column** from the **Any column** group.

1. In the **Pivot column** dialog box, select the **Advanced** option button.

1. Make sure **Value column** is set to **Column1** and **Aggregate values function** is set to **Don't aggregate**.

   :::image type="content" source="media/add-index-column/add-index-column-pivot-column.png" alt-text="Screenshot of the Pivot column dialog with the values set.":::

   More information: [Pivot columns](pivot-columns.md)

The result of that operation gives you a table with four columns, as shown in the following image.

:::image type="content" source="media/add-index-column/add-index-column-example-pre-final-table.png" alt-text="Screenshot of the sample table values from Column 1 pivoted into three columns with three rows for each column.":::

## Step 5. Clean the table

You can now delete the **Integer-division** column and promote the first row of the table to become the headers of your table. More information: [Promote or demote column headers](table-promote-demote-headers.md)

After you define the correct data types for your columns, your table looks like the following table, with exactly the three columns that you needed and the shape that you were looking for.

:::image type="content" source="media/add-index-column/add-index-column-final-table.png" alt-text="Screenshot of the final sample output table with no Integer-division column and promoted first row headers.":::
