---
title: Using the data profiling tools
description: Overview of the Data Quality, Column Distribution, and Column Profile features found inside the Power Query Editor
author: ptyx507
ms.date: 10/2/2024
ms.author: miescobar
ms.subservice: transform-data
---

# Using the data profiling tools

The data profiling tools provide new and intuitive ways to clean, transform, and understand data in Power Query Editor. They include:

* Column quality

* Column distribution

* Column profile

To enable the data profiling tools, go to the **View** tab on the ribbon. In Power Query Desktop, enable the options you want in the **Data preview** group, as shown in the following image.

:::image type="content" source="media/data-profiling-tools/enable-data-preview-tools.png" alt-text="Screenshot of the Data profiling tools selected under the Power Query View tab." lightbox="media/data-profiling-tools/enable-data-preview-tools.png":::

In Power Query Online, select **Data view**, then enable the options you want in the drop-down list.

:::image type="content" source="media/data-profiling-tools/enable-data-preview-tools-online.png" alt-text="Screenshot of the data profiling tools selected under Data view in the View tab.":::

After you enable the options, you'll see something like the following image in Power Query Editor.

:::image type="content" source="media/data-profiling-tools/data-preview-tools-enabled-v2.png" alt-text="Screenshot of the data profiling tools after they're set up." lightbox="media/data-profiling-tools/data-preview-tools-enabled-v2.png":::

> [!NOTE]
>By default, Power Query performs this data profiling over the first 1,000 rows of your data. To have it operate over the entire data set, select the **Column profiling based on top 1000 rows** message in the lower-left corner of your editor window to change column profiling to **Column profiling based on entire data set**.

## Column quality

The column quality feature labels values in rows in five categories:

* **Valid**, shown in green.

* **Error**, shown in red.

* **Empty**, shown in dark grey.

* **Unknown**, shown in dashed green. Indicates when there are errors in a column, the quality of the remaining data is unknown.

* **Unexpected error**, shown in dashed red.

These indicators are displayed directly underneath the name of the column as part of a small bar chart, as shown in the following image.

:::image type="content" source="media/data-profiling-tools/data-quality.png" alt-text="Screenshot of the enhanced view of the bar chart with data quality indicators and labels above each column in the table." lightbox="media/data-profiling-tools/data-quality.png":::

The number of records in each column quality category is also displayed as a percentage.

By hovering over any of the columns, you're presented with the numerical distribution of the quality of values throughout the column. Additionally, selecting the ellipsis button (...) opens some quick action buttons for operations on the values.

:::image type="content" source="media/data-profiling-tools/column-quality-hover.png" alt-text="Screenshot of the distribution of names column with 701 names valid (100 percent), zero errors and zero empty, with quick action commands displayed.":::

## Column distribution

This feature provides a set of visuals underneath the names of the columns that showcase the frequency and distribution of the values in each of the columns. The data in these visualizations is sorted in descending order from the value with the highest frequency.

:::image type="content" source="media/data-profiling-tools/column-distribution.png" alt-text="Screenshot of the data profiling tools with the upper column distribution emphasized." lightbox="media/data-profiling-tools/column-distribution.png":::

By hovering over the distribution data in any of the columns, you get information about the overall data in the column (with distinct count and unique values). *Distinct* refers to the overall number of different values in each column. *Unique* refers to values that only have a single instance in the column. You can also select the ellipsis button and choose from a menu of available operations.

:::image type="content" source="media/data-profiling-tools/column-distribution-hover.png" alt-text="Screenshot of the data profiling tools with the column distributions options emphasized.":::

## Column profile

This feature provides a more in-depth look at the data in a column. Apart from the column distribution chart, it contains a column statistics chart. This information is displayed underneath the data preview section, as shown in the following image.

:::image type="content" source="media/data-profiling-tools/column-profile.png" alt-text="Screenshot of the data profiling tool with the column profile emphasized." lightbox="media/data-profiling-tools/column-profile.png":::

### Filter by value

You can interact with the value distribution chart on the right side and select any of the bars by hovering over the parts of the chart.

:::image type="content" source="media/data-profiling-tools/column-profile-hover.png" alt-text="Screenshot demonstrating how to hover over the bar in value distribution bar chart, which shows individual data for that bar." lightbox="media/data-profiling-tools/column-profile-hover.png":::

Right-click to display a set of available transformations for that value.

:::image type="content" source="media/data-profiling-tools/column-profile-right-click.png" alt-text="Screenshot demonstrating how to display the shortcut menu with available transformations for a single bar in the value distribution bar chart." lightbox="media/data-profiling-tools/column-profile-right-click.png":::

### Copy data

In the upper-right corner of both the column statistics and value distribution sections, you can select the ellipsis button (...) to display a **Copy** shortcut menu. Select it to copy the data displayed in either section to the clipboard.

:::image type="content" source="media/data-profiling-tools/copy-column-statistics.png" alt-text="Screenshot of the copy shortcut menu in the column statistics column.":::

### Group by value

When you select the ellipsis button (...) in the upper-right corner of the value distribution chart, in addition to **Copy** you can select **Group by**. This feature groups the values in your chart by a set of available options.

:::image type="content" source="media/data-profiling-tools/value-distribution-group-by.png" alt-text="Screenshot of the copy and group by shortcut menu in the value distribution column." lightbox="media/data-profiling-tools/value-distribution-group-by.png":::

The following image shows a column of product names that are grouped by text length. After the values are grouped in the chart, you can interact with individual values in the chart as described in [Filter by value](#filter-by-value).

:::image type="content" source="media/data-profiling-tools/text-length-distribution.png" alt-text="Screenshot of the new bar chart showing the distribution of the text length of store names in the table's Names column." lightbox="media/data-profiling-tools/text-length-distribution.png":::
