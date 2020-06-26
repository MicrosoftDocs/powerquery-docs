---
title: Grouping or summarizing rows
description: Grouping or summarizing rows
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
---

# Grouping or summarizing rows

In Power Query, you can group the values in various rows into a single value by grouping the rows according to the values in one or more columns. 

Power Query has two types of **Group By** operations:

* aggregate a column with an aggregate function

* perform a row operation

For this demonstration, you'll be using the following sample table:

![image](images/me-group-by-initial-table.png)

## Where to find the Group By button

You can find the **Group By** button in three places:

* **Home tab**&mdash;inside the **Transform** group.

![image](images/me-group-by-home-icon.png)

* **Transform tab**&mdash;inside the **Table** group. 

![image](images/me-group-by-transform-icon.png)

* **Right-click column(s)**&mdash;when doing a right-click on the selected column(s), it will be listed under the contextual menu.

![image](images/me-group-by-right-click-icon.png)

## To Group by one or more columns: add an aggregated column

In this example, your goal is to reach the following table from your original sample table:

![image](images/me-group-by-add-aggregated-column.png)

You want the total units sold summarized at the **Country** and **Sales Channel** level.

You can accomplish your goal by performing a group by operation using the following columns as **Group by** columns:
* Country
* Sales Channel

To do this, first select the **Group by** button from the **Home** tab. Select the **Advanced** option so you can select multiple columns to group by. Then select the **Country** and **Sales Channel** column to perform the group by operation on. Create a new column by aggregating the **Units** column using the Sum function and naming this new column **Total units**.

![image](images/me-group-by-add-aggregated-column-window.png)

This operation gives you the table that you're looking for.

![image](images/me-group-by-add-aggregated-column-final.png)

## To Group by one or more columns: perform a row operation

In this example, your goal is to reach the following table from your original sample table.

![image](images/me-group-by-row-operation-final-table.png)

You want the total units sold, as well as two other columns that give you the name and units sold for the top performing product summarized at the **Country** and **Sales Channel** level.
 
You can accomplish this change by performing a group by operation using the following columns as **Group by'**columns:
* Country
* Sales Channel

And creating two new columns by:
* Aggregating the **Units** column using the *Sum* operation and naming this new column **Total units**. 
* Adding a new **Products** column using the *All Rows* operation.

![image](images/me-group-by-row-operation-window.png)

Once that operation is complete, notice how the **Products** column has **Table** values inside each cell. Each **Table** value contains all rows that were grouped by the **Country** and **Sales Channel** columns from your original table. You can select the whitespace inside the cell so you can see a preview of the contents of the table in the "details preview pane" at the bottom.

![image](images/me-group-by-row-operation-details-preview-pane.png)

>[!Note]
>Power Query doesn't guarantee that the details preview pane shows all rows that are used for the group by. You can select the **Table** value to see all rows pertaining to the correspondent group by operation. 

What you need to do next is extract the row with the highest value in the **Units** column of the tables inside the new **Products** columns and call that new column **Top performer product**.

### Extract the top performer product information

With the new **Products** column with table values, you create a new custom column by going to the **Add Column** menu from the ribbon and selecting **Custom column** from the **General** group.

![image](images/me-add-custom-column-icon.png)

The name of your new column will be **Top performer product**. The formula to enter in **Custom column formula** is `Table.Max([Products], "Units" )`.

![image](images/me-group-by-row-operation-custom-column-formula.png)

The result of that formula will create a new column with record values with the row with the maximum value on the **Units** column of each *table* value in the **Products** column.

![image](images/me-group-by-row-operation-custom-column-details-preview-pane.png)

With this new **Top performer product** column containing **Record** values, you can select the icon with opposite rows in the column header to expand the contents of the column. Select the **Product** and **Units** fields, and then select **OK**.

![image](images/me-group-by-row-operation-custom-column-expand-window.png)

After removing your **Products** column and setting the data type for both newly expanded columns, your result looks like this:

![image](images/me-group-by-row-operation-final-table.png)

## Fuzzy grouping

(Placeholder)

## More resources

You can create your own custom column formula to transform the table from the **Group by** operation. To learn more about how to create your custom column in Power Query, see [Add a Custom column](add-custom-column.md).

If your goal is to remove the duplicates from a table, you can also use the [Remove duplicates](working-with-duplicates.md) operation within Power Query.
