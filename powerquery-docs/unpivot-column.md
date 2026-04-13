---
title: Unpivot columns
description: With the unpivot columns feature in Power Query, you can transform selected columns into attribute-value pairs where columns become rows.
author: ptyx507
ms.date: 7/10/2025
ms.author: miescobar
ms.subservice: transform-data
---

# Unpivot columns

In Power Query, you can transform columns into attribute-value pairs, where columns become rows.

:::image type="complex" source="media/unpivot-column/unpivot-operation-diagram.png" alt-text="Unpivot columns diagram.":::
   Diagram showing the left table with a blank column and rows, and the Attributes values A1, A2, and A3 as column headers. In this table, the A1 column contains the values V1, V4, and V7. The A2 column contains the values V2, V5, and V8. The A3 column contains the values V3, V6, and V9. With the columns unpivoted, the right table of the diagram contains a blank column and rows. An Attributes column also contains nine rows with A1, A2, and A3 repeated three times. Finally, a Values column contains values V1 through V9.  
:::image-end:::

For example, given a table like the following, where country rows and date columns create a matrix of values, it's difficult to analyze the data in a scalable way.

:::image type="complex" source="media/unpivot-column/unpivot-initial-table.png" alt-text="Unpivot columns sample initial table.":::
   Screenshot of a table containing a Country column set in the Text data type, and three columns with the dates June 1, 2023, July 1, 2023, and August 1, 2023 set as the Whole number data type. The Country column contains USA in row 1, Canada in row 2, and Panama in row 3.
:::image-end:::

Instead, you can transform the table into a table with unpivoted columns, as shown in the following image. In the transformed table, it's easier to use the date as an attribute to filter on.

:::image type="complex" source="media/unpivot-column/unpivot-final-table.png" alt-text="Unpivot columns sample goal table.":::
   Screenshot of the table containing a Country column set as the Text data type, an Attribute column set as the Text data type, and a Value column set as the Whole number data type. The Country column contains USA in the first three rows, Canada in the next three rows, and Panama in the last three rows. The Attribute column contains the June 1, 2023 date in the first, fourth, and seventh rows. The July 1, 2023 date appears in the second, fifth, and eighth rows. Finally, the August 1, 2023 date is found in the third, sixth, and ninth rows.
:::image-end:::

The key in this transformation is that you have a set of dates in the table that should all be part of a single column. The respective value for each date and country should be in a different column, effectively creating an attribute-value pair.

Power Query always creates the attribute-value pair by using two columns:

- **Attribute**: The name of the column headings that were unpivoted.
- **Value**: The values that were underneath each of the unpivoted column headings.

There are multiple places in the user interface where you can find **Unpivot columns**. You can right-click the columns that you want to unpivot, or you can select the command from the **Transform** tab in the ribbon.

:::image type="content" source="media/unpivot-column/unpivot-right-click.png" alt-text="Screenshot of the right-click operation to unpivot columns.":::

:::image type="content" source="media/unpivot-column/unpivot-transform-tab.png" alt-text="Screenshot of the Unpivot columns command on the Transform tab.":::

There are three ways that you can unpivot columns from a table:

- **Unpivot columns**
- **Unpivot other columns**
- **Unpivot only selected columns**

<!--markdownlint-disable MD024-->
## Unpivot columns
<!--markdownlint-enable MD024-->

For the previously described scenario, you first need to select the columns you want to unpivot. You can select **Ctrl** as you select as many columns as you need. For this scenario, you want to select all the columns except the one named **Country**. After selecting the columns, right-click any of the selected columns, and then select **Unpivot columns**.

:::image type="complex" source="media/unpivot-column/unpivot-columns-right-click.png" alt-text="Demonstrates how to unpivot the date columns in the table.":::
   Screenshot of the table with the June 1, 2023, July 1, 2023, and August 1 2023 columns selected, and the Unpivot columns command selected in the shortcut menu."
:::image-end:::

The result of that operation yields the result shown in the following image.

:::image type="complex" source="media/unpivot-column/unpivot-columns-final-table.png" alt-text="Unpivot columns final table." lightbox="media/unpivot-column/unpivot-columns-final-table.png":::
   Screenshot of the table containing a Country column set as the Text data type, an Attribute column set as the Text data type, and a Value column set as the Whole number data type. The Country column contains USA in the first three rows, Canada in the next three rows, and Panama in the last three rows. The Attribute column contains the June 1, 2023 date in the first, fourth, and seventh rows. The July 1, 2023 date is in the second, fifth, and eighth rows. The August 1, 2023 date appears in the third, sixth, and ninth rows. In addition, the Unpivot columns entry is emphasized in the Query settings pane and the M language code is shown in the formula bar.
:::image-end:::

### Special considerations

After creating your query from the previous steps, imagine that your initial table gets updated to look like the following screenshot.

:::image type="complex" source="media/unpivot-column/unpivot-updated-source-table.png" alt-text="Unpivot columns updated source table.":::
   Screenshot of the table with the same original Country, June 1, 2023, July 1, 2023, and August 2023 date columns, with the addition of a September 1, 2023 date column. The Country column still contains the USA, Canada, and Panama values, but also has UK added to the fourth row and Mexico added to the fifth row.
:::image-end:::

Notice that you're adding a new column for the date September 1, 2023 (**9/1/2023**), and two new rows for the countries/regions UK and Mexico.

If you refresh your query, notice that the operation is done on the updated column, but doesn't affect the column that wasn't originally selected (**Country**, in this example). This behavior means that any new column that you added to the source table is unpivoted as well.

The following image shows what your query looks like after the refresh with the new updated source table.

:::image type="complex" source="media/unpivot-column/unpivot-columns-final-updated-table.png" alt-text="Unpivot columns final updated table.":::
   Screenshot of the table with Country, Attribute, and Value columns. The first four rows of the Country column contain USA, the second four rows contains Canada, the third four rows contains Panama, the fourth four rows contains UK, and the fifth four rows contains Mexico. The Attribute column contains the June 1, 2023, July 1, 2023, and August 2023 dates in the first four rows, which are repeated for each country.
:::image-end:::

## Unpivot other columns

You can also select the columns that you don't want to unpivot and unpivot the rest of the columns in the table. This operation is where **Unpivot other columns** comes into play.

:::image type="content" source="media/unpivot-column/unpivot-other-columns.png" alt-text="Screenshot of the table with the Country column shortcut menu selected and the Unpivot other columns command emphasized.":::

The result of that operation yields exactly the same result as the one you got from **Unpivot columns**.

:::image type="complex" source="media/unpivot-column/unpivot-other-columns-final-table.png" alt-text="Unpivot other columns sample goal table.":::
   Screenshot of the table containing a Country column set as the Text data type, an Attribute column set as the Text data type, and a Value column set as the Whole number data type. The Country column contains USA in the first three rows, Canada in the next three rows, and Panama in the last three rows. The Attribute column contains the June 1, 2023 date in the first, fourth, and seventh rows. The July 1, 2023 date is in the second, fifth, and eighth rows. The August 1, 2023 date appears in the third, sixth, and ninth rows.
:::image-end:::

> [!NOTE]
> This transformation is crucial for queries that have an unknown number of columns. The operation unpivots all columns from your table except the ones that you selected. This type of transformation is an ideal solution if the data source of your scenario got new date columns in a refresh, because those new columns get picked up and unpivoted.

<!--markdownlint-disable MD024-->
### Special considerations
<!--markdownlint-enable MD024-->

Similar to the **Unpivot columns** operation, if your query is refreshed and more data is picked up from the data source, all the columns are unpivoted except the ones that were previously selected.

To illustrate this process, say that you have a new table like the one in the following image.

:::image type="complex" source="media/unpivot-column/unpivot-updated-source-table.png" alt-text="Sample unpivot source table.":::
   Screenshot of the table with Country, June 1, 2023, July 1, 2023, August 1, 2023, and September 1, 2023 columns, with all columns set to the Text data type. The Country column contains, from top to bottom, USA, Canada, Panama, UK, and Mexico.
:::image-end:::

You can select the **Country** column, and then select **Unpivot other column**, which yields the following result.

:::image type="complex" source="media/unpivot-column/unpivot-other-columns-updated-final-table.png" alt-text="Sample unpivot other columns updated final table.":::
   Screenshot of the table with Country, Attribute, and Value columns. The Country and Attribute columns are set to the Text data type. The Value column is set to the Whole value data type. The first four rows of the Country column contain USA, the second four rows contains Canada, the third four rows contains Panama, the fourth four rows contains UK, and the fifth four rows contains Mexico. The Attribute column contains June 1, 2023, July 1, 2023, August 1, 2023, and September 1, 2023 in the first four rows, which are repeated for each country.
:::image-end:::

## Unpivot only selected columns

The purpose of this last option is to only unpivot specific columns from your table. This option is important for scenarios where you're dealing with an unknown number of columns from your data source. It allows you to unpivot only the selected columns.

To perform this operation, select the columns to unpivot, which in this example is all the columns except the **Country** column. Then right-click any of the columns you selected, and then select **Unpivot only selected columns**.

:::image type="content" source="media/unpivot-column/unpivot-only-selected-columns-right-click.png" alt-text="Screenshot of the table with the date columns selected, and the Unpivot only selected columns emphasized.":::

Notice how this operation yields the same output as the previous examples.

:::image type="complex" source="media/unpivot-column/unpivot-only-selected-columns-final-table.png" alt-text="Unpivot only selected columns final table.":::
   Screenshot of the table containing a Country column set as the Text data type, an Attribute column set as the Text data type, and a Value column set as the Whole number data type. The Country column contains USA in the first three rows, Canada in the next three rows, and Panama in the last three rows. The Attribute column contains the June 1, 2023 date in the first, fourth, and seventh rows. The July 1, 2023 date is in the second, fifth, and eighth rows. The August 1, 2023 date appears in the third, sixth, and ninth rows.
:::image-end:::

<!--markdownlint-disable MD024-->
### Special considerations
<!--markdownlint-enable MD024-->

After doing a refresh, if our source table changes to have a new **9/1/2020** column and new rows for UK and Mexico, the output of the query is different from the previous examples. Say that our source table, after a refresh, changes to the table in the following image.

:::image type="content" source="media/unpivot-column/unpivot-updated-source-table.png" alt-text="Screenshot of the unpivot updated source table for unpivot only selected columns.":::

The output of our query looks like the following image.

:::image type="content" source="media/unpivot-column/unpivot-only-selected-columns-updated-final-table.png" alt-text="Screenshot of the Unpivot only selected columns updated final table.":::

It looks like this because the unpivot operation was applied only on the **6/1/2020**, **7/1/2020**, and **8/1/2020** columns, so the column with the header **9/1/2020** remains unchanged.
