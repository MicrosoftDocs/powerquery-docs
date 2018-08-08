---
title: Quickstart - using Power Query in Power BI
description: In this quickstart, you learn to use Power Query in Power BI Desktop
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerquery
ms.component: power-query
ms.topic: quickstart
ms.date: 08/10/2018
ms.author: davidi

LocalizationGroup: Get started
---
# Quickstart: Using Power Query in Power BI Desktop

With **Power Query** in **Power BI** you can connect to many different data sources, transform the data into the shape you want, and quickly be ready to create reports and insights. When using Power BI Desktop, **Power Query** functionality is provided in the **Power Query Editor**.

Let’s get acquainted with **Power Query Editor**.

If you're not signed up for Power BI, you can [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web) before you begin. Also, Power BI Desktop is [free to download](https://go.microsoft.com/fwlink/?LinkId=521662&clcid=0x409). 

## Using Power Query Editor

**Power Query** is made available in **Power BI Desktop** through **Power Query Editor**. To launch Power Query Editor, select **Edit Queries** from the **Home** tab of Power BI Desktop.  

![The Edit Queries button](media/power-query-quickstart-using-power-bi/queryoverview_queryview.png)

With no data connections, **Power Query Editor** appears as a blank pane, ready for data.  

![A blank Power Query Editor screen](media/power-query-quickstart-using-power-bi/queryoverview_blankpane.png)

Once a query is loaded, **Power Query Editor** view becomes more interesting. If we connect to the following Web data source, **Power Query Editor** loads information about the data, which you can then begin to shape.

[*http://www.bankrate.com/finance/retirement/best-places-retire-how-state-ranks.aspx*](http://www.bankrate.com/finance/retirement/best-places-retire-how-state-ranks.aspx)

Here’s how **Power Query Editor** appears once a data connection is established:

1. In the ribbon, many buttons are now active to interact with the data in the query
2. In the left pane, queries are listed and available for selection, viewing, and shaping
3. In the center pane, data from the selected query is displayed and available for shaping
4. The **Query Settings** window appears, listing the query’s properties and applied steps  
   
   ![Elements of the Power Query Editor](media/power-query-quickstart-using-power-bi/queryoverview_withdataconnection.png)

We’ll look at each of these four areas – the ribbon, the queries pane, the data view, and the Query Settings pane – in the following sections.

## The query ribbon
The ribbon in **Power Query Editor** consists of five tabs – **Home**, **Transform**, **Add Column**, **View**, and **Help**.

The **Home** tab contains the common query tasks, including the first step in any query, which is **Get Data.** The following image shows the **Home** ribbon.  

![The Home ribbon](media/power-query-quickstart-using-power-bi/queryoverview_ribbon.png)

To connect to data and begin the query building process, select the **Get Data** button. A menu appears, providing the most common data sources.  

![Get data from a new source](media/power-query-quickstart-using-power-bi/queryoverview_getdatamenu.png)

The **Transform** tab provides access to common data transformation tasks, such as adding or removing columns, changing data types, splitting columns, and other data-driven tasks. The following image shows the **Transform** tab.  

![The Transform ribbon](media/power-query-quickstart-using-power-bi/queryoverview_transformribbon.png)

The **Add Column** tab provides additional tasks associated with adding a column, formatting column data, and adding custom columns. The following image shows the **Add Column** tab.  

![The Add Column ribbon](media/power-query-quickstart-using-power-bi/queryoverview_addcolumnribbon.png)

The **View** tab on the ribbon is used to toggle whether certain panes or windows are displayed. It’s also used to display the Advanced Editor. The following image shows the **View** tab.  

![The View ribbon](media/power-query-quickstart-using-power-bi/queryoverview_viewribbon.png)

It’s useful to know that many of the tasks available from the ribbon are also available by right-clicking a column, or other data, in the center pane.

## The left pane

The left pane displays the number of active queries, as well as the name of the query. When you select a query from the left pane, its data is displayed in the center pane, where you can shape and transform the data to meet your needs. The following image shows the left pane with multiple queries.  

![The left pane of Power Query Editor](media/power-query-quickstart-using-power-bi/queryoverview_theleftpane.png)

## The center (data) pane

In the center pane, or Data pane, data from the selected query is displayed. This is where much of the work of the Query view is accomplished.

In the following image, the Web data connection established earlier is displayed, the **Overall score** column is selected, and its header is right-clicked to show the available menu items. Notice that many of these right-click menu items are the same as buttons in the ribbon tabs.  

![The center pane](media/power-query-quickstart-using-power-bi/queryoverview_thecenterpane.png)

When you select a right-click menu item (or a ribbon button), Query applies the step to the data, and saves it as part of the query itself. The steps are recorded in the **Query Settings** pane in sequential order, as described in the next section.  

## The query settings pane
The **Query Settings** pane is where all steps associated with a query are displayed. For example, in the following image, the **Applied Steps** section of the **Query Settings** pane reflects the fact that we just changed the type of the **Overall score** column.

![The Query Settings pane](media/power-query-quickstart-using-power-bi/queryoverview_querysettingspane.png)

As additional shaping steps are applied to the query, they are captured in the **Applied Steps** section.

It’s important to know that the underlying data is *not* changed; rather, Power Query Editor adjusts and shapes its view of the data, and any interaction with the underlying data occurs based on Power Query Editor’s shaped and modified view of that data.

In the **Query Settings** pane, you can rename steps, delete steps, or reorder the steps as you see fit. To do so, right-click the step in the **Applied Steps** section, and choose from the menu that appears. All query steps are carried out in the order they appear in the **Applied Steps** pane.

![Renaming a step in Query Settings](media/power-query-quickstart-using-power-bi/queryoverview_querysettings_rename.png)

## The Advanced Editor

If you want to see the code that **Power Query Editor** is creating with each step, or want to create your own shaping code, you can use the **Advanced Editor**. To launch the advanced editor, select **View** from the ribbon, then select **Advanced Editor**. A window appears, showing the existing query code. 
 
![The Advanced editor](media/power-query-quickstart-using-power-bi/queryoverview_advancededitor.png)

You can directly edit the code in the **Advanced Editor** window. To close the window, select the **Done** or **Cancel** button.  

## Saving your work
When your query is where you want it, you can have Power Query Editor apply the changes to the data model into Power BI Desktop, and close Power Query Editor. To do that, select **Close & Apply** from Power Query Editor's **File** menu.  

![Close and load your query to Power BI Desktop](media/power-query-quickstart-using-power-bi/queryoverview_closenload.png)

As progress is made, Power BI Desktop provides a dialog to display its status.  

![Progress dialogue](media/power-query-quickstart-using-power-bi/queryoverview_loading.png)

Once you have your query where you want it, or if you just want to make sure your work is saved, Power BI Desktop can save your work in a .pbix file.

To save your work, select **File \> Save** (or **File \> Save As**), as shown in the following image.  

![Save your Power BI Desktop report](media/power-query-quickstart-using-power-bi/queryoverview_savework.png)

## Next steps

In this quickstart you learned how to use Power Query Editor in Power BI Desktop, and how to connect to data sources. To learn more, continue with the tutorial on shaping and transforming data with Power Query.

> [!div class="nextstepaction"]
> [Power Query tutorial](./tutorial-manage-vm.md)