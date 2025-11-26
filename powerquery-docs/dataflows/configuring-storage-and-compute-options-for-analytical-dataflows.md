---
title: Configuring storage and compute options for analytical dataflows
description: Configuring storage and compute options for analytical dataflows.
author: Luitwieler
ms.author: jeluitwi
ms.topic: concept-article
ms.date: 1/26/2024
ms.subservice: dataflows
---

# Dataflow storage options

[Standard dataflows](understanding-differences-between-analytical-standard-dataflows.md) always load data into Dataverse tables in an environment. [Analytical dataflows](understanding-differences-between-analytical-standard-dataflows.md) always load data into Azure Data Lake Storage accounts. For both dataflow types, there's no need to provision or manage the storage. Dataflow storage, by default, is provided and managed by products the dataflow is created in.

Analytical dataflows allow an additional storage option: your organizations' Azure Data Lake Storage account. This option enables access to the data created by a dataflow directly through Azure Data Lake Storage interfaces. Providing your own storage account for analytical dataflows enables other Azure or line-of-business applications to leverage the data by connecting to the lake directly.

## Dataflows that use built-in storage

By default, analytical dataflows will use the built-in Data Lake Storage; for example, when you create a dataflow in Power BI or Power Apps. Access to the output of this type of dataflow is only possible through the Microsoft Power Platform dataflows connector in Power BI Desktop, or from other dataflows.

## Dataflows that use customer-provided storage

Before creating a dataflow that uses your organization's Data Lake Storage account, you must link the environment or workspace the dataflow was created in to your Data Lake Storage account. Depending on which product dataflow you're using (Power BI or Power Platform dataflows), the settings for connecting to an external Data Lake Storage subscription is linked in different places.

### Linking Power BI to your organization's Azure Data Lake Storage

To configure Power BI dataflows to store data in your organization's Data Lake Storage, you need to follow the steps described in [Connect Azure Data Lake Storage Gen2 for dataflow storage](/power-bi/transform-model/service-dataflows-connect-azure-data-lake-storage-gen2) in the Power BI admin portal.

![Connect your own Data Lake Storage for Power BI dataflows.](/power-bi/transform-model/media/service-dataflows-connect-azure-data-lake-storage-gen2/dataflows-connect-08b.png)

### Linking a Power Platform environment to your organization's Azure Data Lake Storage

To configure dataflows created in Power Apps to store data in your organization's Azure Data Lake Storage, follow the steps in [Connect Azure Data Lake Storage Gen2 for dataflow storage](/powerapps/maker/common-data-service/connect-azure-data-lake-storage-for-dataflow) in Power Apps.

:::image type="content" source="/powerapps/maker/common-data-service/media/select-storage-account.png" alt-text="Storage account setting for Power Platform analytical dataflow.":::

### Known limitations

* After a dataflow is created, its storage location can't be changed.

* Linked and computed table features are only available when both dataflows are in the same storage account.

## The enhanced compute engine

In Power BI, in addition to the standard dataflow engine, an enhanced compute engine is available for the dataflows created in Power BI Premium workspaces. You can configure this setting in the Power BI admin portal, under the Premium capacity settings. The enhanced compute engine is available in Premium P1 or A3 capacities and above. The enhanced compute engine reduces the refresh time required for long-running extract, transform, load (ETL) steps over computed tables, such as joins, distinct, filters, and group by. It also provides the ability to perform DirectQuery over tables from the Power BI semantic model. More information: [The enhanced compute engine](/power-bi/transform-model/service-dataflows-enhanced-compute-engine)

![The enhanced compute engine.](/power-bi/transform-model/media/service-dataflows-enhanced-compute-engine/enhanced-compute-engine-01.png)

## Next steps

The articles below provide further information that can be helpful.

* [Connect Azure Data Lake Storage Gen2 for dataflow storage (Power BI dataflows)](/power-bi/service-dataflows-connect-azure-data-lake-storage-gen2)
* [Connect Azure Data Lake Storage Gen2 for dataflow storage (Power Platform dataflows)](/powerapps/maker/common-data-service/connect-azure-data-lake-storage-for-dataflow)
* [Creating computed tables in dataflows](computed-tables.md)
* [The enhanced compute engine](/power-bi/transform-model/service-dataflows-enhanced-compute-engine)
* [Understanding the differences between standard and analytical dataflows](understanding-differences-between-analytical-standard-dataflows.md)
