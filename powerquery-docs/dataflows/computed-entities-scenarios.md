# Computed Entities Scenarios and Use-cases

There are benefits to using computed entities in the dataflow. This article explains computed entity use cases and how they work behind the scenes.

## What is a computed entity?

An entity represents the data output of a query created in a dataflow, after the dataflow has been refreshed. It represents data from a source and, optionally, the transformations that were applied to it. Sometimes, you might want to create new entities that are a function of a previously ingested entity.

While it's possible to repeat the queries that created an entity and apply new transformations to them, this approach has drawbacks. For example, data is ingested twice and the load on the data source is doubled.

Computed entities solve both problems. Computed entities are similar to other entities in that they get data from a source and allow a customer to apply further transformations to create them. But their data originates from the storage dataflow use and not the original data source, that is, they were previosuly created by a dataflow and re-used.

Computed entities can be created by referencing an entity in the same dataflow, or by referencing an entity created in a different dataflow.

![Computed Entity](https://docs.microsoft.com/power-bi/transform-model/media/service-dataflows-computed-entities-premium/computed-entities-premium_00.png)

## Why is it good to use Computed Entity?

Preforming all the transformation steps in one entity can be slow at times. There can be many reasons for that, the data source might be slow, and some of the transformations that you are doing might be need to be replicated in two or more queries. In addition, it might be advantegeous to first ingest the data from the source, and then re-use it in one or more entities. In such cases, choosing to create two entities, one that gets data from the data source, and another, a computed entity, that applies additional transformations to data already written into the data lake used by a dataflow can increase performance and re-usibility of data, saving time and resources.

For example, if there are two entities which are even sharing part of their transformation logic, without a computed entity, they will be re-doing the transformations again;

![without computed entity](media/SeparateEntities.png)

However, if a computed entity is used, then the common (shared) part of the transformation will be processed once, stored in ADLS gen2, and the remaining transformation will processes from the output of it, which is much faster.

![Computed entity for the shared transformations](media/Computedentityinbetween.png)

Computed entity is not only helping with having one place as the source code for the transformation, but also it will speed up the transformation because it will be done only once instead of multiple times. The load on the data source will be also reduced.

## Example scenario of using computed entity

If you are building an aggregated table in Power BI to speed up the data model, your aggregated table can be built by referencing the original table and applying additional transformations to it. Using this approach, you don't replicate your transformation from the source (the part that is for the original table)

For example, this is Orders entity; 

![Orders Entity](media/ordersentity.png)

And using a reference from it, we build a computed entity;

![creating computed entity](media/ordersentityreferenced.png)

The computed entity, can have further transformation; (for example Group By to aggregated the data at the customer level)

![Orders aggregated entity](media/ordersaggregatedentity.png)

This means that the Orders Aggregated entity will be getting data from the Order entity (not from the data source again), and parts of the transformations that has been done in the Orders entity is already done, which makes the performance better and data transformation faster.

## Computed Entity in other dataflows

You can also create computed entity in other dataflows. It can be created by getting data from a dataflow using the Power Platform dataflow connector.

![get data from Power Platform dataflows](media/getdatafromppdataflows.png)

The concept of the computed entity is to have a table persisted in the storage, and other tables sourced from it, so that you can reduce the read from the data source, and share some of the common transformations. This can be achieved by getting data from other dataflows through the dataflow connector, or referencing another query in the same dataflow.

## Computed Entity with the Transformations or Without?

Now that you know computed entities are great for improving performance of the data transformation, a good question to ask is whether transformations should always be deferd to the computed entity or whether they should be applied to the source entity. i.e. should data always be ingested into one entity and then transformed in a computed entity? what are pros and cons?

### Load data without transformation for Text/CSV files

When a data source does not supports query folding (such as Text/CSV files), there is little benefit applying transformation at the time of getting data the data from the source, especially if data volumes are large. The source entity should then just load data from the Text/CSV file without applying any transformations.

Then, computed entities can get data from the source entity and perform the transformation on top of the ingested data.

You might ask what is the value of creating a source entity that only ingests data. Such an entity can be still be useful, because if the data from the source is used in more than one entity, it will reduce the load on the data source. In addition, data can now be re-used by other people and dataflows. Computed entites are especially useful in scenarios that the data volume is large, or when a data source is on-premise data gateway because it reduces the traffic from the gateway and load on datasources behind it. 

### Doing some of the common transformations for a SQL table

If your data source supports query folding, then it is good to perform some of the transformations in the source entity because the query will be folded to the data source, and only the transformed data will be fetched from it, which improves overall performance. The set of transformations that will be common in downstream computed entities should be applies in the source entity, so they can be folded to the source, and other transformations that only apply to downstream entities should be done in computed entities.

