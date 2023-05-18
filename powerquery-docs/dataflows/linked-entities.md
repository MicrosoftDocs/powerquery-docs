---
title: Link entities between dataflows
description: Learn how to link entities in dataflows
author: bensack
ms.topic: conceptual
ms.date: 1/6/2023
ms.author: bensack
---
# Link entities between dataflows

With dataflows in Microsoft Power Platform, you can have a single organizational data storage source where business analysts can prep and manage their data once, and then reuse it between different analytics apps in the organization. 

When you link entities between dataflows, you can reuse entities that have already been ingested, cleansed, and transformed by dataflows that are owned by others, without the need to maintain that data. The linked entities simply point to the entities in other dataflows, and do *not* copy or duplicate the data.

Linked entities are read-only, so if you want to create transformations for a linked entity, you must create a new computed entity with a reference to the linked entity.

## Linked entity availability

Linked entity availability depends on whether you're using dataflows in Power BI or Power Apps. The following sections describe the details for each.

### Linked entities in Power BI

To be refreshed, linked entities require a [Power BI Premium](/power-bi/service-premium-what-is) subscription. Linked entities are available in any dataflow on a workspace that's hosted on Power BI Premium capacity. There are no limitations on the source dataflow.

Linked entities only work properly in new Power BI workspaces, and, likewise, all linked dataflows must be located in new workspaces. More information: [Create the new workspaces in Power BI](/power-bi/service-create-the-new-workspaces)

> [!NOTE]
> Entities differ based on whether they're standard entities or computed entities. Standard entities (often simply referred to as entities) query an external data source, such as a SQL database. Computed entities require Premium capacity on Power BI and run their transformations on data that's already in Power BI storage. 
>
>If your dataflow isn't located in a Premium capacity workspace, you can still reference a single query&mdash;or combine two or more queries&mdash;as long as the transformations aren't defined as in-storage transformations. Such references are considered standard entities. To do this, turn off the **Enable load** option for the referenced queries to prevent the data from being materialized and ingested into storage. From there, you can reference those **Enable load = false** queries, and set **Enable load** to **On** only for the resulting queries that you want to materialize.

### Linked entities in Power Apps

Linked entities are available in both Power Apps Plan 1 and Plan 2.

## How to link entities between dataflows

There are a few ways to link entities between dataflows. To link entities in Power BI, you must sign in with your Power BI credentials.

You can select **Get data** from the dataflow authoring tool, which displays a dialog box for selecting the categories and each data source. Then select the **Power Platform dataflows** connector.

![Image showing how to select the Power Platform connector in Power BI.](media/linked-entities/linked-entities-03.png)

A connection window for the selected data connection is displayed. If credentials are required, you're prompted to provide them.

In Power BI, you can select **Add linked entities** from the dataflow authoring tool.

![Image showing how to add linked entities in the Power BI dataflow authoring tool.](media/linked-entities/linked-entities-00.png)

You can also select **Add linked entities** from the **Add entities** menu in the Power BI service.

![Image showing how to add linked entities from the menu in the Power BI service.](media/linked-entities/linked-entities-01.png)

A **Navigator** window opens, and you can choose a set of entities you can connect to. The window displays entities for which you have permissions across all workspaces and environments in your organization.

After you select your linked entities, they appear in the list of entities for your dataflow in the authoring tool, with a special icon identifying them as linked entities.

You can also view the source dataflow from the dataflow settings of your linked entity.

## Refresh logic of linked entities

The refresh logic of linked entities differs slightly based on whether you're using Power BI or Power Apps, as described in the following sections.

### Refresh logic in Power BI

The default refresh logic of linked entities depends on whether the source dataflow is in the same Power BI workspace as the destination dataflow. The following sections describe the behavior of each.

* **Links between workspaces**: Refresh for links from entities in different workspaces behaves like a link to an external data source. When the dataflow is refreshed, it takes the latest data for the entity from the source dataflow. If the source dataflow is refreshed, it doesn't automatically affect the data in the destination dataflow.

* **Links in the same workspace**: When data refresh occurs for a source dataflow, that event automatically triggers a refresh process for dependent entities in all destination dataflows in the same workspace, including any calculated entities based on them. All other entities in the destination dataflow are refreshed according to the dataflow schedule. Entities that depend on more than one source refresh their data whenever any of their sources are refreshed successfully.

  > [!NOTE]
  > The entire refresh process is committed at once. Because of this, if the data refresh for the destination dataflow fails, the data refresh for the source dataflow fails as well.

### Refresh logic in Power Apps

The refresh logic of linked entities in Power Apps behaves like an external data source. When the dataflow is refreshed, it takes the latest data for the entity from the source dataflow. If the source dataflow is refreshed, it doesn't automatically affect the data in the destination dataflow.

## Permissions when viewing reports from dataflows

When creating a Power BI report that includes data based on a dataflow, you can see any linked entities only when you have access to the source dataflow.

## Limitations and considerations

There are a few limitations to keep in mind when working with linked entities:

* An entity can be referenced by another dataflows. That reference entity can also be reference by other dataflows and so on, up to 5 times.
* Cyclical dependencies of linked entities aren't allowed.
* The dataflow must be in a [new Power BI workspace](/power-bi/service-create-the-new-workspaces) or a Power Apps environment.
* A linked entity can't be joined with a regular entity that gets its data from an on-premises data source.
* When using M parameters to address linked entities, if the source dataflow is refreshed, it doesn't automatically affect the data in the destination dataflow.
* Attempting to connect two dataflow entities between two workspaces of different storage types&mdash;Bring Your Own Storage Account (BYOSA) and Internal&mdash;isn't supported.

## Next steps

The following articles might be useful as you create or work with dataflows:

* [Self-service data prep in Power BI](create-use.md)
* [Using incremental refresh with dataflows](incremental-refresh.md)
* [Creating computed entities in dataflows](computed-entities.md)
* [Connect to data sources for dataflows](data-sources.md)

The articles below provide more information about dataflows and Power BI:

* [Create and use dataflows in Power BI](/power-bi/service-dataflows-create-use)
* [Using computed entities on Power BI Premium](computed-entities.md)
* [Using dataflows with on-premises data sources](/power-bi/service-dataflows-on-premises-gateways)
* [Developer resources for Power BI dataflows](/power-bi/service-dataflows-developer-resources)

For more information about Power Query and scheduled refresh, you can read these articles:

* [Query overview in Power BI Desktop](/power-bi/desktop-query-overview)
* [Configuring scheduled refresh](/power-bi/refresh-scheduled-refresh)

For more information about Common Data Model, you can read its overview article:

* [Common Data Model - overview](/powerapps/common-data-model/overview)
