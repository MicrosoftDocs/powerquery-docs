---
title: Splitting Columns By Uppercase to Lowercase
description: Splitting Columns By Uppercase to Lowercase
author: jessli20

ms.topic: conceptual
ms.service: powerquery
ms.date: 06/04/2020
ms.author: jessli20
---

# Split Columns By Uppercase to Lowercase

In Power Query, you can create a split a column through different functions.
In this case, the column(s) selected can be split by the last Uppercase to the first Lowercase.

We will be using the following table to show the change.

![Before](images/splitColumnsBeforeTableUL.PNG)

The result of the transformation will be two or more columns split from the original column.

![After](images/splitColumnsAfterTableUL.PNG)

## Option One: Home Tab Split Columns By Uppercase to Lowercase 

1. Select the column that we want to split by double-clicking the header.
2. Then go to the **Split Column** option from the *Text column* group:

![HomeTab](images/splitColumnsHomeTabUL.png)

3. After clicking the **Split Column** option, click the suboption **By Uppercase to Lowercase**.

![Split Column Dropdown](images/splitColumnsDropdownUL.PNG)

The final outcome will be the singular column split into multiple columns given every instance of the last Uppercase letter to the next Lowercase letter.

![Split Column Dropdown](images/splitColumnsAfterFunctionUL.PNG)

## Option Two: Transform Tab Split Columns By Uppercase to Lowercase 

1. Go to the top left hand corner and click on the *Transform* tab.

2. Then follow the same directions given for ***Option 1: Home Tab Split Columns By Uppercase to Lowercase***.

![HomeTab](images/splitColumnsTransformTabUL.PNG)


## Option Three: Split Column By Uppercase to Lowercase using Mouse Right Click

1. Move the mouse to the header of the column that needs splitting.
2. Right click the header and scroll to **Split Column** and open the dropdown.
3. Within the Split Column dropdown select By **Uppercase to Lowercase**.

![HomeTab](images/splitColumnsRightClickUL.PNG)
