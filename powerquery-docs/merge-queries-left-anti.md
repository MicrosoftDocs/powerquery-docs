---
title: "Left anti join"
description: An article on how to perform a merge operation in Power Query using the Left anti join kind. 
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 07/22/2020
ms.author: v-miesco
ms.custom: edited
---

# Left anti join

One of the join kinds available in the **Merge** dialog box in Power Query is a *left anti join*, which brings in only rows from the left table that don't have any matching rows from the right table. More information: [Merge operations overview](merge-queries-overview.md) 

![Sample left anti join](images/left-anti-join-operation.png "needs detailed alt text")
<!-- Keep?
>[!Note]
>Samples used in this article are only to showcase the concepts. The concepts showcased here apply to all queries in Power Query. -->

This article uses sample data to show how to do a merge operation with the left anti join. The sample source tables for this example are:

* **Sales**: This table includes the fields **Date**, **CountryID**, and **Units**. **CountryID** is a whole number value that represents the unique identifier from the **Countries** table.

   ![Sales table](images/me-merge-operations-full-outer-join-sales-table.png "needs detailed alt text")

* **Countries**: This is a reference table with the fields **id** and **Country**. The **id** field represents the unique identifier for each record.

   ![Countries table](images/me-merge-operations-inner-join-countries-table.png "needs detailed alt text")

In this example, you'll merge both tables, with the **Sales** table as the left table and the **Countries** table as the right one. The join will be made between the following columns.

|Field from the Sales table| Field from the Countries table|
|-----------|------------------|
|CountryID|id|

The goal is to create a table like the following, where only the rows from the left table that don't match any from the right table are kept.

:::image type="complex" source="images/me-merge-operations-left-anti-final-table.png" alt-text="Left anti join final table":::
   Left anti join final table with Date, CountryID, Units, and Country column headers, and three rows of data of which the values for the Country column are all null.
:::image-end:::

<!-- ![Left anti join final table with Date, CountryID, Units, and Country column headers, and three rows of data of which the values for the Country column are all null](images/me-merge-operations-left-anti-final-table.png "needs detailed alt text") -->
<!--markdownlint-disable MD036-->
**To perform a left anti join**
<!--markdownlint-enable MD036-->
1. Select the **Sales** query, and then select **Merge queries**.
2. In the **Merge** dialog box, under **Right table for merge**, select **Countries**.
3. In the **Sales** table, select the **CountryID** column.
4. In the **Countries** table, select the **id** column.
5. In the **Join kind** section, select **Left anti**.
6. Select **OK**.

![Merge dialog box for left anti join](images/me-merge-operations-left-anti-merge-window.png "needs detailed alt text?")

>[!TIP]
>Take a closer look at the message at the bottom of the dialog box that reads "The selection excludes 1 of 4 rows from the first table." This message is crucial to understanding the result that you get from this operation. 

In the **Sales** table, you have a **CountryID** of 1 and 2, but neither of them are found in the **Countries** table. That's why the match only found one of four rows in the left (first) table.

In the **Countries** table, you have the **Country** Spain with an **id** of 4, but there are no records for **CountryID** 4 in the **Sales** table. That's why only one of two rows from the right (second) table found a match.

From the newly created **Countries** column, expand the **Country** field. Don't select the **Use original column name as prefix** check box.

![Expand table column for Country](images/me-merge-operations-left-anti-expand-field.png "Expand table column for Country")

After performing this operation, you'll create a table that looks like the following image. The newly expanded **Country** field doesn't have any values. That's because the left anti join doesn't bring any values from the right table&mdash;it only keeps rows from the left table.

:::image type="complex" source="images/me-merge-operations-left-anti-final-table-2.png" alt-text="Final table for left anti join":::
   Final table with Date, CountryID, Units, and Country column headers, and three rows of data of which the values for the Country column are all null.
:::image-end:::

