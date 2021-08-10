---
title: Understanding query evaluation and query folding in Power Query
description: Guide on how queries get evaluated in Power Query, how the query folding mechanism works and how to get the most out of it to improve query execution times.
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

## How does a query get evaluated in Power Query?

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

## Possible outcomes of query folding 

The goal of query folding is to offload or push as much of the evaluation of a query to the data source which is able to compute the transformations of your query. 

It accomplishes this goal by translating the code from your query into a language that can be interpreted and executed by your data source, thus pushing the evaluation to your data source and sending the result of that evaluation to Power Query.

This often provides a much faster query execution than extracting all the required data from your data source and running all transforms required in the Power Query engine.

When you use the [Get Data experience](get-data-experience.md), Power Query guides you through the process that ultimately lets you connect to your data source. When doing so, Power Query leverages a series of functions in the M language categorized as [accessing data functions](https://docs.microsoft.com/powerquery-m/accessing-data-functions) which is the function that you commonly see in the first step of your query commonly with the name *Source*. These specific functions use mechanisms and protocols in order to connect to your data source using a language that your data source can understand. 

However, the steps that follow in your query are the steps or transforms that the query folding mechanism will attempt to optimize and check if they can be offloaded to your data source instead of them being processed using the Power Query engine. 

>[!IMPORTANT]
> All data source functions, commonly showcased as the *Source* step of a query, will query the data to the data source in its native language. The query folding mechanism applies to all transforms applied to your query after your data source function so they can be translated and combined into a single data source query or as many transforms that can be offloaded to the data source.

Depending on how the query is structured, there could be three possible outcomes to the query folding mechanism:
* **Full query Folding**: When all of your query transformations get pushed back to the data source and no processing occurs  by the Power Query engine. Instead you receive your desired output directly from the data source.
* **Partial query Folding**: When only a few transformations in your query, and not all, can be pushed back to the data source. This means that a subset of your transformations is done at your data source and the rest of your query transformations occur locally.
* **No query folding**:  When the query contains transformations that can't be translated to the native query language of your data source, either because the transformations aren't supported or the connector doesn't support query folding. For this case, Power Query gets the raw data from your data source and uses the Power Query engine to achieve your desired output by processing the required transforms at the Power Query engine level.

>[!NOTE]
>The Query folding mechanism is primarily available in connectors for structured data sources such as, but not limited to, [Microsoft SQL Server](Connectors/sqlserver.md) and [OData Feed](Connectors/odatafeed.md). 
>
>Leveraging a data source that has more processing resources and has Query folding capabilities can expedite your query loading times as the processing occurs at the data source and not  in the Power Query engine.

This article provides some example scenarios for each of the possible outcomes for query folding. It will also include some suggestions on how to get the most out of the query folding mechanism.

### About the scenario


#### Full query folding

Example 1

#### Partial query folding

Example 2

#### No query folding

Example 3

>[!NOTE] 
>Queries that rely solely on unstructured data sources or that don't have a compute engine, such as CSV or Excel files, don't have query folding capabilities. This means that Power Query evaluates all the required data transformations using the Power Query engine.

### Query performance comparison

Here's a section to compare all 3 possible outcomes.

## Considerations and suggestions

* Follow the best practices when creating a new query as stated in [Best practices in Power Query](best-practices.md).
* Checking the **View Native Query** option is always recommended to make sure that your query can be folded back to the data source. If your step disables this option, you know that you've created a step that stops query folding. 
* Use the query diagnostics tool to your advantage and to better understand the requests being sent to your data source when query folding capabilities are available for the connector.
* When combining data sourced from the use of multiple connectors, Power Query tries to push as much work as possible to both of the data sources while complying with the privacy levels defined for each data source. 
* Read the article on [Privacy levels](dataprivacyfirewall.md) to protect your queries from running against a Data Privacy Firewall error.
* You can also use other tools to check query folding from the perspective of the request being received by the data source. Based on our example, you can use the Microsoft SQL Server Profile to check the requests being sent by Power Query and received by the Microsoft SQL Server.