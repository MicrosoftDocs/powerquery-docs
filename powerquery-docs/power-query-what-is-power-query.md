---
title: What is Power Query?
description: Learn what Power Query is, and how it can help you get and transform data
author: mllopis

ms.service: powerquery
ms.topic: overview
ms.date: 07/20/2019
ms.author: millopis

LocalizationGroup: Get started
#Customer intent: As a data analyst or report creator, I want to know what Power Query is, so I can decide whether Power Query has the features and services I need to connect to and transform data.
---

## What is Power Query?

Power Query is a data transformation and data preparation engine. Power Query comes with a graphical interface for getting the data from sources, and and a Power Query Editor for applying the transformation. The destination of which the data will be stored is dependent of where the Power Query have been used, because the engine is available in many other products and services. Using Power Query you can perform the Extract (E), Transform (T), and Load (L) process of data, also called as ETL.

![What is Power Query](whatispowerquery.png)


## How Power Query helps with data acquisition

Business users spend up to 80% of their time on data preparation, delaying the time to analysis and decision making. There are many challenges that cause this situation, and **Power Query** helps address many of them.


|Existing Challenge  |How does Power Query help?  |
|---------|---------|
|Finding and connecting to data is too difficult     |Power Query enables connectivity to a wide range (100s) of data sources, including data of all sizes and shapes. |
|Experiences for data connectivity are too fragmented     | Consistency of experience, and parity of query capabilities over all data sources with Power Query.        |
|Data often needs to be reshaped before consumption     | Highly interactive and intuitive experience for rapidly and iteratively building queries over any data source, any size.        |
|Any shaping is one-off and not repeatable     |  When using Power Query to access and transform data, users are defining a repeatable process (query) that can be easily refreshed in the future to get up-to-date data. <br>In the event that the process/query needs to be modified to account for underlying data or schema changes, Power Query provides users with the ability to modify existing queries using the same interactive and intuitive experience that they used when initially defining their queries.      |
|Volume (data sizes), Velocity (rate of change) and Variety (breadth of data sources and data shapes)     |  Power Query offers the ability to work against a subset of the entire data set in order to define the required data transformations, allowing users to easily filter down and transform their data to a manageable size. <br>Power Query queries can be refreshed manually or by leveraging schedule refresh capabilities in specific products (such as Power BI) or even programmatically (using Excel’s Object Model). <br>Power Query provides connectivity to hundreds of data sources and over 350 different types of data transformations for each of these sources, allowing users to work with data from any source and in any shape.      |


## Transformations

The transformation engine in Power Query includes many pre-build transformation functions that can be simply used through the graphical interface of the Power Query Editor. These transformation can be as simple as removing a column or filtering rows, or as common as using the first rows as headers. There are also advanced transformation options such as Merge, Append, Group By, Pivot and Unpivot etc. 

All of these transformations are simply possible by choosing the transformation option in the menu, and then applying the options required for that. Here are a few of these transformations available in Power Query Editor;

![Some of the power query transformations](powerquerytransformationslist.png)

To learn more about data transformations using Power Query, read [this article](power-query-quickstart-using-power-bi.md).

## The Power Query Formula Language (M)

In any data transformation scenario, there are some transformations that cannot be done in the best way using the graphical editor. Some of these transformations might require special configurations and settings that the graphical interface doesn't have that covered for the time being. Power Query engine uses a scripting language behind the scene for Power Query called Power Query Formula Language, also called as M. 

The M language is the data transformation language of Power Query, anything that happens in the query is written in M. If you want to do advanced transformations using the Power Query engine, you can use the Advanced Editor to access the script of the query and modify it as you wish. The amount of functions and transformations available in M is far more, and what you can do using the language is far more than what can be done through the graphical interface.

![Sample M script](sampleMScript.png)

To lean more about M, [follow this](https://docs.microsoft.com/powerquery-m/index) thread.

## Power Query experiences

The Power Query user experience is provided via the user interface or Power Query Editor. The goal of this interface is to help you apply your desired transformations by simply interacting with a user-friendly set of ribbons, menus, buttons and other set of interative components.

The Power Query Editor is the primary data preparation experience, allowing users to connecto to over 70 data sources and apply over 300 different data transformations by previewing data and selecting transformations in the user experience. These data transformation capabilities are common across all data sources, regardless of the underlying data source limitations.

When creating a new transformation step, by intercting with the components of the Power Query interface, Power Query will automatically create the M code required to perform such transformation without the need for you to write any code.
 
Currently there are two Power Query experiences available:
* **Power Query Online** - Found in integrations such as Power BI dataflows, Power Platform dataflows, Azure Data Factory Wrangling Dataflows, and many more that provide the experience through an online webpage.
* **Power Query for Desktop** - Found in integrations such as Power Query for Excel and Power BI Desktop. 

>[!Note]
>While these two experiences exist, they both provide almost the same user experience in every scenario.

## Dataflows

Power Query can be used in many products such as Power BI and Excel. However, using it inside that product will limit the usage of it only within that product itself. Dataflow is a service version of Power Query experience. Using dataflows, you can perform the same actions of getting data and transforming it. However, instead of sending the output to Power BI or Excel, you can store the output in other storage options such as Common Data Services, and Azure Data Lake Storage Gen2. This will enable the output of dataflows to be used in other products and services. Dataflows are product-agnostic Power Query service that runs in the cloud.

![Dataflow](/dataflows/media/dataflows-power-platform-dynamics-365/dataflow-function.png)

Read [this article](/dataflows/overview-dataflows-across-power-platform-dynamics-365) to learn more about dataflows.

## Where to use Power Query

Power Query can be found in the following Microsoft products and services:

|Product|M engine|Power Query Desktop|Power Query Online|Dataflows|
|-------|---------|-------------------|------------------|---------|
|Excel for Windows|![Yes](images/me-checkmark-24px.png)|![Yes](images/me-checkmark-24px.png)|![No](images/me-cancel-24px.png)| ![No](images/me-cancel-24px.png)|
|Excel for Mac|![Yes](images/me-checkmark-24px.png)|![No](images/me-cancel-24px.png)|![No](images/me-cancel-24px.png)| ![No](images/me-cancel-24px.png)|
|Power BI|![Yes](images/me-checkmark-24px.png)|![Yes](images/me-checkmark-24px.png)|![Yes](images/me-checkmark-24px.png)| ![Yes](images/me-checkmark-24px.png)
|Power Apps| ![Yes](images/me-checkmark-24px.png) |![No](images/me-cancel-24px.png)|![Yes](images/me-checkmark-24px.png)| ![Yes](images/me-checkmark-24px.png)||
|Power Automate| ![Yes](images/me-checkmark-24px.png) |![No](images/me-cancel-24px.png) | ![Yes](images/me-checkmark-24px.png) |![No](images/me-cancel-24px.png) |
|Azure Data Factory| ![Yes](images/me-checkmark-24px.png) |![No](images/me-cancel-24px.png) |![Yes](images/me-checkmark-24px.png) |![Yes](images/me-checkmark-24px.png)|
|SQL Server Integration Services| ![Yes](images/me-checkmark-24px.png)| ![No](images/me-cancel-24px.png)|![No](images/me-cancel-24px.png)|![No](images/me-cancel-24px.png)|
|SQL Server Analysis Services| ![Yes](images/me-checkmark-24px.png)| ![Yes](images/me-checkmark-24px.png)|![No](images/me-cancel-24px.png)|![No](images/me-cancel-24px.png)|
|Dynamics 365 Customer Insights|![Yes](images/me-checkmark-24px.png)|![No](images/me-cancel-24px.png)|![Yes](images/me-checkmark-24px.png)|![Yes](images/me-checkmark-24px.png)


|Label|Description|
|----|--|
|M engine| Underlying query execution engine that runs queries expressed in the Power Query formula language (“M”). |
|Power Query Desktop| Power Query experience found inside of desktop applications|
|Power Query Online|Power Query experience found inside of web browser applications|
|Dataflows| Power Query as a service that runs in the cloud, and is product agnostic. The stored result can be used in other applications as services.|

## More resources
* [Data sources in Power Query](connectors.md)
* [Getting data](get-data-experience.md)
* [Power Query quickstart](power-query-quickstart-using-power-bi.md)
* [Shape and combine data using Power Query](power-query-tutorial-shape-combine.md)
* [What are dataflows](overview-dataflows-across-power-platform-dynamics-365.md)
