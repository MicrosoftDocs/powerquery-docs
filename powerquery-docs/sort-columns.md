---
title: Sort columns
description: With Power Query, you can sort a table by one or multiple columns in the order of your choice. This article demonstrates how to sort columns in Power Query.
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
ms.custom: edited
---

# Sort columns

You can sort a table in Power Query by one column or multiple columns. For example, take the following table with the columns named<!--I'm going to suggest using column heading terminology to be consistent with other articles, and also to avoid using **Field** as if it were a UI string.--> **Competition**, **Competitor**, and **Position**.

![Sample source table](images/me-sort-by-column-start.png "needs detailed alt text")

For this example, the goal is to sort this table by the **Competition** and **Position** fields in ascending order.

![Sample output table](images/me-sort-by-column-final.png "needs detailed alt text")

## To sort a table by using columns

To sort the table, first select the column to be sorted. After the column has been selected, you can select the sort operation from one of two places:

- On the **Home** tab, in the **Sort** group, you'll see the icons to sort your column in either ascending or descending order.

   ![Sort column button on the Home tab](images/me-sort-by-column-sort-group.png "Sort column button on the Home tab")

- From the column heading drop-down menu. Next to the name of the column you'll see a drop-down menu indicator :::image type="icon" source="images/col-head-drop-down-menu.png":::. When you select the icon, you'll see the option to sort the column.

  ![Sort commands on the column heading drop-down menu](images/me-sort-by-column-sort-icons.png "Sort commands on the column heading drop-down menu")

In this example, first you need to sort the **Competition** column. You'll perform the operation by using the buttons in the **Sort** group on the **Home** tab. See how this action creates a new step in the **Applied steps** section named **Sorted rows**.

![Sorted rows step in the Applied steps section](images/me-sort-by-column-sort-step.png "Sorted rows step in the Applied steps section")

A visual indicator, displayed as an arrow pointing up, gets added to the **Competitor** drop-down menu icon to show that the column is being sorted in ascending order.

Now you'll sort the **Position** field in ascending order as well, but this time you'll use the **Position** column heading drop-down menu.

![Sort commands on the Position drop-down menu](images/me-sort-by-column-position.png "Sort commands on the Position drop-down menu")

Notice that this action doesn't create a new **Sorted rows** step, but modifies it to perform both sort operations in one step.<!--Suggested.--> When you sort multiple columns, the order that the columns are sorted in is based on the order the columns were selected in.<!--Suggested.--> A visual indicator, displayed as a number to the left of the drop-down menu indicator, shows the place each column occupies in the sort order.<!--Suggested.-->

![Sorted columns with numbers that represent the sort order](images/me-sort-by-column-multi-column-sort.png "Sorted columns with numbers that represent the sort order")

## To clear a sort operation from a column
<!--Edits okay? I wasn't sure what was happening here.-->
Do one of the following:

- Select the down arrow next to the column heading, and then select **Clear sort**.
- In **Applied steps** on the **Query Settings** pane, delete the **Sorted rows** step.
