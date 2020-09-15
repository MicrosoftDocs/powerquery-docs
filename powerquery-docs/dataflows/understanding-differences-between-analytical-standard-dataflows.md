--- 
title: Understanding the differences between standard and analytical dataflows 
description: Understanding the differences between standard and analytical dataflows 
author: radacad 
ms.service: powerquery 
ms.topic: conceptual 
ms.date: 05/11/2020 
ms.author: bensack 
--- 

# Understanding the differences between standard and analytical dataflows 
<!--Edits to the first paragraph, suggested.-->
One of the many ways you can categorize dataflows is by the type of entity they create. Entities are of two types: standard and analytical. Based on the type of entity produced by the dataflow, it's either a standard dataflow or an analytical dataflow. Understanding this concept helps you create the right dataflow for your requirements.

## Standard dataflows

A *standard* dataflow is used to extract, transform, and load data to a destination. The destination of a standard dataflow must be Common Data Service, and the entities it produces are database entities.  

Standard dataflows can be created through the Power Apps admin center. 

![Creating a standard dataflow](media/analytical-standard-dataflows/create-standard-dataflow.png) 

One benefit of this type of dataflow is that any application that can connect to Common Data Service can work with the data, such as Power BI, Power Apps, Power Automate, Power Virtual Agents, Dynamics 365, and other applications. 

## Analytical dataflows

An *analytical* dataflow stores its entities in storage optimized for analytics: Azure Data Lake Storage. Microsoft Power Platform environments and Power BI workspaces provide managed analytical storage location that's bundled with those product licenses. In addition, you can link your organization's Data Lake storage account as a destination for dataflows.

Analytical dataflows are capable of being used with additional analytical features&mdash;for example, integration with AI features in Power BI or the use of computed entities, which will be discussed later.  

You can create analytical dataflows in Power BI. By default, they'll load data to managed storage in Power BI. But you can also configure Power Bi to store the data in your organization's Data Lake Storage account. 

![Creating an analytical dataflow in Power BI](media/analytical-standard-dataflows/create-analytical-dataflow-powerbi.png) 

You can also create analytical dataflows in Power Apps and Dynamics 365 Customer Insights portals<!--Please check guidance about whether "portals" is okay here.-->. When you're creating a dataflow in Power Apps admin center, you can choose between Common Data Service&ndash;managed<!--Edit okay? Confused what this meant.--> analytical storage or your organization's Data Lake Storage account. 

![Creating an analytical dataflow in Microsoft Power Platform](media/analytical-standard-dataflows/create-analytical-dataflow-power-platform.png) 

### AI integration 

Sometimes, depending on your requirements, you might need to apply some AI and machine learning functions on the data through the dataflow. These functionalities are available in Power BI dataflows. They require a Premium workspace. 

![AI insights in an analytical dataflow](media/analytical-standard-dataflows/dataflow-ai-functions.png) 

The following articles discuss how to use AI functions in a dataflow: 

- [Azure Machine Learning integration in Power BI](https://docs.microsoft.com/power-bi/service-machine-learning-integration) 

- [Cognitive Services in Power BI](https://docs.microsoft.com/power-bi/service-cognitive-services) 

- [Automated Machine Learning in Power BI](https://docs.microsoft.com/power-bi/service-machine-learning-automated) 

Note that the features listed above are Power BI&ndash;specific and aren't available when you create a dataflow in Power Apps or Dynamics 365 Customer Insights.  

### Computed entities

One of the reasons to use a computed entity is that you can process large amounts of data. A computed entity helps in those scenarios. If you have an entity in a dataflow, and another entity in the same dataflow uses the first entity's output, this creates a computed entity.

The computed entity helps with the performance of data transformations. Instead of redoing the transformations needed in the first entity multiple times, the transformation is only done once, in the computed entity. Then the result is used multiple times in other entities. 

![Computed entity in an analytical dataflow](media/analytical-standard-dataflows/computed-entity-in-dataflow.png) 

Computed entities are available only in an analytical dataflow. More information: [Using computed entities on Power BI Premium](https://docs.microsoft.com/power-bi/service-dataflows-computed-entities-premium)

## Standard vs. analytical entities
<!--Edit to heading okay? -->
The following table lists some differences between a standard entity and an analytical entity. 

| Operation               | Standard entity           | Analytical entity         | 
| --------------------------------- | --- | ------------------------------------------------------------ | 
| How to create                     | Power Platform dataflows | Power BI dataflows<br />Power Platform dataflows by selecting the **Analytical Entity** check box when creating the dataflow | 
| Storage options                   | Common Data Service      | Data Lake Storage internal for the Power BI dataflows<br />Data Lake Storage external attached to the Power BI or Power Platform dataflows | 
| Power Query transformations       | Yes             |Yes                                                          | 
| AI functions                      | No              | Yes                                                          | 
| Computed entity                   | No              | Yes                                                          | 
| Can be used in other applications | Yes, through Common Data Service | Power BI dataflows: Only in Power BI<br />Power Platform dataflows or Power BI external dataflows: Yes, through Data Lake Storage | 
| Mapping to standard Entity        | Yes              | Yes                                                         | 
| Incremental load                  | Default: incremental load<br />Possible to change by selecting the **Delete rows that no longer exist in the query output** check box in the load settings | Default: full load <br />Possible to set up incremental refresh in the dataflow settings | 
| Scheduled refresh                 | Yes              | Yes, the possibility of notifying the dataflow owners upon the failure | 

## Scenarios for using each dataflow type

The following are some sample scenarios and best practice recommendations for each type of dataflow. 

### Cross-platform usage&mdash;standard dataflow

If your plan for building dataflows is to use stored data in multiple platforms (not only Power BI, but also other Microsoft Power Platform services, Dynamics 365, and so on), a standard dataflow is a great choice. Standard dataflows store the data in Common Data Service, which you can access through many other platforms and services.

### Heavy data transformations on large data tables&mdash;analytical dataflow

Analytical dataflows are an excellent option for processing large amounts of data. Analytical dataflows also enhance the computing power behind the transformation. Having the data stored in Data Lake Storage increases the speed of writing to a destination. Compared to Common Data Service (which might have many rules to check at the time of data storage)<!--note from editor: Excellent, concise explanation!-->, Data Lake Storage is faster for read/write transactions on a large amount of data.

### AI features&mdash;analytical dataflow

If you're planning to use any AI functionality through the data transformation stage, you'll find it helpful to use an analytical dataflow because you can use all the supported AI features with this type of dataflow.
