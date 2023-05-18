---
title: Split columns by uppercase to lowercase
description: Split columns by uppercase to lowercase
author: ptyx507x
ms.topic: conceptual
ms.date: 1/9/2023
ms.author: miescobar
---

# Split columns by uppercase to lowercase

In Power Query, you can split a column through different methods.
In this case, the column(s) selected can be split by every instance of the last uppercase letter to the next lowercase letter.

## Where to find Split Columns > By Uppercase to Lowercase

You can find the **Split Columns > By Uppercase to Lowercase** option in three places:

* **Home tab**&mdash;under the **Split Column** dropdown menu inside the **Transform** group.

   ![Image shows By Uppercase to Lowercase under the Home tab.](media/splitcolumns-uppercase-to-lowercase/sc-home-ul.png)

* **Transform tab**&mdash;under the **Split Column** dropdown menu inside the **Text Column** group.

   ![Image shows By Uppercase to Lowercase under the Transform tab.](media/splitcolumns-uppercase-to-lowercase/sc-transform-ul.png)

* **Right-click a column**&mdash;inside the **Split Column** option.

   ![Image shows By Uppercase to Lowercase when right-clicking a column.](media/splitcolumns-uppercase-to-lowercase/sc-rightclick-ul.png)

## Split columns by uppercase to lowercase into columns

Your initial table in this example will be the one shown in the image below, with only one column for **Column1**.

![Image showing table with Products/Brands column, with five rows, with the Word column containing the first and second half of the word.](media/splitcolumns-uppercase-to-lowercase/sc-before-ul.png)

This column holds two values:

* **FirstWord**&mdash;The first half of a product that is in camel case.
* **SecondWord**&mdash;The second half of a product that is in camel case.

In this example, you want to split this column into the two columns described in the list above. Select the column and then select the option to split the column by uppercase to lowercase.

This single column will split into multiple columns, given every instance of the last uppercase letter to the next lowercase letter. In this case, it only splits into two columns.

Your final table will look like the following image.

![Image showing Products/Brands.1 and Products/Brands.2 columns, with the first and second half of the word separated into the two columns.](media/splitcolumns-uppercase-to-lowercase/sc-after-ul.png)
