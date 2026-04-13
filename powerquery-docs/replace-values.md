---
title: Replace values and errors
description: In Power Query, you can replace values and errors found in one or multiple columns with a value of your choice. This article demonstrates how to do this transformation in Power Query.
author: ptyx507
ms.date: 8/16/2024
ms.author: miescobar
ms.subservice: transform-data
---

# Replace values and errors

With Power Query, you can replace one value with another value wherever that value is found in a column. The **Replace values** command can be found:

- On the cell shortcut menu. Select and hold (or right-click) the cell to replace the selected value in the column with another value.

   :::image type="content" source="media/replace-values/right-click.png" alt-text="Screenshot of the shortcut menu for replacing the selected value.":::

- On the column shortcut menu.

   :::image type="content" source="media/replace-values/right-click-column.png" alt-text="Screenshot of the shortcut menu for replacing the selected column.":::

- On the **Home** tab, in the **Transform** group.

   :::image type="content" source="media/replace-values/home-tab.png" alt-text="Screenshot of the Replace values on the Home tab." lightbox="media/replace-values/home-tab.png":::

- On the **Transform** tab, in the **Any column** group.

   :::image type="content" source="media/replace-values/transform-tab.png" alt-text="Screenshot of the Replace values on the Transform tab.":::

The replace values operation has two modes:

- **Replace entire cell contents**: This mode is the default behavior for nontext columns, where Power Query searches for and replaces the full contents of a cell. You can enable this mode for text columns by selecting the **Advanced** option in the **Replace values** dialog, and then selecting the **Match entire cell contents** check box.
- **Replace instances of a text string**: This mode is the default behavior for text columns. Power Query searches for a specific text string in all rows of a column and replaces as many instances of the text string that it finds.

Advanced options are only available in columns of the `text` data type. Within that set of options is the **Use special characters** option.

:::image type="content" source="media/replace-values/replace-using-special-characters.png" alt-text="Screenshot of the Replace values advance options with the special characters option selected.":::

## Replace entire cell contents

Imagine a table like the following, where you have columns for **Account ID**, **Category Name**, and **Sales Goal**.

:::image type="content" source="media/replace-values/original-table.png" alt-text="Screenshot of the initial sample table with -1 in the first row of the Sales Goal column.":::

The value of **-1** in the **Sales Goal** column is an error in the source and needs to be replaced with the standard sales goal defined by the business for these instances, which is 250,000. To do that, select and hold (or right-click) the **-1** value, and then select **Replace values**. This action brings up the **Replace values** dialog with **Value to find** set to **-1**. Now all you need to do is enter **250000** in the **Replace with** box.

:::image type="content" source="media/replace-values/replace-values-numeric.png" alt-text="Screenshot of the basic Replace values for a nontext column.":::

The outcome of that operation gives you the result that you're looking for.

:::image type="content" source="media/replace-values/original-after-numeric-replace.png" alt-text="Screenshot of the output sample table after the -1 value in the first row of the Sales Goal column was replaced with 250000.":::

## Replace instances of a text string

Continuing with the previous table, let's say you want to remove the text string "Category Name: " from the **Category Name** column. To do that, go to the **Transform** group on the **Home** tab, and select **Replace values**. In the **Replace values** dialog box, enter the text string **Category Name:** (followed by a space) in the **Value to find** box, leave the **Replace with** box empty, and then select **OK**.

:::image type="content" source="media/replace-values/replace-values-text.png" alt-text="Screenshot of the Replace values dialog for a text column.":::

The result of that operation gives you the table in the following image.

:::image type="content" source="media/replace-values/final-table.png" alt-text="Screenshot of the table with the Category Name: text removed from all rows of the Category Name column, leaving only the actual category name.":::

## Replace errors

For information on handling cell level errors, including replacing errors, go to [Handling errors at the cell level](dealing-with-errors.md#handling-errors-at-the-cell-level).
