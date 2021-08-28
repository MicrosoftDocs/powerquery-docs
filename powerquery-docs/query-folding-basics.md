---
title: Understanding query evaluation and query folding in Power Query
description: Overview on Power Query query evaluation and query folding mechanisms
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 8/29/2020
ms.author: v-miesco
ms.custom: intro-internal
---
# Understanding query evaluation and query folding in Power Query

*Get help from Bob or Doug to write this after the rest of the sections are finished*

## Create a Power Query M script

A query in Power Query is written in the M language. This query gets interpreted and evaluated by the Power Query engine to output its results. The M script or M code serves as the set of instructions needed to evaluate the query. 

>[!TIP]
>You can think of the M script as a recipe in order to prepare your data.

The most common way to create an M script is by using the Power Query Editor. For example, when you connect to a data source such as a SQL Server database you'll notice on the right-hand side of your screen that there's a section called [applied steps](applied-steps.md) which displays all the steps or transforms used in your query. In this sense, the Power Query Editor serves as an interface to help you create the appropriate M script for the transforms that you're after as well as validating that the code used is valid. 

>[!NOTE]
> The M script is used within the Power Query editor to:
> * Display the query as a series of steps and allow the creation or modification of new steps
> * Display a diagram view

![image of the applied steps and the data preview view](media/query-folding-basics/applied-steps-section.png)

As you can see from the previous image that shows the applied steps section, the query in the image has the following steps:

* **Source**: Makes the connection to the data source. In this case its a connection to a SQL Server database.
* **Navigation**: Navigates to a specific table within the database.
* **Removed other columns**: Selects which columns to keep from the table and removes the rest.
* **Sorted rows**: Sorts the table using one or multiple columns using a descending order.
* **Kept top rows**: Filters the table to only keep a certain number of rows from the top of the table.

The Power Query Editor helps you add these steps, through a diverse set of interactions on its user interface, to create the M Script that produces your desired query output.

These set of steps names are a friendly way to interpret the M script that Power Query has created for you. To view this full M script you can either go to the Advanced Editor window in the View tab or change the view of the formula bar to show the query script by going into the View tab and from the Layout group select the **Script view** to be *Query script*.

![image that displays the full script and the corresponding names of the steps](media/query-folding-basics/m-script-applied-steps.png) 

From the previous image, you can see that most of the names that you see in the applied steps pane are also being used in the M script and in some cases they are wrapped around other symbols. The Power Query Editor always tries to show you a friendly name instead of the exact name being used inside your M script to help you interpret your query much easier.

>[!NOTE]
>Steps of a query are named using something called  *identifiers* in the M language. A quoted-identifier, such as the one for the *#"Kept top rows"*, can be used to allow any sequence of zero or more Unicode characters to be used as an identifier, including keywords, whitespace, comments, operators and punctuators. You can learn more about *identifiers* in the M language from the documentation on [lexical structure](https://docs.microsoft.com/powerquery-m/m-spec-lexical-structure#identifiers).

Furthermore, any changes that you make to your query through the Power Query Editor will automatically update the M script for your query. For example, using the previous image as the starting point, if you change the *Kept top rows* step name to be *Top 20 rows*, this will automatically be updated in the script view as shown in the image below:

![image about how a change in a step name updates the m script](media/query-folding-basics/change-step-name.png)

While it is recommended to leverage the Power Query Editor to create all or most of the M script for you, you can manually add or modify pieces of your M code. You can learn more about the M language from the [official docs site for the language](https://docs.microsoft.com/powerquery-m/). 

>[!NOTE]
> M Script or M code are terms used for any code that uses the M Language. In the context of this article, M Script also refers to the code found inside a Power Query query and accessible through the Advanced Editor window in the View tab and also through the script view in the formula bar.

## How does a query get evaluated in Power Query?

The diagram below explores the process that happens in order to evaluate the previously mentioned query in Power Query:

![Query evaluation diagram as an overview](media/query-folding-basics/diagram-1.png)

1. The M Script, found inside the Advanced Editor, is submitted to the Power Query engine alongside with other important information such as credentials and data source privacy levels.
2. Power Query determines what data needs to be extracted from the data source and submits a request to the data source.
3. The data source responds to the request from Power Query by transferring the requested data to Power Query.
4. Power Query receives the incoming data from the data source and performs any transformations using the Power Query engine if necessary.
5. The results derived from the previous point are loaded to a destination.

>[!NOTE]
>While this example showcases a query with a SQL Database as a data source, the concept applies to queries with or without a data source.

When Power Query reads your M script, it runs it through an optimization process to more efficiently evaluate your query. In this process it determines which steps (transforms) from your query can be offloaded to your data source and which other steps would need to be evaluated using the Power Query engine. This optimization process is also called Query folding where Power Query tries to push as much of the possible execution to the data source in an effort to optimize your query's execution.

>[!IMPORTANT]
>All rules from the [Power Query formula language (also known as M Language)](https://docs.microsoft.com/powerquery-m/) are followed. Most notably, lazy evaluation plays an important role during the optimization process where Power Query will understand what specific transforms from your query need to be evaluated and what others do not need to be evaluated because they are not needed in the output of your query. 
>Furthermore, when multiple sources are involved the data privacy level of each data source is taken into consideration when evaluating the query. You can learn more about the behind the scenes of the [Data Privacy Firewall from this article](https://docs.microsoft.com/power-query/dataprivacyfirewall).

You can see in detail the steps that take place in this optimization process by following the below diagram:

![Query evaluation diagram 2](media/query-folding-basics/diagram-2.png)

1. The M Script, found inside the Advanced Editor, is submitted to the Power Query engine alongside with other important information such as credentials and data source privacy levels.
2. The Query folding mechanism submits metadata requests to the data source to determine the capabilities of the data source, table schemas, relationships between different entities at the data source and more. 
3. Based on the metadata received, the query folding mechanisms determines what information to extract from the data source and what set of transformations will need to happen inside the Power Query engine. It sends the instructions to two other components that will take care of retrieving the data from the data source and transforming the incoming data in the Power Query engine if necessary.
4. Once the instructions have been received by the internal components of Power Query, Power Query sends a request to the data source using a data source query.
5. The data source receives the request from Power Query and transfers the data to the Power Query engine.
6. Once the data is inside Power Query, the transformation engine inside Power Query (also known as mashup engine) performs the transformations that couldn't be folded back or offloaded to the data source.
7. The results derived from the previous point are loaded to a destination.

This is the process that happens to a Power Query query during its evaluation.

>[!NOTE]
>Depending on the transformations and data source used in the M script, Power Query will determine if it will stream or buffer the incoming data.

## What is query folding?

The goal of query folding is to offload or push as much of the evaluation of a query to the data source which is able to compute the transformations of your query.

It accomplishes this goal by translating your M Script into a language that can be interpreted and executed by your data source, thus pushing the evaluation to your data source and sending the result of that evaluation to Power Query.

This often provides a much faster query execution than extracting all the required data from your data source and running all transforms required in the Power Query engine.

When you use the [Get Data experience](get-data-experience.md), Power Query guides you through the process that ultimately lets you connect to your data source. When doing so, Power Query leverages a series of functions in the M language categorized as [accessing data functions](https://docs.microsoft.com/powerquery-m/accessing-data-functions). These specific functions use mechanisms and protocols in order to connect to your data source using a language that your data source can understand. 

However, the steps that follow in your query are the steps or transforms that the query folding mechanism will attempt to optimize and check if they can be offloaded to your data source instead of them being processed using the Power Query engine. 

>[!IMPORTANT]
> All data source functions, commonly showcased as the *Source* step of a query, will query the data to the data source in its native language. The query folding mechanism applies to all transforms applied to your query after your data source function so they can be translated and combined into a single data source query or as many transforms that can be offloaded to the data source.

Depending on how the query is structured, there could be three possible outcomes to the query folding mechanism:

* **Full query folding**: When all of your query transformations get pushed back to the data source and minimal processing occurs at the Power Query engine. 
* **Partial query folding**: When only a few transformations in your query, and not all, can be pushed back to the data source. This means that a subset of your transformations is done at your data source and the rest of your query transformations occur in the Power Query engine.
* **No query folding**:  When the query contains transformations that can't be translated to the native query language of your data source, either because the transformations aren't supported or the connector doesn't support query folding. For this case, Power Query gets the raw data from your data source and uses the Power Query engine to achieve your desired output by processing the required transforms at the Power Query engine level.

>[!NOTE]
>The Query folding mechanism is primarily available in connectors for structured data sources such as, but not limited to, [Microsoft SQL Server](Connectors/sqlserver.md) and [OData Feed](Connectors/odatafeed.md). During the optimization phase, the engine may sometimes reorder steps in the query.
>
>Leveraging a data source that has more processing resources and has Query folding capabilities can expedite your query loading times as the processing occurs at the data source and not at the Power Query engine.

## Next steps

For detailed examples of the three possible outcomes of the query folding mechanism, you can read the follow up article on [Query folding examples](query-folding-examples.md).