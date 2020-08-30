---
title: "Cross-join"
description: An article on how to perform a cross-join operation in Power Query. 
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 07/19/2020
ms.author: v-miesco
ms.custom: edited
---

# Cross join

A *cross join* is a type of join that returns the Cartesian product<!--Are you sure your readers will get this? I think it's a bit show-offy. :) --> of rows from the tables in the join. In other words, it combines each row from the first table with each row from the second table.

This article demonstrates, with a practical example, how to do a cross join in Power Query.

## Sample input and output tables

For this example, the sample source tables are:

* **Products**<!--Screenshot says "Product". Should we use "Product," or should the screenshot be changed?-->: A table with all the generic products that you sell.

   ![Sample Products table](images/me-cross-join-products-table.png "needs detailed alt text")

* **Colors**: A table with all the product variations, as colors, that you can have in our inventory.

   ![Sample Colors table](images/me-cross-join-colors-table.png "needs detailed alt text")

The goal is to perform a cross-join operation with these two tables to create a list of all unique products that you can have in your inventory, as shown in Table 1. This operation is necessary because the **Products** table only contains the generic product name, and doesn't give the level of detail you need to see what product variations (such as color) there are.<!--Edit okay? I wasn't sure what "it has" referred to. Also, Writing Style Guide says "Don't substitute could for can unless you're referring to the past."-->

*Table 1. Final table after the cross-join operation*<br>
![Final table after cross join](images/me-cross-join-final-table.png "needs detailed alt text")

## Perform a cross-join

To do a cross-join operation in Power Query, first go to the **Products** table. From the **Add column** tab on the ribbon, select **Custom column**. More information: [Add a custom column](add-custom-column.md)

![Custom column command](images/me-cross-join-add-column-icon.png "Custom column command")

In the **Custom column** dialog box, enter whatever name you like in the **New column name** box, and enter `Colors` in the **Custom column formula** box.

![Custom column for cross-join](images/me-cross-join-add-column-window.png "Custom column for cross-join")

>[!IMPORTANT]
>If your query name has spaces in it, such as **Product Colors**, the text that you need to enter in the **Custom column formula** section has to follow the syntax ```#"Query name"```. For **Product Colors**, you need to enter ```#"Product Colors"```<br>
<br>You can check the name of your queries in the **Query settings** pane on the right side of your screen or in the **Queries** pane on the left side.

After you select **OK** in the **Custom column** dialog box, a new column is added to the table. In the new column heading, select **Expand** ![Expand](images/expand-icon.png) to expand the contents of this newly created column, and then select **OK**.

![Cross-join custom column added](images/me-cross-join-new-table-column.png "Cross-join custom column added")

After you select **OK**, you'll reach your goal of creating a table that looks like Table 1, with all possible combinations of **Products** and **Colors**. 
<!--
![Final table after cross join](images/me-cross-join-final-table.png "needs detailed alt text") -->
