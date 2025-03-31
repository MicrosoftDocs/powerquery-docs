---
title: "How to GROUP BY or summarize rows"
description: "In Power Query, you can group or summarize the values in various rows into a single value by grouping the rows according to the values in one or more columns. Power Query has two types of Group By operations: aggregate a column with an aggregate function, or perform an operation."
author: ptyx507x
ms.date: 3/28/2025
ms.author: miescobar
ms.custom: edited
ms.subservice: transform-data
---

# Grouping or summarizing rows

In Power Query, you can group values in various rows into a single value by grouping the rows according to the values in one or more columns. You can choose from two types of grouping operations:

* Column groupings.

* Row groupings.

For this tutorial, you're using the following sample table.

:::image type="complex" source="media/group-by/initial-table.png" alt-text="Sample initial table.":::
  Screenshot of a table with columns showing Year (2020), Country (USA, Panama, or Canada), Product (Shirt or Shorts), Sales channel (Online or Reseller), and Units (various values from 55 to 7500)
:::image-end:::

## Where to find the Group by button

You can find the **Group by** button in three places:

* On the **Home** tab, in the **Transform** group.

   :::image type="content" source="media/group-by/home-icon.png" alt-text="Screenshot of the Power Query ribbon with the Group by option emphasized in the Home tab." lightbox="media/group-by/home-icon.png":::

* On the **Transform** tab, in the **Table** group.

   :::image type="content" source="media/group-by/transform-icon.png" alt-text="Screenshot of the Power Query ribbon with the Group by option emphasized in the Transform tab.":::

* On the shortcut menu, when you right-click to select columns.

   :::image type="content" source="media/group-by/right-click-icon.png" alt-text="Screenshot of a table with the Group by option emphasized in the shortcut menu.":::

## Use an aggregate function to group by one or more columns

In this example, your goal is to summarize the total units sold at the country and sales channel level. You use the **Country** and **Sales Channel** columns to perform the group by operation.

1. Select **Group by** on the **Home** tab.
2. Select the **Advanced** option, so you can select multiple columns to group by.
3. Select the **Country** column.
4. Select **Add grouping**.
5. Select the **Sales Channel** column.
6. In **New column name**, enter **Total units**, in **Operation**, select **Sum**, and in **Column**, select **Units**.
7. Select **OK**

:::image type="content" source="media/group-by/add-aggregated-column-window.png" alt-text="Screenshot of the Group by dialog with the aggregated columns filled in.":::

This operation gives you the following table.

:::image type="content" source="media/group-by/add-aggregated-column-final.png" alt-text="Screenshot of the sample output table with the Country, Sales Channel, and Total units columns." lightbox="media/group-by/add-aggregated-column-final.png":::

### Operations available

With the **Group by** feature, the available operations can be categorized in two ways:

* Row level operation
* Column level operation

The following table describes each of these operations.

|Operation Name|Category|Description|
|-----|------|------|
|**Sum**|Column operation|Sums up all values from a column|
|**Average**|Column operation|Calculates the average value from a column|
|**Median**|Column operation|Calculates the median from a column|
|**Min**|Column operation|Calculates the minimum value from a column|
|**Max**|Column operation|Calculates the maximum value from a column|
|**Percentile** |Column operation|Calculates the percentile, using an input value from 0 to 100, from a column|
|**Count distinct values**|Column operation|Calculates the number of distinct values from a column|
|**Count rows**|Row operation|Calculates the total number of rows from a given group|
|**Count distinct rows**|Row operation|Calculates the number of distinct rows from a given group|
|**All rows**|Row operation|Outputs all grouped rows in a table value with no aggregations|

> [!NOTE]
>The **Count distinct values** and **Percentile** operations are only available in Power Query Online.

## Perform an operation to group by one or more columns

Starting from the original sample, in this example you create a column containing the total units and two other columns that give you the name and units sold for the top-performing product, summarized at the country and sales channel level.

:::image type="content" source="media/group-by/row-operation-final-table.png" alt-text="Screenshot of the sample output table with operations." lightbox="media/group-by/row-operation-final-table.png":::

1. Use the following columns as **Group by** columns:
   * Country
   * Sales Channel

2. Create two new columns by following these steps:
   1. Aggregate the **Units** column by using the **Sum** operation. Name this column **Total units**.
   1. Add a new **Products** column by using the **All rows** operation.

   :::image type="content" source="media/group-by/row-operation-window.png" alt-text="Screenshot of the Group by dialog with a nonaggregate column.":::

After that operation is complete, notice how the **Products** column has **\[Table\]** values inside each cell. Each **\[Table\]** value contains all the rows that were grouped by the **Country** and **Sales Channel** columns from your original table. You can select the white space inside the cell to see a preview of the contents of the table at the bottom of the dialog.

:::image type="content" source="media/group-by/row-operation-details-preview-pane.png" alt-text="Screenshot of the table details preview pane.":::

> [!NOTE]
>The details preview pane might not show all the rows that were used for the group-by operation. You can select the **\[Table\]** value to see all rows pertaining to the corresponding group-by operation.

Next, you need to extract the row that has the highest value in the **Units** column of the tables inside the new **Products** column, and call that new column **Top performer product**.

### Extract the top performer product information

With the new **Products** column with **\[Table\]** values, you create a new custom column by going to the **Add Column** tab on the ribbon and selecting **Custom column** from the **General** group.

:::image type="content" source="media/group-by/add-custom-column-icon.png" alt-text="Screenshot of the Power Query ribbon with the Custom column option emphasized in the Add column tab.":::

Name your new column **Top performer product**. Enter the formula `Table.Max([Products], "Units" )` under **Custom column formula**.

:::image type="content" source="media/group-by/row-operation-custom-column-formula.png" alt-text="Screenshot of the Custom column dialog with the formula for Table.Max entered.":::

The result of that formula creates a new column with **\[Record\]** values. These record values are essentially a table with just one row. These records contain the row with the maximum value for the **Units** column of each **\[Table\]** value in the **Products** column.

:::image type="content" source="media/group-by/row-operation-custom-column-details-preview-pane.png" alt-text="Screenshot of the result of the custom column formula with Table.Max.":::

With this new **Top performer product** column that contains **\[Record\]** values, you can select the :::image type="icon" source="media/group-by/expand-icon.png"::: expand icon, select the **Product** and **Units** fields, and then select **OK**.

:::image type="content" source="media/group-by/row-operation-custom-column-expand-window.png" alt-text="Screenshot of the expand operation for the record value on the Top performer product column.":::

After you remove your **Products** column and set the data types for both newly expanded columns, your result resembles the following image.

:::image type="content" source="media/group-by/row-operation-final-table-2.png" alt-text="Screenshot of the final table with all transformations." lightbox="media/group-by/row-operation-final-table-2.png":::

## Fuzzy grouping

> [!NOTE]
>The following feature is only available in Power Query Online.

To demonstrate how to do "fuzzy grouping," consider the sample table shown in the following image.

:::image type="content" source="media/group-by/fuzzy-grouping-sample-source-table.png" alt-text="Screenshot of a table with nine rows of entries that contain various spellings and capitalizations of the name Miguel and William.":::

The goal of fuzzy grouping is to do a group-by operation that uses an approximate match algorithm for text strings. Power Query uses the Jaccard similarity algorithm to measure the similarity between pairs of instances. Then it applies agglomerative hierarchical clustering to group instances together. The following image shows the output that you expect, where the table is grouped by the **Person** column.

:::image type="content" source="media/group-by/fuzzy-grouping-sample-final-table-no-transform-table.png" alt-text="Screenshot of a table showing entries for Person as Miguel and Mike, and Frequency as 3 and 2, respectively.":::

To do the fuzzy grouping, you perform the same steps previously described in this article. The only difference is that this time, in the **Group by** dialog box, you select the **Use fuzzy grouping** check box.

:::image type="content" source="media/group-by/fuzzy-grouping-button-group-by-window.png" alt-text="Screenshot of the Fuzzy grouping check box emphasized in the Group by dialog box.":::

For each group of rows, Power Query picks the most frequent instance as the "canonical" instance. If multiple instances occur with the same frequency, Power Query picks the first one. After you select **OK** in the **Group by** dialog box, you get the result that you were expecting.

:::image type="content" source="media/group-by/fuzzy-grouping-sample-final-table-no-transform-table-2.png" alt-text="Screenshot of the Fuzzy grouping sample final table, no transform table.":::

However, you have more control over the fuzzy grouping operation by expanding **Fuzzy group options**.

:::image type="content" source="media/group-by/fuzzy-grouping-fuzzy-group-options.png" alt-text="Screenshot of the Group by dialog with the Fuzzy group options emphasized.":::

The following options are available for fuzzy grouping:

* **Similarity threshold (optional)**: This option indicates how similar two values must be to be grouped together. The minimum setting of zero (0) causes all values to be grouped together. The maximum setting of 1 only allows values that match exactly to be grouped together. The default is 0.8.
* **Ignore case**: When text strings are compared, case is ignored. This option is enabled by default.
* **Group by combining text parts**: The algorithm tries to combine text parts (such as combining **Micro** and **soft** into **Microsoft**) to group values.
* **Show similarity scores**: Show similarity scores between the input values and the computed representative values after fuzzy grouping. Requires the addition of an operation such as **All rows** to showcase this information on a row-by-row level.
* **Transformation table (optional)**: You can select a transformation table that maps values (such as mapping **MSFT** to **Microsoft**) to group them together.

For this example, a transformation table is used to demonstrate how values can be mapped. The transformation table has two columns:

* **From**: The text string to look for in your table.
* **To**: The text string to use to replace the text string in the **From** column.

The following image shows the transformation table used in this example.

:::image type="content" source="media/group-by/fuzzy-grouping-sample-transformation-table.png" alt-text="Screenshot of the table showing From values of mike and William, and To values of Miguel and Bill.":::

> [!IMPORTANT]
>It's important that the transformation table has the same columns and column names as shown in the previous image (they have to be labeled "From" and "To"). Otherwise Power Query doesn't recognize the table as a transformation table.

Return to the **Group by** dialog box, expand **Fuzzy group options**, change the operation from **Count rows** to **All rows**, enable the **Show similarity scores** option, and then select the **Transformation table** drop-down menu.

:::image type="content" source="media/group-by/fuzzy-grouping-sample-transformation-table-window.png" alt-text="Screenshot of the fuzzy grouping sample transformation table drop-down menu.":::

After you select the transformation table, select **OK**. The result of that operation gives you the following information:

:::image type="content" source="media/group-by/fuzzy-grouping-sample-final-table.png" alt-text="Screenshot of the fuzzy grouping sample final table with transform table.":::

In this example, the **Ignore case** option was enabled, so the values in the **From** column of the transformation table are used to look for the text string without considering the case of the string. This transformation operation occurs first, and then the fuzzy grouping operation is performed.

The similarity score is also shown in the table value next to the person column, which reflects exactly how the values were grouped and their respective similarity scores. You can expand this column if needed or use the values from the new **Frequency** columns for other sorts of transformations.

> [!NOTE]
>When grouping by multiple columns, the transformation table performs the replace operation in all columns if replacing the value increases the similarity score.

For more information about how transformation tables work, go to [Transformation table precepts](cluster-values.md#transformation-table-precepts).

### Related content

* [Add a custom column](add-custom-column.md)  
* [Remove duplicates](working-with-duplicates.md)
