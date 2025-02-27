---
title: Rank column (Preview)
description: Add a new column to an existing table in Power Query that ranks the table rows based on the desired sorting of the table and the rank strategy used for ties.
author: ptyx507x
ms.date: 7/17/2024
ms.author: miescobar
ms.subservice: transform-data
---

# Rank column (Preview)

The **Rank column** command adds a new column to a table with the ranking defined by one or more other columns from the table. A **Rank method** option can be used to define how ties should be handled.

:::image type="content" source="media/rank-column/rank-column-ribbon-entry.png" alt-text="Screenshot of the rank column entry point in the Power Query ribbon inside the Add column tab.":::

> [!NOTE]
>Currently, the rank column feature is only available in Power Query Online.

## Adding a rank column

The following table has fields for `Team`, `Total Points`, and `Bonus modifier`. Imagine that you have the task of creating of a new column that effectively ranks the teams using the values from the `Total Points` and `Bonus modifier` fields.

|Team|Total Points|Bonus modifier|
|----|------------|--------------|
|A|20|0.5|
|B|30|0.8|
|C|40|0.2|
|D|10|0.45|
|E|20|0.75|

The teams shared a list of ways that they want to rank each other:

* [Using only the values from the *Total Points* field where higher values rank higher using **standard competition as the rank method**](#single-column-rank)
* [Using only the values from the *Total Points* field where higher values rank higher using **dense as the rank method**](#single-column-rank-with-specific-rank-method)
* [Ranking first by the *Total Points* and then by *Bonus modifier* where higher values rank higher using the **standard competition as rank method**](#multiple-column-rank-with-specific-rank-method)

### Single column rank

For the first requirement in the shared list, use only the values from the `Total Points` field, where higher values rank higher using [standard competition](#rank-methods) as the rank method. To achieve this requirement, use the following steps:

1. With the original table already in Power Query, select the `Total Points` column. Then from the Power Query **Add column** tab, select **Rank column**.
2. In **Rank**, select `Total Points` for **Rank by** and **Rank values from high to low** for the **Rank criteria**.

   :::image type="content" source="media/rank-column/rank-basic-dialog.png" alt-text="Screenshot of the rank basic dialog. Only the Total Points field is selected with a rank criteria of Rank values from high to low.":::

3. By default, the rank method for this dialog is **standard competition**, so just select **OK**. This action gives you a new step with the added `Rank` column.

   :::image type="complex" source="media/rank-column/rank-total-fields-column-standard.png" alt-text="Rank transform with standard competition rank method.":::
   Screenshot of the output of the rank transform, where the Total Points field was the only Rank by field and the rank criteria for it was Rank values from high to low. Team C Ranked first. Team B ranked second. Team A and Team E ranked third. Team D ranked fifth.
:::image-end:::

### Single column rank with specific rank method

For the second requirement in the shared list, use only the values from the `Total Points` field, where higher values rank higher using [dense](#rank-methods) as the rank method. To achieve this requirement, use the following steps:

1. With the original table already in Power Query, select the `Total Points` column. Then from the Power Query **Add column** tab, select **Rank column**.
2. In **Rank**, select `Total Points` for **Rank by** and **Rank values from high to low** for the **Rank criteria**.
3. Select **Advanced** at the top of the dialog box. This selection enables the advanced section. In **Rank method**, change the value from **Standard competition** to **Dense**.

   :::image type="complex" source="media/rank-column/rank-total-fields-column-advanced.png" alt-text="Rank transform with dense rank method selected.":::
   Screenshot of the advanced section of the rank dialog where the Total Points field is being used with the Higher value ranks higher rank criteria and the rank method being selected is Dense.
:::image-end:::

4. After selecting the rank method, select **OK**. This action gives you a new step with the added `Rank` column.

   :::image type="complex" source="media/rank-column/rank-total-dense.png" alt-text="Rank transform with dense rank method.":::
   Screenshot of the output of the rank transform, where the Total Points field was the only Rank by field, the rank criteria for it was Higher value ranks higher and the rank method was Dense. Team C ranked first. Team B ranked second. Team A and Team E ranked third. Team D ranked fourth.
:::image-end:::

### Multiple column rank with specific rank method

For the third requirement in the shared list, rank first by the `Total Points` and then by `Bonus modifier`, where higher values rank higher using the [standard competition](#rank-methods) as the rank method. To achieve this requirement, use the following steps:

1. With the original table already in Power Query, select the `Total Points` and then `Bonus modifier` columns. Then from the Power Query **Add column** tab, select **Rank column**.
2. The rank dialog appears with its advanced section open, with both fields selected in the **Rank by** column. **Total Points** is in the first row and then **Bonus modifier** below it. Both rows use the **Rank criteria** of **Rank values from high to low**.
3. Make sure that **Rank method** is set to **Standard competition**.

   :::image type="complex" source="media/rank-column/rank-multiple-columns-specific-rank-method.png" alt-text="Advanced section of the rank dialog.":::
   Screenshot of the advanced section of the rank dialog. The Total Points and the Bonus modifier fields are being used as part of the Rank by logic, in that exact order. Both have a rank criteria of Rank values from high to low. The rank method selected is set to Standard competition.
:::image-end:::

4. After verifying the selections, select **OK**. This action gives you a new step with the added `Rank` column.

   :::image type="content" source="media/rank-column/rank-output-multiple-column.png" alt-text="Screenshot of the rank operation output table. Team C is ranked first, Team B second, Team E third, Team A fourth, and Team D is ranked fifth.":::

## Rank methods

A rank method establishes the strategy in which the ranking algorithm handles ties. This option is only available in the advanced section of the **Rank** dialog.

The following table lists all three available rank methods and provides a description for each.

|Rank method|Description|
|-----------|-----------|
|Standard competition| Items that compare equally receive the same ranking number, and then a gap is left in the ranking numbers. For example, 1224.|
|Dense| Items that compare equally receive the same ranking number, and the next items receive the immediately following ranking number. For example, 1223.|
|Ordinal| All items receive distinct ordinal numbers, including items that compare equally. For example, 1234.|
