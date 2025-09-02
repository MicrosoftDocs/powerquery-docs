---
title: What licenses do you need to use dataflows
description: Describes the various licenses you need for various apps for you to use either analytical or standard dataflows.
author: Luitwieler
ms.topic: conceptual
ms.date: 7/24/2024
ms.author: jeluitwi
ms.subservice: dataflows
---

# What licenses do you need to use dataflows?

Dataflows can be created in different portals, such as Power BI and the Power Apps, and can be of either analytical or standard type. In addition, some dataflow features are only available as Premium features. Considering the wide range of products that can use dataflows, and feature availability in each product or dataflow type, it's important to know what licensing options you need to use dataflows.

## Creating dataflows in Power BI workspaces

If you want to create dataflows in Power BI workspaces, you need to have a paid Power BI Pro license. A Power BI free license doesn't give you the ability to create dataflows. Depending on the features you use, Power BI Premium (per user) or embedded capacity is required.

A Power BI Pro account is available on a user-monthly basis. Multiple options are available for premium or embedded capacities.

## Creating dataflows in Microsoft Power Platform environments

If you want to create dataflows in the Microsoft Power Platform environment, a Power Apps Premium, Power Apps Per User plan  (P1 legacy license) or Power Apps Per App plan (P2 legacy license) is required. For more information, go to [Purchase Power Apps for your organization](/power-platform/admin/signup-for-powerapps-admin).

If you want to create analytical dataflows that store data in your organization's Azure Data Lake Storage Gen2 account, you or your administrator need access to an Azure subscription and an Azure Data Lake Storage Gen2 account.

## Premium features

Some of the dataflow features are limited to premium licenses. If you want to use the enhanced compute engine to speed up your dataflow queries' performance over computed tables, or have the DirectQuery connection option to the dataflow, you need to have Power BI P1 or A3 or higher capacities.

AI capabilities in Power BI, linked table, and computed table are all premium functions that aren't available with a Power BI Pro account.

## List of features

The following table contains a list of features and the license needed for them to be available.

| Feature                                                      | Power BI                           | Power Apps                                                   |
| ------------------------------------------------------------ | ---------------------------------- | ------------------------------------------------------------ |
| Store data in Dataverse tables (standard dataflow) | N/A                                | Per app plan<br />Per user plan                              |
| Store data in Azure Data Lake Storage (analytical dataflow)               | Yes | Yes, using analytical dataflows                              |
| Store data in customer provided Azure Data Lake Storage (analytical dataflow; bring your own Azure Data Lake Storage) | Yes | Per app plan<br />Per user plan      |
| The enhanced compute engine (running on Power BI Premium capacity / parallel execution of transforms) | Power BI Premium only                   | N/A                                                          |
| DirectQuery connection to dataflow                           | Power BI Premium only                | N/A                                                          |
| AI capabilities in Power BI                                  | Power BI Premium only                | N/A                                                          |
| Linked tables                                              | Power BI Premium only                | Yes, using analytical dataflows |
| Computed tables (in-storage transformations using M)       | Power BI Premium only                | Yes, using analytical dataflows |
| Schedule refresh                                             | Yes                                   | Yes                                                             |
| Dataflow authoring with Power Query Online                   | Yes                                | Yes                                                          |
| Dataflow management                                          | Yes | Yes                                         |
| New connectors                                               | Yes                                | Yes                                                          |
| Standardized schema, built-in support for Common Data Model | Yes                                | Yes                                                          |
| Dataflows data connector in Power BI Desktop                 | Yes                                | Yes, using analytical dataflows   |
| Dataflow incremental refresh                                 | Power BI Premium only               | Yes, using analytical dataflows with Per user Plan |

## Limitations on each license

The preceding table shows what features each license gives you. The following sections provide details about some of the limitations of each license.

### Power Apps licenses

If you use a Power Apps license to create dataflows, there's no limitation on the number of dataflows and tables you can create. However, there's a limitation on the size of Dataverse service you can use and refresh performance.

The Power Apps per-app plan covers up to a 50-MB database capacity. The Power Apps per-user plan allows you to have a database of 250-MB capacity.

The following limitations are in place in Power Apps:

- A dataflow refresh can run for a maximum of 24 hours.
- A dataflow can be refreshed up to 48 times per 24 hours (once every 30 minutes).
- Each query/partition has a maximum run duration of four hours.
- For each refresh, there's a concurrency limit of four queries/partitions that can refresh simultaneously.
- Power Query Online refresh limits apply for each user. More information: [Refresh limits](../power-query-online-limits.md#refresh-limits)

### Power BI Pro

Power BI Pro gives you the ability to create analytical dataflows, but not use any of the premium features. With a Power BI Pro account, you can't use linked or computed tables, you can't use AI capabilities in Power BI, and you can't use DirectQuery to connect to the dataflow. The storage for your dataflows is limited to the space left under your Power BI Pro account, which is a subset of 10-GB storage for all Power BI content. Currently, we don't report the current storage usage of dataflows in the [Power BI portal](/power-bi/admin/service-admin-manage-your-data-storage-in-power-bi). You'll be notified if you've almost reached the limit of the left over capacity. When you migrate an existing workspace from Power BI Premium back to Power BI Pro, dataflows may no longer support refresh operations through the UI due to a known limitation. As a workaround, you can re-enable refresh by editing and saving the dataflow.

### Power BI Premium

If you use Power BI Premium (capacity-based licensing), you can use all the AI capabilities in Power BI, computed tables and linked tables, with the ability to have a DirectQuery connection to the dataflow. You can also use the enhanced compute engine. However, the dataflow created under a premium capacity license uses only the internal Azure Data Lake Storage, and isn't accessible by other platforms except Power BI itself. You can't create external dataflows just by having a Power BI Premium license; you need to have an Azure subscription for Azure Data Lake Storage as well.

#### Limitations per premium capacity

Dataflows that are using a premium capacity to refresh the data are limited to the maximum number of parallel tasks they can perform at a given time. The maximum number of parallel tasks depends on the type of premium capacity you're using. [This table](/power-bi/enterprise/service-premium-what-is#dataflows-gen1) represents the maximum number of parallel tasks that can be run at a given time by all dataflows in a workspace mapped to the capacity.

#### Parallel tasks

A premium capacity can run multiple evaluations in parallel. For example, you have a P4 capacity and a dataflow that consists of 84 tasks. You refresh your dataflow and the first 64 tasks are allocated for the refresh. The 20 left over evaluations for this dataflow are parked in a queue. Once one of the evaluations is finished, it starts with the next evaluation from the queue. If you start another dataflow in your workspace on the same premium capacity while the other is still running, it gets parked in the same queue of the premium capacity. The new dataflow needs to wait on the other dataflows in the workspace to start the refresh of your data.

You can use the following pointers to estimate the number of tasks of your dataflow refresh:

- The number of queries executed in the refresh (don't forget the upstream linked tables).
- The number of partitions in an incremental refresh query are considered as extra tasks.

#### Strategy to lower the number of tasks during refresh

To lower the number of tasks or improve the efficiency of your tasks, you can use the following strategies:

- Lower the number of queries in your dataflow by combining queries where possible and only "enable load" for queries that are used downstream.
- Evaluate if you really need the upstream linked tables to refresh automatically.
- Strategically schedule your dataflow refreshes based on the number of tasks.
- Make sure your query returns the minimum set of columns and rows to satisfy your data need. The faster and more efficiently the task executes, the sooner the next task can start.

### Using your organization's Azure Data Lake Storage account for dataflow storage

To create dataflows that store data in your organization's Azure Data Lake Storage account, in addition to the previously listed product licenses, you must have an Azure subscription. The amount of storage that can be used isn't limited by the dataflow or the product it was created in.

## Related content

If you want to read more details about the concepts discussed in this article, go to any of the following links.

### Pricing

- [Power BI pricing](https://powerbi.microsoft.com/pricing/)
- [Power Apps pricing](https://powerapps.microsoft.com/pricing/)
- [Azure Data Lake Storage Gen 2 pricing](https://azure.microsoft.com/pricing/details/storage/data-lake/)

### Features

- [Computed tables](computed-tables.md)
- [Linked tables](linked-tables.md)
- [AI capabilities in Power BI dataflows](/power-bi/service-machine-learning-automated)
- [Standard vs. analytical dataflows](understanding-differences-between-analytical-standard-dataflows.md)
- [The enhanced compute engine](/power-bi/transform-model/service-dataflows-enhanced-compute-engine)



