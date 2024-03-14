---
title: "Choose or remove columns"
description: An article on how to choose or remove specific columns from a table. 
author: ptyx507
ms.date: 12/9/2022
ms.author: miescobar
ms.custom: edited
---

# Choose or remove columns

**Choose columns** and **Remove columns** are operations that help you define what columns your table needs to keep and which ones it needs to remove. This article will showcase how to use the **Choose columns** and **Remove columns** commands by using the following sample table for both operations.

![Sample table containing three rows of data with columns for date, product, sales person, unites, GUID, and report created by.](media/choose-remove-columns/choose-remove-columns-sample-table.png "Sample table with six columns")

The goal is to create a table that looks like the following image.

![Final table containing three rows of data with columns for date, product, salesperson, and units.](media/choose-remove-columns/choose-remove-columns-sample-final-table.png "Final table containing three rows of data with columns for date, product, salesperson, and units")

## Choose columns

On the **Home** tab, in the **Manage columns** group, select **Choose columns**.

:::image type="content" source="media/choose-remove-columns/choose-remove-columns-choose-columns-icon.png" alt-text="Choose columns command.":::

The **Choose columns** dialog box appears, containing all the available columns in your table. You can select all the fields that you want to keep and remove specific fields by clearing their associated check box. For this example, you want to remove the **GUID** and **Report created by** columns, so you clear the check boxes for those fields.

:::image type="content" source="media/choose-remove-columns/choose-remove-columns-choose-columns-window.png" alt-text="Choose columns dialog box.":::

After selecting **OK**, you'll create a table that only contains the **Date**, **Product**, **SalesPerson**, and **Units** columns.

![Final table with the GUID and Report created by columns removed.](media/choose-remove-columns/choose-remove-columns-sample-final-table-2.png "Final table with the GUID and Report created by columns removed")

## Remove columns

When you select **Remove columns** from the **Home** tab, you have two options:

* **Remove columns**: Removes the selected columns.
* **Remove other columns**: Removes all columns from the table *except* the selected ones.

:::image type="content" source="media/choose-remove-columns/choose-remove-columns-remove-columns-icon.png" alt-text="Remove columns menu options.":::

### Remove selected columns

Starting from the sample table, select the **GUID** and the **Report created** columns. Right-click to select any of the column headings. A new shortcut menu appears, where you can select the **Remove columns** command.

:::image type="content" source="media/choose-remove-columns/choose-remove-columns-remove-columns-right-click.png" alt-text="Table column shortcut menu.":::

After selecting **Remove columns**, you'll create a table that only contains the **Date**, **Product**, **SalesPerson**, and **Units** columns.

![Final table with the selected GUID and Report created by columns removed.](media/choose-remove-columns/choose-remove-columns-sample-final-table-3.png "[Final table with the selected GUID and Report created by columns removed")

### Remove other columns

Starting from the sample table, select all the columns from the table except **GUID** and **Report created**. On the **Home** tab, select **Remove columns** > **Remove other columns**.

:::image type="content" source="media/choose-remove-columns/choose-remove-columns-remove-other-columns-icon.png" alt-text="Remove other columns command.":::

After selecting **Remove other columns**, you'll create a table that only contains the **Date**, **Product**, **SalesPerson**, and **Units** columns.

![Final table with the non-selected GUID and Report created by columns removed.](media/choose-remove-columns/choose-remove-columns-sample-final-table-4.png "Final table with the non-selected GUID and Report created by columns removed")
