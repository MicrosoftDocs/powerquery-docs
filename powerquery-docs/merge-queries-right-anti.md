---
title: "Right anti join"
description: An article on how to do a merge operation in Power Query using the Right anti join kind. 
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 07/22/2020
ms.author: v-miesco
ms.custom: edited
---

# Right anti join

One of the join kinds available in the **Merge** dialog box in Power Query, a *right anti join* brings only rows from the right table that don't have any matching rows from the left table. More information: [Merge operations overview](merge-queries-overview.md) 

![Sample right anti join](images/right-anti-join-operation.png "needs detailed alt text")

This article uses sample data to show how to do a merge operation with the right anti join. The sample source tables for this example are:

* **Sales**: This table includes the fields **Date**, **CountryID**, and **Units**. **CountryID** is a whole number value that represents the unique identifier from the **Countries** table.

   ![Sales table](images/me-merge-operations-full-outer-join-sales-table.png "needs detailed alt text")

* **Countries**: This is a reference table with the fields **id** and **Country**. The **id** field represents the unique identifier for each record.

   ![Countries table](images/me-merge-operations-inner-join-countries-table.png "needs detailed alt text")

In this example, you'll merge both tables, with the **Sales** table as the left table and the **Countries** table as the right one. The join will be made between the following columns.

|Field from the Sales table| Field from the Countries table|
|-----------|------------------|
|CountryID|id|

The goal is to create a table like the following, where only the rows from the right table that don't match any from the left table are kept. As a common use case, you can find all the rows that are available in the right table but aren't found in the left table.

*Table 1. Final table for the right anti join example*<br>
![Right anti join final table](images/me-merge-operations-right-anti-final-table.png "needs detailed alt text")
<!--markdownlint-disable MD036-->
**To perform a right anti join**
<!--markdownlint-enable MD036-->
1. Select the **Sales** query, and then select **Merge queries** to create a new step inside the sales query that will merge the **Sales** query with the **Countries** query.
2. In the **Merge** dialog box, under **Right table for merge**, select **Countries**.
3. In the **Sales** table, select the **CountryID** column.
4. In the **Countries** table, select the **id** column.
5. In the **Join kind** section, select **Right anti**.
6. Select **OK**.
![Merge dialog box for right anti join](images/me-merge-operations-right-anti-merge-window.png "needs detailed alt text?")

>[!TIP]
>Take a closer look at the message at the bottom of the dialog box that reads "The selection excludes 1 of 2 rows from the second table." This is crucial to understanding the result that you get from this operation. 

In the **Countries** table, you have the **Country** Spain with an **id** of 4, but there are no records for **CountryID** 4 in the **Sales** table. That's why only one of two rows from the right (second) table found a match. Because of how the right anti join works, you'll never see any rows from the left (first) table in the output of this operation.

From the newly created **Countries** column, expand the **Country** field. Don't select the **Use original column name as prefix** check box.

![Expand table column for Country](images/me-merge-operations-right-anti-expand-field.png "Expand table column for Country")

After performing this operation, you'll create a table that looks like Table 1, shown earlier in this article. The newly expanded **Country** field doesn't have any values. That's because the right anti join doesn't bring any values from the left table&mdash;it only keeps rows from the right table.
<!-- 
![Right anti join final table](images/me-merge-operations-right-anti-final-table.png "Right anti join final table")
-->
