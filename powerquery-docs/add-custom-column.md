---
title: Add a custom column
description: An article that demonstrates how to create a custom column in Power Query
author: ptyx507
ms.service: powerquery
ms.reviewer: kvivek
ms.date: 06/08/2020
ms.author: v-miesco
ms.custom: edited
---

# Add a custom column

If you need more flexibility for adding new columns than the ones provided out of the box in Power Query, you can create your own custom column by using the Power Query M formula language.

Imagine that you have a table with the following set of columns.

![Sample initial table with Date, Country, Units, Unit Price and percent discount columns](images/me-add-custom-column-initial-table.png "Sample initial table")

Using the **Units**, **Unit Price**, and **Discount** columns, you'd like to create two new columns:

* **Total Sale before Discount**: Calculated by multiplying the **Units** column times the **Unit Price** column.
* **Total Sale after Discount**: Calculated by multiplying the **Total Sale before Discount** column by the net percentage value (one minus the discount value).

The goal is to create a table with new columns that looks like the following image.

![Create custom Total Sale before Discount and Total Sale after Discount columns in a table](images/me-add-custom-column-example-table.png "Create custom columns in a table")

## Create a custom column

On the **Add column** tab, select **Custom column**.

![Custom column command on the Add column tab](images/me-add-custom-column-icon.png "Custom column command on the Add column tab")

The **Custom column** dialog box appears. This dialog box is where you define the formula to create your column.

![Custom column dialog box](images/me-add-custom-column-window.png "Custom column dialog box")

The **Custom column** dialog box contains:

* An **Available columns** list on the right.

* The initial name of your custom column in the **New column name** box. You can rename this column.

* [Power Query M formula](/powerquery-m/power-query-m-function-reference) in the **Custom column formula** box.  

To add a new custom column, select a column from the **Available columns** list on the right side of the dialog box. Then select the **Insert column** button below the list to add it to the custom column formula. You can also add a column by selecting it in the list. Alternatively, you can write your own formula by using the Power Query M formula language in the **Custom column formula** box.

>[!NOTE]
>If there's a syntax error when creating your custom column, you'll see a yellow warning icon, along with an error message and reason.

### Adding the Total Sale before Discount column

The formula that you can use to create the **Total Sale before Discount** column is `[Units] * [Unit Price]`. The following image shows how it will look in the **Custom column** dialog box.

![Custom column formula for Total Sale before Discount](images/me-add-custom-column-total-sale-before-discount.png "Custom column formula for Total Sale before Discount")

The result of that operation will add a new **Total Sale before Discount** column to your table and will look like the following image.

![Table with new custom column called Total Sale before Discount showing the price without the discount](images/me-add-custom-column-total-sale-before-discount-column.png "Table with new Total Sale before Discount custom column")

### Adding the Total Sale after Discount column

The formula that you can use to create the **Total Sale before Discount** is `[Total Sale before Discount]* (1-[Discount]) `. The following image shows how it will look in your **Custom column** dialog box.

![Custom column formula for Total Sale after Discount](images/me-add-custom-column-total-sale-after-discount.png "Custom column formula for Total Sale after Discount")

The result of that operation will add a new **Total Sale after Discount** column to your table and will look like the following image.

![Table with new custom column called Total Sale after Discount showing the price with the discount applied](images/me-add-custom-column-total-sale-after-discount-column.png "Table with new Total Sale after Discount custom column")

### Setting the column data types

Notice that your new columns don't have a data type defined yet. You can tell this by looking at the icon in the header of the column that has the data type icon (ABC123). You'll want to change the data types of both new columns to Currency. 

1. Select both the **Total Sale before Discount** and **Total Sale after Discount** columns.

2. On the **Home** tab, in the **Transform** group, select **Data type** > **Currency**.

![Data types on the Home tab](images/me-add-custom-column-data-types.png "Data types on the Home tab")

After defining the data types for both columns, you'll create a table that looks like the following image.

![Sample final table](images/me-add-custom-column-final-table.png "Sample final table")

## Modify an existing custom column

Power Query adds your custom column to the table and adds the **Added custom** step to the **Applied steps** list in **Query settings**.

![Custom column added to the applied steps list](images/me-add-custom-column-reconfigure.png "Custom column added to the applied steps list")

To modify your custom column, select the **Added custom** step in the **Applied steps** list. 

The **Custom column** dialog box appears with the custom column formula you created.

## Next steps

- You can create a custom column in other ways, such as creating a column based on examples you provide to Power Query Editor. More information: [Add a column from an example](column-from-example.md)
- For Power Query M reference information, go to [Power Query M function reference](/powerquery-m/power-query-m-function-reference).