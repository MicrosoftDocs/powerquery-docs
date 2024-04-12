---
title: "Inner join"
description: An article on how to perform a merge operation in Power Query using the Inner join kind. 
author: ptyx507
ms.date: 12/12/2022
ms.author: miescobar
ms.custom: edited
---

# Inner join

One of the join kinds available in the **Merge** dialog box in Power Query is an *inner join*, which brings in only matching rows from both the left and right tables. More information: [Merge operations overview](merge-queries-overview.md)

:::image type="complex" source="media/merge-queries-inner/inner-join-operation.png" alt-text="Inner join example.":::
   Figure shows a table on the left with Date, CountryID, and Units columns. The emphasized CountryID column contains values of 1 in rows 1 and 2, 3 in row 3, and 2 in row 4. A table on the right contains ID and Country columns. The emphasized ID column contains values of 3 in row 1 (denoting Panama) and 4 in row 2 (denoting Spain). A table below the first two tables contains Date, CountryID, Units, and Country columns, but only one row of data for Panama.
   :::image-end:::

This article uses sample data to show how to do a merge operation with the inner join. The sample source tables for this example are:

* **Sales**: This table includes the fields **Date**, **CountryID**, and **Units**. **CountryID** is a whole number value that represents the unique identifier from the **Countries** table.

   ![Sales table containing Date, CountryID, and Units columns, with CountryID set to 1 in rows 1 and 2, 3 in row 3, and 2 in row 4.](media/merge-queries-inner/inner-join-sales-table.png "Sales table containing Date, CountryID, and Units columns, with CountryID set to 1 in rows 1 and 2, 3 in row 3, and 2 in row 4")

* **Countries**: This is a reference table with the fields **id** and **Country**. The **id** field represents the unique identifier for each record.

   ![Countries table with id set to 3 in row 1 and 4 in row 2 and Country set to Panama in row 1 and Spain in row 2.](media/merge-queries-inner/inner-join-countries-table.png "Countries table with id set to 3 in row 1 and 4 in row 2 and Country set to Panama in row 1 and Spain in row 2")

In this example, you'll merge both tables, with the **Sales** table as the left table and the **Countries** table as the right one. The join will be made between the following columns.

|Field from the Sales table| Field from the Countries table|
|-----------|------------------|
|CountryID|id|

The goal is to create a table like the following, where the name of the country appears as a new **Country** column in the **Sales** table. Because of how the inner join works, only matching rows from both the left and right tables will be brought in.

![Inner join final table with Date, CountryID, Units, and Country column headers, and a single row of data for the country Panama.](media/merge-queries-inner/inner-final-table.png "Inner join final table with Date, CountryID, Units, and Country column headers, and a single row of data for the country Panama")
<!--markdownlint-disable MD036-->
**To perform an inner join**
<!--markdownlint-enable MD036-->
1. Select the **Sales** query, and then select **Merge queries**.
2. In the **Merge** dialog box, under **Right table for merge**, select **Countries**.
3. In the **Sales** table, select the **CountryID** column.
4. In the **Countries** table, select the **id** column.
5. In the **Join kind** section, select **Inner**.
6. Select **OK**.

:::image type="content" source="media/merge-queries-inner/inner-merge-window.png" alt-text="Merge dialog box showing the results of following the previous inner join procedure.":::

>[!TIP]
>Take a closer look at the message at the bottom of the dialog box that reads "The selection matches 1 of 4 rows from the first table, and 1 of 2 rows from the second table." This message is crucial to understanding the result that you get from this operation.

In the **Sales** table, you have a **CountryID** of 1 and 2, but neither of these values are found in the **Countries** table. That's why the match only found one of four rows in the left (first) table.

In the **Countries** table, you have the **Country** Spain with the **id** 4, but there are no records for a **CountryID** of 4 in the **Sales** table. That's why only one of two rows from the right (second) table found a match.

From the newly created **Countries** column, expand the **Country** field. Don't select the **Use original column name as prefix** check box.

:::image type="content" source="media/merge-queries-inner/inner-expand-field.png" alt-text="Expand table column for Country.":::

After performing this operation, you'll create a table that looks like the following image.

![Final table with Date, CountryID, Units, and Country column headers, and a single row of data for the country Panama.](media/merge-queries-inner/inner-final-table-2.png "Final table with Date, CountryID, Units, and Country column headers, and a single row of data for the country Panama")
