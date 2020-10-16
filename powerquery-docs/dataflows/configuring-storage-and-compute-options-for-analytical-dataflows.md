---
title: Configuring storage and compute options for analytical dataflows
description: Configuring storage and compute options for analytical dataflows
author: radacad

ms.service: powerquery
ms.topic: conceptual
ms.date: 05/25/2020
ms.author: v-douklo

LocalizationGroup: Data from files
---

# Dataflow storage options

[Standard dataflows](understanding-differences-between-analytical-standard-dataflows.md) always load data into Common Data Service tables in an environment. [Analytical dataflows](understanding-differences-between-analytical-standard-dataflows.md) always load data into Azure Data Lake Storage Gen2 accounts. For both dataflow types, there's no need to provision or manage the storage. Dataflow storage, by default, is provided and managed by products the dataflow is created in.

Analytical dataflows allow an additional storage option: your organizations' Azure Data Lake Storage Gen2 account. This option enables access to the data created by a dataflow directly through Azure Data Lake Storage Gen2 interfaces. Providing your own storage account for analytical dataflows enables other Azure or line-of-business applications to leverage the data by connecting to the lake directly.

## Dataflows that leverage built-in storage

By default, analytical dataflows will use the built-in Azure data lake storage; for example, when you create a dataflow in Power BI or Power Apps portal. Access to the output of this type of dataflow is only possible through the Power Platform Dataflow connector in Power BI Desktop, or from other dataflows.

## Dataflows that leverage customer provided storage

Before creating a dataflow that leverages a customer provided Azure Data Lake Storage Gen2 storage account, the environment or workspace they were created in must be linked to an Azure Data Lake Storage Gen2 account. Depending on which product dataflow you're using (Power BI or Power Platform dataflows), the settings for connecting to an external Azure Data Lake Storage Gen2 subscription is linked in different places.

### Linking Power BI to your organization's Azure Data Lake Storage Gen2

To configure Power BI dataflows to store data in the organization's Azure Data Lake Storage Gen2, you need to follow the steps described in [Connect Azure Data Lake Storage Gen2 for dataflow storage](https://docs.microsoft.com/power-bi/transform-model/service-dataflows-connect-azure-data-lake-storage-gen2) in the Power BI Admin Portal.

![Connect your own Azure Data Lake Storage for Power BI dataflows](https://docs.microsoft.com/power-bi/transform-model/media/service-dataflows-connect-azure-data-lake-storage-gen2/dataflows-connect-08b.png)

### Linking a Power Platform environment to your organization's Azure Data Lake Storage Gen2

To configure dataflows created in Power Apps portal to store data in the organization's Azure Data Lake Storage Gen2, follow the steps in [Connect Azure Data Lake Storage Gen2 for dataflow storage](https://docs.microsoft.com/powerapps/maker/common-data-service/connect-azure-data-lake-storage-for-dataflow) in the Power Apps portal.

![Storage account setting for Power Platform analytical dataflow](https://docs.microsoft.com/powerapps/maker/common-data-service/media/select-storage-account.png)

### Known limitations

* Once a dataflow is created, its storage location can't be changed.

* Linked and computed entities features are only available when both dataflows are in the same storage account.

## The enhanced compute engine

In Power BI, in addition to the standard dataflow engine, an enhanced compute engine is available for the dataflows created in Premium workspaces. You can configure this setting in the Power BI Admin portal, under the Premium capacity settings. The enhanced compute engine is available in Premium P1 or A3 capacities and above. The enhanced compute engine will reduce the refresh time required for long-running ETL steps over computed entities, such as joins, distinct, filters, and group by. It also provides the ability to perform DirectQuery over entities from the Power BI dataset.

![The enhanced compute engine](https://docs.microsoft.com/power-bi/transform-model/media/service-dataflows-enhanced-compute-engine/enhanced-compute-engine-01.png)

To learn more about the enhanced compute engine, see [The enhanced compute engine](https://docs.microsoft.com/power-bi/transform-model/service-dataflows-enhanced-compute-engine).

## Next Steps

The articles below provide further information that can be helpful.

- [Connect Azure Data Lake Storage Gen2 for dataflow storage (Power BI dataflows)](https://docs.microsoft.com/power-bi/service-dataflows-connect-azure-data-lake-storage-gen2
  )
- [Connect Azure Data Lake Storage Gen2 for dataflow storage (Power Platform dataflows)](https://docs.microsoft.com/powerapps/maker/common-data-service/connect-azure-data-lake-storage-for-dataflow)
- [Creating computed entities in dataflows](computed-entities.md)
- [The enhanced compute engine](https://docs.microsoft.com/power-bi/transform-model/service-dataflows-enhanced-compute-engine)
- [Standard vs Analytical dataflows](understanding-differences-between-analytical-standard-dataflows.md)
