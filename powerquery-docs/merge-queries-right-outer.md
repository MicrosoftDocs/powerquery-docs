---
title: "Right outer join"
description: An article on how to do a merge operation in Power Query using the right outer join kind. 
author: ptyx507
ms.date: 8/15/2024
ms.author: miescobar
ms.custom: edited
---

# Right outer join

One of the join kinds available in the **Merge** dialog box in Power Query is a *right outer join*, which keeps all the rows from the right table and brings in any matching rows from the left table. More information: [Merge operations overview](merge-queries-overview.md)

:::image type="complex" source="media/merge-queries-right-outer/right-outer-join-operation.png" alt-text="Right outer join example.":::
   Diagram of the left table that contains Date, CountryID, and Units columns. The emphasized CountryID column contains values of 1 in rows 1 and 2, 3 in row 3, and 4 in row 4. The right table contains ID and Country columns, with only one row. The emphasized ID column contains a value of 3 in row 1 (denoting Panama). A table below the first two tables contains Date, CountryID, Units, and Country columns. The table has one row, with the CountryID of 3 and the Country of Panama.
   :::image-end:::

This article uses sample data to show how to do a merge operation with the right outer join. The sample source tables for this example are:

* **Sales**: This table includes the fields **Date**, **CountryID**, and **Units**. The **CountryID** is a whole number value that represents the unique identifier from the **Countries** table.

   :::image type="content" source="media/merge-queries-right-outer/right-outer-join-sales-table.png" alt-text="Screenshot of the sales table containing Date, CountryID, and Units columns, with CountryID set to 1 in rows 1 and 2, 3 in row 3, and 4 in row 4.":::

* **Countries**: This table is a reference table with the fields **ID** and **Country**. The **ID** field represents the unique identifier for each record.

   :::image type="content" source="media/merge-queries-right-outer/right-outer-join-countries-table.png" alt-text="Screenshot of the countries table with a single row, with ID set to 3 and Country set to Panama.":::

In this example, you merge both tables, with the **Sales** table as the left table and the **Countries** table as the right one. You make the join between the following columns.

|Field from the Sales table| Field from the Countries table|
|-----------|------------------|
|CountryID|ID|

The goal is to create a table like the following, where the name of the country/region appears as a new **Country** column in the **Sales** table. Because of how the right outer join works, all rows from the right table are brought in, but only matching rows from the left table are kept.

:::image type="content" source="media/merge-queries-right-outer/right-outer-final-table.png" alt-text="Screenshot of the right outer join final table with Date, CountryID, Units, and Country header columns, and a single row with data for Panama.":::

To do a right outer join:

1. Select the **Sales** query, and then select **Merge queries**.
2. In the **Merge** dialog box, under **Right table for merge**, select **Countries**.
3. In the **Sales** table, select the **CountryID** column.
4. In the **Countries** table, select the **ID** column.
5. In the **Join kind** section, select **Right outer**.
6. Select **OK**.

:::image type="content" source="media/merge-queries-right-outer/right-outer-merge-window.png" alt-text="Screenshot of the Merge dialog box showing the results of following the previous right outer join procedure.":::

From the newly created **Countries** column, expand the **Country** field. Don't select the **Use original column name as prefix** check box.

:::image type="content" source="media/merge-queries-right-outer/right-outer-expand-field.png" alt-text="Screenshot of the Expand table column set for Country only.":::

After performing this operation, you create a table that looks like the following image.

:::image type="content" source="media/merge-queries-right-outer/right-outer-final-table-2.png" alt-text="Screenshot of the final table with Date, CountryID, Units, and Country header columns, and a single row with data for Panama.":::
