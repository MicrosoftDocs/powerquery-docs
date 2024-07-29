---
title: Query folding on native queries
description: This article provides information on how to enable query folding against queries that use the Value.NativeQuery function.
author: ptyx507x
ms.date: 7/19/2024
ms.author: miescobar
---

# Query folding on native queries

In Power Query, you can define a native query and run it against your data source. The [Import data from a database using native database query](native-database-query.md) article explains how to do this process with multiple data sources. But, by using the process described in that article, your query doesn't take advantage of any query folding from subsequent query steps.

This article showcases an alternative method to create native queries against your data source using the [Value.NativeQuery](/powerquery-m/value-nativequery) function and keep the query folding mechanism active for subsequent steps of your query.

> [!NOTE]
>We recommend that you read the documentation on [query folding](query-folding-basics.md) and the [query folding indicators](query-folding-basics.md) to better understand the concepts used throughout this article.

## Supported data connectors

The method described in the next sections applies to the following data connectors:

* [Amazon Redshift](connectors/amazon-redshift.md)
* [Dataverse](connectors/dataverse.md) *(when using enhanced compute)*
* [Google BigQuery](connectors/google-bigquery.md)
* [PostgreSQL](connectors/postgresql.md)
* [SAP HANA](connectors/sap-hana/overview.md)
* [Snowflake](connectors/snowflake.md)
* [SQL Server](connectors/sql-server.md)

## Connect to target from data source

> [!NOTE]
>To showcase this process, this article uses the SQL Server connector and the [AdventureWorks2019 sample database](/sql/samples/adventureworks-install-configure).
>The experience might vary from connector to connector, but this article showcases the fundamentals on how to enable query folding capabilities over native queries for the supported connectors.

When connecting to the data source, it's important that you connect to the node or level where you want to execute your native query. For the example in this article, that node is the database level inside the server.

:::image type="content" source="media/native-query-folding/connection-settings.png" alt-text="Screenshot of the connection settings dialog for the connection to the AdventureWorks2019 database on a local instance of SQL Server.":::

After you define the connection settings and supplying the credentials for your connection, the navigation dialog for your data source opens. The navigation dialog contains all the available objects that you can connect to.

From this list, you need to select the object where the native query is run (also known as the target). For this example, that object is the database level.

At the navigator window in Power Query, select and hold (or right-click) the database node in the navigator window and select the **Transform Data** option. Selecting this option creates a new query of the overall view of your database, which is the target you need to run your native query.

:::image type="content" source="media/native-query-folding/pq-desktop-navigator-window.png" alt-text="Screenshot of choose data where the user right clicked the database node in the navigator, with Transform Data emphasized.":::

Once your query lands in the Power Query editor, only the **Source** step should show in the Applied steps pane. This step contains a table with all the available objects in your database, similar to how they were displayed in the Navigator window.

:::image type="content" source="media/native-query-folding/pqo-sample-query-navigation-deleted.png" alt-text="Screenshot of the query with only the source step." lightbox="media/native-query-folding/pqo-sample-query-navigation-deleted.png":::

## Use Value.NativeQuery function

The goal of this process is to execute the following SQL code, and to apply more transformations with Power Query that can be folded back to the source.

```sql
SELECT DepartmentID, Name FROM HumanResources.Department WHERE GroupName = 'Research and Development'
```

The first step was to define the correct target, which in this case is the database where the SQL code is run.
Once a step has the correct target, you can select that step&mdash;in this case, **Source** in **Applied Steps**&mdash;and then select the **fx** button in the formula bar to add a custom step. In this example, replace the `Source` formula with the following formula:

```powerquery-m
Value.NativeQuery(Source, "SELECT DepartmentID, Name FROM HumanResources.Department WHERE GroupName = 'Research and Development'  ", null, [EnableFolding = true])
```

The most important component of this formula is the use of the optional record for the fourth parameter of the function that has the **EnableFolding** record field set to *true*.

:::image type="content" source="media/native-query-folding/value-native-query-formula.png" alt-text="Screenshot of the new custom step formula with the usage of the Value.NativeQuery function and the explicit SQL query." lightbox="media/native-query-folding/value-native-query-formula.png":::

> [!NOTE]
>You can read more about the Value.NativeQuery function from the [official documentation article](/powerquery-m/value-nativequery).

After you enter the formula, a warning is shown that requires you to enable native queries to run for your specific step. Select continue for this step to be evaluated.

This SQL statement yields a table with only three rows and two columns.

:::image type="content" source="media/native-query-folding/native-query-executed-sample.png" alt-text="Screenshot with the results of the native query evaluated against the target database." lightbox="media/native-query-folding/native-query-executed-sample.png":::

## Test query folding

To test the query folding of your query, you can try to apply a filter to any of your columns and see if the query folding indicator in the applied steps section shows the step as folded. For this case, you can filter the DepartmentID column to have values that aren't equal to two.

:::image type="content" source="media/native-query-folding/query-filter.png" alt-text="Screenshot demonstrating how to filter the DepartmentID column to only have the values that aren't equal to two.":::

After adding this filter, you can check that the query folding indicators still show the query folding happening at this new step.

:::image type="content" source="media/native-query-folding/filter-step-folded.png" alt-text="Filter step shown as folded back to the data source in the applied steps section." lightbox="media/native-query-folding/filter-step-folded.png":::

To further validate what query is being sent to the data source, you can select and hold (or right-click) the **Filtered rows** step and select the **View query plan** option to check the query plan for that step.

In the query plan view, you can see that a node with the name Value.NativeQuery that has a **View Details** hyperlink. You can select this hyperlink to view the exact query that's being sent to the SQL Server database.

The native query is wrapped around another SELECT statement to create a subquery of the original. Power Query does its best to create the most optimal query given the transforms used and the native query provided.

:::image type="content" source="media/native-query-folding/query-plan.png" alt-text="Screenshot of the query plan for the Filtered rows step.":::

> [!TIP]
>For scenarios where you get errors because query folding wasn't possible, we recommend that you try validating your steps as a subquery of your original native query to check if there might be any syntax or context conflicts.
