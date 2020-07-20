---
title: "Cross join"
description: An article on how to perform a cross join operation in Power Query. 
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 07/19/2020
ms.author: v-miesco
---

# Cross join

A cross join is a type of join that returns the Cartesian product of rows from the tables in the join. In other words, it will combine each row from the first table with each row from the second table.

This article demonstrates, with a practical example, how to perform a cross join in Power Query.

## Sample input and output tables

For this example, the sample source tables are:
* **Products** - a table with all the generic products that you sell.

![Sample Products table](images/me-cross-join-products-table.png)

* **Colors** - a table with all thet product variations, as colors, that you shall have in our inventory.

![Sample Colors table](images/me-cross-join-colors-table.png)

The goal is to perform a cross join operation with these two tables to create a list of all unique products that you could have in our inventory. This is necessary as the **Products** table only contains the generic product name and is not at the detailed level where you could see what product variations (such as color) it has.  

![Final table after cross join](images/me-cross-join-final-table.png)

## Perform a Cross join

To perform a cross join operation in Power Query, first go to the **Products** table. From the ribbon, select the *Add column* menu and click the *Custom column* button. You can learn more about the *Custom column* feature from the article [Add a custom column](add-custom-column.md).

![Add Custom column icon](images/me-cross-join-add-column-icon.png)

Inside the *Custom column* window, you can enter the name of the query for the crossjoin inside the *Custom column formula* section. In this case, it'll be the **Colors** query. You can enter the text of your choice for the *New column name*.

![Custom column for cross join](images/me-cross-join-add-column-window.png)

>[!IMPORTANT]
>If your query name has spaces in it, such as **Product Colors**, then the text that you need to enter in the *Custom column formula* section has to follow the syntax ```#"Query name"```. For the before mentioned example you'll need to enter ```#"Product Colors"```. You can check the name of your queries in the *Query settings pane* on the right side of your screen or inside the *Queries pane* on the left side of your screen.

After you hit OK in the *Custom column* window a new column will be added to the table with table values in it. You can click the icon on next to the column header of this new column to expand the contents of this newly created column

![Cross join custom column added](images/me-cross-join-new-table-column.png)

After hitting the OK button to expand the column, you'll reach the desired goal with a table that has all the posible combinations of **Products** and **Colors**. 

![Final table after cross join](images/me-cross-join-final-table.png)