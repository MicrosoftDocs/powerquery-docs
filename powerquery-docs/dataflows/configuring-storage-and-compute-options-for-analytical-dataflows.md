---
title: Configuring storage and compute options for analytical dataflows
description: Configuring storage and compute options for analytical dataflows
author: radacad

ms.service: powerquery
ms.topic: conceptual
ms.date: 05/25/2020
ms.author: v-rerad

LocalizationGroup: Data from files
---

# Configuring storage and compute options for analytical dataflows

For [standard dataflows](understanding-differences-between-analytical-standard-dataflows.md), you don't need to set up the storage, because standard dataflows store the data into Common Data Service in your environment. However, for an [analytical dataflow](understanding-differences-between-analytical-standard-dataflows.md), you need to set up storage options, especially if you aren't using the internal Azure data lake storage for the dataflow.

## Internal dataflows

Internal dataflows are those dataflows that use the internal Azure data lake storage. An example of an internal dataflow is when you create a dataflow in Power BI. By default (if you haven't connected the dataflow to an external Azure Data Lake Storage Gen2), this will use the internal Azure data lake Storage. This type of dataflow can be created only in the Power BI environment at the moment, and access to the output of this type of dataflow is only possible from Power BI Desktop or Power BI dataflows.

## External dataflows

A dataflow is external when it's connected to an external Azure Data Lake Storage Gen2 subscription. Depending on which type of the dataflow you're using (Power BI or Power Platform dataflows), the settings for connecting to an external Azure Data Lake Storage Gen2 subscription is in different places.

### Power BI dataflow connection to Azure Data Lake Storage Gen2

To connect Power BI dataflows to Azure Data Lake Storage Gen2, you need to follow the process described in [Connect Azure Data Lake Storage Gen2 for dataflow storage](https://docs.microsoft.com/power-bi/transform-model/service-dataflows-connect-azure-data-lake-storage-gen2) in the Power BI Admin Portal.

![Connect your own Azure Data Lake Storage for Power BI dataflows](https://docs.microsoft.com/power-bi/transform-model/media/service-dataflows-connect-azure-data-lake-storage-gen2/dataflows-connect-08b.png)

### Power Platform dataflow: Analytical dataflow Settings

If you're creating an analytical dataflow in Power Platform, then follow the steps in [Connect Azure Data Lake Storage Gen2 for dataflow storage](https://docs.microsoft.com/powerapps/maker/common-data-service/connect-azure-data-lake-storage-for-dataflow) in PowerApps to configure the dataflow to use your own Azure Data Lake Storage Gen2 subscription.

![Storage account setting for Power Platform analytical dataflow](https://docs.microsoft.com/powerapps/maker/common-data-service/media/select-storage-account.png)

### Limitation on Change

When you create the connection between Azure Data Lake Storage Gen2 and the dataflow, the connection can't be changed. Linked and computed entities only work properly when they're residing in the same storage account.

## The enhanced compute engine

In Power BI, you can get a better outcome using the enhanced compute engine for the dataflows. You can find this setting under the Premium capacity settings. The enhanced compute engine only works with Power BI capacities A3 or above. The enhanced compute engine will reduce the refresh time required for long-running ETL steps over computed entities, such as joins, distinct, filters, and group by. It also provides the ability to perform DirectQuery over entities from the Power BI dataset.

![The enhanced compute engine](https://docs.microsoft.com/power-bi/transform-model/media/service-dataflows-enhanced-compute-engine/enhanced-compute-engine-01.png)

To learn more about the enhanced compute engine, see [The enhanced compute engine](https://docs.microsoft.com/power-bi/transform-model/service-dataflows-enhanced-compute-engine).

## Next Steps

The articles below provide further information that can be helpful.

- [Connect Azure Data Lake Storage Gen2 for dataflow storage (Power BI dataflows)](https://docs.microsoft.com/power-bi/service-dataflows-connect-azure-data-lake-storage-gen2
  )
- [Connect Azure Data Lake Storage Gen2 for dataflow storage (Power Platform dataflows)](https://docs.microsoft.com/powerapps/maker/common-data-service/connect-azure-data-lake-storage-for-dataflow)
- [Creating computed entities in dataflows](computed-entities)
- [The enhanced compute engine](https://docs.microsoft.com/power-bi/transform-model/service-dataflows-enhanced-compute-engine)
- [Standard vs Analytical dataflows](understanding-differences-between-analytical-standard-dataflows.md)