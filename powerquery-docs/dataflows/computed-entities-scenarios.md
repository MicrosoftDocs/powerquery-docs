# Computed Entities Scenarios and Use-cases

There is a great benefit in using the computed entity in the dataflow. This article explains uses cases and how it works behind the scene for the transformation.

## What is Computed Entity?

A computed entity is an entity that is already processed through Power Query in the dataflow, and the result of that stored in storage. In analytical dataflows, that mean the data stored in Azure Data Lake Storage Gen 2. In other words, Computed entities are intermediate entities to pass the data to other entities. And the data of that intermediate entity is stored in a storage too.

![Computed Entity](https://docs.microsoft.com/en-us/power-bi/transform-model/media/service-dataflows-computed-entities-premium/computed-entities-premium_00.png)

## Why is it good to use Computed Entity?

Doing all the transformation steps at one shot against the data source can be slow sometimes. There can be many reasons for that, the data source might be slow, and some of the transformations that we are doing might be needed to be replicated in two or more queries. Having part of the transformations done, and stored as computed entity helps in the performance of the dataflow.

For example, if there are two entities which are even sharing part of their transformation logic, without a computed entity, they will be re-doing the transformations again;

![without computed entity](media/SeparateEntities.png)

However, if a computed entity is used, then the common (shared) part of the transformation will be processed once, stored in ADLS gen2, and the remaining transformation will processes from the output of it, which is much faster.

![Computed entity for the shared transformations](media/Computedentityinbetween.png)

Computed entity is not only helping with having one place as the source code for the transformation, but also it will speed up the transformation because it will be done only once instead of multiple times. The load on the data source will be also reduced.

## Example scenario of using computed entity

If you are building an aggregated table in Power BI to speed up the data model, your aggregated table can be build with a reference of the original table and doing extra transformations on it. Using this approach, you don't replicate your transformation from the source (the part that is for the original table)

For example, this is Orders entity; 

![Orders Entity](media/ordersentity.png)

And using a reference from it, we build a computed entity;

![creating computed entity](media/ordersentityreferenced.png)

The computed entity, can have further transformation; (for example Group By to aggregated the data at the customer level)

![Orders aggregated entity](media/ordersaggregatedentity.png)

This means that the Orders Aggregated entity will be getting data from the Order entity (not from the data source again), and parts of the transformations that has been done in the Orders entity is already done, which makes the performance better and data transformation faster.

## Computed Entity in other dataflows

You can also create computed entity in Power Platform dataflows or Customer Insights dataflows. It is not called as computed entity in Power Platform dataflows, but it can be created by creating one dataflow, and then the second dataflow by get data from Power Platform dataflows.

![get data from Power Platform dataflows](media/getdatafromppdataflows.png)

The whole concept of the computed entity is to have a table persisted in the storage, and other tables sourced from it, so that you can reduce the read from the data source, and share some of the common transformations. This can be achieved with getting data from other dataflows in PowerApps portal, or referencing another query in the Power BI dataflows.

## Computed Entity with the Transformations or Without?

Now that you know the computed entity is good for the performance of the data transformation, a good question is that should you be doing any data transformations in the computed entity? or should it be merely a data ingestion from the data source? what are pros and cons?

### Load data without transform for Text/CSV files

If the data source does not supports query folding (such as Text/CSV files), then there is little benefit in doing transformation at the time of getting data (inside the computed entity). The computed entity can be only getting data from the Text/CSV file without any transformations.

and other entities that are getting data from the computed entity can do the transformation on top of it.

A computed entity that load raw data from the source even without any transformation can be still helpful, because it reduces the load on the data source. Especially on the scenarios that the data source is on a heavy load, this can be very beneficial.

### Doing some of the common transformations for a SQL table

If your data source supports query folding, then it is good to do some of the transformations even in the computed entity, because the query will be folded to the data source, and only the transformed data will be fetched from it, which is better for performance. The set of transformations that you apply in the computed entity can be those which are common between other entities, and can be folded.

