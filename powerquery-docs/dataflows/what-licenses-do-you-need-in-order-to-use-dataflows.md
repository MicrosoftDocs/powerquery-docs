---
title: What licenses do you need to use dataflows
description: What licenses do you need to use dataflows
author: radacad

ms.service: powerquery
ms.topic: conceptual
ms.date: 05/25/2020
ms.author: v-rerad

LocalizationGroup: Data from files
---

# What licenses do you need to use dataflows?

Dataflows come in different types, such as Power BI dataflows and Power Platform dataflows, analytical and standard dataflows, and internal and external dataflows. You can create dataflows in multiple environments. Considering this wide range of places that you can use dataflows, it's important to know what licensing options you need to use dataflows.

## Power BI dataflows

If you want to create dataflows in Power BI environments, you need to have a paid license for Power BI. A Power BI free license won't give you the ability to create dataflows. You need to have either a Power BI pro account, or be part of a premium or embedded capacity. Although, being part of the premium or embedded capacity itself won't allow you to create a dataflow, you would still need the pro account to create the dataflow.

Power BI pro account is available on a user-monthly-basis option.

and there are multiple options for the dedicated capacity such as what mentioned here.

## Power Platform dataflows

If you want to create dataflows in the Power Platform environment, then there are two options for you. If you create standard dataflows, you won't need any other license than the Power Apps (per user or per app) license, because that will give you the ability to use Common Data Services.

If you want to create analytical dataflows in the Power Platform environment, then you need to bring your own storage account, which is explained in the next section. In addition to having a Power Apps license, you need to have an Azure subscription.

## Using your own storage account

If you're using your own storage account and connected that to the dataflow you're creating, then you need to have a separate Azure Data Lake Storage Gen2 subscription, which can be part of your Azure licensing and subscription.

## Premium features

Some of the dataflow features are limited to premium capacity in Power BI. If you want to use the enhanced compute engine to speed up your dataflow queries performance over computed entities, or have the DirectQuery connection option to the dataflow, you need to have Power BI capacity A3 or higher.

AI capabilities in Power BI, linked entity, and computed entity are all premium functions that aren't available with a Power BI pro account.

## Features

The following table contains a list of features and the license needed for them to be available.

| Feature                                                      | Power BI                           | Power Apps                                                   | Customer Insights |
| ------------------------------------------------------------ | ---------------------------------- | ------------------------------------------------------------ | ----------------- |
| Store data in Common Data Services entities (standard dataflow) | N/A                                | Per app plan<br />Per user plan                              | N/A               |
| Store data in Azure Data Lake Storage Gen2 (analytical dataflow)               | Power BI Pro<br />Power BI Premium | N/A                                                          | ?                 |
| Store data in customer provided Azure Data Lake Storage Gen2 (analytical dataflow; bring your own Azure Data Lake Storage Gen2) | Power BI Pro<br />Power BI Premium | Per app plan<br />Per user plan                              | ?                 |
| The enhanced compute engine (running on Power BI Premium capacity / parallel execution of transforms) | Power BI Premium                   | N/A                                                          | ?                 |
| DirectQuery connection to dataflow                           | Power BI Premium                   | N/A                                                          | ?                 |
| AI capabilities in Power BI                                  | Power BI Premium                   | N/A                                                          | ?                 |
| Linked entities                                              | Power BI Premium                   | For dataflows with Azure Data Lake Storage Gen2 as the destination (analytical) | ?                 |
| Computed entities (in-storage transformations using M)       | Power BI premium                   | For dataflows with Azure Data Lake Storage Gen2 as the destination (analytical) | ?                 |
| Schedule refresh                                             |                                    |                                                              |                   |
| Dataflow authoring with Power Query online                   | Yes                                | Yes                                                          | Yes               |
| Dataflow Management                                          | Power BI portal                    | Power Apps portal                                            | ?                 |
| New connectors                                               | Yes                                | Yes                                                          | ?                 |
| Standardized schema / built-in support for the Common Data Model | Yes                                | Yes                                                          | Yes               |
| Dataflows Data Connector in Power BI Desktop                 | Yes                                | For dataflows with Azure Data Lake Gen2 as the destination   | ?                 |
| Dataflow incremental refresh                                 | Power BI Premium                   | For dataflows with Azure Data Lake Gen2 as the destination, requires Power Apps Plan2 | ?                 |
| | | | |

## Limitations on each license

The table above shows what features each license will give you. The following sections provide details about some of the limitations of each license.

### Power Apps Licenses

If you use the Power Apps license to create a standard dataflow, there's no limitation on the number of dataflows and entities you can create. However, there's a limitation on the size of Common Data Service you can use.

The Power Apps per app plan covers up to a 50-MB database capacity. The Power Apps per user plan allows you to have a database of 250-MB capacity.

### Power BI Pro

Power BI Pro only gives you the ability to create analytical dataflows, but not any of the premium features. Using a Power BI pro account, you can't use linked or computed entities, you can't use AI capabilities in Power BI, and you can't use DirectQuery to connect to the dataflow. The storage for your dataflows is limited to the space left under your Power BI pro account, which is a subset of 10-GB storage for all Power BI content.

### Power BI Premium

If you use Power BI Premium (capacity-based licensing), you can use all the AI capabilities in Power BI, computed entities and linked entities, with the ability to have a DirectQuery connection to the dataflow, and you can use the enhanced compute engine. However, the dataflow created under a premium capacity license uses only the internal Azure Data Lake Storage Gen2 storage, and won't be accessible by other platforms except Power BI itself. You can't create external dataflows just by having a Power BI Premium license; you need to have an Azure subscription for Azure Data Lake Storage Gen2 as well. 

### Azure Data Lake Storage Gen2

A subscription to Azure Data Lake Storage Gen2 gives you the ability to create external analytical dataflows. The size of the storage would be only limited to your Azure subscription license. However, having only Azure Data Lake Storage Gen2 won't give you the ability to create dataflows; you need to have either a Power BI or Power Platform license to be able to author and create dataflows.

## Next step

If you want to read more details about the concepts discussed in this article, follow any of the links below.

### Pricing

- [Power BI Pricing](https://powerbi.microsoft.com/pricing/)
- [Power Platform Pricing](https://powerapps.microsoft.com/pricing/)
- [Azure Data Lake Storage Gen 2 Pricing](https://azure.microsoft.com/pricing/details/storage/data-lake/)

### Features

- [Computed entity](computed-entities.md)
- [Linked entity](linked-entities.md)
- [AI capabilities in Power BI dataflow](https://docs.microsoft.com/power-bi/service-machine-learning-automated)
- [Standard vs analytical dataflow](understanding-differences-between-analytical-standard-dataflows.md)
- [The enhanced compute engine](https://docs.microsoft.com/power-bi/transform-model/service-dataflows-enhanced-compute-engine)
