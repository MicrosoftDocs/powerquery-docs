---
title: Split columns by digit to non-digit
description: Split columns by digit to non-digit
author: ptyx507x
ms.topic: concept-article
ms.date: 11/10/2025
ms.author: miescobar
ms.subservice: transform-data
---

# Split columns by digit to non-digit

In Power Query, you can split a column through different methods. Among the available split options in Power Query, this article examines how to split the selected column or columns wherever a digit comes before a non-digit.

## Where to find Split columns > By Digit to Non-Digit

You can find the **Split Columns: By Digit to Non-Digit** option in three places:

* **Home tab**&mdash;under the **Split Column** dropdown menu inside the **Transform** group.

   :::image type="content" source="media/splitcolumns-digit-to-nondigit/sc-home-dtnd.png" alt-text="Screenshot showing the location of By Digit to Non-Digit under the Home tab." lightbox="media/splitcolumns-digit-to-nondigit/sc-home-dtnd.png":::

* **Transform tab**&mdash;under the **Split Column** dropdown menu inside the **Text Column** group.

   :::image type="content" source="media/splitcolumns-digit-to-nondigit/sc-transform-dtnd.png" alt-text="Screenshot showing the location of By Digit to Non-Digit under the Transform tab." lightbox="media/splitcolumns-digit-to-nondigit/sc-transform-dtnd.png":::

* **Right-click a column**&mdash;inside the **Split Column** option.

   :::image type="content" source="media/splitcolumns-digit-to-nondigit/sc-rightclick-dtnd.png" alt-text="Screenshot showing the location of By Digit to Non-Digit when right-clicking a column.":::

## Split columns by digit to non-digit into columns

The initial table in this example is the one shown in the following image, with a column for **Pets** and other extra columns. This example only focuses on the **Pets** column.

:::image type="content" source="media/splitcolumns-digit-to-nondigit/sc-before-dtnd.png" alt-text="Screenshot showing a table with Pets and Age columns, containing four rows, with the Pets column containing the rank of the animal.":::

This column holds two values in each row:

* **Rank**&mdash;The rank of the animal.
* **AnimalType**&mdash;The second part of the word is the type of animal.

In this example, you want to split this column into the two columns described in the previous list. Select the column and then select the split column by digit to non-digit option.

This single column splits into multiple columns, given every instance of a digit followed with a non-digit. In this case, it only splits it into two.

Your final table looks like the following image.

:::image type="content" source="media/splitcolumns-digit-to-nondigit/sc-after-dtnd.png" alt-text="Screenshot showing the Pets.1, Pets.2 and Age columns, with the rank and type of pet separated into the two columns.":::
