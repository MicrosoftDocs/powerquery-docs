---
title: Parameters
description: An article on how to use parameters in Power Query
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 08/30/2020
ms.author: v-miesco
---
# Using parameters

A parameter serves as way to easily store and manage a value that can be reused in one or multiple transformation arguments.

Transformations in Power Query can require none or many arguments to be entered by the user. 
For example, when using the *Keep top rows* transformations as showcased in the [Filter by row position](filter-row-position.md) article where you have to enter a numeric value in the *Number of rows* argument. A parameter can help you centralize and easily manage that numeric value not only in one transformation, but in as many transformations as you may need.

![Example of where a parameter could be of use](images/me-filter-row-position-keep-top-rows-window.png)

You can easily manage your parameters inside the **Manage Parameters** window. You can get to the **Manage Parameters** window by clicking the *Manage Parameters* option inside the *Manage Parameters* button in the Home tab.

![Manage Parameters window](images/me-parameters-manage-parameters.png)

## Creating a parameter

Power Query provides two easy ways to create parameters:

* **From an existing query** - You can easily right-click a query which output is a non-structured value such as, but not limited to, a date, text, number, and select the option to **Convert to Parameter**.
    
![Convert to parameter](images/me-parameters-convert-to-parameter.png)

>[!NOTE]
>You can also convert a parameter to a query by right-clicking the parameter and then selecting the option to **Convert To Query** as shown in the image below.
>
>![Convert to query](images/me-parameters-convert-to-query.png)

* **Using the Manage Parameters window** - You can click the *New Parameter* option from the dropdown menu of the Manage Parameters button in the Home tab, or you can launch the **Manage Parameters** window and click in the *New* button on the top to create a parameter. You can fill in this form and hit OK to create a new parameter.

![Create a parameter from the Manage Parameters window](images/me-parameters-create-parameter.png)

After creating the parameter, you can always go back to the **Manage Parameters** window to modify any of your parameters at any moment.

## Components of a parameter

A parameter stores a value that can be used for transformations in Power Query. Apart from the name of the parameter and the value that it stores, it also has other components that provide metadata to it. The components of a parameter are as follows.

* **Name** - The name to distinguish the parameter.
* **Description** - A general description of your parameter.
* **Required** - Denotes if the parameter should be treated as a required or optional parameter when used inside a function. 
* **Type** - It is highly recommended that you always set up the data type of your parameter. You can learn more about the importance of data types from the article [Data types](data-types.md).
* **Suggested Values** - Provides the user with options to select a current value from the available options:
    * *Any value* - The current value can be any manually entered value. 
    * *List of values* - Provides you with a simple table-like experience so you can define a list of suggested values that you can later select from for the **Current Value**. When this option is selected a new option called *Default Value* will be available where you can select what should be the default value for this parameter, which will be the default value shown to the user when referencing the parameter. This is not to be confused with the **Current Value, which is the value that is stored inside the Parameter and can be passed as an argument in transformations. Using this option will enable a drop-down menu to be displayed in the *Default Value* and **Current Value** fields where you can pick one of the values from the suggested list of values.

    ![Parameter with a suggest list of values](images/me-parameters-list-of-values.png)

    * *Query* - Uses a list query (a query whose output is a list) to provide the list of suggested values that you can later select for the **Current Value**.

    ![Parameter with list query](images/me-parameters-query.png)

* **Current Value** - The value that will be stored with this parameter.

## Where to use parameters

A parameter can be used in many different ways, but it is more commonly used in two scenarios:
* **Transformation step argument** - With the use of the User Interface you can use a parameter as the argument of multiple transformations driven from the User Interface.
* **Custom Function argument** - You can create a new function from a query and reference parameters as the arguments of your custom function.

In the next sections, you'll see an example for these two scenarios.

### Step arguments

To enable this feature, first go to the *View* tab in the Power Query Editor and enable the *Always allow* option in the Parameters group.

![Always allow parameters](images/me-parameters-always-allow.png)

>[!NOTE]
>This feature is currently not availble in Power Query Online experiences.

For example purposes, you can see the following **Orders** query with the fields OrderID, Units, and Margin.

![Sample table for Orders with margin](images/me-parameters-step-argument-sample-table.png)

You can create a new parameter with the name **Minimum Margin** with a *Decimal Number* type and a *Current Value* of 0.2 as shown in the next image:

![Sample Parameter](images/me-parameters-step-argument-sample-parameter.png)

You can go to the **Orders** query, and in the Margin field select the filter option with the name *Greater Than...*.

![Greater than filter option for Margin field](images/me-parameters-step-argument-sample-parameter-greater-than.png)

In the **Filter rows** window you will see a button with a data type for the field selected. You can click this button to display a dropdown menu in which you can select the option to use a Parameter. From the field selection right next to it you can select the parameter that you want to pass to this argument. In this case it's the *Minimum Margin* parameter.

![Select parameter for transformation argument](images/me-parameters-step-argument-sample-parameter-select-parameter.png)

After you hit OK, you can see that your table has been filtered using the **Current Value** for your Parameter.

![Sample parameter used as a transformation argument](images/me-parameters-step-argument-sample-parameter-used.png)

You can modify the **Current Value** of your *Minimum Margin* parameter to be 0.3 and you can immediately see how your Orders query gets updated and shows you only the rows where the *Margin* is above 30%.

![Updated Current Value for parameter](images/me-parameters-step-argument-sample-parameter-updated.png)

>[!TIP]
> Multiple transformations in Power Query offer this experience where you can select your parameter from a dropdown, so it is recommended that you always look for it and take advantage of what parameters can offer you. 

### Custom Function argument

You can learn more about how to create Custom Functions from the article [Creating a Custom Function](custom-function.md).