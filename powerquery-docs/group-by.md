---
title: "Grouping or summarizing rows"
description: "In Power Query, you can group or summarize the values in various rows into a single value by grouping the rows according to the values in one or more columns. Power Query has two types of Group By operations: aggregate a column with an aggregate function, or perform an operation."
author: ptyx507x
ms.service: powerquery
ms.reviewer: kvivek
ms.date: 12/20/2021
ms.author: dougklo
ms.custom: edited
---

# Grouping or summarizing rows

In Power Query, you can group values in various rows into a single value by grouping the rows according to the values in one or more columns. You can choose from two types of grouping operations:

* Aggregate a column by using an aggregate function.

* Perform an operation.

For this tutorial, you'll be using the sample table shown in the following image.

:::image type="complex" source="images/me-group-by-initial-table.png" alt-text="Sample initial table.":::
  Table with columns showing Year (2020), Country (USA, Panama, or Canada), Product (Shirt or Shorts), Sales channel (Online or Reseller), and Units (various values from 55 to 7500)
:::image-end:::

## Where to find the Group by button

You can find the **Group by** button in three places:

* On the **Home** tab, in the **Transform** group.

   ![Group by on the Home tab.](images/me-group-by-home-icon.png "Group by on the Home tab")

* On the **Transform** tab, in the **Table** group. 

   ![Group by on the Transform tab.](images/me-group-by-transform-icon.png "Group by on the Transform tab")

* On the shortcut menu when you right-click to select columns.

   ![Group by on the shortcut menu.](images/me-group-by-right-click-icon.png "Group by on the shortcut menu")

## Use an aggregate function to group by one or more columns

In this example, your goal is to summarize the total units sold at the country and sales channel level. You'll use the **Country** and **Sales Channel** columns to perform the group by operation.

1. Select **Group by** on the **Home** tab.
2. Select the **Advanced** option, so you can select multiple columns to group by. 
3. Select the **Country** and **Sales Channel** columns.
4. In the New columns section, create a new column where the name is **Total units**, the aggregate operation is **Sum**, and the column used is **Units**.
5. Hit OK

![Group by dialog box with aggregated columns.](images/me-group-by-add-aggregated-column-window.png "Group by dialog box with aggregated columns")

This operation gives you the table that you're looking for.

![Sample output table with aggregated columns.](images/me-group-by-add-aggregated-column-final.png "Sample output table with aggregated columns")

## Operations available

With the **Group by** feature, the operations available can be categorized into two groups:

* Aggregations based on a single column
* Operations based on a row

The following table describes each of these operations.

|Operation Name|Category|Description|
|-----|------|------|
|**Sum**|Column aggregation|Sums up all values from a column of numbers|
|**Average**|Column aggregation|Calculates the average value from a column of numbers|
|**Median**|Column aggregation|Calculates the median from a column of numbers|
|**Min**|Column aggregation|Calculates the minimum value from a column of numbers|
|**Max**|Column aggregation|Calculates the maximum value from a column of numbers|
|**Count distinct values**|Column aggregation|Calculate the number of distinct values from a column|
|**Count rows**|Row level operation|Calculates the total number of rows from a given group|
|**Count distinct rows**|Row level operation|Calculates the number of distinct rows from a give group|
|**All rows**|Row level operation|Outputs all grouped rows in a table value with no aggregations|

## Perform an operation to group by one or more columns

In this example, you want total units sold and&mdash;in addition&mdash;you want two other columns that give you the name and units sold for the top-performing product, summarized at the country and sales channel level.

![Sample output table with operations.](images/me-group-by-row-operation-final-table.png "Sample output table with operations")

1. Use the following columns as **Group by** columns:
   * Country
   * Sales Channel

2. Create two new columns by doing the following:
   1. Aggregate the **Units** column by using the **Sum** operation. Name this column **Total units**.
   1. Add a new **Products** column by using the **All rows** operation.

   ![Group by dialog box with a non-aggregate column.](images/me-group-by-row-operation-window.png "Group by dialog box with a non-aggregate column")

After that operation is complete, notice how the **Products** column has \[Table\] values inside each cell. Each \[Table\] value contains all the rows that were grouped by the **Country** and **Sales Channel** columns from your original table. You can select the white space inside the cell to see a preview of the contents of the table at the bottom of the dialog box.

![Table details preview pane.](images/me-group-by-row-operation-details-preview-pane.png "Table details preview pane")

>[!NOTE]
>The details preview pane might not show all the rows that were used for the group-by operation. You can select the \[Table\] value to see all rows pertaining to the corresponding group-by operation. 

Next, you need to extract the row that has the highest value in the **Units** column of the tables inside the new **Products** column, and call that new column **Top performer product**.

### Extract the top performer product information

With the new **Products** column with \[Table\] values, you create a new custom column by going to the **Add Column** tab on the ribbon and selecting **Custom column** from the **General** group.

![Add a custom column.](images/me-add-custom-column-icon.png "Add a custom column")

Name your new column **Top performer product**. Enter the formula `Table.Max([Products], "Units" )` under **Custom column formula**.

![Custom column formula with Table.Max.](images/me-group-by-row-operation-custom-column-formula.png "Custom column formula with Table.Max")

The result of that formula creates a new column with \[Record\] values. These record values are essentially a table with just one row. These records contain the row with the maximum value for the **Units** column of each \[Table\] value in the **Products** column.

![Result of the custom column formula with Table.Max.](images/me-group-by-row-operation-custom-column-details-preview-pane.png "Result of the custom column formula with Table.Max")

With this new **Top performer product** column that contains \[Record\] values, you can select the ![expand.](images/expand-icon.png) expand icon, select the **Product** and **Units** fields, and then select **OK**.

![Expand operation for record value on the Top performer product column.](images/me-group-by-row-operation-custom-column-expand-window.png "Expand operation for record value on the Top performer product column")

After removing your **Products** column and setting the data type for both newly expanded columns, your result will resemble the following image.

![Final table with all transformations.](images/me-group-by-row-operation-final-table-2.png "Final table with all transformations")

## Fuzzy grouping
>[!NOTE]
>The following feature is only available in Power Query Online.

To demonstrate how to do "fuzzy grouping," consider the sample table shown in the following image.

![Table with nine rows of entries that contain various spellings and captilizations of the name Miguel and William.](images/me-fuzzy-grouping-sample-source-table.png "Table with nine rows of entries that contain various spellings and captilizations of the name Miguel and William")

The goal of fuzzy grouping is to do a group-by operation that uses an approximate match algorithm for text strings. Power Query uses the Jaccard similarity algorithm to measure the similarity between pairs of instances. Then it applies agglomerative hierarchical clustering to group instances together. The following image shows the output that you expect, where the table will be grouped by the **Person** column.

![Table showing entries for Person as "Miguel" and "Mike," and Frequency as 3 and 2, respectively."](images/me-fuzzy-grouping-sample-final-table-no-transform-table.png "Table showing entries for Person as 'Miguel' and 'Mike,' and Frequency as 3 and 2, respectively")

To do the fuzzy grouping, you perform the same steps previously described in this article. The only difference is that this time, in the **Group by** dialog box, you select the **Use fuzzy grouping** check box.

![Fuzzy grouping check box in the Group by dialog box.](images/me-fuzzy-grouping-button-group-by-window.png "Fuzzy grouping check box in the Group by dialog box")

For each group of rows, Power Query will pick the most frequent instance as the "canonical" instance. If multiple instances occur with the same frequency, Power Query will pick the first one. After you select **OK** in the **Group by** dialog box, you'll get the result that you were expecting.

![Fuzzy grouping sample final table, no transform table.](images/me-fuzzy-grouping-sample-final-table-no-transform-table-2.png "Fuzzy grouping sample final table, no transform table")

However, you have more control over the fuzzy grouping operation by expanding **Fuzzy group options**.

![Fuzzy group options.](images/me-fuzzy-grouping-fuzzy-group-options.png "Fuzzy group options")

The following options are available for fuzzy grouping:

* **Similarity threshold (optional)**: This option indicates how similar two values must be to be grouped together. The minimum setting of 0 will cause all values to be grouped together. The maximum setting of 1 will only allow values that match exactly to be grouped together. The default is 0.8.
* **Ignore case**: When comparing text strings, case will be ignored. This option is enabled by default.
* **Group by combining text parts**: The algorithm will try to combine text parts (such as combining **Micro** and **soft** into **Microsoft**) to group values.
* **Show similarity scores**: Show similarity scores between the input values and the computed representative values after fuzzy grouping. Requires the addition of an operation such as *All rows* to showcase this information on a row by row level.
* **Transformation table (optional)**: You can select a transformation table that will map values (such as mapping **MSFT** to **Microsoft**) to group them together.

For this example, a transformation table will be used to demonstrate how values can be mapped. The transformation table has two columns:

* **From**: The text string to look for in your table.
* **To**: The text string to use to replace the text string in the **From** column.

The following image shows the transformation table used in this example.

![Table showing From values of mike and William, and To values of Miguel and Bill.](images/me-fuzzy-grouping-sample-transformation-table.png "Table showing From values of mike and William, and To values of Miguel and Bill")

>[!IMPORTANT]
>It's important that the transformation table has a the same columns and column names as shown above (they have to be "From" and "To"), otherwise Power Query will not recognize these.

Return to the **Group by** dialog box, expand **Fuzzy group options**, change the operation from *Count rows* to *All rows*, enable the **Show similarity scores** option and then select the **Transformation table** drop-down menu.

![Fuzzy grouping sample transformation table drop-down menu.](images/me-fuzzy-grouping-sample-transformation-table-window.png "Fuzzy grouping sample transformation table drop-down menu")

After selecting your transformation table, select **OK**. The result of that operation will give you the result shown in the following image.

![Fuzzy grouping sample final table with transform table.](images/me-fuzzy-grouping-sample-final-table.png "")

In this example, the **Ignore case** option was enabled, so the values in the **From** column of the **Transformation table** will be used to look for the text string without considering the case of the string. This transformation operation occurs first, and then the fuzzy grouping operation is performed. 

You can also see how the similarity score is shown in the table value next to the person column which reflects exactly how the values were grouped and their respective similarity scores. You have the option to expand this column if needed or use the values from the new Frequency columns for other sort of transformations.
 
>[!NOTE]
>When grouping by multiple columns, the transformation table will perform the replace operation in all columns if replacing the value increases the similarity score.

### See also

[Add a custom column](add-custom-column.md)  
[Remove duplicates](working-with-duplicates.md)
