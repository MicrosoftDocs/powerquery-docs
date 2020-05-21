---
title: Understanding the differences between standard and analytical dataflows
description: Understanding the differences between standard and analytical dataflows
author: radacad
ms.service: powerquery
ms.topic: conceptual
ms.date: 05/11/2020
ms.author: gepopell

---

# Understanding the differences between standard and analytical dataflows

Dataflows are categorized in many ways. One of those ways is the difference between standard and analytical dataflows. Understanding this concept helps you create the dataflow for the right requirement. Dataflows create entities, and entities are of two types: standard and analytical. Based on the type of entity produced by the dataflow, we call the dataflow either a standard dataflow or an analytical dataflow.

## Standard dataflow

A dataflow by the standard definition is a service to extract, transform, and load the data in a destination. A standard dataflow supports Power Query transformations, and can get data from any sources that Power Query is compatible with. The entities of this type of dataflow store their data in Common Data Service.

Standard dataflows can be created by Power Platform dataflows when created through the Power Apps portal. 

![Creating a standard dataflow](media/analytical-standard-dataflows/create-standard-dataflow.png)

One benefit of this type of dataflow is that any application that can connect to Common Data Service can work with the data, such as Power BI, Power Apps, Power Automate, Power Virtual Agent, Dynamics, and other applications.

## Analytical dataflow

An analytical dataflow, in addition to doing the transformation, is also capable of extra analytical features. These features can be AI functions in the dataflow, and also the use of computed entities. Analytical entities in the analytical dataflow store their data in Azure Data Lake Storage.

Analytical dataflows can be created using Power BI dataflows, regardless of whether it's an external dataflow (a dataflow connected to a customer's Azure Data Lake Storage Gen2) or a normal dataflow created in Power BI.

![Creating an analytical dataflow in Power BI](media/analytical-standard-dataflows/create-analytical-dataflow-powerbi.png)

Analytical dataflows can also be created in Power Platform dataflows. The selection of an analytical dataflow is an option at the start of creation of the dataflow in the Power Apps portal.

![Creating Analytical Dataflow in Power Platform](media/analytical-standard-dataflows/create-analytical-dataflow-power-platform.png)

### AI functionalities

Depending on the requirement, sometimes you might need to apply some AI and machine learning functions on the data through the dataflow. These functionalities are possible when the dataflow is an analytical dataflow. 

![AI insights in an analytical dataflow](media/analytical-standard-dataflows/dataflow-ai-functions.png)

The following articles discuss how to use AI functions in a dataflow:

- [Azure Machine Learning integration in Power BI](https://docs.microsoft.com/power-bi/service-machine-learning-integration)
- [Cognitive Services in Power BI](https://docs.microsoft.com/power-bi/service-cognitive-services)
- [Automated Machine Learning in Power BI](https://docs.microsoft.com/power-bi/service-machine-learning-automated)

Note that the features listed above are not available in a standard dataflow.

### Computed entity

One of the reasons to use a computed entity is the ability to process large amounts of data. The computed entity helps in those scenarios. A computed entity is an entity that is already processed through the dataflow, and then the result of that processing can be used in another entity in the same dataflow. 

The computed entity helps with the performance of the data transformations. Instead of re-doing the transformations needed in the first entity over and over again, the transformation will be done only once in the computed entity, and then the result will be used multiple times in other entities.

![Computed entity in an analytical dataflow](media/analytical-standard-dataflows/computed-entity-in-dataflow.png)

To learn more about computed entities, see [Using computed entities on Power BI Premium](https://docs.microsoft.com/power-bi/service-dataflows-computed-entities-premium).

Computed entities are available only in an analytical dataflow.

## Standard vs. analytical dataflows

The following table lists some differences between a standard entity and an analytical entity.

|                                   | Standard             | Analytical                            |
| --------------------------------- | --- | ------------------------------------------------------------ |
| How to create                     | Power Platform dataflows | Power BI dataflows<br />Power Platform dataflows by selecting the **Analytical Entity** checkbox when creating the dataflow | 
| Storage options                   | Common Data Service      | Azure Data Lake Storage Gen2 internal for the Power BI dataflows<br />Azure Data Lake Storage Gen2 external attached to the Power BI or Power Platform dataflows |
| Power Query transformations       | Yes             |Yes                                                          |
| AI functions                      | No              | Yes                                                          |
| Computed entity                   | No              | Yes                                                          |
| Can be used in other applications | Yes, through Common Data Service | Power BI dataflows: Only in Power BI<br />Power Platform dataflows or Power BI external dataflows: Yes, through Azure Data Lake Storage Gen2 |
| Mapping to standard Entity        | Yes              | Yes                                                         |
| Incremental load                  | Default incremental-load<br />Possible to change using the **Delete rows that no longer exist in the query output** checkbox at the load settings | Default full-load <br />Possible to set up incremental refresh by setting up the incremental refresh in the dataflow settings |
| Scheduled Refresh                 | Yes              | Yes, possibility of notifying the dataflow owners upon the failure |

## Scenarios to use each dataflow type

Here are some sample scenarios and best practice recommendations for each type of dataflow.

### Cross platform usage&mdash;standard dataflow

If your plan when building dataflows is to use the stored data in multiple platforms (not only Power BI, but also other Power Platform services, Dynamics, and so on), then a standard dataflow is a great choice. Standard dataflows store the data in Common Data Service, which can then be accessed through many other platforms and services.

### Heavy data transformations on large data tables&mdash;analytical dataflow

Analytical dataflows are a great option for processing large amounts of data, and also enhancing the computing power behind the transformation using the computed entity. The fact that the data is stored in Azure Data Lake also increases the writing speed to a destination, because compared to Common Data Service (which might have many rules to check at the time of data storage), Azure Data Lake is faster for read/write transactions on a large amount of data.

### AI features&mdash;analytical dataflow

If you're planning to use any of the AI functionalities through the data transformation stage, then analytical dataflow is definitely helpful, because you can use all the supported AI features with this type of dataflow.



