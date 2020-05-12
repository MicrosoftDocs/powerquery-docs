# Unpivot columns
In Power Query, you can transform columns into attribute-value pairs where columns become rows. You use Power Query's Query Editor to unpivot columns.

![image](https://user-images.githubusercontent.com/9544580/81667071-744bdf00-9408-11ea-880c-45e328c9f3da.png)

For example, imagine a table like the following:

![image](https://user-images.githubusercontent.com/9544580/81668364-3354ca00-940a-11ea-98de-555574d4e6f1.png)

That has the quantity of sales by sales person and by date as a matrix. We need to transform that table into the following one with unpivoted columns:

![image](https://user-images.githubusercontent.com/9544580/81668316-1e783680-940a-11ea-8f4e-2459b8da4ef1.png)

The key in this transformation is that we have a set of dates on the table that should all be part of a column. The respective value for each date and 'Sales Person' should be in a different column, effectively creating a value-pair. 

Power Query will always create the value-pair with two columns:
1. **Attribute** - Has the name of the column headers that were unpivoted.
2. **Value** - Has the values that were underneath each of the unpivoted columns.

There are multiple instances where to find the **Unpivot Columns** button by either right clicking on the columns that you wish to unpivot or by selecting the icon from the Transform menu in the ribbon. 

![Unpivot-button-inside-Ribbon](https://user-images.githubusercontent.com/9544580/81667541-03f18d80-9409-11ea-8519-acafbbc008b6.png)

![Unpivot-button-inside-right-click-menu](https://user-images.githubusercontent.com/9544580/81668414-44054000-940a-11ea-8737-e10a3f531be5.png)

There are three ways that we can unpivot columns from a table:
1. Unpivot Columns
2. Unpivot Other Columns
3. Unpivot Only Selected Columns

## Unpivot Columns
For the scenario described above, we first need to select the columns that we want to unpivot. You can hold the Ctrl key to select as many columns as you need. For our scenario, we want to select all the columns except the one with the header **Sales Person**.
After selecting the columns, you can right click on any of the selected columns and then left click on the Unpivot Columns button.

![image](https://user-images.githubusercontent.com/9544580/81668477-5aab9700-940a-11ea-9a54-a0cd488c5d2d.png)

The result of that operation will yield the following result:
![image](https://user-images.githubusercontent.com/9544580/81668606-8af33580-940a-11ea-97f3-2e96a1bd6064.png)

## Unpivot Other Columns
It is also possible to only select the columns that we do not want to unpivot and only unpivot the rest of the columns from the table. This is where **Unpivot Other Columns** comes into play.

![image](https://user-images.githubusercontent.com/9544580/81669149-677cba80-940b-11ea-8954-100e740a4db9.png)

The result of that operation will yield exactly the same result as the one that we got from **Unpivot Columns**.

![image](https://user-images.githubusercontent.com/9544580/81669192-7b282100-940b-11ea-94ab-d095da185012.png)

>[!NOTE]
>This transformation is crucial for queries with unknown number of columns. The operation will unpivot all columns from our table except the ones that we've selected. 
>This is a ideal solution if the data source of our scenario had new date columns in a refresh as those will get picked up and unpivoted. 

## Unpivot Only Selected Columns
The purpose of this last option is to only unpivot specific columns from our table. This is quite important for scenarios where we're dealing with an unknown number of columns from our data source and we only want to unpivot the selected columns.

To perform this operation we select the columns to unpivot, and select the option to **Unpivot Only Selected Columns**.

![image](https://user-images.githubusercontent.com/9544580/81670742-ab70bf00-940d-11ea-9329-3ab876d4d1e2.png)

The result of that operation will yield the same result as the previous examples, but it will behave differently if there are new columns on the data source when the query refreshes. 

![image](https://user-images.githubusercontent.com/9544580/81670893-e70b8900-940d-11ea-962e-4f6ffb7b0f65.png)

>[!NOTE]
>This transformation is crucial for queries with unknown number of columns. The operation will unpivot only the selected columns from our table. 
>This is an ideal solution if the data source of our scenario had new columns that were related to the 'Sales Person' such as their employee ID, Business Unit or other information not attributed to the dates of the sales.

