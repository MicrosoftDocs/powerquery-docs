---
title: Computed entities scenarios and use-cases
description: Computed entities scenarios and use-cases
author: radacad
ms.service: powerquery
ms.reviewer: v-douklo
ms.topic: conceptual
ms.date: 05/25/2020
ms.author: v-douklo
---

# Computed entities scenarios and use-cases

There are benefits to using computed entities in the dataflow. This article explains computed entity use cases and how they work behind the scenes.

## What is a computed entity?

An entity represents the data output of a query created in a dataflow, after the dataflow has been refreshed. It represents data from a source and, optionally, the transformations that were applied to it. Sometimes, you might want to create new entities that are a function of a previously ingested entity.

While it's possible to repeat the queries that created an entity and apply new transformations to them, this approach has drawbacks. For example, data is ingested twice and the load on the data source is doubled.

Computed entities solve both problems. Computed entities are similar to other entities in that they get data from a source and allow a customer to apply further transformations to create them. But their data originates from the storage dataflow use and not the original data source. That is, they were previously created by a dataflow and reused.

Computed entities can be created by referencing an entity in the same dataflow, or by referencing an entity created in a different dataflow.

![Computed Entity](https://docs.microsoft.com/power-bi/transform-model/media/service-dataflows-computed-entities-premium/computed-entities-premium_00.png)

## Why is it good to use a computed entity?

Performing all the transformation steps in one entity can be slow at times. There can be many reasons for this slowdown&mdash;the data source might be slow, and some of the transformations that you're doing might be need to be replicated in two or more queries. In addition, it might be advantageous to first ingest the data from the source, and then reuse it in one or more entities. In such cases, choosing to create two entities&mdash;one that gets data from the data source, and another, a computed entity, that applies additional transformations to data already written into the data lake used by a dataflow&mdash;can increase performance and reusability of data, saving time and resources.

For example, if two entities are sharing even a part of their transformation logic, without a computed entity the transformation will have to be done twice.

![without computed entity](media/SeparateEntities.png)

However, if a computed entity is used, then the common (shared) part of the transformation will be processed once and stored in Azure Data Lake Storage Gen2. The remaining transformations will then be processed from the output of the common transformation. Overall, this processing is much faster.

![Computed entity for the shared transformations](media/Computedentityinbetween.png)

A computed entity not only helps by having one place as the source code for the transformation. In addition, a computed entity will also speed up the transformation because the transformation will be done only once instead of multiple times. The load on the data source will also be reduced.

## Example scenario using a computed entity

If you're building an aggregated table in Power BI to speed up the data model, your aggregated table can be built by referencing the original table and applying additional transformations to it. Using this approach, you don't replicate your transformation from the source (the part that is for the original table)

For example, the following figure shows an **Orders** entity.

![Orders Entity](media/ordersentity.png)

Using a reference from this entity, you can build a computed entity.

![creating computed entity](media/ordersentityreferenced.png)

The computed entity can have further transformations. For example, you can use **Group By** to aggregate the data at the customer level.

![Orders aggregated entity](media/ordersaggregatedentity.png)

This means that the **Orders Aggregated** entity will be getting data from the **Order** entity (not from the data source again). Since some of the transformations that need to be done have already been done in the **Orders** entity, performance is better and data transformation is faster.

## Computed entity in other dataflows

You can also create computed entity in other dataflows. It can be created by getting data from a dataflow using the Power Platform dataflow connector.

![get data from Power Platform dataflows](media/getdatafromppdataflows.png)

The concept of the computed entity is to have a table persisted in storage, and other tables sourced from it, so that you can reduce the read time from the data source and share some of the common transformations. This can be achieved by getting data from other dataflows through the dataflow connector, or referencing another query in the same dataflow.

## Computed entity with transformations or without?


Now that you know computed entities are great for improving performance of the data transformation, a good question to ask is whether transformations should always be deferred to the computed entity or whether they should be applied to the source entity. That is, should data always be ingested into one entity and then transformed in a computed entity? What are pros and cons?

### Load data without transformation for Text/CSV files


When a data source doesn't support query folding (such as Text/CSV files), there's little benefit applying transformations when getting data from the source, especially if data volumes are large. The source entity should just load data from the Text/CSV file without applying any transformations.

Then, computed entities can get data from the source entity and perform the transformation on top of the ingested data.

You might ask what is the value of creating a source entity that only ingests data. Such an entity can still be useful, because if the data from the source is used in more than one entity, it will reduce the load on the data source. In addition, data can now be reused by other people and dataflows. Computed entities are especially useful in scenarios where the data volume is large, or when a data source is through an on-premise data gateway because it reduces the traffic from the gateway and the load on data sources behind it. 

### Doing some of the common transformations for a SQL table

If your data source supports query folding, then it's good to perform some of the transformations in the source entity because the query will be folded to the data source, and only the transformed data will be fetched from it, which improves overall performance. The set of transformations that will be common in downstream computed entities should be applied in the source entity, so they can be folded to the source. Other transformations that only apply to downstream entities should be done in computed entities.
