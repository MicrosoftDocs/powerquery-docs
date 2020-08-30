---
title: "Choose or remove columns"
description: An article on how to choose or remove specific columns from a table. 
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 07/19/2020
ms.author: v-miesco
ms.custom: edited
---

# Choose or remove columns
<!--We don't use the same image multiple times. We'll actually get build warnings for that in a month or so. Suggest naming the first instance and then harkening back to it, as shown below. I'm not sure whether this should be a table caption or a figure caption. We don't usually number a table or figure if there's only one in the article, but I want to be able to refer back to it.-->
**Choose columns** and **Remove columns** are operations that help you define what columns your table needs to keep and which ones it needs to remove. This article will showcase how to use the **Choose columns** and **Remove columns** commands by using the following sample table for both operations.
<!--This would be a good candidate for an HTML table.-->
![Sample table](images/me-choose-remove-columns-sample-table.png "needs detailed alt text")

The goal is to create a table that looks like the following.

*Table 1. Final table for the choose and remove columns example*
![Final table](images/me-choose-remove-columns-sample-final-table.png "Final table")

## Choose columns

On the **Home** tab, in the **Manage columns** group, select **Choose columns**.

![Choose columns command](images/me-choose-remove-columns-choose-columns-icon.png "Choose columns command")

The **Choose columns** dialog box appears, containing all the available fields (columns)<!--Edit okay?--> in your table. You can select all the fields that you want to keep and remove specific fields by clearing their associated check box. For this example, you want to remove the **GUID** and **Report created by** columns, so you clear the check boxes for those fields.

![Choose columns dialog box](images/me-choose-remove-columns-choose-columns-window.png "Choose columns dialog box")

After selecting **OK**, you'll create a table that looks like Table 1, shown earlier in this article.
<!--
![Final table](images/me-choose-remove-columns-sample-final-table.png "Final table")
-->

## Remove columns

When you select **Remove columns** from the **Home** tab, you have two options:

* **Remove columns**: Removes the selected columns.
* **Remove other columns**: Removes all columns from the table *except*<!--Edit okay?--> the selected ones.

![Remove columns menu options](images/me-choose-remove-columns-remove-columns-icon.png "Remove columns menu options")

### Remove selected columns

Starting from the sample table, select the **GUID** and the **Report created** columns. Right-click to select any of the column headings. A new shortcut menu appears, where you can select the **Remove columns** command.

![Table column shortcut menu](images/me-choose-remove-columns-remove-columns-right-click.png "Table column shortcut menu")

<!--
Alternatively, you can select **Remove columns** from the ribbon. The item found in this shortcut menu is exactly the same as the one found in the ribbon.
-->

After selecting **Remove columns**, you'll create a table that looks like Table 1, shown earlier in this article.
<!--
![Final table](images/me-choose-remove-columns-sample-final-table.png "[Final table")
-->

### Remove other columns

Starting from the sample table, select all the columns from the table except **GUID** and **Report created**. On the **Home** tab, select **Remove columns** > **Remove other columns**.<!--Edit okay?-->

![Remove other columns command](images/me-choose-remove-columns-remove-other-columns-icon.png "Remove other columns command")

After selecting **Remove other columns**, you'll create a table that looks like Table 1, shown earlier in this article.
<!--
![Final table](images/me-choose-remove-columns-sample-final-table.png "Final table")
-->
