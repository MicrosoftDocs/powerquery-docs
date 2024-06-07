---
title: "Inner join"
description: An article on how to perform a merge operation in Power Query using the Inner join kind. 
author: ptyx507
ms.date: 6/7/2024
ms.author: miescobar
ms.custom: edited
---

# Inner join

One of the join kinds available in the **Merge** dialog box in Power Query is an *inner join*, which brings in only matching rows from both the left and right tables. More information: [Merge operations overview](merge-queries-overview.md)

:::image type="complex" source="media/merge-queries-inner/inner-join-operation.png" alt-text="Inner join example.":::
   Figure shows the left table with Date, CountryID, and Units columns. The emphasized CountryID column contains values of 1 in rows 1 and 2, 3 in row 3, and 2 in row 4. The right table contains ID and Country columns. The emphasized ID column contains values of 3 in row 1 (denoting Panama) and 4 in row 2 (denoting Spain). A table below the first two tables contains Date, CountryID, Units, and Country columns, but only one row of data for Panama.
   :::image-end:::

This article uses sample data to show how to do a merge operation with the inner join. The sample source tables for this example are:

* **Sales**: This table includes the fields **Date**, **CountryID**, and **Units**. **CountryID** is a whole number value that represents the unique identifier from the **Countries** table.

  :::image type="content" source="media/merge-queries-inner/inner-join-sales-table.png" alt-text="Screenshot of the sales table containing Date, CountryID, and Units columns, with CountryID set to 1 in rows 1 and 2, 3 in row 3, and 2 in row 4.":::

* **Countries**: This table is a reference table with the fields **ID** and **Country**. The **ID** field represents the unique identifier for each record.

  :::image type="content" source="media/merge-queries-inner/inner-join-countries-table.png" alt-text="Screenshot of the countries table with ID set to 3 in row 1 and 4 in row 2 and Country set to Panama in row 1 and Spain in row 2.":::

In this example, you merge both tables, with the **Sales** table as the left table and the **Countries** table as the right one. The join is made between the following columns.

|Field from the Sales table| Field from the Countries table|
|-----------|------------------|
|CountryID|ID|

The goal is to create a table like the following, where the name of the country appears as a new **Country** column in the **Sales** table. Because of how the inner join works, only matching rows from both the left and right tables are brought in.

:::image type="content" source="media/merge-queries-inner/inner-final-table.png" alt-text="Screenshot of the final inner join table with Date, CountryID, Units, and Country column headers, and a single row of data for the country Panama.":::

To perform an inner join:

1. Select the **Sales** query, and then select **Merge queries**.
2. In the **Merge** dialog box, under **Right table for merge**, select **Countries**.
3. In the **Sales** table, select the **CountryID** column.
4. In the **Countries** table, select the **ID** column.
5. In the **Join kind** section, select **Inner**.
6. Select **OK**.

:::image type="content" source="media/merge-queries-inner/inner-merge-window.png" alt-text="Screenshot of the merge dialog showing the results of following the previous inner join procedure.":::

> [!TIP]
>Take a closer look at the message at the bottom of the dialog box that reads "The selection matches 1 rows from both the tables." This message is crucial to understanding the result that you get from this operation.

In the **Sales** table, you have a **CountryID** of 1 and 2, but neither of these values are found in the **Countries** table. Therefore, the match only found one of four rows in the left (first) table.

In the **Countries** table, you have the **Country** Spain with the **ID** 4, but there are no records for a **CountryID** of 4 in the **Sales** table. Therefore only one of two rows from the right (second) table found a match.

From the newly created **Countries** column, expand the **Country** field. Don't select the **Use original column name as prefix** check box.

:::image type="content" source="media/merge-queries-inner/inner-expand-field.png" alt-text="Screenshot of the expanded table options with the Country column selected.":::

After performing this operation, you've create a table that looks like the following image.

:::image type="content" source="media/merge-queries-inner/inner-final-table-2.png" alt-text="Screenshot of the final table with Date, CountryID, Units, and Country column headers, and a single row of data for the country Panama.":::
