---
title: Best practices when working with Power Query
description: Best practices when working with Power Query
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 08/31/2020
ms.author: v-miesco
---
# Best practices when working with Power Query

Below are some tips and tricks to make the most out of your data wrangling experience in Power Query.

## Choose the right connector

Power Query offers a vast number of data connectors ranging from data sources such as TXT, CSV, and Excel files, to databases such as Microsoft SQL Server and popular SaaS services such as Microsoft Dynamics 365 and Salesforce. 
If you don't see your data source listed in the *Get Data* window, you can always use the ODBC or OLEDB connector to connect to your data source. 

Using the best connector for the task will provide you with the best experience and performance. For example, using the SQL Server connector instead of the ODBC connector when connecting to a SQL Server database will not only provide you with a much better *Get Data* experience, but the SQL Server connector also offers you features that can improve your experience and performance such as query folding. You can read more about query folding from the article [Power Query query folding](power-query-folding.md).

Each data connector follows a standard experience as explained in the article on [Getting data](get-data-experience.md). This standardized experience has a stage called **Data Preview** in which you're provided with a user-friendly window to select the data that you want to get from your data source, If the connector allows it, and a simple data preview of that data. You can even select multiple datasets from your datasource through the *Navigation* window as shown in the next image.

![Sample navigator window](images/me-navigator.png)

> [!NOTE]
> You can see the full list of available connectors in Power Query from the article [Connectors in Power Query](Connectors/index.md).

## Explore your data

Before you start preparing you data and adding new transformation steps, it is highly recommended that you enable the data profiling tools when using Power Query to easily discover information about your data.

![Data preview or data profiling tools in Power Query](images/me-data-preview-tools-enabled-v2.png)

These tools help you better understand your data by providing you with small visualizations that provide you with information on a per column basis such as.
* **Column quality** - Provides a small bar chart and three indicators with the representation of how many values in the column fall under the categories of valid, error, or empty values.
* **Column distribution** - This feature provides a set of visuals underneath the names of the columns that showcases the frequency and distribution of the values in each of the columns.
* **Column profile** - Provides a more thorough view of your column and the statistics associated to it.

You can also interact with these features, which will help you prepare your data.

![Data Quality hover options](images/me-column-quality-hover.png)

> [!NOTE]
> You can read more about the data profiling tools from the article [Data profiling tools](data-profiling-tools.md).

## Filter early

It is always recommended to filter your data in the early stages of your query or as early as possible. Some connectors will take advantage of your filters through query folding as described in the article [Power Query query folding](power-query-folding.md). 
It is also a best practice to filter out any data that is not relevant for your case. This will let you better focus in your task at hand also only show you the data that you're interested in within the data preview section.

You can use the Auto filter menu that displays a distinct list of the values found in your column to select the values that you want to keep or filter out. You can also use the search bar to help you find the values in your column.

![Auto filter menu in Power Query](images/me-filter-values-auto-filter-menu.png)

You can also take advantage of the Type-specific filters such as "is in the previous" for a date, datetime or even date timezone column.

![type specific filter for a date column](images/me-filter-values-date-column.png)

These type-specific filters can help you create a dynamic filter that will always retrieve data that is in the previous *x* number of seconds, minutes, hours, days, weeks, months, quarters, years as showcased in the image below.

![Is in the previous date-specific filter](images/me-is-in-the-previous.png)

> [!NOTE]
> You can read more about filtering your data based on values from a column from the article [Filter by values](filter-values.md).

## Use parameters 
Creating queries that are dynamic and flexible is a best practice. Parameters in Power Query help you make your queries more dynamic and flexible.
A parameter serves as way to easily store and manage a value that can be reused in many different ways, but it is more commonly used in two scenarios:
* **Step argument** - With the use of the User Interface you can use a parameter as the argument of multiple transformations driven from the User Interface.

![Select parameter for transformation argument](images/me-parameters-step-argument-sample-parameter-select-parameter.png)

* **Custom Function argument** - You can create a new function from a query and reference parameters as the arguments of your custom function.

![Create Function](images/me-parameters-create-function.png)

The main benefits of creating and using parameters are.

* Centralized view of all your parameters through the **Manage Parameters** window.

![Manage Parameters window](images/me-parameters-manage-parameters.png)

* Reusability of the parameter in multiple steps or queries.

* Makes the creation of custom functions straightforward and easy.

You can even use parameters in some of the arguments of the data connectors. For example, you could create a parameter for your Server name when connecting to your SQL Server database and use that parameter inside the SQL Server database dialog as shown below.

![SQL Server database dialog with parameter for server name](images/me-sql-server-parameter.png)

If you change your server location, all you need to do is update the parameter for your server name and your queries will be updated.

> [!NOTE]
> You can read more about creating and using parameters from the article [Using parameters](parameters.md).

## Document your work 
It is highly recommended that you document your queries by renaming or adding a description to your steps, queries, or groups as you see fit. 

While Power Query automatically creates a step name for you in the applied steps pane, you can also rename your steps or add a description to any of them.

![Applied steps pane with documented steps and description added](images/me-documenting.png)

> [!NOTE]
> You can read more about all the available features and components found inside the applied steps pane from the article [Using the Applied steps list](applied-steps.md).

## Take a modular approach

While it is entirely possible to create a single query that contains all the transformations and calculations that you may need, if the query contains a large number of steps then it might be a good idea to split the query into multiple queries where one query references the next. The goal of this approach is to simplify and decouple transformation phases into smaller pieces so they're easier to understand.

For example, if you have query with the nine steps below.

![Applied steps pane with documented steps and description added](images/me-documenting.png)

You could split this query into two at the **Merge with Prices table** step, so it's easier to understand the steps that were applied to the Sales query before the Merge. To do this, you can right-click the **Merge with Prices table** step and select the option that reads 

![Extract previous step](images/me-extract-previous.png)

You will then be prompted with a dialog to give your new query a name. This will effectively split your query into two queries. One that will have all the queries before the merge, and another one that will have an initial step that will reference your new query and the rest of the steps that you had in your original query from the **Merge with Prices table** step downward.

![Original query after the extract previous step action](images/me-extract-previous-referenced.png)

You could also leverage the use of query referencing as you see fit, but it's a good idea to keep your queries at a level that doesn't seem daunting at first glance with so many steps.

> [!NOTE]
> You can read more about query referencing from the article on [Understanding the queries pane](queries-pane.md#referencing-a-query).

## Use the correct data types 

Some features in Power Query are contextual to the data type of the column selected. For example, when selecting a date column, the available options under the *Date and time column* group in the **Add Column** menu will be available, but if the column doesn't have a data type set then these options will be greyed out.

![Type specific option in add column menu](images/me-type-specific-filter-for-date.png)

A similar situation occurs for the type-specific filters since they're specific to certain data types and if your column doesn't have the correct data type defined, these type-specific filters will not be available.

![type specific filter for a date column](images/me-filter-values-date-column.png)

It is crucial that you always work with the correct data types for your columns. When working with structured data sources such as databases, the data type information will be brought from the table schema found in the database, but for unstructured data sources such as TXT and CSV files, it is important that you set the correct data types for the columns coming from that data source.
By default, Power Query offers an automatic data type detection for unstructured data sources. You can read more about this feature and how it can help you from the article on [Data types](data-types.md#automatic-column-data-type-and-headers-detection).

> [!NOTE]
> You can read more about query the importante of data types and how to work with them from the article on [Data types](data-types.md).

## Future-proofing queries

Making sure that you create a query that will not have any issues on a future refresh is a top priority. To make your query resilient to changes and be able to refresh even when some components of your data source changes are something that is possible with several features in  Power Query.

It is a best practice to define the scope of your query as to what it should do and what it should account for in terms of structure, layout, column names, data types and any other component that you deem relevant to the scope.

Some examples of transformations that can help you make your query resilient to changes are:
* If your query has a dynamic number of rows with data, but a fixed number of rows that serve as the footer that should be removed, you can use the **Remove bottom rows** feature.

>[!NOTE]
> You can read more about filtering your data by row position from the article [Filter a table by row position](filter-row-position.md).

* If your query has a dynamic number of columns, but you only need to select specific columns from your dataset, you can use the **Choose columns** feature.

>[!NOTE]
> You can read more about choosing or removing columns from the article [Choose or remove columns](choose-remove-columns.md).

* If your query has a dynamic number of columns and you need to unpivot only a subset of your columns, you can use the **unpivot only selected columns** feature.

>[!NOTE]
> You can read more about the options to unpivot your columns from the article [Unpivot columns](unpivot-column.md).

* If your query has a step that changes the data type of a column but some cells yield errors as the values do not conform to the desired data type, you could remove the rows that yielded error values

>[!NOTE]
> You can read more about working and dealing with errors from the article [Dealing with errors](dealing-with-errors.md#remove-errors).

## Create reusable functions
If you find yourself in a situation where you need to apply the same set of transformations to different queries or values, creating a Power Query custom function that can be reused as many times as you need could be beneficial. A Power Query custom function is a mapping from a set of input values to a single output value, and is created from native M functions and operators.

For example, if you have multiple queries or values that require the same set of transformations, you could create a custom function that later could be invoked against the queries or values of your choice saving you time and helping you in managing your set of transformations in a central location, which you can modify at any moment.

Power Query custom functions can be created from existing queries and parameters. For example, imagine a query that has several codes as a text string and you wish to create a function that will decode those values.

![List of codes](images/me-sample-flight-data.png)

You start by having a parameter that has a value that serves as an example.

![Sample parameter code value](images/me-sample-parameter-code.png)

From that parameter, you create a new query where you apply the transformations that you need. For this case, you want to split the code *PTY-CM1090-LAX* into multiple components:
* **Origin** = PTY
* **Destination** = LAX
* **Airline** = CM
* **FlightID** = 1090

![Sample transform query](images/me-sample-transform-query.png)

You can then transform that query into a function by doing a right-click on the query and selecting **Create Function..**. Finally, you can invoke your custom function into any of your queries or values as shown in the next image.

![Invoking a custom function](images/me-invoke-custom-function.png)

After a few more transformations, you can see that you've reached your desired output and leveraged the logic for such transformation from a custom function.

 [ ![Final output query after invoking a custom function](images/me-invoked-custom-function.png) ](images/me-invoked-custom-function.png#lightbox)

>[!NOTE]
> You can read more about how to create and use custom functions in Power Query from the article [Custom Functions](custom-function.md).

## Create groups

A great way to keep your work organized is by leveraging the use of groups in the queries pane.

![Working with groups in Power Query](images/queries-pane-move-to-group.png)

The sole purpose of groups is to help you keep your work organized by serving as folders for your queries. You can create groups within groups should you ever need to. Moving queries across groups is as easy as drag and drop. 

Try to give your groups a meaningful name that makes sense to you and your case.

> [!NOTE]
> You can read more about all the available features and components found inside the queries pane from the article [Understanding the queries pane](queries-pane.md).    