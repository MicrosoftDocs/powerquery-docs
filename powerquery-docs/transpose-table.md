---
title: Transpose table
description: In Power Query, you can transpose a table by rotating it 90 degrees.
author: ptyx507
ms.date: 12/13/2022
ms.author: miescobar
ms.custom: edited
---

# Transpose a table

The transpose table operation in Power Query rotates your table 90 degrees, turning your rows into columns and your columns into rows.

Imagine a table like the one in the following image, with three rows and four columns.

:::image type="complex" source="media/transpose-table/transpose-initial-table.png" alt-text="Sample source table to be transposed.":::
   Table with four columns named Column1 through Column4, with all columns set to the Text data type. Column1 contains Events in row 1, Participants in row 2, and Funds in row 3. Column2 contains Event 1 in row 1, 150 in row 2, and 4000 in row 3. Column3 contains Event 2 in row 1, 450 in row 2, and 10000 in row 3. Column4 contains Event 2 in row 1, 1250 in row 2, and 15000 in row 3.
:::image-end:::

The goal of this example is to transpose that table so you end up with four rows and three columns.

:::image type="complex" source="media/transpose-table/transpose-final-table.png" alt-text="Final output table.":::
   Table with three columns named Events with a Text data type, Participants with a Whole number data type, and Funds with a whole number data type. The Events column contains, from top to bottom, Event 1, Event 2, and Event 3. The Participants column contains, from top to bottom, 150, 450, and 1250. The Funds column contains, from top to bottom, 4000, 10000, and 15000.
:::image-end:::

On the **Transform** tab in the ribbon, select **Transpose**.

![Transpose command on the Transform tab.](media/transpose-table/transpose-button.png "Transpose command on the Transform tab")

The result of that operation will look like the following image.

:::image type="complex" source="media/transpose-table/transpose-after.png" alt-text="Sample output table after transpose operation.":::
   Table with three columns named Column1, Column2, and Column 3, with all columns set to the Any data type. Column1 contains, from top to bottom, Events, Event 1, Event 2, and Event 3. Column2 contains, from top to bottom, Participants, 150, 450, and 1250. Column 3 contains, from top to bottom, Funds, 4000, 10000, and 15000.
:::image-end:::

> [!NOTE]
> Only the contents of the table will be transposed during the transpose operation; the column headers of the initial table will be lost.  The new columns will have the name **Column** followed by a sequential number.

The headers you need in this example are in the first row of the table. To promote the first row to headers, select the table icon in the upper-left corner of the data preview, and then select **Use first row as headers**.

![Promote the first row to be table headers.](media/transpose-table/transpose-promote-headers.png "Promote the first row to be table headers")

The result of that operation will give you the output that you're looking for.

:::image type="complex" source="media/transpose-table/transpose-final-table-2.png" alt-text="Final sample output table.":::
   Final table with three columns named Events with a Text data type, Participants with a Whole number data type, and Funds with a whole number data type. The Events column contains, from top to bottom, Event 1, Event 2, and Event 3. The Participants column contains, from top to bottom, 150, 450, and 1250. The Funds column contains, from top to bottom, 4000, 10000, and 15000.
:::image-end:::

>[!NOTE] 
>To learn more about the promote headers operation, also known as **Use first row as headers**, go to [Promote or demote column headers](table-promote-demote-headers.md).
