---
title: "Full outer join"
description: An article on how to do a merge operation in Power Query using the full outer join kind. 
author: ptyx507
ms.date: 6/7/2024
ms.author: miescobar
ms.custom: edited
---

# Full outer join

One of the join kinds available in the **Merge** dialog in Power Query is a *full outer join*, which brings in all the rows from both the left and right tables. More information: [Merge operations overview](merge-queries-overview.md)

:::image type="complex" source="media/merge-queries-full-outer/full-outer-join-operation.png" alt-text="Full outer join example.":::
   Screenshot shows a left table with Date, CountryID, and Units columns. The emphasized CountryID column contains values of 1 in rows 1 and 2, 3 in row 3, and 2 in row 4. A right table contains ID and Country columns. The emphasized ID column contains values of 1 in row 1 (denoting USA), 2 in row 2 (denoting Canada), 3 in row 3 (denoting Panama), and 4 (denoting Spain) in row 4. A table below the first two tables contains Date, CountryID, Units, and Country columns. All rows are rearranged in numerical order according to the CountryID value. The country associated with the CountryID number is shown in the Country column. Because the country ID for Spain wasn't contained in the left table, a new row is added and the date, country ID, and units values for this row are set to null.
:::image-end:::

This article uses sample data to show how to do a merge operation with the full outer join. The sample source tables for this example are:

* **Sales**: This table includes the fields **Date**, **CountryID**, and **Units**. **CountryID** is a whole number value that represents the unique identifier from the **Countries** table.

  :::image type="content" source="media/merge-queries-full-outer/full-outer-join-sales-table.png" alt-text="Screenshot of the Sales table containing Date, CountryID, and Units columns, with CountryID set to 1 in rows 1 and 2, 3 in row 3, and 2 in row 4.":::

* **Countries**: This table is a reference table with the fields **ID** and **Country**. The **ID** field represents the unique identifier for each record.

  :::image type="content" source="media/merge-queries-full-outer/full-outer-join-countries-table.png" alt-text="Screenshot of the Countries table containing ID and Country columns, with ID set to 1 in row 1, 2 in row 2, 3 in row 3, and 4 in row 4.":::

In this example, you merge both tables, with the **Sales** table as the left table and the **Countries** table as the right one. The join is made between the following columns.

|Field from the Sales table| Field from the Countries table|
|-----------|------------------|
|CountryID|ID|

The goal is to create a table like the following, where the name of the country appears as a new **Country** column in the **Sales** table. Because of how the full outer join works, all rows from both the left and right tables are brought in, regardless of whether they only appear in one of the tables.

:::image type="complex" source="media/merge-queries-full-outer/full-outer-final-table.png" alt-text="Final table for full outer join operation.":::
   Screenshot of the final full outer join table with Date, a CountryID, and Units derived from the Sales table, and a Country column derived from the Countries table. A fifth row was added to contain data from Spain, but that row contains null in the Date, CountryID, and Units columns since those values didn't exist for Spain in the Sales table.
:::image-end:::

To perform a full outer join:

1. Select the **Sales** query, and then select **Merge queries**.
2. In the **Merge** dialog box, under **Right table for merge**, select **Countries**.
3. In the **Sales** table, select the **CountryID** column.
4. In the **Countries** table, select the **ID** column.
5. In the **Join kind** section, select **Full outer**.
6. Select **OK**

:::image type="content" source="media/merge-queries-full-outer/full-outer-merge-window.png" alt-text="Merge dialog box showing the results of following the previous full outer join procedure.":::

> [!NOTE]
>You can merge on more than one column by selecting and holding Ctrl and then selecting the columns.

> [!TIP]
>Take a closer look at the message at the bottom of the dialog box that reads "The selection matches 4 of 5 rows from both tables." This message is crucial for understanding the result that you get from this operation.

In the **Countries** table, you have the **Country** Spain with **ID** of 4, but there are no records for **CountryID** 4 in the **Sales** table. Therefore, only three of four rows from the right table found a match. All rows from the right table that didn't have matching rows from the left table are grouped and shown in a new row in the output table with no values for the fields from the left table.

:::image type="content" source="media/merge-queries-full-outer/full-outer-no-matching-rows.png" alt-text="Screenshots showing no matching rows for Spain on left table for full outer join, so the Date, CountryID, and Units values for Spain are set to null.":::

From the newly created **Countries** column after the merge operation, expand the **Country** field. Don't select the **Use original column name as prefix** check box.

:::image type="content" source="media/merge-queries-full-outer/full-outer-expand-field.png" alt-text="Screenshot of the Expand table options with the column for Country selected.":::

After performing this operation, you'll create a table that looks like the following image.

:::image type="complex" source="media/merge-queries-full-outer/full-outer-final-table-2.png" alt-text="Full outer join final table.":::
   Screenshot of the full outer join final table containing Date, a CountryID, and Units derived from the Sales table, and a Country column derived from the Countries table. A fifth row was added to contain data from Spain, but that row contains null in the Date, CountryID, and Units columns since those values didn't exist for Spain in the Sales table.
:::image-end:::
