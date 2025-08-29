---
title: "Left anti join"
description: An article on how to do a merge operation in Power Query using the Left anti join kind. 
author: ptyx507
ms.date: 8/29/2025
ms.author: miescobar
ms.custom: edited
ms.subservice: transform-data
---

# Left anti join

One of the join kinds available in the **Merge** dialog box in Power Query is a *left anti join*, which brings in only rows from the left table that don't have any matching rows from the right table. Fro more information, go to [Merge operations overview](merge-queries-overview.md).

:::image type="complex" source="media/merge-queries-left-anti/left-anti-join-operation.png" alt-text="Left anti join example.":::
   Diagram shows the left table with Date, CountryID, and Units columns. The emphasized CountryID column contains values of 1 in rows 1 and 2, 3 in row 3, and 2 in row 4. The right table contains ID and Country columns. The emphasized ID column contains values of 3 in row 1 (denoting Panama) and 4 in row 2 (denoting Spain). A table below the first two tables contains Date, CountryID, Units, and Country columns. The table has three rows, with two rows containing the data for CountryID 1, and one row for CountryID 2. Since none of the remaining CountryIDs match any of the countries/regions in the right table, the rows in the Country column in the merged table all contain null.
   :::image-end:::

This article uses sample data to show how to do a merge operation with the left anti join. The sample source tables for this example are:

* **Sales**: This table includes the fields **Date**, **CountryID**, and **Units**. **CountryID** is a whole number value that represents the unique identifier from the **Countries** table.

  :::image type="content" source="media/merge-queries-left-anti/left-anti-sales-table.png" alt-text="Screenshot of the sales table containing Date, CountryID, and Units columns, with CountryID set to 1 in rows 1 and 2, 3 in row 3, and 2 in row 4.":::

* **Countries**: This table is a reference table with the fields **id** and **Country**. The **id** field represents the unique identifier for each record.

  :::image type="content" source="media/merge-queries-left-anti/left-anti-countries-table.png" alt-text="Screenshot of the countries table with ID set to 3 in row 1 and 4 in row 2 and Country set to Panama in row 1 and Spain in row 2.":::

In this example, you merge both tables, with the **Sales** table as the left table and the **Countries** table as the right one. The join is made between the following columns.

|Field from the Sales table| Field from the Countries table|
|-----------|------------------|
|CountryID|ID|

The goal is to create a table like the following, where only the rows from the left table that don't match any from the right table are kept.

:::image type="complex" source="media/merge-queries-left-anti/left-anti-final-table.png" alt-text="Left anti join final table.":::
   Screenshot of the left anti join final table with Date, CountryID, Units, and Country column headers, and three rows of data of which the values for the Country column are all null.
:::image-end:::

To do a left anti join:

1. Select the **Sales** query, and then select **Merge queries**.
2. In the **Merge** dialog box, under **Right table for merge**, select **Countries**.
3. In the **Sales** table, select the **CountryID** column.
4. In the **Countries** table, select the **ID** column.
5. In the **Join kind** section, select **Left anti**.
6. Select **OK**.

:::image type="content" source="media/merge-queries-left-anti/left-anti-merge-window.png" alt-text="Screenshot of the Merge dialog showing the results of following the previous left anti join procedure.":::

> [!TIP]
>Take a closer look at the message at the bottom of the dialog that reads "The selection selects 3 of 4 rows from the first table." This message is crucial to understanding the result that you get from this operation.

In the **Sales** table, you have two instances of a **CountryID** of 1 and one instance of a **CountryID** of 2, but neither of them are found in the **Countries** table. Therefore, the match found three of four rows in the left (first) table.

In the **Countries** table, you have the **Country** Panama with an **ID** of 3, so that record isn't brought into the **Sales** table because the numbers match. In addition, you have a **Country** Spain with an **ID** of 4, but there are no records for **CountryID** 4 in the **Sales** table. Therefore, neither of the two rows from the right (second) table are brought into the **Sales** table.

From the newly created **Countries** column, expand the **Country** field. Don't select the **Use original column name as prefix** check box.

:::image type="content" source="media/merge-queries-left-anti/left-anti-expand-field.png" alt-text="Screenshot of the Expand dialog with only the Country column selected.":::

After doing this operation, you created a table that looks like the following image. The newly expanded **Country** field doesn't have any values because the left anti join doesn't bring any values from the right table&mdash;it only keeps rows from the left table.

:::image type="complex" source="media/merge-queries-left-anti/left-anti-final-table-2.png" alt-text="Final table for left anti join.":::
   Screenshot of the final table with Date, CountryID, Units, and Country column headers, and three rows of data. The values for the Country column are all null.
:::image-end:::
