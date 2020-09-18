---
title: Transpose table
description: In Power Query, you can transpose a table by rotating it 90 degrees.
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
ms.custom: edited
---

# Transpose a table

The transpose table operation in Power Query rotates your table 90 degrees, turning your rows into columns and your columns into rows.

Imagine a table like the one in the following image, with three rows and four columns.

![Sample source table](images/me-transpose-initial-table.png "needs detailed alt text")

The goal of this example is to transpose that table so you end up with four rows and three columns.

![Sample output table](images/me-transpose-final-table.png "needs detailed alt text")

On the **Transform** tab in the ribbon, select **Transpose**.

![Transpose command on the Transform tab](images/me-transpose-button.png "Transpose command on the Transform tab")

The result of that operation will look like the following image.

![Result after transposing a table](images/me-transpose-after.png "needs detailed alt text")

> [!NOTE]
> Only the contents of the table will be transposed during the transpose operation; the column headers of the initial table will be lost.  The new columns will have the name **Column** followed by a sequential number.

The headers you need in this example are in the first row of the table. To promote the first row to headers, select the table icon in the upper-left corner of the data preview, and then select **Use first row as headers**.

![Promote the first row to be table headers](images/me-transpose-promote-headers.png "Promote the first row to be table headers")

The result of that operation will give you the output that you're looking for.

![Sample output table](images/me-transpose-final-table.png "needs detailed alt text")

>[!NOTE] 
>To learn more about the promote headers operation, also known as **Use first row as headers**, go to [Promote or demote column headers](table-promote-demote-headers.md).
