---
title: "Inner join"
description: An article on how to perform a merge operation in Power Query using the Inner join kind. 
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 07/22/2020
ms.author: v-miesco
---

# Inner join

An inner join is one of the join kinds available inside the **Merge queries** window in Power Query. To read more about the merge operations in Power Query, see [Merge operations overview](merge-queries-overview.md).

An inner join brings only matching rows from both the left and right table.

This article demonstrates, with a practical example, how to do a merge operation using the inner join as the join kind.

![Sample inner join](images/inner-join-operation.png)

>[!Note]
>Samples used in this article are only to showcase the concepts. The concepts showcased here apply to all queries in Power Query.

## Sample input and output tables

The sample source tables for this example are:

* **Sales**&mdash;with the fields **Date**, **CountryID**, and **Units**. The *CountryID* is a whole number value that represents the unique identifier from the **Countries** table.

   ![Sales table](images/me-merge-operations-left-outer-join-sales-table.png)

* **Countries**&mdash;this table is a reference table with the fields **id** and **Country**. The *id* represents the unique identifier of each record.

   ![Countries table](images/me-merge-operations-inner-join-countries-table.png)

The goal is to merge both tables, where the **Sales** table will be the left table and the **Countries** table the right one. The join will be made between the following columns:

|Field from Sales table| Field from Countries table|
|-----------|------------------|
|CountryID|id|

The goal is to reach the following table where the name of the country appears as a new **Country** column in the **Sales** table. Because of how the inner join works, all rows from both the left and right table will be brought, regardless if they only appear in one of the tables.

![Inner join final table](images/me-merge-operations-inner-final-table.png)

## Inner join

To do an inner join:

1. Select the **Sales** query, and then select **Merge queries** to create a new step inside the sales query that will merge the **Sales** query with the **Countries** query.
2. Select **Countries** as the **Right table for merge**.
3. Select the **CountryID** column from the **Sales** table.
4. Select the **id** column from the **Countries** table.
5. From the **Join Kind** section, select the **Inner** option.
6. Select **OK**.

![Merge window for Inner join](images/me-merge-operations-inner-merge-window.png)

>[!TIP]
>Take a closer look at the message at the bottom of the Merge window that reads **The selection matches 1 of 4 rows from the first table, and 1 of 2  rows from the second table** as this is crucial to understand the result that you get from this operation. 

In the **Sales** table, you have a **CountryID** of 1 and 2, but neither of these values are found in the **Countries** table. That's why the match only found one of four rows in the left (first) table.
In the **Countries** table, you have the **Country** Spain with the ID 4, but there are no records for a **CountryID** of 4 in the **Sales** table. That's why only one of two rows from the right (second) table found a match.

From the newly created **Countries** column after the merge operation, expand the **Country** field without using the original column name as a prefix.

![Expand table column for Country](images/me-merge-operations-inner-expand-field.png)

After doing this operation, the desired result is reached.

![Inner join final table](images/me-merge-operations-inner-final-table.png)
