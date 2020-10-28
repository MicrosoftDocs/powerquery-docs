---
title: Best practices around designing and developing complex dataflows
description: Best practices around designing and developing complex dataflows
author: radacad

ms.service: powerquery
ms.reviewer: v-douklo
ms.topic: conceptual
ms.date: 05/25/2020
ms.author: v-douklo
---

# Best practices around designing and developing complex dataflows

If the dataflow you're developing is getting bigger and more complex, here are some things you can do to improve on your original design.

## Break into multiple dataflows

Don't do everything in one dataflow. Not only does a single, complex dataflow make the data transformation process longer, it also makes it harder to understand and reuse the dataflow. Breaking your dataflow into multiple dataflows can be done by separating entities in different dataflows, or even one entity into multiple dataflows. You can use the concept of a computed entity or linked entity to build part of the transformation in one dataflow, and reuse it in other dataflows.

## Split data transformation (T) and staging/extraction (E) dataflows

Having dataflows only for extracting data (stating dataflows), and dataflows only for transforming data isn't only helpful for multi-layered architecture, it's also helpful for reducing the complexity of dataflows. Sometimes, some steps are just to extract data from the data source, such as get data, navigation, data type changes, and so on. By separating the staging dataflows and transformation dataflows, you make your dataflows simpler to develop.

![multi-layered dataflow architecture](media/MultiLayeredDF.png)

## Separate dataflows in multiple workspaces

Maintaining dataflows can be much easier when they are in their workspaces. Having all of your dataflows in one workspace could be too confusing. The lineage can show even dataflows from other workspaces, and access can be given only to the users of those workspaces. 

## Use custom functions

Custom functions are helpful in scenarios where a certain number of steps have to be done for a number of queries from different sources. Custom functions can be developed through the graphical interface in Power Query editor, or using an M script. Functions can be reused in a dataflow in as many entities as needed.

Having a custom function helps by having only a single version of the source code, so you don't have to duplicate the code. As a result, maintaining the Power Query transformation logic and the whole dataflow will be much easier.

[This blog](https://radacad.com/custom-functions-made-easy-in-power-bi-desktop#:~:text=It%20is%20easy%20to%20consume,the%20output%20column%20as%20Holidays.) explains how to use custom functions.

![custom functions](https://i1.wp.com/radacad.com/wp-content/uploads/2016/12/2016-12-06_17h51_22.png?w=555&ssl=1)

## Place queries into folders

Using folders for queries helps to group related queries together. When developing the dataflow, spend a little more time to arrange queries in folders that make sense. Using this approach, you can find queries more easily in the future and maintaining the code will be much easier.

## Use Computed Entities

Computed entities not only make your dataflow more understandable, they also provide better performance. When you use a computed entity, the other entities referenced from it are getting data from an "already-processed-and-stored" entity. The transformation will be much simpler and faster.

## Leverage the enhanced compute engine

For dataflows developed in Power BI portal, ensure you make use of the enhanced compute engine by ensuring you do joins and filter transformations first in a computed entity before performing other types of transformations.

## Break many steps into multiple queries

It's hard to keep track of a large number of steps in one entity. Instead, you should break a large number of steps into multiple entities. You can use the "Enable Load" option for other queries and disable them if they are intermediate queries, and only load the final entity through the dataflow. When you have multiple queries with smaller steps in each, it's easier to use the dependency diagram and track each query for further investigation, rather than digging into hundreds of steps in one query.

## Add properties for queries and steps

Documentation is the key to having easy-to-maintain code. In Power Query, you can add properties to the entities, and also steps. The text that you add in the properties will show up as a tooltip whenever you hover on that query or step. This documentation will be helpful in the future to maintain your model. With a glance at a table or step, you can understand what is happening there, rather than rethinking and remembering what you've done in that step.

## Ensure capacity is in the same region
Dataflows don't currently support multi-geo regions. The Premium capacity must be in the same region as your Power BI tenant.

## Separate on-premises sources from cloud sources
In addition to the previously described best practices, you can create a separate dataflow for each type of source, such as on-premises, cloud, SQL Server, Spark, Dynamics, and so on. It's recommended to split your dataflow by data source type. Such separation by source type facilitates quick troubleshooting, and avoids internal limits when refreshing your dataflows.

## Separate dataflows based on the scheduled refresh required for entities
If you have sales transaction table that gets updated in the source system every hour, and you have a product-mapping table that gets updated every week, then break these two into two dataflows with different scheduled refresh frequencies.

## Avoid scheduling refresh for linked entities inside the same workspace
If you're regularly being locked out of your dataflows that contain linked entities, it may be a result of a corresponding, dependent dataflow inside the same workspace that's locked during dataflow refresh. Such locking provides transactional accuracy and ensures both dataflows successfully refresh, but it can block you from editing.

If you set up a separate schedule for the linked dataflow, dataflows can refresh unnecessarily and block you from editing the dataflow. There are two recommendations to avoid this issue:

Avoid setting a refresh schedule for a linked dataflow in the same workspace as the source dataflow.
If you want to configure a refresh schedule separately, and want to avoid the locking behavior, separate the dataflow in a separate workspace.

