# Add a column from examples

With add column from examples in Power Query Editor, you can add new columns to your data model simply by providing one or more example values for the new columns. You can create the new column examples from a selection, or provide input based on all existing columns in the table.

![Add column example](images/me-add-column-from-example.png)

Using add column from example lets you quickly and easily create new columns, and is great for the following situations:

* You know the data you want in your new column, but you're not sure which transformation, or  collection of transformations, will get you there.
* You already know which transformations you need, but you're not sure what to select in the UI to make them happen.
* You know all about the transformations you need using a Custom Column expression in M language, but one or more of those expressions aren't available in the UI.

Adding a column from an example is easy and straightforward. The button to create a Column from Examples is located in the **Add Column** tab in the Ribbon, inside the General group:

![Add column from example icon](images/me-add-column-from-example-icon.png)


## Add a new column from examples

We will start with the following table:

![Original table](images/me-add-column-from-example-original-table.png)

Our goal is to create create two new columns:
* **Income Range** - Create buckets for the *Monthly Income* column in specific ranges of 5,000 increments.
* **Full Name** - Concatenate the Last and First Name in a single column.

![Final table](images/me-add-column-from-example-final-table.png)

### Column from Examples from selected column(s)

One of the options that we have when creating our new column from examples is to select which columns to base our calculations. For this case, we will be creating the **Income Range** column from the values inside the **Monthly Income** column.

To do this, we simply select the **Income Range** column and then click the Column from Examples dropdown menu to select the *From Selection* option:

![Column from examples in selected column](images/me-add-column-from-example-from-selection.png)

The preview pane will change its aspect to display a new editable column. In tthis new column we can enter the example values so that Power Query can create the formula that will yield that result for us. For the first example, the value from the selected column is 19500, so in our new column we enter the text '15000 to 20000' which is the bucket where that value falls:

![New Range from example](images/me-add-column-from-example-from-selection-buckets.png)

Automatically, Power Query will try to provide suggestions based on the value entered. These values in the column are in a lighter color to denote that are being suggested by Power Query and not manually entered by the end-user. You can also see a glimpse of the formulat that is being created by Power Query for us in the top section

After we hit OK, we'll see our column from example now as part of our query and a new step added to our query:

![image](images/me-add-column-from-example-from-selection-buckets-final.png)

### Column from Examples from all columns

Our new goal is to create a **Full Name** column using the values from the columns first and last name.

To do that, we select the option to create a column from examples **From All Columns**:

![images](images/me-add-column-from-example-from-all-columns.png)

Now inside the experience to create a column from examples, we input the **Full Name** in the format that we're lookin for. Our format is the Last Name followed by a comma, then a space and ultimately the first name. For the first row, that example value is *Anders, Maria*:

![images](images/me-add-column-from-example-from-all-columns-full-name.png)

After we hit OK, we'll see our column from example now as part of our query and a new step added to our query:

![images](images/me-add-column-from-example-from-all-columns-full-name-final.png)

Our last step is to remove the columns **First Name**, **Last Name** and **Monthly Income**, and our final table will look like this:

![Final table](images/me-add-column-from-example-final-table.png)

## Tips and Considerations

When providing examples, Power Query also offers a helpful list of available fields, values and suggested transformations for the selected columns. You can view this contextual list by double clicking on any cells of the column from examples:

![image](images/me-add-column-from-example-suggestions.png)

It is important to note that the **Column From Examples** experience works only on the top 100 rows of your query. You can apply steps prior to the **Column From Examples** step to create your own sample of your data. Once the **Column From Examples** column has been created, you can remove those prior steps and the newly created column won't be affected 

## List of supported transformations
Many but not all transformations are available when using **Add Column from Examples**. The following list shows the supported transformations:

**General**

- Conditional Column

**Reference**
  
- Reference to a specific column, including trim, clean, and case transformations

**Text transformations**

- Combine (supports combination of literal strings and entire column values)
- Replace
- Length
- Extract   
  - First Characters
  - Last Characters
  - Range
  - Text before Delimiter
  - Text after Delimiter
  - Text between Delimiters
  - Length
  - Remove Characters
  - Keep Characters

> [!NOTE]
> All *Text* transformations take into account the potential need to trim, clean, or apply a case transformation to the column value.

**Date transformations**

- Day
- Day of Week
- Day of Week Name
- Day of Year
- Month
- Month Name
- Quarter of Year
- Week of Month
- Week of Year
- Year
- Age
- Start of Year
- End of Year
- Start of Month
- End of Month
- Start of Quarter
- Days in Month
- End of Quarter
- Start of Week
- End of Week
- Day of Month
- Start of Day
- End of Day

**Time transformations**

- Hour
- Minute
- Second  
- To Local Time

> [!NOTE]
> All *Date* and *Time* transformations take into account the potential need to convert the column value to *Date* or *Time* or *DateTime*.

**Number transformations** 

- Absolute Value
- Arccosine
- Arcsine
- Arctangent
- Convert to Number
- Cosine
- Cube
- Divide
- Exponent
- Factorial
- Integer Divide
- Is Even
- Is Odd
- Ln
- Base-10 Logarithm
- Modulo
- Multiply
- Round Down
- Round Up
- Sign
- Sin
- Square Root
- Square
- Subtract
- Sum
- Tangent
- Bucketing/Ranges