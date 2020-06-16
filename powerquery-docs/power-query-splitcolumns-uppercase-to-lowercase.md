---
title: Splitting Columns By Uppercase to Lowercase
description: Splitting Columns By Uppercase to Lowercase
author: jessli20

ms.topic: conceptual
ms.service: powerquery
ms.date: 06/04/2020
ms.author: jessli20
---

# Split Columns: By Uppercase to Lowercase

In Power Query, you can create a split a column through different functions.
In this case, the column(s) selected can be split by every instance of the last Uppercase to the next first Lowercase.

## Where to find the Split Columns: By Uppercase to Lowercase
We can find the Split Columns: By Uppercase to Lowercase option in 3 places:
1. **Home tab** - under the Split column dropdown menu inside the Transform group 
![image](images/sc-home-ul.png)
2. **Transform tab** - under the Split column dropdown menu inside the Text column group
![image](images/sc-transform-ul.png)
3. **Right click a column** - inside the split columns option
![image](images/sc-rightclick-ul.png)

## Split Columns By Uppercase to Lowercase 

Our initial table will be the one below with only one column for "Column1". 

![image](images/sc-before-ul.png)

This column holds 2 values:
1. **FirstWord** - The first half of a product that is in camelcase
2. **SecondWord** - The second half of a product that is in camelcase

We want to split this column into the 2 columns described before. 
To do this, we simply select the column and select the option to split the column by Uppercase to Lowercase.

This singular column will split into multiple columns given every instance of the last Uppercase letter to the next Lowercase letter. In this case, it only splits it into two.

Our final table is will be as such:

![After](images/sc-after-ul.png)

