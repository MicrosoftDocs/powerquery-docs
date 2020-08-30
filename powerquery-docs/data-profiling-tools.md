---
title: Data profiling tools
description: Overview of the Data Quality, Column Distribution, and Column Profile features found inside the Power Query Editor
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
ms.custom: edited
---

# Data profiling tools

The data profiling tools provide new and intuitive ways to clean, transform, and understand data in Power Query Editor. They include:

* Column quality

* Column distribution

* Column profile

To enable the data profiling tools, go to the **View** tab on the ribbon. Enable the options you want in the **Data preview** group, as shown in the following image.<!--The image is a bit misleading, since it only shows **Show whitespace** enabled. Suggest re-creating with more of the options enabled.-->

![Data profiling tools](images/me-enable-data-preview-tools.png "Data profiling tools")

After you enable the options, you'll see something like the following image in Power Query Editor.

![Data profiling tools enabled](images/me-data-preview-tools-enabled-v2.png "Data profiling tools enabled")

>[!NOTE]
>By default, Power Query will perform this data profiling over the first 1,000 rows of your data. To have it operate over the entire dataset, check the lower-left corner of your editor window to change how column profiling is performed.<!--Edit okay? This was confusing to me.-->

## Column quality

The column quality feature labels values in rows in three categories:

* **Valid**, shown in green

* **Error**, shown in red

* **Empty**, shown in dark grey

These indicators are displayed directly underneath the name of the column as part of a small bar chart, as shown in the following image.

![Data quality](images/me-data-quality.png "needs detailed alt text")

The number of records in each column quality category is also displayed as a percentage.

By hovering over any of the columns, you can see the numerical distribution of the quality of values throughout the column. Additionally, selecting the ellipsis button (...) opens some quick action buttons for operations on the values.

![Data quality options](images/me-column-quality-hover.png "needs detailed alt text")

## Column distribution

This feature provides a set of visuals underneath the names of the columns that showcase the frequency and distribution of the values in each of the columns. The data in these visualizations is sorted in descending order from the value with the highest frequency.

![Column distribution](images/me-column-distribution.png "Column distribution")

Besides getting information about the overall data in the column (with distinct count and unique values), you can select the ellipsis button and choose from a menu of available operations.

![Column distributions options](images/me-column-distribution-hover.png "needs detailed alt text")

## Column profile

This feature provides a more in-depth look at the data in a column. Apart from the column distribution chart, it displays<!--Edit okay? Wasn't sure what was the agent of action here. --> a column statistics chart. This information is displayed underneath the data preview section, as shown in the following image.

![Column profile](images/me-column-profile.png "Column profile")

### Filter by value

You can interact with the value distribution chart on the right side and select any of the bars by hovering over the parts of the chart.  

![Column profile filter by value](images/me-column-profile-hover.png "needs detailed alt text")

Right-click to display a set of available transformations for that value.

![Column profile shortcut menu](images/column-profile-right-click.png "needs detailed alt text")

### Copy data

In the upper-right corner of both the column statistics and value distribution sections, you can select the ellipsis button (...) to display a **Copy** shortcut menu. Select it to copy the data displayed in either section to the clipboard.

![Copy column statistics](images/me-copy-column-statistics.png "Copy column statistics")

### Group by value

When you select the ellipsis button (...) in the upper-right corner of the value distribution chart, in addition to **Copy** you can select **Group by**. This feature groups the values in your chart by a set of available options.

![Group by value distribution](images/me-value-distribution-group-by.png "Group by value distribution")

The image below shows a column of product names that have been grouped by text length. After the values have been grouped in the chart, you can interact with it<!--I'm not sure what this means. This highlights the main problem with describing the UI as opposed to writing task-oriented content. Sections like this just kind of dangle because they're not integrated into anything. We haven't given the reader a reason to read this.--> as described in [Filter by value](#filter-by-value).

![Group by text length](images/me-text-length-distribution.png "needs detailed alt text")
