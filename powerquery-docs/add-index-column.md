---
title: Add an index column
description: An article on how to add an index column in Power Query and practical uses for Index columns.
author: ptyx507
ms.date: 12/9/2022
ms.author: miescobar
ms.custom: edited
---

# Add an index column

The **Index column** command adds a new column to the table with explicit position values, and is usually created to support other transformation patterns.

![Add index column command on the Add column tab.](media/add-index-column/add-index-column-icon.png "Add index column command on the Add column tab")

By default, the starting index will start from the value 0 and have an increment of 1 per row.

![Table with nine rows with a new index column with nine rows containing values 0 (top row) through 8 (bottom row).](media/add-index-column/add-index-column-new-index.png "Sample index column")

You can also configure the behavior of this step by selecting the **Custom** option and configuring two parameters:

* **Starting index**: Specifies the initial index value.
* **Increment**: Specifies how much to increment each index value.

![Add index column dialog box.](media/add-index-column/add-index-column-window.png "Add index column dialog box")

For the example in this article, you start with the following table that has only one column, but notice the data pattern in the column.

![Sample initial table with a recurring pattern every third row.](media/add-index-column/add-index-column-start-table.png "Sample initial table")

Let's say that your goal is to transform that table into the one shown in the following image, with the columns **Date**, **Account**, and **Sale**.

![Sample output table with three columns created from the recurring pattern of every third row in the intial single column table.](media/add-index-column/add-index-column-sample-output-table.png "Sample output table")

## Step 1. Add an index column

You first need to add a new **Index** column to your table that starts from 0.

![Index column that starts from zero.](media/add-index-column/add-index-column-new-index.png "Index column that starts from zero")

## Step 2. Add a modulo column from the index column

The next step is to select the newly added index column, and then on the **Add column** tab, select **Standard** > **Modulo**.

![Modulo button on the Add column tab.](media/add-index-column/add-index-column-add-modulo-column.png "Modulo button on the Add column tab")

In the **Modulo** dialog box, enter the number from which to find the remainder for each value in the column. In this case, your pattern repeats itself every three rows, so you'll enter **3**.

![Modulo dialog box.](media/add-index-column/add-index-column-add-modulo-window.png "Modulo dialog box")

The result of that operation will give you a new column named **Modulo**.

![Modulo column added to the table that repeats a 0 to 2 pattern through the nine rows.](media/add-index-column/add-index-column-add-modulo-column.png "Modulo column added to the table")

## Step 3. Add an integer-divide column from the index column

Select the **Index** column, go to the **Add column** tab, and then select **Standard** > **Divide (Integer)**.

![Divide (Integer) button on the Add column tab.](media/add-index-column/add-index-column-add-divide-integer-icon.png "Divide (Integer) button on the Add column tab")

In the **Integer-divide** dialog box, enter a number by which to divide each value in the column. In this case, your pattern repeats itself every three rows, so enter the value **3**.

![Divide (Integer) dialog box.](media/add-index-column/add-index-column-add-integer-divide-window.png "Divide (Integer) dialog box")

Remove the **Index** column, because you no longer need it. Your table now looks like the following image.

![Table with Index column removed and an Integer-division column with 0 in the first three rows, 1 in the next three, and 2 in the last three.](media/add-index-column/add-index-column-add-divide-integer-column.png "Transformed table without index column")

## Step 4. Pivot a column

Your table now has three columns where:

* **Column1** contains the values that should be in the final table.
* **Modulo** provides the column position of the value (similar to the y coordinates of an xy chart).
* **Integer-division** provides the row position of the value (similar to the x coordinates of an xy chart).

To achieve the table you want, you need to pivot the **Modulo** column by using the values from **Column1** where these values don't get aggregated. On the **Transform** tab, select the **Modulo** column, and then select **Pivot column** from the **Any column** group. In the **Pivot column** dialog box, select the **Advanced** option button. Make sure **Value column** is set to **Column1** and **Aggregate values function** is set to **Don't aggregate**.

![Pivot column dialog box.](media/add-index-column/add-index-column-pivot-column.png "Pivot column dialog box")

More information: [Pivot columns](pivot-columns.md)

The result of that operation will give you a table with four columns, as shown in the following image.

![Sample table values from Column 1 pivoted into three columns with three rows for each column.](media/add-index-column/add-index-column-example-pre-final-table.png "Sample table with pivoted column")

## Step 5. Clean the table

You can now delete the **Integer-division** column and promote the first row of the table to become the headers of your table. More information: [Promote or demote column headers](table-promote-demote-headers.md)

After defining the correct data types for your columns, you'll create a table that looks like the following table, with exactly the three columns that you needed and the shape that you were looking for.

![Final sample output table with no Integer-division column and promoted first row headers.](media/add-index-column/add-index-column-final-table.png "Final sample table")
