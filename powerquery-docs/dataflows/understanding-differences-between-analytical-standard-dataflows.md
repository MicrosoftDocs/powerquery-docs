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

 
Dataflows are used to extract, transform, and load data to a storage destination where it can be leveraged for different scenarios. Because not all storage destinations share the same charecteristics, some dataflow features and behaviors differ dependinging on the storage destination the dataflow loads data into. Before you create a dataflow, its important to understand how the data is going to be used and choosing the storage destination according to the requirements of your solution.

[!INCLUDE [CDS note](../includes/cc-data-platform-banner.md)]

Selecting a storage destination of a dataflow will determind the dataflow's type: A dataflow that loads data into Common Data Services entities will be categorized as a Standard dataflow while dataflows that load data to Analytical entities will be categorized as an analytical dataflow.

Dataflows created in Power BI portal are always Analytical Dataflows. Dataflows created in Power Apps portal can either be Standard or Analytical, depending on your selection when creating the dataflow.
 

## Standard dataflows 

A standard dataflow loads data to Common Data Service entities. Standard dataflows can only be created in the Power Apps portal. One benefit of creating this type of dataflow is that any application that depends on data in Common Data Service can work with the data created by standard dataflows. Typical applications that leverage Common Data Service entities are Power Apps, Power Automate, AI Builder and Power Virtual Agents.  

![Creating a standard dataflow](media/analytical-standard-dataflows/create-standard-dataflow.png) 

### Standard dataflows versions

We have been working on significant updates to standard dataflows to improve their performance and reliability. These improvements will eventually be available to all standard dataflows but in the interim, we will differentiate between existing standard dataflows (Version 1) and new standard dataflows (Version 2) by adding a version indicator in the Power Apps portal:

![Standard dataflow versions](media/analytical-standard-dataflows/Standard-Dataflow-Version-Indication.png) 



## Analytical dataflows 

 

An analytical dataflow loads data to storage types optimized for analytics&mdash;Azure Data Lake Storage Gen2. Power Platform environments and Power BI workspaces provide customers with managed analytical storage location that's bundled with those product licenses. In addition, customers can link their organization’s Azure Data Lake storage Gen2 account as a destination for dataflows. 

 

Analytical dataflows are capable additional analytical features. For example, integration with Power BI’s AI features or use of computed entities which will be discussed later.  

You can create analytical dataflows in Power BI. By default, they'll load data to Power BI’s managed storage. But you can also configure Power Bi to store the data in the organization’s Azure Data Lake Storage. 

![Creating an analytical dataflow in Power BI](media/analytical-standard-dataflows/create-analytical-dataflow-powerbi.png) 

You can also create analytical dataflows in Power Apps and Dynamics 365 customer insights portals. When you're creating a dataflow in Power Apps portal, you can choose between Dataverse manages analytical storage or in your organization’s Azure Data Lake Storage account. 

![Creating Analytical Dataflow in Power Platform](media/analytical-standard-dataflows/create-analytical-dataflow-power-platform.png) 

### AI Integration 

Sometimes, depending on the requirement, you might need to apply some AI and machine learning functions on the data through the dataflow. These functionalities are available in Power BI dataflows and require a Premium workspace. 

![AI insights in an analytical dataflow](media/analytical-standard-dataflows/dataflow-ai-functions.png) 

The following articles discuss how to use AI functions in a dataflow: 

- [Azure Machine Learning integration in Power BI](https://docs.microsoft.com/power-bi/service-machine-learning-integration) 
- [Cognitive Services in Power BI](https://docs.microsoft.com/power-bi/service-cognitive-services) 
- [Automated Machine Learning in Power BI](https://docs.microsoft.com/power-bi/service-machine-learning-automated) 

Note that the features listed above are Power BI specific and are not available when creating a dataflow in the Power Apps or Dynamics 365 customer insights portals.  

### Computed entities 

One of the reasons to use a computed entity is the ability to process large amounts of data. The computed entity helps in those scenarios. If you have an entity in a dataflow, and another entity in the same dataflow uses the first entity's output, this will create a computed entity. 

The computed entity helps with the performance of the data transformations. Instead of re-doing the transformations needed in the first entity multiple times, the transformation will be done only once in the computed entity. Then the result will be used multiple times in other entities. 

![Computed entity in an analytical dataflow](media/analytical-standard-dataflows/computed-entity-in-dataflow.png) 

To learn more about computed entities, see [Using computed entities on Power BI Premium](https://docs.microsoft.com/power-bi/service-dataflows-computed-entities-premium). 

Computed entities are available only in an analytical dataflow. 

## Standard vs. analytical dataflows 

The following table lists some differences between a standard entity and an analytical entity. 

| Operation               | Standard             | Analytical                    | 
| --------------------------------- | --- | ------------------------------------------------------------ | 
| How to create                     | Power Platform dataflows | Power BI dataflows<br />Power Platform dataflows by selecting the **Analytical Entity** checkbox when creating the dataflow | 
| Storage options                   | Dataverse      | Azure Data Lake Storage internal for the Power BI dataflows<br />Azure Data Lake Storage external attached to the Power BI or Power Platform dataflows | 
| Power Query transformations       | Yes             |Yes                                                          | 
| AI functions                      | No              | Yes                                                          | 
| Computed entity                   | No              | Yes                                                          | 
| Can be used in other applications | Yes, through Dataverse | Power BI dataflows: Only in Power BI<br />Power Platform dataflows or Power BI external dataflows: Yes, through Azure Data Lake Storage | 
| Mapping to standard Entity        | Yes              | Yes                                                         | 
| Incremental load                  | Default incremental-load<br />Possible to change using the **Delete rows that no longer exist in the query output** checkbox at the load settings | Default full-load <br />Possible to set up incremental refresh by setting up the incremental refresh in the dataflow settings | 
| Scheduled Refresh                 | Yes              | Yes, the possibility of notifying the dataflow owners upon the failure | 
| | | |

## Scenarios to use each dataflow type 

Here are some sample scenarios and best practice recommendations for each type of dataflow. 

### Cross-platform usage&mdash;standard dataflow 

If your plan for building dataflows is to use stored data in multiple platforms (not only Power BI, but also other Power Platform services, Dynamics, and so on), a standard dataflow is a great choice. Standard dataflows store the data in Dataverse, which you can access through many other platforms and services. 

### Heavy data transformations on large data tables&mdash;analytical dataflow 

Analytical dataflows are an excellent option for processing large amounts of data. Analytical dataflows are also enhancing the computing power behind the transformation. Having the data is stored in Azure Data Lake Storage increases the writing speed to a destination. Compared to Dataverse (which might have many rules to check at the time of data storage), Azure Data Lake Storage is faster for read/write transactions on a large amount of data. 

### AI features&mdash;analytical dataflow 

If you're planning to use any AI functionalities through the data transformation stage, then an analytical dataflow is helpful because you can use all the supported AI features with this type of dataflow. 

 
