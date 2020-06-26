---
title: Data preview tools
description: Data preview tools
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
---

# Data preview tools

The main objective of the data preview tools is to provide the user with new and intuitive ways to clean, transform, and understand their data within the Power Query Editor window.

These data preview tools are:

* Column quality

* Column distribution

* Column profile

To enable the data preview tools, select the **View** tab from the ribbon and navigate to the **Data Preview** section. Enable the options you want as shown in the following image.

![Data preview tools](images/me-enable-data-preview-tools.png)

Once enabled, the following image shows how they'll be seen inside Power Query Editor.

![Data preview tools enabled](images/me-data-preview-tools-enabled-v2.png)

Each tool is independent from the other. This means that you can select which ones to enable and which ones you would like to keep as disabled.

>[!NOTE] 
>By default, Power Query will perform these data preview features over the first 1,000 rows of your data. To enable these, check the bottom left query of your editor window to change how the column profiling is performed.

## Column quality
The column quality feature provides the user with a simple visual that labels values in rows with values in three categories:

* **Valid**&mdash;shown in green

* **Error**&mdash;shown in red

* **Empty**&mdash;shown in dark grey

These indicators are displayed right underneath the name of the column as part of a small bar chart, as shown in the following image.

![Data Quality](images/me-data-quality.png)

Also, a percentage the number of records within each column quality category is also displayed.

By hovering over any of the columns, you can see the numerical distribution of the quality of values throughout the column. Additionally, selecting the ellipsis button (...) opens some quick action buttons for operations on the values.

![Data Quality hover options](images/me-column-quality-hover.png)

## Column distribution

This feature provides a set of visuals underneath the names of the columns that showcases the frequency and distribution of the values in each of the columns. The data inside these visualizations is sorted in descending order from the value with the higher frequency.

![Column Distribution](images/me-column-distribution.png)

Besides giving information on the overall data inside the column (with distinct count and unique values), hover over operations are also available.

![Column Distributions hover options](images/me-column-distribution-hover.png)

## Column profile

This feature provides a more in-depth look at the data within a column. Apart from the column distribution chart, there's also a column statistics chart. This information is displayed underneath the data preview section as shown in the following image.

![Column Profile](images/me-column-profile.png)

### Filter by value

You can interact with the value distribution chart on the right and select any of the bars by hovering over the parts of the chart.  

![Column Profile Filter by value](images/me-column-profile-hover.png)

Right-click to display a set of available transformations for that value.

![Column Profile right click](images/column-profile-right-click.png)

### Copy data

On the top right-hand corner of both the column statistics and value distribution sections, there's an ellipsis button (...). When you select the button, a contextual menu is displayed. In this menu, there's an option to copy the contents of the data displayed in either section to the clipboard.

![Copy column statistics](images/me-copy-column-statistics.png)

### Group by value

When you select the ellipsis on the top right-hand corner of the value distribution chart, you'll also get the option to use the **Group by** feature. This feature groups your values in the chart by a set of available options. 

![Group by in Value distribution](images/me-value-distribution-group-by.png)

The image below demonstrates grouping a column of product names by the text length. Once the values have been grouped in the chart, you can interact with it as described in [Filter by value](#filter-by-value).

![Group by text length](images/me-text-length-distribution.png)
