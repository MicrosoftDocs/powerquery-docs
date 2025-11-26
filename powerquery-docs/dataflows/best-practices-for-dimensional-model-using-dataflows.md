---
title: Best practices for creating a dimensional model using dataflows
description: Best practices for creating a dimensional model using dataflows
author: Luitwieler
ms.topic: concept-article
ms.date: 11/26/2025
ms.author: jeluitwi
ms.subservice: dataflows
---

# Best practices for creating a dimensional model using dataflows

Designing a dimensional model is one of the most common tasks you can do with a dataflow. This article highlights some of the best practices for creating a dimensional model using a dataflow.

## Staging dataflows

One of the key points in any data integration system is to reduce the number of reads from the source operational system. In the traditional data integration architecture, this reduction is done by creating a new database called a *staging database*. The purpose of the staging database is to load data as-is from the data source into the staging database on a regular schedule.

The rest of the data integration then uses the staging database as the source for further transformation and converts it to the dimensional model structure.

We recommend that you follow the same approach using dataflows. Create a set of dataflows that are responsible for just loading data as-is from the source system (and only for the tables you need). The result is then stored in the storage structure of the dataflow (either Azure Data Lake Storage or Dataverse). This change ensures that the read operation from the source system is minimal.

Next, you can create other dataflows that source their data from staging dataflows. The benefits of this approach include:

- Reducing the number of read operations from the source system, and reducing the load on the source system as a result.
- Reducing the load on data gateways if an on-premises data source is used.
- Having an intermediate copy of the data for reconciliation purposes, in case the source system data changes.
- Making the transformation dataflows source-independent.

:::image type="complex" source="media/best-practices-for-dimensional-model/staging-dataflows.png" alt-text="Diagram showing the flow when you stage dataflows.":::
   Diagram emphasizing staging dataflows and staging storage. The diagram shows the data being accessed from the data source by the staging dataflow, and tables being stored in either Cadavers or Azure Data Lake Storage. The tables are then shown being transformed along with other dataflows, which are then sent out as queries.
:::image-end:::

## Transformation dataflows

When you separate your transformation dataflows from the staging dataflows, the transformation is independent of the source. This separation helps if you're migrating the source system to a new system. All you need to do in that case is to change the staging dataflows. The transformation dataflows are likely to work without any problem because they're sourced only from the staging dataflows.

This separation also helps in case the source system connection is slow. The transformation dataflow doesn't need to wait for a long time to get records coming through a slow connection from the source system. The staging dataflow already did that part, and the data is ready for the transformation layer.

:::image type="content" source="media/best-practices-for-dimensional-model/transformation-dataflows.png" alt-text="Diagram similar to the previous image, except transformations are emphasized, and the data is being sent to the data warehouse.":::

## Layered Architecture

A layered architecture is an architecture in which you perform actions in separate layers. The staging and transformation dataflows can be two layers of a multi-layered dataflow architecture. Trying to do actions in layers ensures the minimum maintenance required. When you want to change something, you just need to change it in the layer where it's located. The other layers should all continue to work fine.

The following image shows a multi-layered architecture for dataflows in which their tables are then used in Power BI semantic models.

:::image type="content" source="media/best-practices-for-dimensional-model/multi-layered-dataflow.png" alt-text="Diagram showing a multi-layered architecture, where staging dataflows and transformation dataflows are in separate layers.":::

## Use a computed table as much as possible

When you use the result of a dataflow in another dataflow, you're using the concept of the computed table, which means getting data from an "already-processed-and-stored" table. The same thing can happen inside a dataflow. When you reference a table from another table, you can use the computed table. This method is helpful when you have a set of transformations that need to be done in multiple tables, which are called *common transformations*.

:::image type="content" source="media/best-practices-for-dimensional-model/computed-entity-in-between.png" alt-text="Diagram showing the computed table sourced from a data source used to process common transformations.":::

In the previous image, the computed table gets the data directly from the source. However, in the architecture of staging and transformation dataflows, it's likely that the computed tables are sourced from the staging dataflows.

:::image type="content" source="media/best-practices-for-dimensional-model/computed-entity-from-dataflows.png" alt-text="Diagram showing a computed table sourced from dataflows used to process common transformations.":::

## Build a star schema

The best dimensional model is a star schema model that has dimensions and fact tables designed in a way to minimize the amount of time to query the data from the model. A star schema model also makes it easy to understand for the data visualizer.

It isn't ideal to bring data in the same layout of the operational system into a BI system. The data tables should be remodeled. Some of the tables should take the form of a dimension table, which keeps the descriptive information. Some of the tables should take the form of a fact table, to keep the aggregatable data. The best layout for fact tables and dimension tables to form is a star schema. For more information, go to [Understand star schema and the importance for Power BI](/power-bi/guidance/star-schema).

:::image type="content" source="/power-bi/guidance/media/star-schema/star-schema-example1.png" alt-text="Diagram of a star schema showing a fact table surrounded by dimension tables, in the shape of a five-pointed star.":::

### Use a unique key value for dimensions

When building dimension tables, make sure you have a key for each one. This key ensures that there are no many-to-many (or in other words, "weak") relationships among dimensions. You can create the key by applying some transformation to make sure a column or a combination of columns is returning unique rows in the dimension. Then that combination of columns can be marked as a key in the table in the dataflow.

:::image type="content" source="media/best-practices-for-dimensional-model/mark-as-key.png" alt-text="Screenshot of the Power Query transform tab with the Mark as key option and the key icon in the table's date column emphasized.":::

### Do an incremental refresh for large fact tables

Fact tables are always the largest tables in the dimensional model. We recommend that you reduce the number of rows transferred for these tables. If you have a very large fact table, ensure that you use incremental refresh for that table. An incremental refresh can be done in the Power BI semantic model, and also the dataflow tables.

You can use incremental refresh to refresh only part of the data, the part that changed. There are multiple options to choose which part of the data to be refreshed and which part to be persisted. For more information, go to [Using incremental refresh with Power BI dataflows](/power-bi/transform-model/service-dataflows-incremental-refresh).

:::image type="content" source="media/best-practices-for-dimensional-model/dataflows-incremental-refresh-03.png" alt-text="Screenshot of the incremental refresh setting dialog for dataflows.":::

## Referencing to create dimensions and fact tables

In the source system, you often have a table that you use for generating both fact and dimension tables in the data warehouse. These tables are good candidates for computed tables and also intermediate dataflows. The common part of the process&mdash;such as data cleaning, and removing extra rows and columns&mdash;can be done once. By using a reference from the output of those actions, you can produce the dimension and fact tables. This approach uses the computed table for the common transformations.

:::image type="content" source="media/best-practices-for-dimensional-model/orders-entity-referenced.png" alt-text="Screenshot showing an Orders query with the reference option being used to create a new query called Orders aggregated.":::
