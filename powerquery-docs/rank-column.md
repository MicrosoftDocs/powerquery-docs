---
title: Rank column (Preview)
description: In Power Query, you can add a new column to an existing table that ranks the rows in the table based on the desired sorting of the table and the rank strategy to use for ties.
author: ptyx507x
ms.reviewer: 
ms.date: 07/18/2022
ms.author: miescobar
ms.custom: 
---

# Rank column (Preview)

The **Rank column** command adds a new column to a table with the ranking defined by one or more other columns from the table. An additional *Rank kind* option can be used to define how ties should be handled.

![Rank column entry point in the Power Query ribbon inside the Add column tab](media/rank-column/rank-column-ribbon-entry.png)

>[!NOTE]
>Currently, the Rank column feature is only available in Power Query Online.

## Adding a rank column

For the table below that has the fields *Team*, *Total Points* and *Bonus modifier*, imagine that you're tasked with the creation of a new column that effectively ranks the Teams using the values from the *Total Points* and *Bonus modifier* fields.

|Team|Total Points|Bonus modifier|
|----|------------|--------------|
|A|20|0.5|
|B|30|0.8|
|C|40|0.2|
|D|10|0.45|
|E|20|0.75|

The teams have shared a list of ways that they want to rank each other:

* Using only the values from the *Total Points* field where higher values rank higher using **standard competition as the rank method**
* Using only Using only the values from the *Total Points* field where higher values rank higher using **dense as the rank method**
* Ranking first by the *Total Points* and then by *Bonus modifier* where higher values rank higher using the standard competition as rank method

### Single column rank

### Single column rank with specific rank method

### Multiple column rank with specific rank method

## Rank methods

A rank method is what establishes the way in which ties will be handled by the ranking algorithm. This option is only available in the advanced section of the **Rank** dialog.

-----Image of Rank method----

Below is a table that lists all three available rank methods and a description for each of them.

|Rank method|Description|
|-----------|-----------|
|Standard| Items that compare equal receive the same ranking number, and then a gap is left in the ranking numbers. E.g. 1224|
|Dense| Items that compare equally receive the same ranking number, and the next items receive the immediately following ranking number. E.g. 1223|
|Ordinal| All items receive distinct ordinal numbers, including items that compare equal. E.g. 1234|