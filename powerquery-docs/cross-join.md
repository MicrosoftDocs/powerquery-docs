---
title: "Cross join"
description: An article on how to perform a cross-join operation in Power Query. 
author: ptyx507
ms.date: 12/9/2022
ms.author: miescobar
ms.custom: edited
---

# Cross join

A *cross join* is a type of join that returns the Cartesian product of rows from the tables in the join. In other words, it combines each row from the first table with each row from the second table.

This article demonstrates, with a practical example, how to do a cross join in Power Query.

## Sample input and output tables

For this example, the sample source tables are:

* **Product**: A table with all the generic products that you sell.

   :::image type="content" source="media/cross-join/cross-join-products-table.png" alt-text="Sample Product table containing three different products.":::

* **Colors**: A table with all the product variations, as colors, that you can have in your inventory.

   :::image type="content" source="media/cross-join/cross-join-colors-table.png" alt-text="Sample Colors table containing four different colors.":::

The goal is to perform a cross-join operation with these two tables to create a list of all unique products that you can have in your inventory, as shown in the following table. This operation is necessary because the **Product** table only contains the generic product name, and doesn't give the level of detail you need to see what product variations (such as color) there are.

![Final table after cross join listing each product with four different colors, for a total of 12 rows.](media/cross-join/cross-join-final-table.png "Final table after cross join operation")

## Perform a cross join

To do a cross-join operation in Power Query, first go to the **Product** table. From the **Add column** tab on the ribbon, select **Custom column**. More information: [Add a custom column](add-custom-column.md)

:::image type="content" source="media/cross-join/add-column-icon.png" alt-text="Custom column command.":::

In the **Custom column** dialog box, enter whatever name you like in the **New column name** box, and enter `Colors` in the **Custom column formula** box.

:::image type="content" source="media/cross-join/add-column-window.png" alt-text="Custom column for cross-join.":::

>[!IMPORTANT]
>If your query name has spaces in it, such as **Product Colors**, the text that you need to enter in the **Custom column formula** section has to follow the syntax ```#"Query name"```. For **Product Colors**, you need to enter ```#"Product Colors"```.
>
>You can check the name of your queries in the **Query settings** pane on the right side of your screen or in the **Queries** pane on the left side.

After you select **OK** in the **Custom column** dialog box, a new column is added to the table. In the new column heading, select **Expand** :::image type="icon" source="media/cross-join/expand-icon.png"::: to expand the contents of this newly created column, and then select **OK**.

:::image type="content" source="media/cross-join/new-table-column.png" alt-text="Cross-join custom column added.":::

After you select **OK**, you'll reach your goal of creating a table with all possible combinations of **Product** and **Colors**.

![Final table with each of the three products (shirt, jeans, and leggings) each listed with four colors (red, blue, black, and white).](media/cross-join/cross-join-final-table-2.png "Final table with each of the three products (shirt, jeans, and leggings) each listed with four colors (red, blue, black, and white)")
