---
title: Query plan
description: An article that describes why and how to use the new Query plan feature in Power Query.  
author: ptyx507

ms.service: powerquery
ms.topic: quickstart
ms.date: 6/12/2021
ms.author: v-miesco
ms.reviewer: 

localizationgroup: reference
---

# Query plan for Power Query (Preview)

Query plan for Power Query is a feature that focuses in providing you a better view as to how your query might get evaluated. It's main usecase is for when you want to review why a particular query might not fold at a particular step.

Through a practical example, this article will demonstrate the main usecase and potential benefits of using the query plan feature to review your query steps. The examples used in this article have been created using the AdventureWorksLT sample database for Azure SQL Server which you can download from the [official documentation here](https://docs.microsoft.com/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms).

>[!NOTE]
>The query plan feature for Power Query is only available inside the Power Query Online experience.

<flow diagram>

This article has been divided in a series of recommended steps in order to interpret the query plan. These steps are:
1. Review the step folding indicators
2. Select the query step to check its query plan
3. Identify folded nodes from other nodes
4. Review non-folded nodes and consider actions to improve
5. Implement changes to your query

In order to follow this example, follow the following steps to load this query in your own Power Query Online environment:
1. Open your Power Query Online experience.
2. Create a new blank query and replace the code from the blank query with the code shown below.
```
let
  Source = Sql.Database("servername", "database"),
  Navigation = Source{[Schema = "SalesLT", Item = "SalesOrderHeader"]}[Data],
  #"Removed other columns" = Table.SelectColumns(Navigation, {"SalesOrderID", "OrderDate", "SalesOrderNumber", "PurchaseOrderNumber", "AccountNumber", "CustomerID", "TotalDue"}),
  #"Filtered rows" = Table.SelectRows(#"Removed other columns", each [TotalDue] > 1000),
  #"Kept bottom rows" = Table.LastN(#"Filtered rows", 5)
in
  #"Kept bottom rows"
```
3. Before hitting next, be sure to change the "servername" and "database" with the correct names for your own environment
4. *(Optional)* If you are trying to connect to a server and database for an onpremises environment, be sure to configure a gateway for it.
5. Provide the credentials to your data source by clicking the yellow ribbon.

>[!NOTE]
>For more information about the SQL Server connector, you can read the article on conecting to a [SQL Server database](connectors/sqlserver.md). 

After following these steps, your query will look exactly like the one shown in the screeenshot below:

<image of how the query will look like>

As a brief description of what this query is trying to accomplish, it connects to the SalesOrderHeader table to get only a few columns and only the last five orders with a **TotalDue** value above 1000.

>[!NOTE]
>This article uses a simplified example to showcase this feature, but please bare in mind the concepts described in this article apply to all queries. It is recommended that you have a good knowledge of query folding before reading the query plan. You can learn more about query folding from the article [Query folding basics](query-folding-basics.md). 

## 1. Review the step folding indicators

>[!NOTE]
>Before reading this section, it is recommended that you review the article on [Step Folding Indicators](step-folding-indicators.md).

Your first step in this process is to review your query and pay close attention to the step folding indicators. The goal is to review the steps that are maked as not folded and see if making changes to the overall query could make those transformations fold completely.

<image of the step folding indicators>

For this example, the step named **Kept bottom rows** is the only step that has an indicator that it can not be folded and at the same time is the output of the query.

The goal now is to review this step and understand what's being folded back to the data source and what can't be folded.

## 2. Select the query step to check its query plan
You've identified the **Kept bottom rows** step as a step of interest since that step doesn't fold back to the data source. Right click the step and select the option that reads Query plan. This action will display a new dialogue where you'll see a diagram for the query plan of the selected step.

<image of query plan>

Power Query tries to optimize your query by taking advantage of lazy evaluation and query folding as mentioned in the article on [Query folding basics](query-folding-basics.md). This Query plan represents the optimized translation of your M query into the native query that will be sent to the data source and any transforms that will be performed locally.  

## 3. Identify folded nodes from other nodes

You can identify the nodes in this diagram into two groups:
* **Folded nodes** -  This can be either "Value.NativeQuery" or "data source" nodes such as SQL Server. 
* **Non-folded nodes** - Any other node that doesn't have Value.NativeQuery or the name of a particular "data source".

In the image below you'll see the folded nodes inside the red rentagle and the rest of the nodes outside of it are nodes that do not fold back to the data source and you need to review those as the goal is to attempt to have those fold back to the data source.

<image with a red rectangle of the folded data sources>

Furthermore, you can click the *View details* text at the bottom of some nodes in order to see more metadata about each those. For example, the details of the Value.NativeQuery shows the native query (in SQL) that will be sent to the data source.

<image of the metadata for the Value.NativeQuery>

That is effectively the query that Power Query sends to the data source and then the following node called [Table.LastN](https://docs.microsoft.com/powerquery-m/table-lastn) is calculated locally by the Power Query engine as it can't be folded.

>[!NOTE]
>In most cases, the non-folded node will have the name of the Power Query M function that will be executed locally.

## 4. Review non-folded nodes and consider actions to improve

You've been able to determine what are the nodes that couldn't be folded and would be evaluated locally. This case only has the Table.LastN node, but in other scenarios it could have many more.

The goal is to apply changes to your query so that the step can be completely folded. Some of the changes that you could implement could range from re-arranging your steps to applying an alternate logic to your query which is more explicit to the data source. This doesn't mean that all queries and all operations are foldable by applying some changes, but it's a good practice to determine via trial and error if your query could be folded back.

Since the data source is a SQL Server database, if the goal is to retrieve the last five orders from the table, then a viable alternative would be to take advantage of the TOP and ORDER BY clauses in SQL. Since there is no BOTTOM clause in SQL, there is simply not a way to translate the Power Query transform into SQL. You could remove the Table.LastN step and replace it with:
1. **A sort descending step** - by the SalesOrderID column from the table since this column determines which order goes first and which has been entered last.
2. **Select the top five rows** - since the table has been sorted, this transform will accomplish the same as if it was a *Kept bottom rows* (Table.LastN).  

This alternative is equivalent to the original query. While this in theory seems like a good alternative, you need to make the changes in order to see if this will make this fully fold back to the data source.

## 5. Implement changes to your query
Implement the alternative discussed in the previous section:
* Close the query plan dialog and go back to the Power Query Editor. 
* Remove the Kept bottom rows step.
* Sort the **SalesOrderID** column in descending order
* Click the table icon on the top left corner of the data preview view and select the option that reads Keep top rows. In the dialog pass the number five as the argument and hit OK.

<Image after the changes>
After implementing the changes, check again the step folding indicators and then review the query plan for the last step of the query.

Note how now there are only folded nodes. Click the view details of the Value.NativeQuery to check what is the query being sent to the database.

<image of the metadata for the new Value.NativeQuery>

While this time this article is the one telling you what alternatives to apply, the main objective of Query folding is to give you the visibility of what's being sent to your data source and what transforms will be done locally. 

You can tweak your code to see the impact that it has in your query and, using the step folding indicators, have a better idea of what steps are preventing your query from folding.