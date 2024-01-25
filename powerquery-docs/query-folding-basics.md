---
title: Understanding query evaluation and query folding in Power Query
description: Overview on Power Query query evaluation and query folding mechanisms
author: migueesc123
ms.date: 1/5/2023
ms.author: miescobar
ms.topic: overview
---

# Overview of query evaluation and query folding in Power Query

This article provides an overview of how M queries are processed and turned into data source requests.

## Power Query M script

Any query, whether created by Power Query, manually written in the advanced editor, or entered using a blank document, consists of functions and syntax from the [Power Query M formula language](/powerquery-m/). M script, also referred to as M code, is any code that uses the M language inside a Power Query query. While we recommend that you use the Power Query editor to create most of the M script, you can manually modify your M script. 

The M script is accessible through the advanced editor window or the script view in the formula bar. M script serves as the set of instructions needed by the Power Query engine to evaluate queries and output results. You can think of the M script as a recipe that describes how to prepare your data.

## Applied steps 

The Power Query editor serves as an interface to help you create the appropriate M script for the transforms that you're after and ensures valid code. The Power Query editor interprets the M script and displays the query as a series of steps. On the right-hand side, you'll notice a section called [applied steps](applied-steps.md). This section displays all the steps or transforms used in your query. 

![Image of the applied steps and the data preview view.](media/query-folding-basics/applied-steps-section.png)

The previous image emphasizes the applied steps section, which contains the following steps:

- **Source**: Makes the connection to the data source. In this case, it's a connection to a SQL Server database.
- **Navigation**: Navigates to a specific table in the database.
- **Removed other columns**: Selects which columns from the table to keep.
- **Sorted rows**: Sorts the table using one or more columns.
- **Kept top rows**: Filters the table to only keep a certain number of rows from the top of the table.

## Access the M script

This set of step names is a friendly way to view the M script that Power Query has created for you. There are several ways to view the full M script. In Power Query, you can select **Advanced Editor** in the **View** tab. You can also select **Advanced Editor** from the **Query** group in the **Home** tab. In some versions of Power Query, you can also change the view of the formula bar to show the query script by going into the **View** tab, and from the **Layout** group, select **Script view** > **Query script**.

![Image with the full M script and the corresponding names of the applied steps.](media/query-folding-basics/m-script-applied-steps.png)

Most of the names found in the **Applied steps** pane are also being used as is in the M script. The steps of a query are [identifiers](/powerquery-m/m-spec-lexical-structure#identifiers) in the M language. Sometimes extra characters are wrapped around step names in M, but these characters aren’t shown in the applied steps. 

An example is `#"Kept top rows"`, which is categorized as a *quoted identifier* because of these extra characters. A quoted identifier can be used to allow any sequence of zero or more Unicode characters to be used as an identifier, including keywords, whitespace, comments, operators, and punctuators.

Changes made to the query through the Power Query editor will automatically update the M script of your query. For example, using the previous image as the starting point, if you change the **Kept top rows** step name to **Top 20 rows**, the script view will automatically update.

![Image with the applied step name changed to Top 20 rows, which also updates the M script.](media/query-folding-basics/change-step-name.png)

## Query evaluation in Power Query

The following diagram explores the process that occurs when a query is evaluated in Power Query.

![Query evaluation diagram as an overview.](media/query-folding-basics/diagram-1.png)

1. The M script, found inside the advanced editor, is submitted to the Power Query engine. Other important information is also included, such as credentials and data source privacy levels.
2. Power Query determines what data needs to be extracted from the data source and submits a request to the data source.
3. The data source responds to the request from Power Query by transferring the requested data to Power Query.
4. Power Query receives the incoming data from the data source and does any transformations using the Power Query engine if necessary.
5. The results derived from the previous point are loaded to a destination.

>[!NOTE]
>While this example showcases a query with an SQL Database as a data source, the concept applies to queries with or without a data source.

## Query folding

When Power Query reads your M script, it runs the script through an optimization process to evaluate your query. This optimization process is called *query folding*. The goal of query folding is to determine which steps (transforms) from your query can be offloaded to your data source that can compute the transformations of your query and which other steps need to be evaluated using the Power Query engine.

The query folding mechanism in Power Query translates your M script to a language that can be interpreted and executed by your data source. It then pushes the evaluation to your data source and sends the result of that evaluation to Power Query. This operation often provides a much faster query execution than extracting all the required data from your data source and running all transforms required in the Power Query engine.

>[!IMPORTANT]
>All rules from the [Power Query M language](/powerquery-m/) are followed. *lazy evaluation* is important during the optimization process because this is when Power Query understands that only specific transforms from your query need to be evaluated because they are needed in the query output.
>
>When multiple sources are involved, the data privacy level of each data source is taken into consideration when evaluating the query. To learn more, go to [Behind the scenes of the Data Privacy Firewall](dataprivacyfirewall.md)

### The optimization process

The following diagram demonstrates the steps that take place in this optimization process.

![Query evaluation diagram that explains the optimization process.](media/query-folding-basics/diagram-2.png)

The steps highlighted in red in the diagram in detail: 

1. The M script, found inside the advanced editor, is submitted to the Power Query engine. Other important information is also supplied, such as credentials and data source privacy levels.
2. The Query folding mechanism submits metadata requests to the data source to determine the capabilities of the data source, table schemas, relationships between different tables at the data source, and more.
3. Based on the metadata received, the query folding mechanism determines what information to extract from the data source and what set of transformations need to happen inside the Power Query engine. It sends the instructions to two other components that take care of retrieving the data from the data source and transforming the incoming data in the Power Query engine if necessary.
4. Once the instructions have been received by the internal components of Power Query, Power Query sends a request to the data source using a data source query.
5. The data source receives the request from Power Query and transfers the data to the Power Query engine.
6. Once the data is inside Power Query, the transformation engine inside Power Query (also known as mashup engine) does the transformations that couldn't be folded back or offloaded to the data source.
7. The results derived from the previous point are loaded to a destination.

>[!NOTE]
>Depending on the transformations and data source used in the M script, Power Query will stream or buffer the incoming data.

When you use the [get data experience](get-data-experience.md), Power Query guides you through the process that ultimately lets you connect to your data source. When doing so, Power Query uses a series of functions in the M language categorized as [accessing data functions](/powerquery-m/accessing-data-functions). These specific functions use mechanisms and protocols to connect to your data source using a language that your data source can understand.

>[!IMPORTANT]
> All data source functions, commonly shown as the **Source** step of a query, query the data at the data source in its native language. The query folding mechanism is utilized on all transforms applied to your query after your data source function so they can be translated and combined into a single data source query or as many transforms that can be offloaded to the data source.

## Query folding results

Depending on how the query is structured, there could be three possible outcomes to the query folding mechanism:

- **Full query folding**: All of your query transformations get pushed back to the data source and minimal processing occurs at the Power Query engine.
- **Partial query folding**: Only a few transformations in your query can be pushed back to the data source. In this case, only a subset of your transformations is done at your data source and the rest of your query transformations occur in the Power Query engine.
- **No query folding**:  The query contains transformations that can't be translated to the native query language of your data source, either because the transformations aren't supported or the connector doesn't support query folding. Power Query gets the raw data from your data source and uses the Power Query engine to achieve the output you want by processing the required transforms at the Power Query engine level.

>[!NOTE]
>The query folding mechanism is primarily available in connectors for structured data sources such as, but not limited to, [Microsoft SQL Server](connectors/sql-server.md) and [OData Feed](connectors/odata-feed.md). During the optimization phase, the engine might sometimes reorder steps in the query.
>
>Leveraging a data source that has more processing resources and query folding capabilities can expedite your query loading times as the processing occurs at the data source and not at the Power Query engine.

## Next steps

For detailed examples of the three possible outcomes of the query folding mechanism, go to [Query folding examples](query-folding-examples.md).

For information about query folding indicators found in the **Applied Steps** pane, go to [Query folding indicators](step-folding-indicators.md)
