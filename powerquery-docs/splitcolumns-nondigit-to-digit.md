---
title: Split columns by non-digit to digit
description: Split columns by non-digit to digit
author: ptyx507x
ms.topic: conceptual
ms.date: 11/10/2025
ms.author: miescobar
ms.subservice: transform-data
---

# Split columns by non-digit to digit

In Power Query, you can split a column through different methods. Among the available split options in Power Query, this article examines how to split the selected column or columns wherever a non-digit comes before a digit.

## Where to find Split Columns > By Non-Digit to Digit

You can find the **Split Columns > By Non-Digit to Digit** option in three places:

* **Home tab**&mdash;under the **Split Column** dropdown menu inside the **Transform** group.

   :::image type="content" source="media/splitcolumns-nondigit-to-digit/sc-home-ndtd.png" alt-text="Screenshot showing the location of By Non-Digit to Digit under the Home tab." lightbox="media/splitcolumns-nondigit-to-digit/sc-home-ndtd.png":::

* **Transform tab**&mdash;under the **Split Column** dropdown menu inside the **Text Column** group.

   :::image type="content" source="media/splitcolumns-nondigit-to-digit/sc-transform-ndtd.png" alt-text="Screenshot showing the location of By Non-Digit to Digit under the Transform tab." lightbox="media/splitcolumns-nondigit-to-digit/sc-transform-ndtd.png":::

* **Right-click a column**&mdash;inside the **Split Column** option.

   :::image type="content" source="media/splitcolumns-nondigit-to-digit/sc-rightclick-ndtd.png" alt-text="Screenshot showing the location of By Non-Digit to Digit when right-clicking a column.":::

## Split columns by non-digit to digit into columns

The initial table in this example is the one shown in the following image, with a column for **Pets** and other extra columns. In this example, you only focus on the **Pets** column.

:::image type="content" source="media/splitcolumns-nondigit-to-digit/sc-before-ndtd.png" alt-text="Screenshot showing a table with Animal and other columns, containing four rows, with the Pets column containing the animal type and number.":::

This column holds two values in each row:

* **AnimalType**&mdash;The first part is the type of animal.
* **Number**&mdash;The animal number that came into the person's life.

In this example, you want to split this column into the two columns described in the previous list. Select the column and then select the split the column by non-digit to digit option.

This single column splits into multiple columns, given every instance of a digit followed by a non-digit. In this case, it only splits into two columns.

Your final table looks like the following image.

:::image type="content" source="media/splitcolumns-nondigit-to-digit/sc-after-ndtd.png" alt-text="Screenshot showing the Animal.1 and Animal.2 columns, with the animal type and number separated into the two columns.":::
