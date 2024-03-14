---
title: Query plan
description: An article that describes why and how to use the new Query plan feature in Power Query.  
author: ptyx507x

ms.topic: quickstart
ms.date: 1/5/2023
ms.author: miescobar
---

# Query plan for Power Query (Preview)

Query plan for Power Query is a feature that provides a better view of your query's evaluation. It's useful to help determine why a particular query might not fold at a particular step.

Through a practical example, this article will demonstrate the main use case and potential benefits of using the query plan feature to review your query steps. The examples used in this article have been created using the AdventureWorksLT sample database for Azure SQL Server, which you can download from [AdventureWorks sample databases](/sql/samples/adventureworks-install-configure).

>[!NOTE]
>The query plan feature for Power Query is only available in Power Query Online.

![Suggested process to use the query plan feature in Power Query by reviewing the query folding indicators, then review the query plan for a selected step and finally implement any changes derived from reviewing the query plan.](media/query-plan/query-plan-flow.png)

This article has been divided in a series of recommended steps in order to interpret the query plan. These steps are:

1. [Review the query folding indicators](#1-review-the-query-folding-indicators).
2. [Select the query step to review its query plan](#2-select-the-query-step-to-review-its-query-plan).
3. [Implement changes to your query](#3-implement-changes-to-your-query).

Use the following steps to create the query in your own Power Query Online environment.

1. From **Power Query - Choose data source**, select **Blank query**.
2. Replace the blank query's script with the following query.

   ```powerquery-m
   let
     Source = Sql.Database("servername", "database"),
     Navigation = Source{[Schema = "Sales", Item = "SalesOrderHeader"]}[Data],
     #"Removed other columns" = Table.SelectColumns(Navigation, {"SalesOrderID", "OrderDate", "SalesOrderNumber", "PurchaseOrderNumber", "AccountNumber", "CustomerID", "TotalDue"}),
     #"Filtered rows" = Table.SelectRows(#"Removed other columns", each [TotalDue] > 1000),
     #"Kept bottom rows" = Table.LastN(#"Filtered rows", 5)
   in
     #"Kept bottom rows"
   ```

3. Change `servername` and `database` with the correct names for your own environment.
4. (Optional) If you're trying to connect to a server and database for an on-premises environment, be sure to configure a gateway for that environment.
5. Select **Next**.
6. In the Power Query Editor, select **Configure connection** and provide the credentials to your data source.

>[!NOTE]
>For more information about connecting to a SQL Server, go to [SQL Server database](connectors/sql-server.md).

After following these steps, your query will look like the one in the following image.

:::image type="content" source="media/query-plan/sample-query.png" lightbox="media/query-plan/sample-query.png" alt-text="Sample query with query folding indicators enabled.":::
This query connects to the SalesOrderHeader table, and selects a few columns from the last five orders with a **TotalDue** value above 1000.

>[!NOTE]
>This article uses a simplified example to showcase this feature, but the concepts described in this article apply to all queries. We recommend that you have a good knowledge of query folding before reading the query plan. To learn more about query folding, go to [Query folding basics](query-folding-basics.md).

## 1. Review the query folding indicators

>[!NOTE]
>Before reading this section, we recommend that you review the article on [Query folding indicators](step-folding-indicators.md).

Your first step in this process is to review your query and pay close attention to the query folding indicators. The goal is to review the steps that are marked as not folded. Then you can see if making changes to the overall query could make those transformations fold completely.

![Query folding indicators for the sample query inside the Applied steps pane.](media/query-plan/step-folding-indicators-sample.png)

For this example, the only step that can't be folded is **Kept bottom rows**, which is easy to identify through the *not folded* step indicator. This step is also the last step of the query.

The goal now is to review this step and understand what's being folded back to the data source and what can't be folded.

## 2. Select the query step to review its query plan

You've identified the **Kept bottom rows** step as a step of interest since it doesn't fold back to the data source. Right-click the step and select the **View Query plan** option. This action displays a new dialog that contains a diagram for the query plan of the selected step.

:::image type="content" source="media/query-plan/query-plan-diagram-sample-query.png" lightbox="media/query-plan/query-plan-diagram-sample-query.png" alt-text="Query plan dialog that showcases a diagram view for the query plan with nodes connected by lines.":::
Power Query tries to optimize your query by taking advantage of lazy evaluation and query folding, as mentioned in [Query folding basics](query-folding-basics.md). This query plan represents the optimized translation of your M query into the native query that's sent to the data source. It also includes any transforms that are performed by the Power Query Engine. The order in which the nodes appear follows the order of your query starting from the last step or output of your query, which is represented on the far left of the diagram and in this case is the *Table.LastN* node that represents the *Kept bottom rows* step.

At the bottom of the dialog, there's a bar with icons that help you zoom in or out of the query plan view, and other buttons to help you manage the view. For the previous image, the *Fit to view* option from this bar was used to better appreciate the nodes.

:::image type="content" source="media/query-plan/query-plan-fit-to-screen.png" lightbox="media/query-plan/query-plan-fit-to-screen.png" alt-text="Query plan dialog with the nodes magnified for a better view.":::
>[!NOTE]
>The query plan represents the optimized plan. When the engine is evaluating a query, it tries to fold all operators into a data source. In some cases, it might even do some internal reordering of the steps to maximize folding. With this in mind, the nodes/operators left in this optimized query plan typically contain the "folded" data source query and any operators that couldn't be folded and are evaluated locally.

### Identify folded nodes from other nodes

You can identify the nodes in this diagram as two groups:

* **Folded nodes**: This node can be either `Value.NativeQuery` or "data source" nodes such as `Sql.Database`. These can also be identified with the label ***remote*** under their function name.
* **Non-folded nodes**: Other table operators, such as `Table.SelectRows`, `Table.SelectColumns`, and other functions that couldn't be folded. These can also be identified with the labels ***Full scan*** and ***Streaming***.

The following image shows the folded nodes inside the red rectangle. The rest of the nodes couldn't be folded back to the data source. You'll need to review the rest of the nodes since the goal is to attempt to have those nodes fold back to the data source.

:::image type="content" source="media/query-plan/query-plan-folded-nodes.png" lightbox="media/query-plan/query-plan-folded-nodes.png" alt-text="Query plan view controls at the bottom of the dialog with the fit to view option selected.":::
You can select **View details** at the bottom of some nodes to display extended information. For example, the details of the `Value.NativeQuery` node show the native query (in SQL) that will be sent to the data source.

:::image type="content" source="media/query-plan/query-plan-view-details.png" lightbox="media/query-plan/query-plan-view-details.png" alt-text="Details view for the Value.NativeQuery node in the query plan.":::
The query shown here might not be exactly the same query sent to the data source, but it's a good approximation. For this case, it tells you exactly what columns will be queried from the SalesOrderHeader table and then how it will filter that table using the TotalDue field to only get rows where the value for that field is larger than 1000. The node next to it, [Table.LastN](/powerquery-m/table-lastn), is calculated locally by the Power Query engine, as it can't be folded.

>[!NOTE]
>The operators might not exactly match the functions used in the query's script.

### Review non-folded nodes and consider actions to make your transform fold

You've now determined which nodes couldn't be folded and will be evaluated locally. This case only has the `Table.LastN` node, but in other scenarios it could have many more.

The goal is to apply changes to your query so that the step can be folded. Some of the changes you might implement could range from rearranging your steps to applying an alternative logic to your query that's more explicit to the data source. This doesn't mean that all queries and all operations are foldable by applying some changes. But it's a good practice to determine through trial and error if your query could be folded back.

Since the data source is a SQL Server database, if the goal is to retrieve the last five orders from the table, then a good alternative would be to take advantage of the [TOP](/sql/t-sql/queries/top-transact-sql) and [ORDER BY](/sql/t-sql/queries/select-order-by-clause-transact-sql) clauses in SQL. Since there's no BOTTOM clause in SQL, the `Table.LastN` transform in PowerQuery can't be translated into SQL. You could remove the `Table.LastN` step and replace it with:

* **A sort descending step** by the SalesOrderID column in the table, since this column determines which order goes first and which has been entered last.
* **Select the top five rows** since the table has been sorted, this transform accomplishes the same as if it was a *Kept bottom rows* (`Table.LastN`).  

This alternative is equivalent to the original query. While this alternative in theory seems good, you need to make the changes to see if this alternative will make this node fully fold back to the data source.

## 3. Implement changes to your query

Implement the alternative discussed in the previous section:

1. Close the query plan dialog and go back to the Power Query Editor.
2. Remove the *Kept bottom rows* step.
3. Sort the **SalesOrderID** column in descending order.

   ![Sorting the SalesOrderID column in descending order using the autofilter menu.](media/query-plan/sort-descending.png)

4. Select the table icon on the top-left corner of the data preview view and select the option that reads Keep top rows. In the dialog, pass the number five as the argument and hit OK.

   ![Using the table context menu to select the Keep top rows transform to keep only the top five rows.](media/query-plan/keep-top-rows.png)

After implementing the changes, check the query folding indicators again and see if it's giving you a folded indicator.

:::image type="content" source="media/query-plan/alternative-approach.png" lightbox="media/query-plan/alternative-approach.png" alt-text="All query folding indicators are green and showing that they can be folded. The final table provides the same rows but in a different order.":::
Now it's time to review the query plan of the last step, which is now **Keep top rows**. Now there are only folded nodes. Select **View details** under `Value.NativeQuery` to verify which query is being sent to the database.

[![New query plan after making the changes to the query, which now showcases only folded nodes, with Value.NativeQuery showing the full SQL statement that evaluates the query.](media/query-plan/alternative-query-plan.png)](media/query-plan/alternative-query-plan.png#lightbox)

While this article is suggesting what alternative to apply, the main goal is for you to learn how to use the query plan to investigate query folding. This article also provides visibility of what's being sent to your data source and what transforms will be done locally.

You can adjust your code to see the impact that it has in your query. By using the query folding indicators, you'll also have a better idea of which steps are preventing your query from folding.
