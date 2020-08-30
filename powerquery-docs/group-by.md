---
title: "Grouping or summarizing rows"
description: "In Power Query, you can group or summarize the values in various rows into a single value by grouping the rows according to the values in one or more columns. Power Query has two types of Group By operations: aggregate a column with an aggregate function, or perform a row operation."
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
ms.custom: edited
---

# Grouping or summarizing rows

In Power Query, you can group values in various rows into a single value by grouping the rows according to the values in one or more columns. You can choose from two types of grouping operations:

* Aggregate a column by using an aggregate function.

* Perform a row operation.

For this tutorial, you'll be using the sample table shown in the following image.
<!--note from editor: I wanted to experiment with the new image extension from the people at docs. It seems to work well. I don't know what the character limit is for the description, but we certainly have more room now to describe the sample tables in detail. Note that the description shows up in the VSCode preview and the preview on Github, but it looks good (that is, it doesn't appear) on the review site.-->
:::image type="complex" source="images/me-group-by-initial-table.png" alt-text="Sample initial table":::
  Table with columns showing Year (2020), Country (USA, Panama, or Canada), Product (Shirt or Shorts), Sales channel (Online or Reseller), and Units (various values from 55 to 7500)
:::image-end:::

<!--![Sample initial table](images/me-group-by-initial-table.png "Sample initial table")-->

## Where to find the Group by button

You can find the **Group by** button in three places:

* On the **Home** tab, in the **Transform** group.

   ![Group by on the Home tab](images/me-group-by-home-icon.png "Group by on the Home tab")

* On the **Transform** tab, in the **Table** group. 

   ![Group by on the Transform tab](images/me-group-by-transform-icon.png "Group by on the Transform tab")

* On the shortcut menu when you right-click to select columns.

   ![Group by on the shortcut menu](images/me-group-by-right-click-icon.png "Group by on the shortcut menu")

## Use an aggregate function to group by one or more columns
<!--Edit okay?-->
In this example, your goal is to summarize the total units sold at the country and sales channel level. You'll use the **Country** and **Sales Channel** columns to perform the group by operation.

1. Select **Group by** on the **Home** tab.
1. Select the **Advanced** option, so you can select multiple columns to group by. 
1. Select the **Country** and **Sales Channel** columns.
1. Create a new column by aggregating the **Units** column, using the **Sum** operation.<!--The guidance gets very un-specific here. What are the buttons the reader needs to push?-->
1. Name this new column **Total units**.

![Group by dialog box with aggregated columns](images/me-group-by-add-aggregated-column-window.png "Group by dialog box with aggregated columns")

This operation gives you the table that you're looking for.

![Sample output table with aggregated columns](images/me-group-by-add-aggregated-column-final.png "Sample output table with aggregated columns")

## Perform a row operation to group by one or more columns

In this example, you want total units sold and&mdash;in addition&mdash;you want two other columns that give you the name and units sold for the top-performing product, summarized at the country and sales channel level. 
<!--note from editor: It's not good design to use the same graphic twice in an article. If we have duplicate alt text, soon we'll be throwing warnings (not just suggestions) at build time. You'll notice in other articles that duplicate images, I've added a caption ("Table 1") to the first occurrence of the image and then just referred back to it. I'm not sure that's optimal, I'll be curious to see what you think.-->
Your goal is to reach a table that looks like the following image from your original sample table.

![Sample output table with row operations](images/me-group-by-row-operation-final-table.png "Sample output table with row operations")

1. Use the following columns as **Group by** columns:
   * Country
   * Sales Channel

2. Create two new columns by doing the following:
   1. Aggregate the **Units** column by using the **Sum** operation. Name this column **Total units**.
   1. Add a new **Products** column by using the **All rows** operation.

   ![Group by dialog box with a non-aggregate column](images/me-group-by-row-operation-window.png "Group by dialog box with a non-aggregate column")

After that operation is complete, notice how the **Products** column has \[Table\] values inside each cell. Each \[Table\] value contains all the rows that were grouped by the **Country** and **Sales Channel** columns from your original table. You can select the white space inside the cell to see a preview of the contents of the table at the bottom of the dialog box.

![Table details preview pane](images/me-group-by-row-operation-details-preview-pane.png "Table details preview pane")

>[!NOTE]
>The details preview pane might not show all the rows that were used for the group-by operation. You can select the \[Table\] value to see all rows pertaining to the corresponding group-by operation. 

Next, you need to extract the row that has the highest value in the **Units** column of the tables inside the new **Products** column, and call that new column **Top performer product**.

### Extract the top performer product information

With the new **Products** column with \[Table\] values, you create a new custom column by going to the **Add Column** tab on the ribbon and selecting **Custom column** from the **General** group.

![Add a custom column](images/me-add-custom-column-icon.png "Add a custom column")

Name your new column **Top performer product**. Enter the formula `Table.Max([Products], "Units" )` under **Custom column formula**.<!--Suggested, to keep the period out of it entirely.--> 

![Custom column formula with Table.Max](images/me-group-by-row-operation-custom-column-formula.png "Custom column formula with Table.Max")

The result of that formula creates a new column with \[Record\] values with the row with the maximum value for the **Units** column of each \[Table\] value in the **Products** column.<!--Don't know what this means. -->

![Result of the custom column formula with Table.Max](images/me-group-by-row-operation-custom-column-details-preview-pane.png "Result of the custom column formula with Table.Max")

With this new **Top performer product** column that contains \[Record\] values, you can select **Expand**<!--What do you think of using the icon here? (Edit assumes that this is the tooltip. If there is no tooltip, this could be "...you can select the expand icon..."-->![expand](images/expand-icon.png), select the **Product** and **Units** fields, and then select **OK**.

![Expand operation for record value on the Top performer product column](images/me-group-by-row-operation-custom-column-expand-window.png "Expand operation for record value on the Top performer product column")

After removing your **Products** column and setting the data type for both newly expanded columns, your result will resemble the following image.

![Final table with all transformations](images/me-group-by-row-operation-final-table.png "Final table with all transformations")

## Fuzzy grouping

To demonstrate how to do "fuzzy grouping," consider the sample table shown in the following image.

![Table with nine rows of entries for "miguel," "Miguel," migueeel," "mike," "Mike"](images/me-fuzzy-grouping-sample-source-table.png "Table with entries for 'miguel,' 'Miguel,' migueeel,' 'mike, and 'Mike'")

The goal of fuzzy grouping is to do a group-by operation that uses an approximate match algorithm for text strings. Power Query uses the Jaccard similarity algorithm to measure the similarity between pairs of instances. Then it applies agglomerative hierarchical clustering to group instances together. The following image shows the output that you expect, where the table will be grouped by the **Person** column.

![Table showing entries for Person as "Miguel" and "Mike," and Frequency as 3 and 2, respectively"](images/me-fuzzy-grouping-sample-final-table-no-transform-table.png "Table showing entries for Person as 'Miguel' and 'Mike,' and Frequency as 3 and 2, respectively")

To do the fuzzy grouping, you perform the same steps previously described in this article. The only difference is that this time, in the **Group by** dialog box, you select the **Use fuzzy grouping** check box.

![Fuzzy grouping check box in the Group by dialog box](images/me-fuzzy-grouping-button-group-by-window.png "Fuzzy grouping check box in the Group by dialog box")

For each group of rows, Power Query will pick the most frequent instance as the "canonical" instance. If multiple instance occur with the same frequency, Power Query will pick the first one. After you select **OK** in the **Group by** dialog box, you'll get the result that you were expecting.

![Fuzzy grouping sample final table, no transform table](images/me-fuzzy-grouping-sample-final-table-no-transform-table.png "Fuzzy grouping sample final table, no transform table")

However, you have more control over the fuzzy grouping operation by expanding **Fuzzy group options**.

![Fuzzy group options](images/me-fuzzy-grouping-fuzzy-group-options.png "Fuzzy group options")

:::image type="content" source="images/me-fuzzy-grouping-fuzzy-group-options.png" alt-text="Fuzzy group options":::

The following options are available for fuzzy grouping:

* **Similarity threshold (optional)**: This option indicates how similar two values must be to be grouped together. The minimum setting<!--Just to reduce the use of "value".--> of 0 will cause all values to be grouped together. The maximum setting of 1 will only allow values that match exactly to be grouped together. The default is 0.8.
* **Ignore case**: When comparing text strings, case will be ignored. This option is enabled by default.
* **Group by combining text parts**: The algorithm will try to combine text parts (such as combining **Micro** and **soft** into **Microsoft**) to group values.
* **Transformation table (optional)**: You can select a transformation table that will map values (such as mapping **MSFT** to **Microsoft**) to group them together.

For this example, a transformation table will be used to demonstrate how values can be mapped. The transformation table must have two columns:<!--Edit assumes there must be exactly two.-->

* **From**: The text string to look for in your table.
* **To**: The text string to use to replace the text string in the **From** column.

The following image shows the transformation table to create.<!--The reader has to create this table, right? The "table to be used" seems to imply that it already exists somewhere.-->

![Table showing From values of mike and William, and To values of Miguel and Bill](images/me-fuzzy-grouping-sample-transformation-table.png "Table showing From values of mike and William, and To values of Miguel and Bill")

Return to the **Group by** dialog box, expand **Fuzzy group options**, and then select the **Transformation table** drop-down menu.

![Fuzzy grouping sample transformation table drop-down menu](images/me-fuzzy-grouping-sample-transformation-table-window.png "Fuzzy grouping sample transformation table drop-down menu")

After selecting your transformation table<!--Edit okay? It looks like the sample table shows up in the list, and I assume the reader has to select it? -->, select **OK**. The result of that operation will give you the result shown in the following image.

![Fuzzy grouping sample final table with transform table](images/me-fuzzy-grouping-sample-final-table.png "")

In this example, the **Ignore case** option was enabled, so the values in the **From** column of the **Transformation table** will be used to look for the text string without considering the case of the string. This transformation operation occurs first, and then the fuzzy grouping operation is performed. 

>[!NOTE]
>When grouping by multiple columns, the transformation table will perform the replace operation in all columns if replacing the value increases the similarity score.<!--I'm not sure how this affects the user. Do they need to do anything about it?-->

### See also

[Add a custom column](add-custom-column.md)  
[Remove duplicates](working-with-duplicates.md)
