---
title: "Choose or remove columns"
description: Describes how to keep columns in a table by either choosing to keep or choosing to remove specific columns. 
author: ptyx507
ms.date: 7/24/2024
ms.author: miescobar
---

# Choose or remove columns

At times, you might need to choose between the columns in a table you want to keep and the columns you want to remove. You can accomplish this task by either choosing the columns to keep, or choosing the columns to remove. **Choose columns** and **Remove columns** are operations that help you define what columns your table needs to keep and which ones it needs to remove. This article showcases how to use the **Choose columns** and **Remove columns** commands by using the following sample table for both operations.

:::image type="content" source="media/choose-remove-columns/choose-remove-columns-sample-table.png" alt-text="Screenshot of the sample table containing three rows of data with columns for date, product, sales person, units, GUID, and report created by." lightbox="media/choose-remove-columns/choose-remove-columns-sample-table.png":::

The goal is to create a table that contains only the date, product, sales person, and units columns.

:::image type="content" source="media/choose-remove-columns/choose-remove-columns-sample-final-table.png" alt-text="Screenshot of the final table containing three rows of data with columns for date, product, salesperson, and units.":::

## Choose columns

On the **Home** tab, in the **Manage columns** group, select **Choose columns**.

:::image type="content" source="media/choose-remove-columns/choose-remove-columns-choose-columns-icon.png" alt-text="Screenshot of the Power Query Home tab ribbon with the Choose columns option emphasized.":::

The **Choose columns** dialog appears, containing all the available columns in your table. You can select all the fields that you want to keep and remove specific fields by clearing their associated check box. For this example, you want to remove the **GUID** and **Report created by** columns, so you clear the check boxes for those fields.

:::image type="content" source="media/choose-remove-columns/choose-remove-columns-choose-columns-window.png" alt-text="Screenshot of the Choose columns dialog with the date, product, sales person, and units columns selected.":::

After selecting **OK**, you create a table that only contains the **Date**, **Product**, **SalesPerson**, and **Units** columns.

:::image type="content" source="media/choose-remove-columns/choose-remove-columns-sample-final-table-2.png" alt-text="Screenshot of the final table with the date, product, sales person, and units columns remaining.":::

## Remove columns

When you select **Remove columns** from the **Home** tab, you have two options:

* **Remove columns**: Removes the selected columns.
* **Remove other columns**: Removes all columns from the table *except* the selected ones.

:::image type="content" source="media/choose-remove-columns/choose-remove-columns-remove-columns-icon.png" alt-text="Screenshot of the remove columns menu options with both options emphasized.":::

You can also select the columns you want to remove in the table, then select and hold (or right-click) the column and choose **Remove columns** in the shortcut menu. This method of removing columns is demonstrated in the next section.

### Remove selected columns

Starting from the sample table, select the **GUID** and the **Report created** columns. Select and hold (or right-click) either of the selected column headings. A new shortcut menu appears, where you can select the **Remove columns** command.

:::image type="content" source="media/choose-remove-columns/choose-remove-columns-remove-columns-right-click.png" alt-text="Screenshot of the table column shortcut menu with Remove columns emphasized.":::

After selecting **Remove columns**, you create a table that only contains the **Date**, **Product**, **SalesPerson**, and **Units** columns.

:::image type="content" source="media/choose-remove-columns/choose-remove-columns-sample-final-table-3.png" alt-text="Screenshot of the final table with the selected GUID and Report created by columns removed.":::

### Remove other columns

Starting from the sample table, select all the columns from the table except **GUID** and **Report created**. On the **Home** tab, select **Remove columns** > **Remove other columns**.

:::image type="content" source="media/choose-remove-columns/choose-remove-columns-remove-other-columns-icon.png" alt-text="Screenshot of the Power Query Home tab ribbon with the Remove other columns option emphasized.":::

After selecting **Remove other columns**, you create a table that only contains the **Date**, **Product**, **SalesPerson**, and **Units** columns.

:::image type="content" source="media/choose-remove-columns/choose-remove-columns-sample-final-table-4.png" alt-text="Screenshot of the final table with the nonselected GUID and Report created by columns removed.":::
