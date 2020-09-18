---
title: "Full outer join"
description: An article on how to do a merge operation in Power Query using the full outer join kind. 
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 07/19/2020
ms.author: v-miesco
ms.custom: edited
---

# Full outer join
<!--Please see the editor's notes in merge-queries-left-outer.md-->
One of the join kinds available in the **Merge** dialog box in Power Query is a *full outer join*, which brings in all the rows from both the left and right tables. More information: [Merge operations overview](merge-queries-overview.md)

![Sample full outer join ](images/full-outer-join-operation.png "needs detailed alt text")

<!-- Keep?
>[!Note]
>Samples used in this article are only to showcase the concepts. The concepts showcased here apply to all queries in Power Query. -->

This article uses sample data to show how to do a merge operation with the full outer join. The sample source tables for this example are:

* **Sales**: This table includes the fields **Date**, **CountryID**, and **Units**. **CountryID** is a whole number value that represents the unique identifier from the **Countries** table.

   ![Sales table](images/me-merge-operations-full-outer-join-sales-table.png "needs detailed alt text")

* **Countries**: This is a reference table with the fields **id** and **Country**. The **id** field represents the unique identifier for each record.

   ![Countries table](images/me-merge-operations-full-outer-join-countries-table.png "needs detailed alt text")

In this example, you'll merge both tables, with the **Sales** table as the left table and the **Countries** table as the right one. The join will be made between the following columns.

|Field from the Sales table| Field from the Countries table|
|-----------|------------------|
|CountryID|id|

The goal is to create a table like the following, where the name of the country appears as a new **Country** column in the **Sales** table. Because of how the full outer join works, all rows from both the left and right tables will be brought in, regardless of whether they only appear in one of the tables.

<a id="final-table-full-outer"></a>

:::image type="complex" source="images/me-merge-operations-full-outer-final-table.png" alt-text="Full outer join final table":::
   Full outer join final table with a Date column set to the Date data type, a CountryID column set to the Text data type, a Units column set to the Number data type, and a Country column set to the Text data type, along with five rows of data in which the fifth row contains null in the Date, CountryID, and Units columns.
:::image-end:::

<!-- ![Full outer join final table](images/me-merge-operations-full-outer-final-table.png "needs detailed alt text") -->
<!--markdownlint-disable MD036-->
**To perform a full outer join**
<!--markdownlint-enable MD036-->
1. Select the **Sales** query, and then select **Merge queries**.
2. In the **Merge** dialog box, under **Right table for merge**, select **Countries**.
3. In the **Sales** table, select the **CountryID** column.
4. In the **Countries** table, select the **id** column.
5. In the **Join kind** section, select **Full outer**.
6. Select **OK**

![Merge dialog box for full outer join](images/me-merge-operations-full-outer-merge-window.png "needs detailed alt text?")

>[!TIP]
>Take a closer look at the message at the bottom of the dialog box that reads "The selection matches 4 of 4 rows from the first table, and 3 of 4 rows from the second table." This message is crucial for understanding the result that you get from this operation.

In the **Countries** table, you have the **Country** Spain with **id** of 4, but there are no records for **CountryID** 4 in the **Sales** table. That's why only three of four rows from the right table found a match. All rows from the right table that didn't have matching rows from the left table will be grouped and shown in a new row in the output table with no values for the fields from the left table.

![No matching rows on left table for full outer join](images/me-merge-operations-full-outer-no-matching-rows.png "needs detailed alt text")

From the newly created **Countries** column after the merge operation, expand the **Country** field. Don't select the **Use original column name as prefix** check box.

![Expand table column for Country](images/me-merge-operations-full-outer-expand-field.png "Expand table column for Country")

After performing this operation, you'll create a table that looks like [final table](#final-table-full-outer), shown earlier in this article.
<!--
![Full outer join final table](images/me-merge-operations-full-outer-final-table.png "Full outer join final table")
-->
