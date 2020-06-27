---
title: Transpose table
description: In Power Query you can transpose a table with a click of one button. This article demonstrates how to tranpose your table using Power Query.
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
---

# Transpose table

The transpose table operation in Power Query rotates your table 90 degrees by making your rows become columns and your columns become rows.

## To transpose a table

Imagine a table like the one in the following image, with three rows and four columns.

![Sample source table](images/me-transpose-initial-table.png)

The goal of this example is to transpose that table so you end up with four rows and three columns.

![Sample output table](images/me-transpose-final-table.png)

First, go to the **Transform** tab in the ribbon and select **Transpose** inside the **Table** group.

![Transpose button in the Transform tab](images/me-transpose-button.png)

The result of that operation will look like the following image.

![Result after transposing a table](images/me-transpose-after.png)

> [!Note]
> When doing the transpose operation, the column headers of the initial table will be lost. Only the contents of the table will be transposed during the operation. The new columns will have the name of **Column** followed by a sequential number.

## Post transpose cleaning

The headers that you need in this example are in the first row of the table. Your final table will look like the following image. To promote the first row to headers, select the table contextual icon inside the **Data Preview** section. Then select the option to **Use first row as headers**.

![Promote row to be table headers](images/me-transpose-promote-headers.png)

The result of that operation will give you the output that you're looking for.

![Sample output table](images/me-transpose-final-table.png)
