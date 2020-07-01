---
title: Add a conditional column
description: With Power Query, you can add a conditional column to your query. You can define IF-THEN-ELSE conditions in your query. When the conditions are fulfilled, the conditional column will automatically display the values that you specified.
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 06/30/2020
ms.author: v-miesco
---

# Add a conditional column

With Power Query, you can add a conditional column to your query. You can define IF-THEN-ELSE conditions in your query. When the conditions are fulfilled, the conditional column will automatically display the values that you specified.

The **Conditional column** button is located in the *Add column* tab in the ribbon, inside the *General* group:

![Conditional Column button](images/me-add-conditional-column-button.png)

## To add a conditional column

For demonstration purposes, we will be using the following table:

![Sample table](images/me-add-conditional-column-sample-table-start.png)

In this table we have a field that gives us the **CustomerGroup**. We also have different prices applicable to that customer in the fields **Tier 1 Price**, **Tier 2 Price**, and **Tier 3 Price**. Our goal is to create a new column with the name **Final Price** based on the value found in the **CustomerGroup** field. If the value in the **CustomerGroup** field is equal to 1, then we want to use the value from the **Tier 1 Price** field, else we use the value from the **Tier 3 Price**.   

To add this conditional column, we select the *Conditional column* button and a new window called the *Add conditional column* window will appear. In this window we can define 3 pieces:

![Simple conditional column clause](images/me-add-conditional-column-one-clause.png)

1. **New column name** - we can define the name of our new column. In this case we'll use the name "Final Price".
2. **Conditional clauses** - where we define our conditional clauses. We can add more clauses by  clicking on the "Add clause button". Each conditional clause will be tested on the order shown in the window from top to bottom. Each clause has 4 parts:
   - **Column name** - From the dropdown, select the column to be used for the conditional test. For our demonstration, the column that we want to use is the *CustomerGroup*.  
   - **Operator** - select type of test or operator for the conditional test. For our demonstration, The value from the CustomerGroup has to be equal to 1, so we select *equals* from the dropdown list of operators. 
   - **Value** - you can enter a value or select a column to be used for the conditional test.  For our demonstration, this value will be 1.
   - **Output** - if the test is positive, then the value entered here or the column selected will be the Output. For our demonstration, if the *CustomerGroup* value is equals to 1, then our Output value should be the value from the ***Tier 1 Price*** column.
3. **Final Else clause** - if none of the clauses above yield a positive test, the output of this operation will be the one defined here as a manually entered value or a value from a column.  In this case, the output will be the value from the ***Tier 3 Price*** column.

The result of that operation will give us a new **Final Price** column as shown in the next image:

![New conditional column](images/me-add-conditional-column-sample-table-mid.png)

>[!Note]
> New conditional columns will not have a data type defined. You can add a new step to define a data type for this newly created column by following this article on [Data Types](data-types.md).

### Adding and organizing multiple clauses

For demonstration purposes, we'll change our goal. Our new conditional clauses are:
* If the value from the **CustomerGroup** column is equal to 1, then the Output shall be the value from the **Tier 1 Price** column
* If the value from the **CustomerGroup** column is equal to 2, then the Output shall be the value from the **Tier 2 Price** column
* If none of the previous tests are positive, then the Output shall be the value from the **Tier 3 Price** column

![Multitple conditional column clauses](images/me-add-conditional-column-multiple-clauses.png)

>[!Note]
> At the end of each clause we'll have a contextual button (shown as three dots) that will allow us to Delete, Move up, and Move down our clauses.

The result of that operation will give us exactly the result that we were looking for:

![Final conditional column](images/me-add-conditional-column-sample-table-final.png)
