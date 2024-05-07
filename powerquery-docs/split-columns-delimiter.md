---
title: Split columns by delimiter
description: An article on how to Split columns by delimiter into new columns or rows using Power Query.
author: ptyx507
ms.date: 5/6/2024
ms.author: miescobar
---

# Split columns by delimiter

In Power Query, you can split a column through different methods. In this case, you can split one or more selected columns by a delimiter.

## Where to find Split Columns > By Delimiter

You can find the **Split Columns: By Delimiter** option in three places:

* **Home tab**&mdash;under the **Split column** dropdown menu inside the **Transform** group.

   :::image type="content" source="media/split-columns-delimiter/icon-home.png" alt-text="Screenshot of the split column button and options in the Home tab." lightbox="media/split-columns-delimiter/icon-home.png":::

* **Transform tab**&mdash;under the **Split column** dropdown menu inside the **Text column** group.

   :::image type="content" source="media/split-columns-delimiter/icon-transform.png" alt-text="Screenshot of the split column button and options in the Transform tab." lightbox="media/split-columns-delimiter/icon-transform.png":::

* **Right-click a column**&mdash;inside the **Split column** option.

   :::image type="content" source="media/split-columns-delimiter/right-click-icon.png" alt-text="Screenshot of the split column button and options found in the column right-click contextual menu.":::

## Split columns by delimiter into columns

In this example, the initial table is shown in the following image, with only one column for **Accounts**.

:::image type="content" source="media/split-columns-delimiter/into-columns-original.png" alt-text="Screenshot of the sample source table for splitting columns into new columns.":::

This column holds two values:

* Account number
* Account name

In this example using Power Query Online, you want to split this column into two columns. A space character delimits the values&mdash;the first space from left to right. To do this split, select the column, and then select the option to split the column by a delimiter. In **Split Column by Delimiter**, apply the following configuration:

* **Basic/Advanced**: Advanced
* **Select or enter delimiter**: Space
* **Split at**: Left-most delimiter
* **Split into**: Columns

:::image type="content" source="media/split-columns-delimiter/into-columns-split-column-window.png" alt-text="Screenshot of the split column dialog with the delimiter splitting into columns.":::

> [!NOTE]
> The **Split column** dialog has a different format in Power Query Desktop, but the options are basically the same. In Power Query Desktop, you only need to select **Space** as the delimiter and **Left-most delimiter** for **Split at**. The **Split into** option is under **Advanced** in Power Query Desktop, but the default value is already set to **Columns**.
>
>:::image type="content" source="media/split-columns-delimiter/into-columns-split-column-window-desktop.png" alt-text="Screenshot of the split column dialog in Power Query Desktop with the delimiter splitting into columns.":::

The result of that operation gives you a table with the two columns that you're expecting.

:::image type="content" source="media/split-columns-delimiter/into-columns-final.png" alt-text="Screenshot of the sample output table after splitting a column into new columns.":::

> [!NOTE]
>Power Query splits the column into as many columns as needed. The name of the new columns contains the same name as the original column. A suffix that includes a dot and a number that represents the split sections of the original column is appended to the name of the new columns.

## Split columns by delimiter into rows

In this example, your initial table is shown in the following image, with the columns **Cost Center** and **Accounts**.

:::image type="content" source="media/split-columns-delimiter/into-rows-original.png" alt-text="Screenshot of the sample source table for splitting columns into rows." lightbox="media/split-columns-delimiter/into-rows-original.png":::

The **Accounts** column has values in pairs separated by a comma. These pairs are separated by a semicolon. The goal of this example is to split this column into new rows by using the semicolon as the delimiter.

To do that split in Power Query Online, select the **Accounts** column. Select the option to split the column by a delimiter. In **Split Column by Delimiter**, apply the following configuration:

* **Basic/Advanced**: Advanced
* **Select or enter delimiter**: Semicolon
* **Split at**: Each occurrence of the delimiter
* **Split into**: Rows

:::image type="content" source="media/split-columns-delimiter/into-rows-split-column-window.png" alt-text="Screenshot of the split column by delimiter dialog with the column split into rows.":::

> [!NOTE]
> The **Split column** dialog has a different format in Power Query Desktop, but the options are basically the same. In Power Query Desktop, you only need to select **Semicolon** as the delimiter, **Each occurrence of the delimiter** for **Split at**, and **Rows** for **Split into** under **Advanced options**.

The result of that operation gives you a table with the same number of columns, but many more rows because the values inside the cells are now in their own cells.

:::image type="content" source="media/split-columns-delimiter/into-rows-final.png" alt-text="Screenshot of the sample output table after splitting columns into rows.":::

### Final Split

Your table still requires one last split column operation. You need to split the **Accounts** column by the first comma that it finds. This split creates a column for the account name and another one for the account number.

To do that split, select the **Accounts** column and then select **Split Column > By Delimiter**. Inside the **Split column** window, apply the following configuration:

* **Basic/Advanced**: Advanced
* **Select or enter delimiter**: Comma
* **Split at**: Each occurrence of the delimiter
* **Split into**: Columns

:::image type="content" source="media/split-columns-delimiter/into-rows-into-columns-split-window.png" alt-text="Screenshot of the table after splitting into rows and into columns.":::

> [!NOTE]
> The **Split column** dialog has a different format in Power Query Desktop, but the options are basically the same. In Power Query Desktop, you only need to select **Comma** as the delimiter and **Each occurrence of the delimiter** for **Split at**. The **Split into** option is under **Advanced** in Power Query Desktop, but the default value is already set to **Columns**.

The result of that operation gives you a table with the three columns that you're expecting. You then rename the columns as follows:

Previous Name | New Name
--------------|----------
Accounts.1 | Account Name
Accounts.2 | Account Number

Your final table looks like the one in the following image.

:::image type="content" source="media/split-columns-delimiter/into-rows-into-columns-final.png" alt-text="Screenshot of the final output table with renamed columns.":::
