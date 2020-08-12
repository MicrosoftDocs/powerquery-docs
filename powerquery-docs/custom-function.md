---
title: Custom Function
description: An article on how to create custom functions in Power Query
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 08/31/2020
ms.author: v-miesco
---
# Custom Function

If you find yourself in a situation where you need to apply the same set of transformations to different queries or values, creating a Power Query custom function that can be reused as many times as you need could be beneficial. A Power Query custom function is a mapping from a set of input values to a single output value, and is created from native M functions and operators. 

While you can manually create your own Power Query custom function using code as shown in the article [Understanding Power Query M functions](https://docs.microsoft.com/powerquery-m/understanding-power-query-m-functions), the Power Query User Interface offers you features to expedite, simplify, and enhance the process of creating and managing a custom function. 
This article focuses on this experience provided only through the Power Query User Interface and how to get the most out of it.

## Create a custom function

You can follow along with this example by downloading the sample files used in this article from the following [download link](https://aka.ms/PQCombineFilesSample). For simplicity, this article will be using the Folder connector. To learn more about the Folder connector, see [Folder](Connectors/folder.md). The goal of this example is to create a custom function that can be applied to all the files in that folder before combining all of the data from all files into a single table.

After connecting to the folder where your files are located, right-click on the Binary value of your choice from the **Content** field and select the option that reads **Add as New Query**. For this example, you'll see that the selection was made for the first file from the list, which happens to be the file *April 2019.csv*.

![Selecting a file to be our Sample File](images/me-custom-function-add-as-new-query.png)

This will effectively create a new query with a navigation step directly to that file as a Binary, and the name of this new query will be the file path of the selected file. Rename this query to be **Sample File**.

![Sample File query](images/me-custom-function-sample-file-query.png)

Create a new parameter with the name **File Parameter** and use the **Sample File** query as the Current Value as shown in the image below.

![File parameter](images/me-custom-function-file-parameter.png)

>[!NOTE]
>It is highly recommended that you read the article on [Parameters](parameters.md) to better understand how to create and manage parameters in Power Query. 
>Custom functions can be created using any parameters type. There's no requirement for any custom function to have a binary as a parameter.
>It is possible to create a custom function without a parameter. This is commonly seen in scenarios where an input can be inferred from the environment where the function is being invoked. For example, a function that takes the environment's current date and time and creates a specific text string from those values.  

Right-click the **File Parameter** from the Queries pane and select the option that reads **Reference**.

![Reference the File Parameter](images/me-custom-function-reference-file-parameter.png)

Rename the newly created query from **File Parameter (2)** to **Transform Sample file**.

![Renamed query Transform Sample file](images/me-custom-function-reference-file-parameter-query-renamed.png)

Right-click this new **Transform Sample file** query and select the option that reads *Create Function...*. 

![Create a function from Transform Sample file](images/me-custom-function-transform-sample-file-function.png)

This will effectively create a new function that will be linked with the **Transform Sample file** query. Any changes that you make to the **Transform Sample file** query will be automatically replicated to your custom function. During the creation of this new function, use **Transform file** as the *Function name*.

![Create a function window for Transform file](images/me-custom-function-transform-sample-file-function-window.png)

After creating the function, you'll notice that a new group will be created for you with the name of your function. This new group will contain:
* All parameters that were referenced in your **Transform Sample file** query
* Your **Transform Sample file** query or commonly known as the *Sample query*.
* Your newly created function, in this case **Transform file**

![Function group](images/me-custom-function-group.png)

### Applying transformations to Sample query

With your new function created, select the query with the name **Transform Sample file**. This query is now linked with the **Transform file** function, so any changes made to this query will be reflected on the function. This is what is known as the concept of a Sample query linked to a function.

The first transformation that needs to happen to this query is the one that will interpret the binary. You can simply right-click the binary from the preview pane and select the CSV option to interpret the binary as a CSV file.

![Interpret binary as CSV](images/me-custom-function-csv.png)

The format of all the CSV files in the folder is the same. They all have a header that spans the first top four rows. The column headers are located in row five and the data starts from row six downwards as shown in the next image.

![Sample CSV data](images/me-custom-function-sample-csv-data.png)

The next set of transformation steps that need to be applied to the **Transform Sample file** are:
1. **Remove the top four rows** - This will get rid of the rows that are considered part of the header section of the file.

![Remove top rows from Transform Sample file](images/me-custom-function-sample-csv-remove-top-rows.png)

>[!NOTE]
> Learn more about how to remove rows or filter a table by row position from the article [Filter by row position](filter-row-position.md).

2. **Promote headers** - The headers for your final table are now in the first row of the table. You can promote them as shown in the next image.

![Use first row as headers](images/me-custom-function-sample-csv-promote-headers.png)

Power Query by default will automatically add a new *Changed Type* step after promoting your column headers that will automatically detect the data types for each column. Your **Transform Sample file** query will look as shown in the next image.

>[!NOTE]
> Learn more about how to promote and demote headers from the article [Promote or demote column headers](table-promote-demote-headers.md).

![Final transform sample query](images/me-custom-function-final-transform-sample-query.png)

>[!CAUTION]
>Your **Transform file** function relies on the steps performed in the **Transform Sample file** query. However, if you try to manually modify the code for the **Transform file** function, you will be greeted with a warning that reads *The definition of the function 'Transform file' is updated whenever query 'Transform Sample file' is updated. However, updates will stop if you directly modify function 'Transform file'.*  

## Invoke Custom Function as a new column

With the custom function now created and all the transformation steps incorporated, you can go back to the original query where you have the list of files from the folder. Inside the *Add Column* menu in the ribbon, select the button that reads *Invoke Custom Function* from the General group. Inside the *Invoke Custom Function* window enter **Output Table** as the *New column name* and select the name of our function, **Transform file**, from the *Function query* dropdown. After selecting the function from the dropdown menu, the parameter for the function will be displayed and you can select which column from the table to use as the argument for this function. Select the column **Content** as the value / argument to be passed for the **File Parameter**.

![Invoke custom function button in Add column menu](images/me-custom-function-invoke-custom-function.png)

After you hit OK, a new column with the name **Output Table** will be created which has Table values in its cells as shown in the next image. For simplicity, remove all columns from this table except **Name** and **Output Table**.

![Custom function invoked](images/me-custom-function-invoked-custom-function.png)

>[!NOTE]
> Learn more about how to choose or remove columns from a table from the article [Choose or remove columns](choose-remove-columns.md).


Your function was applied to each and every single row from the table using the values from the **Content** column as the argument for your function. Now that the data has been transformed into the shape that you're looking for, you can expand the **Output Table** column as shown in the image below without using any prefix for the expanded columns.

![Expand Output Table column](images/me-custom-function-invoked-custom-function-expanded-window.png)

You can check that your you have data from all files in the folder by checking the values in the **Name** or **Date** column. For this case, you can check the values from the Date column as each file only contains data for a single month from a given year. If you see more than one, it means that you've successfully combined data from multiple files into a single table.

![Validating that the final table contains data from all files](images/me-custom-function-invoked-custom-function-all-data-expanded.png)

>[!NOTE]
>What you've read so far is fundamentally the same process that happens during the **Combine files** experience but done manually.
>It is highly recommended that you also read the  article on [Combine files overview](combine-files-overview.md) and [Combine CSV files](combine-files-csv.md) to further understand how the Combine files experience works in Power Query and the role that custom functions play.


## Add new parameter to existing custom function

Imagine that there's a new requirement on top of what you've built. The new requirement requires that before you combine the files, you filter the data inside them to only get the rows where the Country is equals to *Panama*.

To make this happen, create a new parameter called **Market** with the text data type and for the **Current Value** you enter the value *Panama*.

![New parameter](images/me-custom-function-second-parameter.png)

Now with this new parameter, select the **Transform Sample file** query and filter the Country field using the value from the **Market** Parameter.

![Filter Country column using the new Market parameter](images/me-custom-function-filter-using-second-parameter.png)

>[!NOTE]
> Learn more about how to filter columns by values from the article [Filter values](filter-values.md).

Applying this new step to your query will automatically update the **Transform file** function, which will now require two parameters based on the two parameters that your **Transform Sample file** uses.

![Function updated with now two parameters](images/me-custom-function-with-second-parameter.png)

The **CSV files** query has a warning sign next to it. The reason behind this is that now that your function has been updated and it requires two parameters, the step where you invoke the function results in error values since only one of the arguments was passed to the **Transform file** function during the *Invoked Custom Function* step.

![Errors after function update](images/me-custom-function-errors-after-function-update.png)

To fix the errors, double-click the *Invoked Custom Function* to bring the **Invoke Custom Function** window and in the Market parameter manually enter the value *Panama*.

![Updating Invoked Custom Function arguments](images/me-custom-function-updated-arguments.png)

You can now check your query to validate that only rows where the *Country* is equals to Panama show up in the final resultset of the **CSV Files** query.

![Final output table after updated arguments](images/me-custom-function-after-updated-arguments.png)