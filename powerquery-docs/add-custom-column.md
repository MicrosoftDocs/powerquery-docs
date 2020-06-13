# Add a Custom column

*Content partially taken from the Power BI docs [article](https://docs.microsoft.com/en-us/power-bi/create-reports/desktop-add-custom-column).*

In Power Query, you can create your custom column using the PowerQuery M formula language. PowerQuery M formula language has a comprehensive function reference content set.

Imagine that we have the following table with a set of columns: 

![image](images/me-add-custom-column-initial-table.png)

Using the columns Units, Unit Price and Discount, We would like to create a two new columns:

* **Total Sale before Discount** - calculated by multiplying the Unit column times the Unit Price
* **Total Sale after Discount** - calculated by multiplying the **Total Sale before Discount** column by the net percentage value ( one minus the discount value )

The final table with the new columns will look like this:

![image](images/me-add-custom-column-final-table.png)

## To add a custom column

To create a custom column,  click on the **Custom Column** button from the **Add Column** tab on the ribbon.

![images](images/me-add-custom-column-icon.png)

After selecting this, a new **Add Custom Column** window appears.

![images](images/me-add-custom-column-window.png)

This is where we define the the formula to create our columns.

The **Add Custom Column** window has the following features: 
- A list of available columns, in the **Available columns** list on the right.

- The initial name of your custom column, in the **New column name** box. You can rename this column.

- [PowerQuery M formula](https://docs.microsoft.com/powerquery-m/power-query-m-function-reference), in the **Custom column formula** box.  

To add a new custom column, you can select a column from the **Available columns** list on the right, and then select **Insert** below the list to add them to the custom column formula. You can also add a column by double-clicking it in the list. Alternatively, you can write your own formula using the Power Query formula language.

>[!Note]
>If there's a syntax error when creating your custom column, you'll see a yellow warning icon, along with an error message and reason. 

### Adding the Total Sales before Discount column

The formula that we will use to create the **Total Sale before Discount** is ```[Units] * [Unit Price]  ``` and this is how it'll look in our Custom column window:

![image](images/me-add-custom-column-total-sale-before-discount.png)

The result of that operation will add a new 'Total Sales beforre Discount' column to our table and will look like the following image:

![image](images/me-add-custom-column-total-sale-before-discount-column.png)

### Adding the Total Sales after Discount column

The formula that we will use to create the **Total Sale before Discount** is ```[Total Sale before Discount]* (1-[Discount])  ``` and this is how it'll look in our Custom column window:

![image](images/me-add-custom-column-total-sale-after-discount.png)

The result of that operation will add a new 'Total Sales after Discount' column to our table and will look like the following image:

![image](images/me-add-custom-column-total-sale-after-discount-column.png)

### Setting the column Data Types

Notice that our new columns do not have a data type defined yet. We can tell this by looking at the icon in the header of the column which has the *any* data type icon (ABC123). We want to change the data types of both new columns to the type currency. To do that, we select both columns, go to the Home tab and inside the 'Transform' group click the data type dropdown and select the **Currency** data type.

![image](images/me-add-custom-column-data-types.png)

After defining the data types for both columns, this is how our table will look like:

![image](images/me-add-custom-column-final-table.png)

## Modify an existing custom column

Power Query adds your custom column to the table, and adds the **Added Custom** step to your query's **Applied Steps** list in **Query Settings**.

![Custom column added to Query Settings](images/me-add-custom-column-reconfigure.png)

To modify your custom column, double-click the **Added Custom** step in the **Applied Steps** list. 

   The **Add Custom Column** window appears with the custom column formula you created.
   
## Next steps

- You can create a custom column in other ways, such as creating a column based on examples you provide to Query Editor. For more information, see [Add a column from an example](column-from-example.md).

- For Power Query M reference information, see [Power Query M function reference](/powerquery-m/power-query-m-function-reference).