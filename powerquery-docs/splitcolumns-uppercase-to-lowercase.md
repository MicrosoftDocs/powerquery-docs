---
title: Split columns by uppercase to lowercase
description: Split columns by uppercase to lowercase
author: ptyx507x
ms.topic: concept-article
ms.date: 11/10/2025
ms.author: miescobar
ms.subservice: transform-data
---

# Split columns by uppercase to lowercase

In Power Query, you can split a column through different methods. Among the available split options in Power Query, this article examines how you can split the selected column or columns at every point where an uppercase letter is followed by a lowercase letter.

## Where to find Split Columns > By Uppercase to Lowercase

You can find the **Split Columns > By Uppercase to Lowercase** option in three places:

* **Home tab**&mdash;under the **Split Column** dropdown menu inside the **Transform** group.

   :::image type="content" source="media/splitcolumns-uppercase-to-lowercase/sc-home-ul.png" alt-text="Screenshot showing the location of By Uppercase to Lowercase under the Home tab." lightbox="media/splitcolumns-uppercase-to-lowercase/sc-home-ul.png":::

* **Transform tab**&mdash;under the **Split Column** dropdown menu inside the **Text Column** group.

   :::image type="content" source="media/splitcolumns-uppercase-to-lowercase/sc-transform-ul.png" alt-text="Screenshot showing the location of By Uppercase to Lowercase under the Transform tab." lightbox="media/splitcolumns-uppercase-to-lowercase/sc-transform-ul.png":::

* **Right-click a column**&mdash;inside the **Split Column** option.

   :::image type="content" source="media/splitcolumns-uppercase-to-lowercase/sc-rightclick-ul.png" alt-text="Screenshot showing the location of By Uppercase to Lowercase when right-clicking a column.":::

## Split columns by uppercase to lowercase into columns

Your initial table in this example is the one shown in the following image, with only one column for **Column1**.

:::image type="content" source="media/splitcolumns-uppercase-to-lowercase/sc-before-ul.png" alt-text="Screenshot showing a table with Products/Brands column, containing five rows, with the Word column containing the first and second half of the word.":::

This column holds two values:

* **FirstWord**&mdash;The first half of a product that's in camel case.
* **SecondWord**&mdash;The second half of a product that's in camel case.

In this example, you want to split this column into the two columns described in the previous list. Select the column and then select the split the column by uppercase to lowercase option.

This single column splits into multiple columns, given every instance of the last uppercase letter to the next lowercase letter. In this case, it only splits into two columns.

Your final table looks like the following image.

:::image type="content" source="media/splitcolumns-uppercase-to-lowercase/sc-after-ul.png" alt-text="Screenshot showing the Products/Brands.1 and Products/Brands.2 columns, with the first and second half of the word separated into the two columns.":::
