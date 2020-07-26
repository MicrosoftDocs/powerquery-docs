---
title: Sort columns
description: With Power Query, you can sort a table by one or multiple columns in the order of your choice. This article demonstrates how to sort columns in Power Query.
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
---

# Sort columns

You can sort a table in Power Query by either one or multiple columns. For example, take the following table with the fields **Competition**, **Competitor**, and **Position**.

![Sample source table](images/me-sort-by-column-start.png)

For this example, the goal is to sort this table by the **Competition** and **Position** fields in ascending order.

![Sample output table](images/me-sort-by-column-final.png)

## To sort a table

To sort the table, first select the column to be sorted. Once the column has been selected, you can select the sort operation from two places:

- **Home tab**&mdash;you'll find a group called **Sort** where you'll see the icons to sort your column by either ascending or descending order.

![Sort column button in Home tab](images/me-sort-by-column-sort-group.png)

- **Field dropdown**&mdash;next to the name of the field you'll see a dropdown icon. When you select the dropdown icon, you'll see the option to sort your column.

![Sort column button in Sort & Filter menu](images/me-sort-by-column-sort-icons.png)

In this example, first you need to do the sort on the **Competition** field. In this case, you've chosen to do the operation through the **Sort** group inside the **Home** tab. See how this action creates a new step in the **Applied Steps** section called **Sorted Rows**.

![Sorted rows step in Applied steps section](images/me-sort-by-column-sort-step.png)

A visual indicator, displayed as an arrow, gets added to the **Field** dropdown to display how the column is being sorted.

Now you can sort by the **Position** field in ascending order as well, but this time you'll do it using the **Field** dropdown menu.

![Sort & Filter menu after selecting the field dropdown icon](images/me-sort-by-column-position.png)

Notice how this action doesn't create a new step, but modifies the existing one to do both sort operations in just one step. When you sort based on multiple columns, the order or hierarchy of the sorting is based on the order that the columns were selected. A visual indicator prior to the **Field** dropdown is displayed, which provides a number that represents the order of this order or hierarchy.   

![Sorted columns with numbers that represent the sort order](images/me-sort-by-column-multi-column-sort.png)

## To clear a sort

You can clear a sort operation of a specific column by going through the **Field** dropdown and selecting **Clear Sort** or by deleting the step from the Applied Steps pane.
