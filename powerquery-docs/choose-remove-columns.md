---
title: "Choose or remove columns"
description: An article on how to choose or remove specific columns from a table. 
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 07/19/2020
ms.author: v-miesco
---

# Choose or remove columns

**Choose columns** and **Remove columns** are operations that help you define what columns your table needs to keep and which ones it needs to remove.

This article will showcase how to use the **Choose columns** and **Remove columns** features by using the following sample table for both operations.

![Sample table](images/me-choose-remove-columns-sample-table.png)

The goal of both features is to reach the following desired table.

![Final table](images/me-choose-remove-columns-sample-final-table.png)

## Choose columns

**Choose columns** can be found inside the **Home** tab, under the **Manage columns** group.

![Choose columns item in the menu](images/me-choose-remove-columns-choose-columns-icon.png)

After selecting this item, a new window called **Choose columns** will appear that contains all the available fields in your table. Within this window, you can select all the fields that you want to keep. You remove specific fields from your table by clearing the associated check box. For this example, you want to remove the **GUID** and **Report created** by columns, so you clear those fields from this window.

![Choose columns window](images/me-choose-remove-columns-choose-columns-window.png)

After selecting **OK**, you'll reach the desired goal.

![Final table](images/me-choose-remove-columns-sample-final-table.png)

## Remove columns

The **Remove columns** menu item provides two options from its dropdown menu:
* **Remove columns**&mdash;removes the selected columns.
* **Remove other columns**&mdash;removes all columns from the table except the selected ones.

![Remove columns options](images/me-choose-remove-columns-remove-columns-icon.png)

### Remove selected columns

Starting from the sample table, select the **GUID** and the **Report created** columns. Right-click on any of the column headers. A new contextual menu will appear where you can select the **Remove columns** option.

![Table Column Right click contextual menu](images/me-choose-remove-columns-remove-columns-right-click.png)

Alternatively, you can also use **Remove columns** from the ribbon. The item found in this contextual menu is exactly the same as the one found in the ribbon.

After selecting **Remove columns**, you'll reach the desired goal.

![Final table](images/me-choose-remove-columns-sample-final-table.png)

### Remove other columns

Starting from the sample table, select all the columns from the table except the **GUID** and the **Report created** columns. Select **Remove other columns** from the **Remove columns** dropdown menu inside the **Manage columns** group in the **Home** tab.

![Remove other columns button](images/me-choose-remove-columns-remove-other-columns-icon.png)

After selecting **Remove other columns**, you'll reach the desired goal.

![Final table](images/me-choose-remove-columns-sample-final-table.png)