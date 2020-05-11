# Data Discovery Tools

The main objective of the Data Discovery tools is to provide the user with new and intuitive ways to clean, transform and understand their data within the Power Query Editor Window.

These Data Discovery tools are:

1. Column Quality
2. Column Distribution
3. Column Profile

By default, only a small version of the Column Quality is enabled, but it is possible to fully enable them by going to the Power Query Editor Window, select the View tab from the ribbon and enable these options as shown in the image below:

![Image to show how to enable these](img.png)

Once enabled, this is how they'll be seen inside the Power Query Editor Window:

![img](https://350519-1085912-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2019/08/080519_1345_DataProfili2.png)

Each tool is independent from the other. This means that you can select which ones to enable and which ones you'd like to keep as disabled.
>[!NOTE]
>By default, Power Query will perform these Data Discovery features over the first 1,000 rows of your data. In order to enable these, check the bottom left query of your editor window to change how the column profiling is performed.

## Column Quality

The column quality feature provides the user with a simple visual that detects rows with values in 3 categories:
* **Valid** - colored in red
* **Error** - colored in green
* **Empty** - colored in dark grey

These indicators are also displayed right underneath the name of the column as part of a small bar chart.

Furthermore, it also provides simple statistics of such categories and by hovering over either one of them we get some quick actions buttons for the operations that we can perform over the values in each category:

![img](https://350519-1085912-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2019/08/080519_1345_DataProfili5.png)

## Column Distribution 

This feature provides a set of visuals underneath the names of the columns that showcases the frequency and distribution of the values in each the columns. The data inside those visualizations is sorted in descending order from the value with the higher frequency. 

![img](https://350519-1085912-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2019/08/080519_1345_DataProfili8.png)

Besides being informational of the overall data inside the column (with distinct count and unique values), mouseover operations are also available:

![img](https://350519-1085912-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2019/08/080519_1345_DataProfili9.png)

## Column Profile 

This feature provides a more in-depth look at the data within a particular column.  Apart from the Column Distribution chart, there is also a Column Statistics. This information is displayed underneath the data preview section as shown in the next image:

![img](https://350519-1085912-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2019/08/080519_1345_DataProfili11.png)

### Filter by value

You can interact with the value distribution chart on the right and select any of the bars with either a mouseover or a right click to display a set of available transformations for that value.

[Image of the mouseover and right click interactions](image.png) 

### Copy data

On the top right hand corner of both the Column statistics and value distribution sections there's a small icon of three dots. By clicking on these three dots a contextual menu is displayed and within this menu there's an option to copy the contents of the data displayed in such section to the clipboard.

[Image of the copy option](image.png) 

### Group by value

On the top right hand corner of the Value distribution chart there's a small icon of three dots. When clicking on this contextual three dots, you'll get the option to use the 'Group by' feature to group your values in the chart by a set of options available. Once the values have been grouped in the chart, you can interact with it and interact with it as showcased in the 'Filter by value' section of this article.

[Image o group by as a before and after picture](image.png) 
