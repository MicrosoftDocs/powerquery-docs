---
title: Computed entity scenarios and use cases
description: Computed entity scenarios and use cases
author: radacad
ms.service: powerquery
ms.reviewer: v-douklo
ms.topic: conceptual
ms.date: 05/25/2020
ms.author: v-douklo
---

# Computed entity scenarios and use cases

There are benefits to using computed entities in a dataflow. This article describes use cases for computed entities and describes how they work behind the scenes.
<!--At some point it would be good to refer to the computed-entities.md article for further information.-->
## What is a computed entity?

An entity represents the data output of a query created in a dataflow, after the dataflow has been refreshed. It represents data from a source and, optionally, the transformations that were applied to it. Sometimes, you might want to create new entities that are a function of a previously ingested entity.

Although it's possible to repeat the queries that created an entity and apply new transformations to them, this approach has drawbacks: data is ingested twice, and the load on the data source is doubled.

Computed entities solve both problems. Computed entities are similar to other entities in that they get data from a source and you can apply further transformations to create them. But their data originates from the storage dataflow used, and not the original data source. That is, they were previously created by a dataflow and then reused.<!--Edits okay? I wasn't sure what this was saying.-->

Computed entities can be created by referencing an entity in the same dataflow or by referencing an entity created in a different dataflow.

![Computed entity](https://docs.microsoft.com/power-bi/transform-model/media/service-dataflows-computed-entities-premium/computed-entities-premium_00.png)

## Why use a computed entity?

Performing all transformation steps in one entity can be slow. There can be many reasons for this slowdown&mdash;the data source might be slow, or the transformations that you're doing might need to be replicated in two or more queries. It might be advantageous to first ingest the data from the source and then reuse it in one or more entities. In such cases, you might choose to create two entities: one that gets data from the data source, and another&mdash;a computed entity&mdash;that applies additional transformations to data already written into the data lake used by a dataflow. This can increase performance and reusability of data, saving time and resources.

For example, if two entities share even a part of their transformation logic, without a computed entity the transformation will have to be done twice.
<!--Please write more descriptive alt text. -->
![Without computed entity](media/SeparateEntities.png)

However, if a computed entity is used, then the common (shared) part of the transformation will be processed once and stored in Azure Data Lake Storage. The remaining transformations will then be processed from the output of the common transformation. Overall, this processing is much faster.
<!--Also here. This is a nice diagram, it would be good to actually describe it.-->
![Computed entity for common transformations](media/Computedentityinbetween.png)


A computed entity provides one place as the source code for the transformation and speeds up the transformation because it need only be done once instead of multiple times.<!--Suggested, to be less redundant. --> The load on the data source is also reduced.

## Example scenario for using a computed entity

If you're building an aggregated table in Power BI to speed up the data model, you can build the aggregated table by referencing the original table and applying additional transformations to it. By using this approach, you don't replicate your transformation from the source (the part that is for the original table)<!--I don't know what "part" means here.-->.

For example, the following figure shows an Orders entity.

![Orders entity](media/ordersentity.png)

Using a reference from this entity, you can build a computed entity.
<!--This image is carrying the meaning, so it needs to be more fully described. -->
![Creating a computed entity](media/ordersentityreferenced.png)

The computed entity can have further transformations. For example, you can use **Group By** to aggregate the data at the customer level.

![Orders aggregated entity](media/ordersaggregatedentity.png)

This means that the Orders Aggregated entity will be getting data from the Order entity, and not from the data source again. Because some of the transformations that need to be done have already been done in the Orders entity, performance is better and data transformation is faster.

## Computed entity in other dataflows

You can also create a computed entity in other dataflows. It can be created by getting data from a dataflow with the Power Platform dataflow connector.
<!--I find this image very hard to read online, would it be possible to change the callout color, or at least make the text thicker? Also, the callout needs to be duplicated in alt text.-->
![Get data from Power Platform dataflows](media/getdatafromppdataflows.png)

The concept of the computed entity is to have a table persisted in storage, and other tables sourced from it, so that you can reduce the read time from the data source and share some of the common transformations. This can be achieved by getting data from other dataflows through the dataflow connector or referencing another query in the same dataflow.

## Computed entity: With transformations, or without?

Now that you know computed entities are great for improving performance of the data transformation, a good question to ask is whether transformations should always be deferred to the computed entity or whether they should be applied to the source entity. That is, should data always be ingested into one entity and then transformed in a computed entity? What are the pros and cons?

### Load data without transformation for Text/CSV files

When a data source doesn't support query folding (such as Text/CSV files), there's little benefit in applying transformations when getting data from the source, especially if data volumes are large. The source entity should just load data from the Text/CSV file without applying any transformations. Then, computed entities can get data from the source entity and perform the transformation on top of the ingested data.

You might ask, what's the value of creating a source entity that only ingests data? Such an entity can still be useful, because if the data from the source is used in more than one entity, it reduces the load on the data source. In addition, data can now be reused by other people and dataflows. Computed entities are especially useful in scenarios where the data volume is large, or when a data source is accessed through an on-premises data gateway, because they reduce the traffic from the gateway and the load on data sources behind them.<!--Edit assumes "they" is "computed entities."-->

### Doing some of the common transformations for a SQL table

If your data source supports query folding, it's good to perform some of the transformations in the source entity because the query will be folded to the data source, and only the transformed data will be fetched from it. This improves overall performance. The set of transformations that will be common in downstream computed entities should be applied in the source entity, so they can be folded to the source. Other transformations that only apply to downstream entities should be done in computed entities.
