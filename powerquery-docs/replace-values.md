# Replace Values and Errors

With Power Query, you can replace one value with another value in a selected column. There are three ways to start a replace values operation in Power Query:

- **Right click on a cell** - this will display a contextual menu with the option to replace the selected value in the column with another value. 

![](images/me-replace-values-right-click.png)

- **Right click on a column** - this displays a contextual menu for operations available in the selected column.

![](images/me-replace-values-right-click-column.png)

- **Home tab** - the Replace values button can be found inside the Transform group in the Home tab.

![](images/me-replace-values-home-tab.png)

- **Transform tab** - the Replace values button can be found inside the Any Column group in the Transform tab.

![](images/me-replace-values-transform-tab.png)

## Replace Values modes

For the Replace Values operation, we have two modes:

- **Replace instances of a text string** - this is the default behavior for text columns where Power Query will search for a specific text string inside all rows of a column and replace as many instances of the text string that it finds on all rows.
- **Replace entire cell content** - for non-text columns this is the default behavior, but for text columns this is enabled by going through the Advanced Options and selecting the "Match entire cell contents" option. This will effectively make the 'Replace Values' operation to work exactly as it does with non-text columns where it only searches and replaces the full contents of a cell. 

The 'Advanced Options' is only available in columns of the text data type. Within that set of options we have 'Replace using special characters' as shown in the next image:

![](images/me-replace-values-replace-using-special-characters.png)

### Replace entire cell content

Imagine a table like the following where we have a field for 'Account ID', 'Category Name' and 'Sales Goal':

![](images/me-replace-values-original-table.png)

The -1 value in the 'Sales Goal' is an error in the source and needs to be replaced with a standard 'Sales Goal' defined by the business for these instances which is 250,000. To do that, we simply right click on the -1 value and select the option to replace values. This will bring the Replace Values window with the 'Value To Find' prepopulated with the -1 value. All we need to do is define the 'Replace With' value which has to be set at 250,000 as shown in the image below:

![](images/me-replace-values-numeric.png)

The outcome of that operation will give us the result that we're looking for:

![](images/me-replace-values-original-after-numeric-replace.png)

> Note
>
> The replace values operation in columns that are not of the text data type only look for exact matches for the contents of a cell. To enable this behavior in text columns, select the 'match entire cell contents' from the advanced options in the Replace values window

### Replace instances of a text string

Continuing with the previous table, we want to replace the text string "Category Name: " from the "Category Name" column. To do that, we can select the replace values option from the Transform group in the Home tab. Inside the Replace Values window, we enter the text string "Category Name: " in the 'Value To Find' textbox and leave the 'Replace With' text box empty as shown in the next image:

![](images/me-replace-values-text.png)

The result of that operation gives us the following table:

![](images/me-replace-values-final-table.png)
