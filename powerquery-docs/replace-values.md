---
title: Replace values and errors
description: In Power Query, you can replace values and errors found in one or multiple columns with a value of your choice. This article demonstrates how to do this transformation in Power Query.
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
ms.custom: edited
---

# Replace values and errors

With Power Query, you can replace one value with another value wherever that value is found in a column. The **Replace values** command can be found:

- On the cell shortcut menu. Right-click the cell to replace the selected value in the column with another value. 

   ![Shortcut menu for replacing the selected value](images/me-replace-values-right-click.png "Shortcut menu for replacing the selected value")

- On the column shortcut menu.

   ![Shortcut menu for replacing the selected column](images/me-replace-values-right-click-column.png "Shortcut menu for replacing the selected column")

- On the **Home** tab, in the **Transform** group.

   ![Replace values on the Home tab](images/me-replace-values-home-tab.png "Replace values on the Home tab")

- On the **Transform** tab, in the **Any column** group.

   ![Replace values on the Transform tab](images/me-replace-values-transform-tab.png "Replace values on the Transform tab")

<!--I lost the story in this section; the following edits are suggested. You don't want to have just one H2, so I promoted the H3s.-->
The replace values operation has two modes:

- **Replace entire cell contents**: This is the default behavior for non-text columns, where Power Query searches for and replaces the full contents of a cell. You can enable this mode for text columns by selecting **Advanced options**, and then selecting the **Match entire cell contents** check box.
- **Replace instances of a text string**: This is the default behavior for text columns, where Power Query will search for a specific text string in all rows of a column and replace as many instances of the text string that it finds.

Advanced options are only available in columns of the Text data type. Within that set of options is the **Replace using special characters** option.

![Replace using special characters option](images/me-replace-values-replace-using-special-characters.png "Replace using special characters option")

## Replace entire cell contents

Imagine a table like the following, where you have columns for **Account ID**, **Category Name**, and **Sales Goal**.

![Initial sample table](images/me-replace-values-original-table.png "needs detailed alt text")

The value of **-1** in the **Sales Goal** column is an error in the source and needs to be replaced with the standard sales goal defined by the business for these instances, which is 250,000. To do that, right-click the **-1** value, and then select **Replace values**. This action will bring up the **Replace values** dialog box with **Value to find** set to **-1**. Now all you need to do is enter **250000** in the **Replace with** box.

![Replace values for a non-text column](images/me-replace-values-numeric.png "Replace values for a non-text column")

The outcome of that operation will give you the result that you're looking for.

![Output sample table after values are replaced](images/me-replace-values-original-after-numeric-replace.png "needs detailed alt text")

## Replace instances of a text string

Continuing with the previous table, let's say you want to remove the text string "Category Name: " from the **Category Name** column. To do that, go to the **Transform** group on the **Home** tab, and select **Replace values**. In the **Replace values** dialog box, enter the text string **Category Name:** (followed by a space) in the **Value to find** box, leave the **Replace with** box empty, and then select **OK**.

![Replace values for a text column](images/me-replace-values-text.png "Replace values for a text column")

The result of that operation gives you the table in the following image.

![Output sample table after values replaced](images/me-replace-values-final-table.png "needs detailed alt text")
