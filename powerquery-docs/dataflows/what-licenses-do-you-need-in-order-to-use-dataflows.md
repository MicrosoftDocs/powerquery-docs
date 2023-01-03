---
title: What licenses do you need to use dataflows
description: What licenses do you need to use dataflows
author: bensack
ms.topic: conceptual
ms.date: 08/01/2022
ms.author: bensack
---

# What licenses do you need to use dataflows?

Dataflows can be created in different portals, such as Power BI and the Power Apps, and can be of either analytical or standard type. In addition, some dataflow features are only available as Premium features. Considering the wide range of products that can use dataflows, and feature availability in each product or dataflow type, it's important to know what licensing options you need to use dataflows.

## Creating dataflows in Power BI workspaces

If you want to create dataflows in Power BI workspaces, you need to have a paid Power BI Pro license. A Power BI free license won't give you the ability to create dataflows. Depending on the features you use, a Power BI Premium or embedded capacity is required.

A Power BI Pro account is available on a user-monthly basis. Multiple options are available for premium or embedded capacities.

## Creating dataflows in Microsoft Power Platform environments

If you want to create dataflows in the Microsoft Power Platform environment a Power Apps (per-user or per-app) license is required.

If you want to create analytical dataflows that store data in your organization's Azure Data Lake Storage Gen2 account, you or your administrator will need access to an Azure subscription and an Azure Data Lake Storage Gen2 account.

## Premium features

Some of the dataflow features are limited to premium licenses. If you want to use the enhanced compute engine to speed up your dataflow queries' performance over computed entities, or have the DirectQuery connection option to the dataflow, you need to have Power BI P1 or A3 or higher capacities.

AI capabilities in Power BI, linked entity, and computed entity are all premium functions that aren't available with a Power BI Pro account.

## Features

The following table contains a list of features and the license needed for them to be available.

| Feature                                                      | Power BI                           | Power Apps                                                   |
| ------------------------------------------------------------ | ---------------------------------- | ------------------------------------------------------------ |
| Store data in Dataverse tables (standard dataflow) | N/A                                | Per app plan<br />Per user plan                              |
| Store data in Azure Data Lake Storage (analytical dataflow)               | Power BI Pro<br />Power BI Premium | Yes, using analytical dataflows                              |
| Store data in customer provided Azure Data Lake Storage (analytical dataflow; bring your own Azure Data Lake Storage) | Power BI Pro<br />Power BI Premium | Per app plan<br />Per user plan                              |
| The enhanced compute engine (running on Power BI Premium capacity / parallel execution of transforms) | Power BI Premium                   | N/A                                                          |
| DirectQuery connection to dataflow                           | Power BI Premium                   | N/A                                                          |
| AI capabilities in Power BI                                  | Power BI Premium                   | N/A                                                          |
| Linked entities                                              | Power BI Premium                   | Yes, using analytical dataflows |
| Computed entities (in-storage transformations using M)       | Power BI premium                   | Yes, using analytical dataflows |
| Schedule refresh                                             | Yes                                   | Yes                                                             |
| Dataflow authoring with Power Query Online                   | Yes                                | Yes                                                          |
| Dataflow management                                          | Power BI                     | Power Apps                                         |
| New connectors                                               | Yes                                | Yes                                                          |
| Standardized schema, built-in support for Common Data Model | Yes                                | Yes                                                          |
| Dataflows data connector in Power BI Desktop                 | Yes                                | Yes, using analytical dataflows   |
| Dataflow incremental refresh                                 | Power BI Premium                   | Yes, using analytical dataflows with Per user Plan |
| | | |

## Limitations on each license

The preceding table shows what features each license will give you. The following sections provide details about some of the limitations of each license.

### Power Apps licenses

If you use a Power Apps license to create dataflows, there's no limitation on the number of dataflows and entities you can create. However, there's a limitation on the size of Dataverse service you can use.

The Power Apps per-app plan covers up to a 50-MB database capacity. The Power Apps per-user plan allows you to have a database of 250-MB capacity.

### Power BI Pro

Power BI Pro gives you the ability to create analytical dataflows, but not use any of the premium features. With a Power BI Pro account, you can't use linked or computed entities, you can't use AI capabilities in Power BI, and you can't use DirectQuery to connect to the dataflow. The storage for your dataflows is limited to the space left under your Power BI Pro account, which is a subset of 10-GB storage for all Power BI content. At this point in time, we don't report the current storage usage of dataflows in the [Power BI portal](/power-bi/admin/service-admin-manage-your-data-storage-in-power-bi). You'll be notified if you've almost reached the limit of the left over capacity.

### Power BI Premium

If you use Power BI Premium (capacity-based licensing), you can use all the AI capabilities in Power BI, computed entities and linked entities, with the ability to have a DirectQuery connection to the dataflow, and you can use the enhanced compute engine. However, the dataflow created under a premium capacity license uses only the internal Azure Data Lake Storage, and won't be accessible by other platforms except Power BI itself. You can't create external dataflows just by having a Power BI Premium license; you need to have an Azure subscription for Azure Data Lake Storage as well.

#### Limitations per premium capacity

Dataflows that are using a premium capacity to refresh the data are limited to the maximum number of parallel tasks they can perform at a given time. The maximum number of parallel tasks depends on the type of premium capacity you're using. [This table](/power-bi/developer/embedded/embedded-capacity#sku-memory-and-computing-power) represents the maximum number of parallel tasks that can be executed at a given time by all dataflows in a workspace mapped to the capacity.

#### Parallel tasks

A premium capacity can run multiple evaluations in parallel. For example, you have a P4 capacity and a dataflow that consists of 84 tasks. You refresh your dataflow and the first 64 tasks will be allocated for the refresh. The 20 left over evaluations for this dataflow will be parked in a queue. Once one of the evaluations is finished, it will start with the next evaluation from the queue. If you start another dataflow in your workspace on the same premium capacity while the other is still running, it will get parked in the same queue of the premium capacity and needs to wait on the other dataflows in the workspace to start the refresh of your data.

You can use the pointers below to estimate the number of tasks of your dataflow refresh:

* The number of queries executed in the refresh (don't forget the upstream linked entities).
* The number of partitions in an incremental refresh query are considered as additional tasks.

#### Strategy to lower the number of tasks during refresh

To lower the number of tasks or improve the efficiency of your tasks, you can use the following strategies:

* Lower the number of queries in your dataflow by combining queries where possible and only "enable load" for queries that are used downstream.
* Evaluate if you really need the upstream linked entities to refresh automatically.
* Strategically schedule your dataflow refreshes based on the number of tasks.
* Make sure your query returns the minimum set of columns and rows to satisfy your data need. The faster and more efficiently the task executes, the sooner the next task can start.

### Using your organization's Azure Data Lake Storage account for dataflow storage

To create dataflows that store data in your organization's Azure Data Lake Storage account, in addition to the product licenses above, you must have an Azure subscription. The amount of storage that can be used isn't limited by the dataflow or the product it was created in.

## Next step

If you want to read more details about the concepts discussed in this article, follow any of the links below.

### Pricing

- [Power BI pricing](https://powerbi.microsoft.com/pricing/)
- [Power Apps pricing](https://powerapps.microsoft.com/pricing/)
- [Azure Data Lake Storage Gen 2 pricing](https://azure.microsoft.com/pricing/details/storage/data-lake/)

### Features

- [Computed entities](computed-entities.md)
- [Linked entities](linked-entities.md)
- [AI capabilities in Power BI dataflows](/power-bi/service-machine-learning-automated)
- [Standard vs. analytical dataflows](understanding-differences-between-analytical-standard-dataflows.md)
- [The enhanced compute engine](/power-bi/transform-model/service-dataflows-enhanced-compute-engine)
