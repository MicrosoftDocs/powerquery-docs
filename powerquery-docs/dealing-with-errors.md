---
title: Dealing with errors 
description: Understanding errors in Power Query and most common step level and cell level errors.
author: ptyx507
ms.date: 12/9/2022
ms.author: miescobar
ms.custom: edited
---

# Dealing with errors in Power Query

In Power Query, you can encounter two types of errors:

* Step-level errors
* Cell-level errors

This article provides suggestions for how to fix the most common errors you might find at each level, and describes the error reason, error message, and error detail for each.

## Step-level error

A step-level error prevents the query from loading and displays the error components in a yellow pane.

![Step-level error.](media/dealing-with-errors/column-name.png "Step-level error")

* **Error reason**: The first section before the colon. In the example above, the error reason is **Expression.Error**.
* **Error message**: The section directly after the reason. In the example above, the error message is **The column 'Column' of the table wasn't found**.
* **Error detail**: The section directly after the **Details:** string. In the example above, the error detail is **Column**.


### Common step-level errors

In all cases, we recommend that you take a close look at the error reason, error message, and error detail to understand what's causing the error. You can select the **Go to error** button, if available, to view the first step where the error occurred.

![Go to error button.](media/dealing-with-errors/go-to-error.png "Go to error button")

#### Can't find the source - DataSource.Error  

This error commonly occurs when the data source is inaccessible by the user, the user doesn't have the correct credentials to access the data source, or the source has been moved to a different place.

**Example**: You have a query from a text tile that was located in drive D and created by user A. User A shares the query with user B, who doesn't have access to drive D. When this person tries to execute the query, they get a **DataSource.Error** because there's no drive D in their environment.

![Data source error, could not find the file because there's no drive D in the current environment.](media/dealing-with-errors/file-path.png "Data source error, could not find the file because there's no drive D in the current environment")

**Possible solutions**: You can change the file path of the text file to a path that both users have access to. As user B, you can change the file path to be a local copy of the same text file. If the **Edit settings** button is available in the error pane, you can select it and change the file path.

#### The column of the table wasn't found

This error is commonly triggered when a step makes a direct reference to a column name that doesn't exist in the query.

**Example**: You have a query from a text file where one of the column names was **Column**. In your query, you have a step that renames that column to **Date**. But there was a change in the original text file, and it no longer has a column heading with the name **Column** because it was manually changed to **Date**. Power Query is unable to find a column heading named **Column**, so it can't rename any columns. It displays the error shown in the following image.

![Expression error, the column of the table wasn't found because the column name was manually changed.](media/dealing-with-errors/column-name.png "Expression error, the column of the table wasn't found because the column name was manually changed")

**Possible solutions**: There are multiple solutions for this case, but they all depend on what you'd like to do. For this example, because the correct **Date** column header already comes from your text file, you can just remove the step that renames the column. This will allow your query to run without this error.

### Other common step-level errors

When combining or merging data between multiple data sources, you might get a **Formula.Firewall** error such as the one shown in the following image.

![Formula Firewall error, the query references other queries or steps, so it may not directly access a data source.](media/dealing-with-errors/formula-firewall.png "Formula Firewall error, the query references other queries or steps, so it may not directly access a data source")

This error can be caused by a number of reasons, such as the data privacy levels between data sources or the way that these data sources are being combined or merged. For more information about how to diagnose this issue, go to [Data privacy firewall](dataprivacyfirewall.md).

## Cell-level error

A cell-level error won't prevent the query from loading, but displays error values as **Error** in the cell. Selecting the white space in the cell displays the error pane underneath the data preview.

![Displaying the error message by selecting whitespace in a table cell containing an error.](media/dealing-with-errors/could-not-convert.png "Displaying the error message by selecting whitespace in a table cell containing an error")

>[!NOTE]
> The data profiling tools can help you more easily identify cell-level errors with the column quality feature. More information: [Data profiling tools](data-profiling-tools.md#column-quality)

### Handling errors at the cell level

When encountering any cell-level errors, Power Query provides a set of functions to handle them either by removing, replacing, or keeping the errors.

For the next sections, the provided examples will be using the same sample query as the start point. In this query, you have a **Sales** column that has one cell with an error caused by a conversion error. The value inside that cell was **NA**, but when you transformed that column to a whole number Power Query couldn't convert **NA** to a number, so it displays the following error.

![Displays data format error, couldn't convert to data type error in the error pane.](media/dealing-with-errors/could-not-convert-details.png "Displays data format error, couldn't convert to data type error in the error pane")

#### Remove errors

To remove rows with errors in Power Query, first select the column that contains errors. On the **Home** tab, in the **Reduce rows** group, select **Remove rows**. From the drop-down menu, select **Remove errors**.

![Remove errors button on the Home tab.](media/dealing-with-errors/remove-errors.png "Remove errors button on the Home tab")

The result of that operation will give you the table that you're looking for.

![Table that previously contained five rows now has the row that contained the error removed, leaving four rows in the table.](media/dealing-with-errors/removed-rows-with-errors.png "Table with the row containing the error removed")

#### Replace errors

If instead of removing rows with errors, you want to replace the errors with a fixed value, you can do so as well. To replace rows that have errors, first select the column that contains errors. On the **Transform** tab, in the **Any column** group, select **Replace values**. From the drop-down menu, select **Replace errors**.

![Replace errors button on the Transform tab.](media/dealing-with-errors/replace-errors.png "Replace errors button on the Transform tab")

In the **Replace errors** dialog box, enter the value **10** because you want to replace all errors with the value 10.

![Replace errors dialog box.](media/dealing-with-errors/replace-errors-window.png "Replace errors dialog box")

The result of that operation will give you the table that you're looking for.

![Table in which the third row contained an error in the Sales column now has the error replaced with the value 10.](media/dealing-with-errors/replaced-errors.png "Sample table with errors replaced")

#### Keep errors

Power Query can serve as a good auditing tool to identify any rows with errors even if you don't fix the errors. This is where **Keep errors** can be helpful. To keep rows that have errors, first select the column that contains errors. On the **Home** tab, in the **Reduce rows** group, select **Keep rows**. From the drop-down menu, select **Keep errors**.

![Keep errors button on the Home tab.](media/dealing-with-errors/keep-errors.png "Keep errors button on the Home tab")

The result of that operation will give you the table that you're looking for.

![Final table that keeps only rows that contain errors.](media/dealing-with-errors/keep-errors-final.png "Final table that keeps only rows that contain errors")

### Common cell-level errors

As with any step-level error, we recommend that you take a close look at the error reasons, error messages, and error details provided at the cell level to understand what's causing the errors. The following sections discuss some of the most frequent cell-level errors in Power Query.

#### Data type conversion errors

Commonly triggered when changing the data type of a column in a table. Some values found in the column could not be converted to the desired data type.

**Example**: You have a query that includes a column named **Sales**. One cell in that column has **NA** as a cell value, while the rest have whole numbers as values. You decide to convert the data type of the column from text to whole number, but the cell with the **NA** value causes an error.

![Could not convert to data type error details.](media/dealing-with-errors/could-not-convert-details.png "Could not convert to data type error details")

**Possible solutions**: After identifying the row with the error, you can either modify the data source to reflect the correct value rather than **NA**, or you can apply a **Replace error** operation to provide a value for any **NA** values that cause an error.

#### Operation errors

When trying to apply an operation that isn't supported, such as multiplying a text value by a numeric value, an error occurs.

**Example**: You want to create a custom column for your query by creating a text string that contains the phrase "Total Sales: " concatenated with the value from the **Sales** column. An error occurs because the concatenation operation only supports text columns and not numeric ones.

![Expression error in the error pane caused by trying to apply an And operator to text and a number from the Sales column.](media/dealing-with-errors/operation-errors.png "Expression error in the error pane caused by trying to apply an And operator to text and a number from the Sales column")

**Possible solutions**: Before creating this custom column, change the data type of the **Sales** column to be text.

![Table with the sales column converted from a Number data type to a Text data type, and the resulting a new column containing both expressions.](media/dealing-with-errors/operation-errors-final-table.png "Table with solution for operation error")

#### Nested values shown as errors

When working with data that contains nested structured values (such as tables, lists, or records), you may sometimes encounter the following error:

![Error for nested values triggered by formula firewall taken place](media/dealing-with-errors/privacy-buffer-error.png)

```
Expression.Error: We cannot return a value of type {value} in this context

Details: In the past we would have returned a text value of {value}, but we now return this error. Please see https://go.microsoft.com/fwlink/?linkid=2099726 for more information.
```

These errors usually occur for two reasons:

* When the Data Privacy Firewall buffers a data source, nested non-scalar values are automatically converted to errors.
* When a column defined with the `Any` data type contains non-scalar values, such values will be reported as errors during load (such as in a Workbook in Excel or the data model in Power BI Desktop).

**Possible solutions:**

* Remove the column that contains the error, or set a non-`Any` data type for such a column.
* Change the privacy levels of the data sources involved to one that allows them to be combined without being buffered.
* Flatten the tables before doing a merge to eliminate columns that contain nested structured values (such as table, record, or list).
