---
title: Consume data from dataflows
description: Consume data from dataflows.
author: luitwieler
ms.topic: conceptual
ms.date: 1/5/2023
ms.author: jeluitwi
---

# Consume data from dataflows

The ways you can consume data from Microsoft dataflows depends on several factors, like storage and type of dataflow. In this article, you'll learn how to choose the right dataflow for your needs.

## Type of dataflow

There are multiple types of dataflows available for you to create. You can choose between a Power BI dataflow, standard dataflow, or an analytical dataflow. To learn more about the differences and how to select the right type based on your needs, go to [Understanding the differences between dataflow types](understanding-differences-between-analytical-standard-dataflows.md).

## Storage type

A dataflow can write to multiple output destination types. In short, you should be using the [Dataflows connector](../connectors/dataflows.md) unless your destination is a Dataverse table. Then you use the [Dataverse/CDS connector](../connectors/dataverse.md).

### Azure Data Lake Storage

Azure Data Lake storage is available in Power BI dataflows and Power Apps analytical dataflows. By default you're using a Microsoft Managed Data Lake. However, you can also connect a self-hosted data lake to the dataflow environment. The following articles describe how to connect the data lake to your environment:

- [Connect Data Lake Gen 2 storage to a Power BI Workspace](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration)
- [Connect Data Lake Gen 2 storage to a Power Apps Environment](./connect-azure-data-lake-storage-for-dataflow.md)

When you've connected your data lake, you should still use the Dataflows connector. If this connector doesn't meet your needs, you could consider using the [Azure Data Lake connector](../connectors/data-lake-storage.md) instead.

### Dataverse

A standard dataflow writes the output data to a Dataverse table. [Dataverse](/powerapps/maker/data-platform/data-platform-intro) lets you securely store and manage data that's used by business applications. After you load data in the Dataverse table, you can consume the data using the [Dataverse connector](../connectors/dataverse.md).

## Dataflows can get data from other dataflows

If you'd like to reuse data created by one dataflow in another dataflow, you can do so by using the Dataflow connector in the Power Query editor when you create the new dataflow.

[![Get data from a dataflow.](media/linked-entities/linked-entities-03.png)](media/linked-entities/linked-entities-03.png#lightbox)

When getting data from the output of another dataflow, a [linked entity](/data-integration/dataflows/dataflows-linked-entities) will be created. Linked entities provide a way to make data created in an upstream dataflow available in a downstream dataflow, without copying the data to the downstream dataflow. Because linked entities are just pointers to entities created in other dataflows, they're kept up to date by the refresh logic of the upstream dataflow. If both dataflows reside in the same workspace or environment, those dataflows will be refreshed together, to keep data in both dataflows always up to date. More information: [Link entities between dataflows](/data-integration/dataflows/dataflows-linked-entities)

## Separating data transformation from data consumption

When you use the output of a dataflow in other dataflows or datasets, you can create an abstraction between the data transformation layer and the rest of the data model. This abstraction is important because it creates a multi-role architecture, in which the Power Query customer can focus on building the data transformations, and data modelers can focus on data modeling.

## Frequently asked questions

_**My dataflow table doesn't show up in the dataflow connector in Power BI**_

You're probably using a Dataverse table as the destination for your standard dataflow. Use the [Dataverse/CDS connector](../connectors/dataverse.md) instead or consider switching to an analytical dataflow.

_**There's a difference in the data when I remove duplicates in dataflows&mdash;how can I resolve this?**_

There could be a difference in data between design-time and refresh-time. We don't guarantee which instance is being kept during refresh time. For information that will help you avoid inconsistencies in your data, go to [Working with duplicate values](../working-with-duplicates.md).

## Next Steps

The following articles provide more details about related articles.

- [Creating and using dataflows in Power BI](/power-bi/service-dataflows-create-use)
- [Link entities between dataflows in Power BI](/power-bi/service-dataflows-linked-entities)
- [Connect to data created by Power BI dataflows in Power BI Desktop (Beta)](/power-bi/desktop-connect-dataflows)
- [Create and use dataflows in Power Platform](/data-integration/dataflows/dataflows-integration-overview)
- [Link entities between dataflows (Power Platform)](/data-integration/dataflows/dataflows-linked-entities)
- [Working with duplicate values in dataflows](../working-with-duplicates.md)
