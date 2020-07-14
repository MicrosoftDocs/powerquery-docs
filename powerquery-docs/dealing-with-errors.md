---
title: Dealing with errors 
description: Understanding errors in Power Query and most common step level and cell level errors.
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
---

# Dealing with errors in Power Query

In Power Query, there are two places where you could encounter errors:

* **Step-level**
* **Cell-level**

This article will cover both of these levels and provide suggestions on how to fix the most common errors you might find in them.

Every error has three components:

* **Error reason** 
* **Error message**
* **Error detail** 

## Step-level error

A step-level error will prevent the query from loading and will display a yellow ribbon with the error components.

![Step-level error](images/me-working-with-errors-column-name.png)

* **Error reason**&mdash;the first section before the colon. In the example above, the error reason is `Expression.Error`.
* **Error message**&mdash;the section right after the reason. In the example above, the error message is `The column 'Column' of the table wasn't found`.
* **Error detail**&mdash;is the section right after the "Details:". In the example above, the error detail is `Column`.

> [!Note] 
> Currently Power Query Online only provides the error message when step-level errors are found.

### Most common step level errors

In all cases, we recommended that you take a close look at the error reason, error message, and error detail provided to understand what's causing the error. Also, select the **Go to Error** button, if available, to view the first step where the error occurred. 

![Go to error button in error ribbon](images/me-working-with-errors-go-to-error.png)

#### Can’t find the source - DataSource.Error  

This error commonly occurs in a situation where the data source is either inaccessible by the user, the user doesn't have the correct credentials to access the data source, or the source has been moved to a different place.

**Example:** You have a query from a text tile that was located in drive "D:" and created by user A. User A shares the query to user B, who doesn't have access to drive "D:". When this person tries to execute the query, they get a `DataSource.Error` because there is no "D:" drive in their environment.

![File path error](images/me-working-with-errors-file-path.png)

**Possible solutions:** You can change the file path of the text file to a path that both users have access to. As user B, you can change the file path to be a local copy of the same text file. If available, you can change the file path by selecting the **Edit Settings** button in the error pane.

#### The column of the table wasn't found

Commonly triggered when a step makes a direct reference to a column name that doesn't exist in the query. 

**Example:** You have a query from a text file where one of the column names was **Column**. In your query, you have a step that renames that column to **Date**. But there was a change in the original text file and it no longer has a column header with the name **Column** because it was manually changed to **Date**. Power Query is unable to find a column header by the name of **Column**, so it can't rename any columns and it displays the following error.

![Column name not found error](images/me-working-with-errors-column-name.png)

**Possible solutions:** There are multiple solutions for this case, but they all depend on your end goal and what you'd like to do. For this example, since the correct **Date** column header already comes from your text file, you can just remove the step that renames the column and your query will no longer have issues.

#### Other common step level errors

When combining or merging data between multiple data sources, you might get a `Formula.Firewall` error such as the one shown below.

![Formula.Firewall error](images/me-working-with-errors-formula-firewall.png)

This error could be caused by a number of reasons, such as the data privacy levels between data sources or the way that these data sources are being combined / merged. You can read more about the Data Privacy Firewall and how to diagnose this issue from [Data Privacy Firewall](dataprivacyfirewall.md).

## Cell-level error

A cell-level error will not prevent the query from loading, but any error values will be displayed as **Error** inside the Cell. Selecting the whitespace inside the cell will display the detail pane underneath the data preview, where you can see the error components

![Could not convert value to data type error](images/me-working-with-errors-could-not-convert.png)

>[!Note]
> The Data profiling tools can help you more easily identify cell-level errors with the use of its Column Quality feature. You can learn more about the Column Quality feature from the [Data profiling tools article](data-profiling-tools.md#column-quality).

### Handling errors at the cell level

When encountering any cell level errors, Power Query provides a set of functions to handle them either by removing, replacing, or keeping the errors.

For the next sections, the provided examples will be using the same sample query as the start point. In this query, you have a **Sales** column that has one cell with an error caused by a conversion error. The value inside that cell was **NA**, but when you transformed that column to a whole number Power Query couldn't convert **NA** to a number, so it displays the following error.

![Could not convert to data type error details](images/me-working-with-errors-could-not-convert-details.png)

#### Remove Errors

To remove rows with errors in Power Query, first select the column that contains errors. In the **Reduce Rows** group in the **Home** tab, select **Remove Rows**. From the dropdown menu, select the option to **Remove Errors**.

![Remove errors button in Home tab](images/me-working-with-errors-remove-errors.png)

The result of that operation will give you the table that you're looking for.

![Removed errors from sample table](images/me-working-with-errors-removed-rows-with-errors.png)

#### Replace Errors

If instead of removing rows with errors, you want to replace the errors with a fixed value, you can do so as well. To replace rows with errors in Power Query, first select the column that contains errors. In the **Any Column** group in the **Transform** tab, select **Replace Values**. From the dropdown menu for **Replace Values**, select the option to **Replace Errors**.

![Replace errors button in the Transform tab](images/me-working-with-errors-replace-errors.png)

This will display the **Replace Errors** window. Enter the value **10** because you want to replace all errors with the value 10.

![Replace errors window](images/me-working-with-errors-replace-errors-window.png)

The result of that operation will give you the table that you're looking for.

![Sample table with errors replaced](images/me-working-with-errors-replaced-errors.png)

#### Keep Errors

Power Query can also serve as a good auditing tool to identify any rows with errors. This is a good example of where **Keep Errors** can be of help. To keep rows with errors in Power Query, first select the column that contains errors. In the **Reduce Rows** group in the **Home** tab, select **Keep Rows**. From the dropdown menu, select the option to **Keep Errors**.

![Keep errors button inside Home tab](images/me-working-with-errors-keep-errors.png)

The result of that operation will give you the table that you're looking for.

![Sample table with only rows with errors](images/me-working-with-errors-keep-errors-final.png)

### Most common cell level errors

As with any step-level error, we recommended that you take a close look at the error reasons, error messages, and error details provided at the cell level to understand what's causing the errors. The next sections discuss some of the most frequent cell level errors in Power Query.

#### Data type conversion errors

Commonly triggered when changing the data type of a column in a table. Some values found in the column could not be converted to the desired data type.

**Example:** You have a query that has a **Sales** column, but one cell in that column has **NA** as a cell value, while the rest have whole numbers as values. You decide to convert the data type of the column from text to whole number, but the cell with the **NA** value yields an error.

![Could not convert to data type error details](images/me-working-with-errors-could-not-convert-details.png)

**Possible solutions:** After identifying the row with the error, you can either modify the data source to reflect the correct value and not an **NA** value, or you can apply a **Replace Error** operation to provide a value to any **NA** values that yield an error.

#### Operation Errors

When trying to apply an operation that isn't supported, such as multiplying a text value by a numeric value, an error will be raised.

**Example:** You want to create a new custom column for your query by creating a text string that contains the phrase "Total Sales: " concatenated to the value from the **Sales** column. An error will be raised as the concatenation operation only supports text columns and not numeric ones. 

![Operation error](images/me-working-with-errors-operation-errors.png)

**Possible solutions:** Before creating this custom column, change the data type of the **Sales** column to be text.

![Sample table with solution for operation error](images/me-working-with-errors-operation-errors-final-table.png)
