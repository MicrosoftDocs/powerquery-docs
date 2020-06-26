---
title: Replace values and errors
description: Replace values and errors
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
---

# Replace values and errors

With Power Query, you can replace one value with another value in a selected column. There are three ways to start a replace values operation in Power Query:

- **Right-click on a cell**&mdash;this action will display a contextual menu with the option to replace the selected value in the column with another value. 

   ![](images/me-replace-values-right-click.png)

- **Right-click on a column**&mdash;this action displays a contextual menu for operations available in the selected column.

   ![](images/me-replace-values-right-click-column.png)

- **Home tab**&mdash;**Replace values** can be found inside the **Transform** group in the **Home** tab.

   ![](images/me-replace-values-home-tab.png)

- **Transform tab**&mdash;**Replace values** can be found inside the **Any Column** group in the **Transform** tab.

   ![](images/me-replace-values-transform-tab.png)

## Replace values modes

The replace values operation has two modes:

- **Replace instances of a text string**&mdash;this mode is the default behavior for text columns, where Power Query will search for a specific text string inside all rows of a column and replace as many instances of the text string that it finds on all rows.
- **Replace entire cell content**&mdash;for non-text columns this mode is the default behavior, but for text columns this mode is enabled by going through the **Advanced options** and selecting the **Match entire cell contents** option. Selecting this option will effectively make the replace values operation work exactly as it does with non-text columns, where it only searches and replaces the full contents of a cell. 

Advanced options are only available in columns of the text data type. Within that set of options is the **Replace using special characters** option.

![](images/me-replace-values-replace-using-special-characters.png)

### Replace entire cell content

Imagine a table like the following where we have a field for **Account ID**, **Category Name**, and **Sales Goal**.

![](images/me-replace-values-original-table.png)

The -1 value in **Sales Goal** is an error in the source and needs to be replaced with a standard sales goal defined by the business for these instances, which is 250,000. To do that, right-click on the -1 value and select the option to replace values. This action will bring up the **Replace Values** window with **Value To Find** prepopulated with the -1 value. All you need to do is define the **Replace With** value, which has to be set at 250,000.

![](images/me-replace-values-numeric.png)

The outcome of that operation will give you the result that you're looking for.

![](images/me-replace-values-original-after-numeric-replace.png)

> [!Note]
> The replace values operation in columns that are not of the text data type only look for exact matches for the contents of a cell. To enable this behavior in text columns, select **Match entire cell contents** from the advanced options in the **Replace Values** window.

### Replace instances of a text string

Continuing with the previous table, let's say you want to replace the text string "Category Name: " from the **Category Name** column. To do that, select the replace values option from the **Transform** group in the **Home** tab. Inside the **Replace Values** window, enter the text string "Category Name: " in the **Value To Find** text box and leave the **Replace With** text box empty.

![](images/me-replace-values-text.png)

The result of that operation gives us the table in the following image.

![](images/me-replace-values-final-table.png)
