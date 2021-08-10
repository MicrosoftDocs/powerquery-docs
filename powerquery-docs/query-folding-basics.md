---
title: Query folding basics
description: Understanding the basic principles of query folding to get the most out of your Power Query experience and optimize your queries.
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 11/24/2020
ms.author: v-miesco
ms.custom: intro-internal
---
# Understanding query evaluation and query folding in Power Query

*Intro about what to expect from this article and why it's here.*

## Create a Power Query M script

*Explain how the UI helps you create the script, but you can also manually edit the script using the advanced editor and the different views to modify your code.*

## How does query get evalauted in Power Query?

Power Query works as a tool that extracts the data from a data source, performs any transformations needed using the Power Query engine (also known as the Mashup engine), and then it loads your desired output into a destination of your choice.

The diagram below explores the process that happens in order to evaluate a query in Power Query:

![Query evaluation diagram as an overview](media/query-folding-basics/diagram-1.png)

1. The Power Query query script (also known as M code), found inside the Advanced Editor, is submitted to the Power Query engine alongside with other important information such as credentials and data source privacy levels.
2. Power Query determines what data needs to be extracted from the data source and submits a request to the data source.
3.	The data source responds to the request from Power Query by transferring the requested data to Power Query.
4.	Power Query receives the incoming data from the data source and performs any transformations using the Power Query engine if necessary.
5.	The results derived from the previous point are loaded to a destination.

When Power Query reads your query script, it runs it through an optimization process to more efficiently evaluate your query. In this process it determines what steps (transforms) from your query can be offloaded to your data source and which other steps would need to be evaluated locally using the Power Query engine. This optimization process is also called Query folding where Power Query tries to push as much of the load possible to the data source in an effort to optimize your query execution.

>[!IMPORTANT]
>All rules from the Power Query formula language (also known as M Language) are followed. Most notably, lazy evaluation plays an important role during the optimization process where Power Query will understand what specific transforms from your query need to be evaluated and what others do not need to be evaluated because they are not needed in the output of your query.

You can see in detail the steps that take place in this optimization process by following the below diagram:

![Query evaluation diagram 1](media/query-folding-basics/diagram-2.png)

1. The Power Query query script, found inside the Advanced Editor, is submitted to the Power Query engine alongside with other important information such as credentials and data source privacy levels.
2. The Query folding mechanism defines what information to extract from the data source and what set of transformations will need to happen inside the Power Query engine. It sends the instructions to two other components that will take care of retrieving the data from the data source and transforming the incoming data locally if necessary.
3. Once the instructions have been received by the internal components of Power Query, Power Query sends a request to the data source using a data source query.
4. The data source receives the request from Power Query and transfers the data to the Power Query engine.
5. Once the data is inside Power Query, the transformation engine inside Power Query (also known as mashup engine) performs the local transformations that couldn't be folded back or offloaded to the data source.
6. The results derived from the previous point are loaded to a destination.

This is the process that happens to a Power Query query during its evaluation.

## Possibble outcomes of Query folding 

The goal of Query folding is to offload or push as much of the evaluation of a query to the data source which is able to compute the transformations from your query. 

It accomplishes this goal by translating the code from your query into a language that can be interpreted and executed by your data source, thus pushing the evaluation to your data source and sending the result of that evaluation to Power Query.

This often provides a much faster query execution than extracting all the required data from your data source and running all transforms required locally in the Power Query engine.

Depending on how the query is structured, there could be three possible outcomes for the query folding mechanism:
* **Full query Folding**: When all of your query transformations get pushed back to the data source and no processing occurs locally by the Power Query engine. Instead you receive your desired output directly from the data source.
* **Partial query Folding**: When only a few transformations in your query, and not all, can be pushed back to the data source. This means that a subset of your transformations is done at your data source and the rest of your query transformations occur locally.
* **No query folding**:  When the query contains transformations that can't be translated to the native query language of your data source, either because the transformations aren't supported or the connector doesn't support query folding. For this case, Power Query gets the raw data from your data source and works locally with the Power Query engine to achieve your desired output.

>[!NOTE]
>The Query folding mechanism is primarily available in connectors for structured data sources such as, but not limited to, [Microsoft SQL Server](Connectors/sqlserver.md) and [OData Feed](Connectors/odatafeed.md). 
>
>Leveraging a data source that has more processing resources and has Query folding capabilities can expedite your query loading times as the processing occurs at the data source and not locally in the Power Query engine.

This article provides some example scenarios for each of the possible outcomes for query folding. It will also include some suggestions on how to get the most out of the query folding mechanism.

>[!IMPORTANT]
> All data source functions, commonly showcased as the Source step of a query, will query the data to the data source in its own language. The query folding mechanism applies to all transforms applied to your query after your data source function so they can be translated and combined into a single data source query.

### Full query folding

For this scenario, you'll be connecting to a Microsoft SQL Server and the data you'll be using is the sample AdventureWorks database in its Data Warehouse version. You can download this database from the article [AdventureWorks sample database](/sql/samples/adventureworks-install-configure).

After identifying the data source, we suggest that you pick the native connectors found in the **Get Data** dialog box. In this case, the connector to be used is the [Microsoft SQL Server Connector](Connectors/SQLServer.md).

Your goal is to summarize the data inside the FactInternetSales table by performing the following transformations:

1. Only get the data from September 2012 by filtering the rows on the OrderDate column.

   ![Filtering the FactInternetSales table by the OrderDate column for only dates in the month of September 2012.](images/me-query-folding-basics-filter-values.png)

   >[!NOTE]
   > To learn more about how to filter rows by their values, go to [Filter values](filter-values.md).

2. Group by the OrderDate column and create a new aggregated column using the **Sum** operation on the SalesAmount column. Name this new column Total Sales Amount.

   ![Group by using the OrderDate column and aggregating by the SalesAmount column.](images/me-query-folding-basics-group-by.png)

   >[!NOTE]
    > To learn more about how to use the group by feature, go to [Grouping or summarizing rows](group-by.md).

3. Now with the summarized table at the date level, filter the new Total Sales Amount column to only keep rows with values greater than or equal to 15000.

   ![Filtering the summarized table by the Total Sales Amount column for values greater than or equal to 15000.](images/me-query-folding-basics-filter-values-greater-than.png)

One simple way to check if the step in your query can fold back to the data source is to right-click the step and see if the **View Native Query** option is enabled or disabled (grayed out).

![Right-clicking the last step of the query to check the View Native Query option.](images/me-query-folding-basics-view-native-query.png)

When you select the **View Native Query** option, a new **Native Query** dialog box appears. Here you'll see the native query that Power Query has translated from all the transformations that construct the selected step.

![The Native Query dialog box with the SQL code generated by Power Query.](images/me-query-folding-basics-native-query-window.png)

This native query is sent to the data source (Microsoft SQL Server) and Power Query only receives the result of that query.

### Partial query folding

Taking the query created in the previous section for **Full Query folding** as your starting point, your new goal is to filter that table to only analyze the rows for dates that fall in the weekdays Friday, Saturday, or Sunday.

To do this, first select the OrderDate column. In the **Add Column** menu from the ribbon, select the **Date** option in the **From Date & Time** group. From this context menu, select the **Day** option. This selection displays a new context menu where you select the **Name of Day** option. 

![Option to add a new column for the Name of the Day.](images/me-query-folding-basics-weekday-name.png)

After selecting this option, a new column called **Day Name** appears in your table with the name of the day. You can now filter the table using this **Day Name** column to only keep the rows with the values Friday, Saturday, or Sunday.

![Filtering the summarized table using the name of the Day.](images/me-query-folding-basics-filter-weekday-name.png)

Now check the **View Native Query** option for the last step you created. You'll notice this option appears grayed out or disabled. However, you can right-click the **Filtered Rows1** step and you'll see the **View Native Query** option is available for that step.

For this particular scenario, the query is folded to the data source until after the **Filtered rows1** step, and everything after is not folded to the data source. Therefore, the entire scenario is partially folded.

![View Native query disabled after performing new transformations.](images/me-query-folding-basics-disabled-view-native-query.png)

Another option to verify query folding is to use the query diagnostics tools, more specifically the **Diagnose Step** option. To learn more about how to use the query diagnostics tool, go to [What is Query Diagnostics for Power Query?](querydiagnostics.md)

![Query diagnostics tools in the Power Query ribbon.](images/me-query-folding-basics-query-diagnostics.png)

To use query diagnostics, select the query that you want to analyze and then select the **Diagnose Step** button. This action creates a new group and two queries with the format `[Query Name] [Step Name] [Diagnostics Type] [Timestamp]`.

Under **Queries**, take a look at the diagnostic that contains *Aggregated* in the [Diagnostics Type] part. Then take a closer look at the Data Source Query column in the table. This column holds all the requests sent to the data source.

![Query diagnostics at the step level for the last step of the new query showing the requests sent to the data source in the Data Source Query column.](images/me-query-folding-basics-query-diagnostics-aggregated-view.png)

Reading the values in that column, you can see the native query sent to the server to retrieve the information. You can right-click to drill down to a specific value. If you look at the specific cell value in row 21 in the previous image, you'll note it's the same native query you can see in the **View Native Query** for the **Filtered Rows1** step.

![Value found inside the query for the aggregated query diagnostics which holds the SQL statement sent to the SQL Server.](images/me-query-folding-basics-query-diagnostics-aggregated-view-drill-down.png)

This means that your query will send that native query to the Microsoft SQL Server and do the rest of the transformations locally. This is what it means to have a query that can partially fold.

>[!NOTE]
> We recommend that you read [Understanding folding with Query Diagnostics](querydiagnosticsfolding.md) to get the most out of the query diagnostics tools and learn how to verify query folding.

### No query folding

Queries that rely solely on unstructured data sources, such as CSV or Excel files, don't have query folding capabilities. This means that Power Query evaluates all the required data transformations outside the data source.

One example can be seen in the article about [combining multiple CSV files from a local folder](combine-files-csv.md) where none of the steps have the **View Native Query** option active, and running the query diagnostics for that step yields no results in the Data Source Query column.

![View Native Query greyed out for the query that combine CSV files.](images/me-query-folding-basics-csv-files-source.png)

## Considerations and suggestions

* Follow the best practices when creating a new query as stated in [Best practices in Power Query](best-practices.md).
* Checking the **View Native Query** option is always recommended to make sure that your query can be folded back to the data source. If your step disables this option, you know that you've created a step that stops query folding. 
* Use the query diagnostics tool to your advantage and to better understand the requests being sent to your data source when query folding capabilities are available for the connector.
* When combining data sourced from the use of multiple connectors, Power Query tries to push as much work as possible to both of the data sources while complying with the privacy levels defined for each data source. 
* Read the article on [Privacy levels](dataprivacyfirewall.md) to protect your queries from running against a Data Privacy Firewall error.
* You can also use other tools to check query folding from the perspective of the request being received by the data source. Based on our example, you can use the Microsoft SQL Server Profile to check the requests being sent by Power Query and received by the Microsoft SQL Server.