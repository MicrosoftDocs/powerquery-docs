---
title: Replace values and errors
description: In Power Query, you can replace values and errors found in one or multiple columns with a value of your choice. This article demonstrates how to do this transformation in Power Query.
author: ptyx507
ms.date: 12/12/2022
ms.author: miescobar
ms.custom: edited
---

# Replace values and errors

With Power Query, you can replace one value with another value wherever that value is found in a column. The **Replace values** command can be found:

- On the cell shortcut menu. Right-click the cell to replace the selected value in the column with another value.

   ![Shortcut menu for replacing the selected value.](media/replace-values/right-click.png "Shortcut menu for replacing the selected value")

- On the column shortcut menu.

   ![Shortcut menu for replacing the selected column.](media/replace-values/right-click-column.png "Shortcut menu for replacing the selected column")

- On the **Home** tab, in the **Transform** group.

   ![Replace values on the Home tab.](media/replace-values/home-tab.png "Replace values on the Home tab")

- On the **Transform** tab, in the **Any column** group.

   ![Replace values on the Transform tab.](media/replace-values/transform-tab.png "Replace values on the Transform tab")

The replace values operation has two modes:

- **Replace entire cell contents**: This is the default behavior for non-text columns, where Power Query searches for and replaces the full contents of a cell. You can enable this mode for text columns by selecting **Advanced options**, and then selecting the **Match entire cell contents** check box.
- **Replace instances of a text string**: This is the default behavior for text columns, where Power Query will search for a specific text string in all rows of a column and replace as many instances of the text string that it finds.

Advanced options are only available in columns of the Text data type. Within that set of options is the **Replace using special characters** option.

![Replace using special characters option.](media/replace-values/replace-using-special-characters.png "Replace using special characters option")

## Replace entire cell contents

Imagine a table like the following, where you have columns for **Account ID**, **Category Name**, and **Sales Goal**.

![Initial sample table with -1 in the first row of the Sales Goal column.](media/replace-values/original-table.png "Initial sample table with -1 in the first row of the Sales Goal column")

The value of **-1** in the **Sales Goal** column is an error in the source and needs to be replaced with the standard sales goal defined by the business for these instances, which is 250,000. To do that, right-click the **-1** value, and then select **Replace values**. This action will bring up the **Replace values** dialog box with **Value to find** set to **-1**. Now all you need to do is enter **250000** in the **Replace with** box.

![Replace values for a non-text column.](media/replace-values/replace-values-numeric.png "Replace values for a non-text column")

The outcome of that operation will give you the result that you're looking for.

![Output sample table after the -1 value in the first row of the Sales Goal column was replaced with 250000.](media/replace-values/original-after-numeric-replace.png "Output sample table after the -1 value in the first row of the Sales Goal column was replaced with 250000")

## Replace instances of a text string

Continuing with the previous table, let's say you want to remove the text string "Category Name: " from the **Category Name** column. To do that, go to the **Transform** group on the **Home** tab, and select **Replace values**. In the **Replace values** dialog box, enter the text string **Category Name:** (followed by a space) in the **Value to find** box, leave the **Replace with** box empty, and then select **OK**.

![Replace values for a text column.](media/replace-values/replace-values-text.png "Replace values for a text column")

The result of that operation gives you the table in the following image.

![Table with the Category Name: text removed from all rows of the Category Name column, leaving only the actual category name.](media/replace-values/final-table.png "Table with the Category Name: text removed from all rows of the Category Name column, leaving only the actual category name")
