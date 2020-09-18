---
title: Unpivot columns
description: With the unpivot columns feature in Power Query, you can transform selected columns into attribute-value pairs where columns become rows.
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/01/2019
ms.author: v-miesco
ms.custom: edited
---


# Unpivot columns

In Power Query, you can transform columns into attribute-value pairs, where columns become rows.

![Unpivot columns diagram](images/unpivot-operation-diagram.png "needs detailed alt text")

For example, given a table like the following, where country rows and date columns create a matrix of values, it's difficult to analyze the data in a scalable way.

![Unpivot columns sample initial table](images/me-unpivot-initial-table.png "needs detailed alt text")

Instead, you can transform the table into a table with unpivoted columns, as shown in the following image. In the transformed table, it's easier to use the date as an attribute to filter on.

![Unpivot columns sample goal table](images/me-unpivot-final-table.png "needs detailed alt text")

The key in this transformation is that you have a set of dates in the table that should all be part of a single column. The respective value for each date and country should be in a different column, effectively creating an attribute-value pair.<!--Edit okay? If a "value-pair" is different, can you please define it?-->

Power Query will always create the attribute-value pair by using two columns:

- **Attribute**: The name of the column headings that were unpivoted.
- **Value**: The values that were underneath each of the unpivoted column headings.

There are multiple places in the user interface where you can find **Unpivot columns**. You can right-click the columns that you want to unpivot, or you can select the command from the **Transform** tab in the ribbon.

![Right-click operation to unpivot columns](images/me-unpivot-right-click.png "Right-click operation to unpivot columns")

![Unpivot columns command on the Transform tab](images/me-unpivot-transform-tab.png "Unpivot columns command on the Transform tab")

There are three ways that you can unpivot columns from a table:

- **Unpivot columns**
- **Unpivot other columns**
- **Unpivot only selected columns**

## Unpivot columns

For the scenario described above, you first need to select the columns you want to unpivot. You can select **Ctrl** as you select as many columns as you need. For this scenario, you want to select all the columns except the one named **Country**. After selecting the columns, right-click any of the selected columns, and then select **Unpivot columns**.

![Unpivot columns from the shortcut menu](images/me-unpivot-columns-right-click.png "needs detailed alt text")

The result of that operation will yield the result shown in the following image.<!--This image should be cropped a bit tighter, it's hard to read.-->

![Unpivot columns final table](images/me-unpivot-columns-final-table.png "needs detailed alt text")

### Special considerations

After creating your query from the steps above, imagine that your initial table gets updated to look like the following screenshot.

![Unpivot columns updated source table](images/me-unpivot-updated-source-table.png "needs detailed alt text")

Notice that you've added a new column for the date 9/1/2020 (September 1, 2020), and two new rows for the countries UK and Mexico.

If you refresh your query, you'll notice that the operation will be done on the updated column, but won't affect the column that wasn't originally selected (**Country**, in this example). This means that any new column that's added to the source table will be unpivoted as well.

The following image shows what your query will look like after the refresh with the new updated source table.

![Unpivot columns final updated table](images/me-unpivot-columns-final-updated-table.png "needs detailed alt text")

## Unpivot other columns

You can also select the columns that you don't want to unpivot and unpivot the rest of the columns in the table. This operation is where **Unpivot other columns** comes into play.

![Unpivot other columns from the shortcut menu](images/me-unpivot-other-columns.png "needs detailed alt text")

The result of that operation will yield exactly the same result as the one you got from **Unpivot columns**.

![Unpivot other columns final table](images/me-unpivot-other-columns-final-table.png "needs detailed alt text")

>[!NOTE]
> This transformation is crucial for queries that have an unknown number of columns. The operation will unpivot all columns from your table except the ones that you've selected. This is an ideal solution if the data source of your scenario got new date columns in a refresh, because those will get picked up and unpivoted. 

### Special considerations

Similar to the **Unpivot columns** operation, if your query is refreshed and more data is picked up from the data source, all the columns will be unpivoted except the ones that were previously selected.

To illustrate this, say that you have a new table like the one in the following image.

![Unpivot updated source table](images/me-unpivot-updated-source-table.png "needs detailed alt text")

You can select the **Country** column, and then select **Unpivot other column**, which will yield the following result.

![Unpivot other columns updated final table](images/me-unpivot-other-columns-updated-final-table.png "needs detailed alt text")

## Unpivot only selected columns

The purpose of this last option is to only unpivot specific columns from your table. This is important for scenarios where you're dealing with an unknown number of columns from your data source and you only want to unpivot the selected columns.

To perform this operation, select the columns to unpivot, which in this example is all the columns except the **Country** column. Then right-click any of the columns you selected, and then select **Unpivot only selected columns**.

![Unpivot only selected columns shortcut menu](images/me-unpivot-only-selected-columns-right-click.png "needs detailed alt text")

Notice how this operation will yield the same output as the previous examples.

![Unpivot only selected columns final table](images/me-unpivot-only-selected-columns-final-table.png "needs detailed alt text")

### Special considerations

After doing a refresh, if our source table changes to have a new **9/1/2020** column and new rows for UK and Mexico, the output of the query will be different from the previous examples. Say that our source table, after a refresh, changes to the table in the following image.

![Unpivot updated source table](images/me-unpivot-updated-source-table.png "Unpivot updated source table")

The output of our query will look like the following image.

![Unpivot only selected columns updated final table](images/me-unpivot-only-selected-columns-updated-final-table.png "Unpivot only selected columns updated final table")

It looks like this because the unpivot operation was applied only on the **6/1/2020**, **7/1/2020**, and **8/1/2020** columns, so the column with the header **9/1/2020** remains unchanged.
