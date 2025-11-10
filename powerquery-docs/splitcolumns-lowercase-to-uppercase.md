---
title: Split columns by lowercase to uppercase
description: Split columns by lowercase to uppercase
author: ptyx507x
ms.topic: conceptual
ms.date: 11/10/2025
ms.author: miescobar
ms.subservice: transform-data
---

# Split columns by lowercase to uppercase

In Power Query, you can split a column through different methods. If your data contains CamelCased text or a similar pattern, this article examines how you can split the selected column or columns at every point where a lowercase letter is followed by an uppercase letter.

## Where to find Split Columns > By Lowercase to Uppercase

You can find the **Split Columns: By Lowercase to Uppercase** option in three places:

* **Home tab**&mdash;under the **Split Column** dropdown menu inside the **Transform** group.

   :::image type="content" source="media/splitcolumns-lowercase-to-uppercase/sc-home-lu.png" alt-text="Screenshot showing the location of By Lowercase to Uppercase under the Home tab.":::

* **Transform tab**&mdash;under the **Split Column** dropdown menu inside the **Text Column** group.

   :::image type="content" source="media/splitcolumns-lowercase-to-uppercase/sc-transform-lu.png" alt-text="Screenshot showing the location of By Lowercase to Uppercase under the Transform tab.":::

* **Right-click a column**&mdash;inside the **Split Column** option.

   :::image type="content" source="media/splitcolumns-lowercase-to-uppercase/sc-rightclick-lu.png" alt-text="Screenshot showing the location of By Lowercase to Uppercase when right-clicking a column.":::

## Split columns by lowercase to uppercase into columns

The initial table in this example is the one shown in the following image, with one column for **Word** and an extra column named **Syllables**. You only focus on the first column.

:::image type="content" source="media/splitcolumns-lowercase-to-uppercase/sc-before-lu.png" alt-text="Screenshot showing a table with Word and Syllables columns, each with five rows, and with the Word column containing the first and second half of the word.":::

This column holds two values in each row:

* **FirstWord**&mdash;The first half of the compound word.
* **SecondWord**&mdash;The second half of the compound word.

In this example, you want to split this column into the two columns described in the previous list. Select the column and then select the split column by lowercase to uppercase option.

This single column splits into multiple columns, given every instance of the last lowercase letter to the next uppercase letter. In this case, it only splits into two columns.

Your final table looks like the following image.

:::image type="content" source="media/splitcolumns-lowercase-to-uppercase/sc-after-lu.png" alt-text="Screenshot showing Word.1, Word.2 and Syllables columns, with the first and second half of the word separated into the two columns.":::
