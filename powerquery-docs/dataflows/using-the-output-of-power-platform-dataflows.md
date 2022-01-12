---
title: Consume data from Dataflows
description: Consume data from Dataflows.
author: luitwieler

ms.service: powerquery
ms.topic: conceptual
ms.date: 01/12/2022
ms.author: jeluitwi

LocalizationGroup: Data from files
---

# Consume data from Dataflows

The ways you can consume data from Microsoft Dataflows is depending on several factors like storage and type of dataflow. In this article, you'll learn how to choose the right dataflow for your needs.

## Type of Dataflow

There are multiple types of dataflows available for you to create. You can choose between a Power BI Dataflow, Standard Dataflow or an Analytical Dataflow. Read [this article](./understanding-differences-between-analytical-standard-dataflows.md) to Learn more about the differences and how to select the right type based on your needs.

## Storage type

A Dataflow is able to write to multiple output destination types. In short you should be using the [Dataflows connector](../Connectors/Dataflows.md), unless your destination is a Dataverse table. Then you use the [Dataverse/CDS connector](../Connectors/Dataverse.md).

### Azure Data Lake Storage

Azure Data Lake storage is available in Power BI Dataflows and Power Apps Analytical Dataflows. By default you are using a Microsoft Manged Data Lake however, you have the option to connect a self-hosted data lake to the dataflow environment. The following guides will help you to connect the data lake to your environment: 

- [Connect Data Lake Gen 2 storage to a Power BI Workspace](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration)
- [Connect Data Lake Gen 2 storage to a Power Apps Environment](./connect-azure-data-lake-storage-for-dataflow.md)

Once you have connected your data lake you should still use the dataflow connector. If this connector does not meet your needs, you could consider using the [Azure Data Lake connector](../Connectors/DataLakeStorage.md) instead.

### Dataverse

A standard dataflow will write the output data to a dataverse table. [Dataverse](/powerapps/maker/data-platform/data-platform-intro) lets you securely store and manage data that's used by business applications. After you loaded data into the Dataverse table you can consume the data using the [dataverse connector](../Connectors/Dataverse.md).

## Dataflows can get data from other dataflows

If you'd like to reuse data created by one dataflow in another dataflow, you can do so by using the dataflow connector in the Power Query editor experience when you create the new dataflow.

![Get data from a dataflow.](/data-integration/dataflows/media/dataflows-linked-entities/linked-entities-03.png)

When getting data from the output of another dataflow, a [linked entity](/data-integration/dataflows/dataflows-linked-entities) will be created. Linked entities provide a way to make data created in an upstream dataflow available in a downstream dataflow, without copying the data to the downstream dataflow. Because linked entities are just pointers to entities created in other dataflows, they're kept up to date by the refresh logic of the upstream dataflow. If both dataflows reside in the same workspace or environment, those dataflows will be refreshed together, to keep data in both dataflows always up to date. More information: [Link entities between dataflows](/data-integration/dataflows/dataflows-linked-entities)

## Separating data transformation from data consumption

When you use the output of a dataflow in other dataflows or datasets, you can create an abstraction between the data transformation layer and the rest of the data model. This abstraction is important because it creates a multi-role architecture, in which the Power Query customer can focus on building the data transformations, and data modelers can focus on data modeling.

## Frequently asked questions

_**My dataflow table does not show up in the dataflow connector in Power BI**_

You are probably using a Dataverse table as destination for your standard dataflow. Use the [Dataverse/CDS connector](../Connectors/Dataverse.md) instead or consider switching to an analytical dataflow.

_**There is a difference in the data when I remove duplicates in dataflows, how can I resolve this?**_

There could be a difference in data between design-time and refresh-time. We do not guarantee which instance is being kept during refresh time. [This article](/powerquery-docs/working-with-duplicates) will help you to avoid inconsistencies in your data.

## Next Steps

The following articles provide more details about related articles.

- [Creating and using dataflows in Power BI](/power-bi/service-dataflows-create-use)
- [Link entities between dataflows in Power BI](/power-bi/service-dataflows-linked-entities)
- [Connect to data created by Power BI dataflows in Power BI Desktop (Beta)](/power-bi/desktop-connect-dataflows)
- [Create and use dataflows in Power Platform](/data-integration/dataflows/dataflows-integration-overview)
- [Link entities between dataflows (Power Platform)](/data-integration/dataflows/dataflows-linked-entities)
- [Working with duplicate values in dataflows](/powerquery-docs/working-with-duplicates)
