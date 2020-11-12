---
title: What licenses do you need to use dataflows
description: What licenses do you need to use dataflows
author: radacad

ms.service: powerquery
ms.topic: conceptual
ms.date: 05/25/2020
ms.author: v-douklo

LocalizationGroup: Data from files
---

# What licenses do you need to use dataflows?

Dataflows can be created in different portals, such as Power BI and Power Apps portal, and can be of two types, analytical and standard dataflows. In addition, some dataflow features are only available as Premium features. Considering the wide range of products that can use dataflows, and feature availability in each product or dataflow type, it's important to know what licensing options you need to use dataflows.

## Creating dataflows in Power BI workspaces

If you want to create dataflows in Power BI workspaces, you need to have a paid Power BI Pro license. A Power BI free license won't give you the ability to create dataflows. Depending on the features you use, a Power BI premium or embedded capacity is required. 

Power BI pro account is available on a user-monthly-basis option. Multiple options are available for premium or embedded capacities.

## Creating dataflows in Power Platform environments

If you want to create dataflows in the Power Platform environment a Power Apps (per user or per app) license is required.

If you want to create analytical dataflows that store data in your organization's Azure Data Lake Storage account, you or your administrator will need access to an Azure subscription and an Azure Data Lake Storage account.

## Premium features

Some of the dataflow features are limited to premium licenses. If you want to use the enhanced compute engine to speed up your dataflow queries performance over computed entities, or have the DirectQuery connection option to the dataflow, you need to have Power BI P1 or A3 or higher capacities.

AI capabilities in Power BI, linked entity, and computed entity are all premium functions that aren't available with a Power BI pro account.

## Features

The following table contains a list of features and the license needed for them to be available.

| Feature                                                      | Power BI                           | Power Apps                                                   |
| ------------------------------------------------------------ | ---------------------------------- | ------------------------------------------------------------ |
| Store data in Dataverse tables (standard dataflow) | N/A                                | Per app plan<br />Per user plan                              |
| Store data in Azure Data Lake Storage (analytical dataflow)               | Power BI Pro<br />Power BI Premium | N/A                                                          |
| Store data in customer provided Azure Data Lake Storage (analytical dataflow; bring your own Azure Data Lake Storage) | Power BI Pro<br />Power BI Premium | Per app plan<br />Per user plan                              |
| The enhanced compute engine (running on Power BI Premium capacity / parallel execution of transforms) | Power BI Premium                   | N/A                                                          |
| DirectQuery connection to dataflow                           | Power BI Premium                   | N/A                                                          |
| AI capabilities in Power BI                                  | Power BI Premium                   | N/A                                                          |
| Linked entities                                              | Power BI Premium                   | Analytical dataflows only |
| Computed entities (in-storage transformations using M)       | Power BI premium                   | Analytical dataflows only |
| Schedule refresh                                             | Yes                                   | Yes                                                             |
| Dataflow authoring with Power Query online                   | Yes                                | Yes                                                          |
| Dataflow Management                                          | Power BI portal                    | Power Apps portal                                            |
| New connectors                                               | Yes                                | Yes                                                          |
| Standardized schema / built-in support for the Common Data Model | Yes                                | Yes                                                          |
| Dataflows Data Connector in Power BI Desktop                 | Yes                                | Analytical dataflows only   |
| Dataflow incremental refresh                                 | Power BI Premium                   | Analytical dataflows only, requires Power Apps Plan2 |
| | | |

## Limitations on each license

The table above shows what features each license will give you. The following sections provide details about some of the limitations of each license.

### Power Apps Licenses

If you use the Power Apps license to create dataflows, there's no limitation on the number of dataflows and entities you can create. However, there's a limitation on the size of Dataverse service you can use.

The Power Apps per app plan covers up to a 50-MB database capacity. The Power Apps per user plan allows you to have a database of 250-MB capacity.

### Power BI Pro

Power BI Pro gives you the ability to create analytical dataflows, but not any of the premium features. Using a Power BI pro account, you can't use linked or computed entities, you can't use AI capabilities in Power BI, and you can't use DirectQuery to connect to the dataflow. The storage for your dataflows is limited to the space left under your Power BI pro account, which is a subset of 10-GB storage for all Power BI content.

### Power BI Premium

If you use Power BI Premium (capacity-based licensing), you can use all the AI capabilities in Power BI, computed entities and linked entities, with the ability to have a DirectQuery connection to the dataflow, and you can use the enhanced compute engine. However, the dataflow created under a premium capacity license uses only the internal Azure Data Lake Storage, and won't be accessible by other platforms except Power BI itself. You can't create external dataflows just by having a Power BI Premium license; you need to have an Azure subscription for Azure Data Lake Storage as well.

### Using your organization's Azure Data Lake Storage account for dataflow storage

To create dataflows that store data in your organizations Azure Data Lake Storage account, in addition to the product licenses above, an Azure subscription is required. The amount of storage that can be used is not limited by the dataflow or the product it was created in.

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
