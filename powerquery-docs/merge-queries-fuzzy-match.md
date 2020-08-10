---
title: "Fuzzy merge"
description: "Finding approximate matches with Fuzzy Matching in Power Query's merge operations"
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 07/22/2020
ms.author: v-miesco
---
# Fuzzy merge

Fuzzy merge is a Smart Data Preparation feature that allows you to apply Fuzzy Matching algorithms when comparing columns and try to find matches across tables being merged. 

You can enable fuzzy matching at the bottom of the **Merge** window by selecting the *Use fuzzy matching to perform the merge* option. To learn more about the **Merge queries** operation and the **Merge** window, see [Merge queries overview](merge-queries-overview.md).

>[!NOTE]
>Fuzzy matching is only supported on merge operations over text columns. Power Query uses the Jaccard Similarity algorithm to measure the similarity between pairs of instances. 

## Sample scenario

A common use case for *Fuzzy matching* is when there are free-form text fields in something such as a survey. For this article, the sample table is taken directly from an online survey sent to a group with only one question: *What is your favorite fruit?*

The results of that survey are shown in the following image.

![Sample survey with raw entries](images/me-merge-fuzzy-matching-sample-table.png)

There's a total of nine records or survey submissions. Take a closer look at the values provided. Some of the values have typos, or are written in plural, and some others are written in singular. Also, some others are written in lowercase, and some others in uppercase.

There's a **Fruits** reference table to help standardize these values.

![Fruits reference table](images/me-merge-fuzzy-matching-sample-reference-table.png)

>[!NOTE]
>For simplicity, this **Fruits** reference table only has the name of the fruits that  will be needed for this sample. Your reference table can have as many rows as needed.

The goal is to standardize all these values so you can do more analysis.

![Sample output table](images/me-merge-fuzzy-matching-sample-output-table.png)

## Fuzzy merge

To perform the fuzzy merge, you start by doing a merge. In this case, you'll use a left outer join where the left table is the one from the survey and the right table is the fruits reference table. At the bottom of the window, you can see the option to **Use fuzzy matching to perform the merge**, which you can enable.

![Use fuzzy matching to perform the merge option](images/me-merge-fuzzy-matching-simple-merge-window.png)

After you select **OK**, you can see a new column in your table as a result of this merge operation. If you expand it, you'll notice that there's one row that doesn't have any values in it. That's exactly what the previous image stated when it said **The selection matches 8 of 9 rows from the first table**.

![Fruits expanded](images/me-merge-fuzzy-matching-expand-no-transform-table.png)

## Fuzzy matching options

You can modify the **Fuzzy matching options** to tweak how the approximate match should be done. First double-click the **Merge queries** step and inside the **Merge** window expand **Fuzzy matching options**.

![Fuzzy matching options](images/me-merge-fuzzy-matching-options.png)

The available options are:
* **Similarity threshold (optional)**&mdash;a value between 0.00 and 1.00 that provides the ability to match records above a given similarity score. A threshold of 1.00 is the same as specifying an exact match criteria. For example, 'Grapes' matches with 'Graes' (missing 'p') only if the threshold is set to less than 0.90. By default this value is set to 0.80.
* **Ignore case**&mdash;allows matching records no matter what the case of the text.
* **Match by combining text parts**&mdash;allows combining text parts to find matches. For example, 'Micro soft' is matched with 'Microsoft' if this option is enabled.
* **Number of matches (optional)**&mdash;specifies the maximum number of matching rows that can be returned.
* **Transformation table (optional)**&mdash;allows matching records based on custom value mappings. For example, 'Grapes' is matched with 'Raisins' if a transformation table is provided with the 'From' column containing 'Grapes' and the 'To' column containing 'Raisins'.

## Transformation table

For the example showcased in this article, you can use a **Transformation table** to map the value with a missing pair. That value is 'apls', which has to be mapped to 'Apple'. Your transformation table needs to have two columns:

* **From**&mdash;will have the values to find.
* **To**&mdash;will have the values that will be used to replace the values found using the **From** column.

For this article, the **Transformation table** will look as follows:

|From|To|
|---|---|
|apls|Apple|

You can go back to the **Merge** window and in **Fuzzy matching options**, change the **Number of matches (optional)** to be one and choose the **Transformation table (optional)** from the dropdown.

![Fuzzy merge with transformation table](images/me-merge-fuzzy-matching-custom-merge-window.png)

After you select **OK**, you'll reach the desired output with all values mapped correctly. Note how the example started with nine distinct values, but after the fuzzy merge there are only four distinct values.

![Sample output table](images/me-merge-fuzzy-matching-sample-output-table.png)
