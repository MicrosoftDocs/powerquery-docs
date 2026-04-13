---
title: Link tables between dataflows
description: Learn how to link tables in dataflows
author: Luitwieler
ms.topic: concept-article
ms.date: 6/14/2023
ms.author: jeluitwi
ms.subservice: dataflows
---
# Link tables between dataflows

With dataflows in Microsoft Power Platform, you can have a single organizational data storage source where business analysts can prep and manage their data once, and then reuse it between different analytics apps in the organization.

When you link tables between dataflows, you can reuse tables that have already been ingested, cleansed, and transformed by dataflows that are owned by others, without the need to maintain that data. The linked tables simply point to the tables in other dataflows, and only makes a copy of the data when the destination dataflow is in another workspace or environment.

Linked tables are read-only, so if you want to create transformations for a linked table, you must create a new computed table with a reference to the linked table.

## Linked table availability

Linked table availability depends on whether you're using dataflows in Power BI or Power Apps. The following sections describe the details for each.

### Linked tables in Power BI

To be refreshed, linked tables require a [Power BI Premium](/power-bi/service-premium-what-is) subscription. Linked tables are available in any dataflow on a workspace that's hosted on Power BI Premium capacity. There are no limitations on the source dataflow.

Linked tables only work properly in new Power BI workspaces, and, likewise, all linked dataflows must be located in new workspaces. More information: [Create the new workspaces in Power BI](/power-bi/service-create-the-new-workspaces)

> [!NOTE]
> Tables differ based on whether they're standard tables or computed tables. Standard tables (often simply referred to as tables) query an external data source, such as a SQL database. Computed tables require Premium capacity on Power BI and run their transformations on data that's already in Power BI storage.
>
>If your dataflow isn't located in a Premium capacity workspace, you can still reference a single query&mdash;or combine two or more queries&mdash;as long as the transformations aren't defined as in-storage transformations. Such references are considered standard tables. To do this, turn off the **Enable load** option for the referenced queries to prevent the data from being materialized and ingested into storage. From there, you can reference those **Enable load = false** queries, and set **Enable load** to **On** only for the resulting queries that you want to materialize.

### Linked tables in Power Apps

For more information about the availability of linked tables in Power Apps, go to [What licenses do you need to use dataflows](what-licenses-do-you-need-in-order-to-use-dataflows.md).

## How to link tables between dataflows

There are a few ways to link tables between dataflows. To link tables in Power BI, you must sign in with your Power BI credentials.

You can select **Get data** from the dataflow authoring tool, which displays a dialog box for selecting the categories and each data source. Then select the Power Platform **Dataflows** connector.

:::image type="content" source="media/linked-tables/linked-tables-03.png" alt-text="Screenshot showing how to select the Power Platform Dataflows connector." lightbox="media/linked-tables/linked-tables-03.png":::

A connection window for the selected data connection is displayed. If credentials are required, you're prompted to provide them.

In Power BI, you can select **Add linked tables** from the dataflow authoring tool.

:::image type="content" source="media/linked-tables/link-tables-from-other-dataflows.png" alt-text="Screenshot showing how to add linked tables in the Power BI dataflow authoring tool." lightbox="media/linked-tables/link-tables-from-other-dataflows.png":::

You can also select **Add linked tables** from the **Add tables** menu in the Power BI service.

:::image type="content" source="media/linked-tables/add-linked-tables.png" alt-text="Screenshot showing how to add linked tables from the menu in the Power BI service.":::

A **Navigator** window opens, and you can choose a set of tables you can connect to. The window displays tables for which you have permissions across all workspaces and environments in your organization.

After you select your linked tables, they appear in the list of tables for your dataflow in the authoring tool, with a special icon identifying them as linked tables.

You can also view the source dataflow from the dataflow settings of your linked table.

## Refresh logic of linked tables

The refresh logic of linked tables differs slightly based on whether you're using Power BI or Power Apps, as described in the following sections.

### Refresh logic in Power BI

The default refresh logic of linked tables depends on whether the source dataflow is in the same Power BI workspace as the destination dataflow. The following sections describe the behavior of each.

* **Links between workspaces**: Refresh for links from tables in different workspaces behaves like a link to an external data source. When the dataflow is refreshed, it takes the latest data for the table from the source dataflow. If the source dataflow is refreshed, it doesn't automatically affect the data in the destination dataflow.

* **Links in the same workspace**: When data refresh occurs for a source dataflow, that event automatically triggers a refresh process for dependent tables in all destination dataflows in the same workspace, including any calculated tables based on them. All other tables in the destination dataflow are refreshed according to the dataflow schedule. Tables that depend on more than one source refresh their data whenever any of their sources are refreshed successfully.

  > [!NOTE]
  > The entire refresh process is committed at once. Because of this, if the data refresh for the destination dataflow fails, the data refresh for the source dataflow fails as well.

### Refresh logic in Power Apps

The refresh logic of linked tables in Power Apps behaves like an external data source. When the dataflow is refreshed, it takes the latest data for the table from the source dataflow. If the source dataflow is refreshed, it doesn't automatically affect the data in the destination dataflow.

## Permissions when viewing reports from dataflows

When creating a Power BI report that includes data based on a dataflow, you can see any linked tables only when you have access to the source dataflow.

## Limitations and considerations

There are a few limitations to keep in mind when working with linked tables:

* A table can be referenced by another dataflows. That reference table can also be reference by other dataflows, and so on, up to five times.
* Cyclical dependencies of linked tables aren't allowed.
* The dataflow must be in a [new Power BI workspace](/power-bi/service-create-the-new-workspaces) or a Power Apps environment.
* A linked table can't be joined with a regular table that gets its data from an on-premises data source.
* When using M parameters to address linked tables, if the source dataflow is refreshed, it doesn't automatically affect the data in the destination dataflow.
* Attempting to connect two dataflow tables between two workspaces of different storage types&mdash;Bring Your Own Storage Account (BYOSA) and Internal&mdash;isn't supported.

## Next steps

The following articles might be useful as you create or work with dataflows:

* [Self-service data prep in Power BI](create-use.md)
* [Using incremental refresh with dataflows](incremental-refresh.md)
* [Creating computed tables in dataflows](computed-tables.md)
* [Connect to data sources for dataflows](data-sources.md)

The following articles provide more information about dataflows and Power BI:

* [Create and use dataflows in Power BI](/power-bi/service-dataflows-create-use)
* [Using computed tables on Power BI Premium](computed-tables.md)
* [Using dataflows with on-premises data sources](/power-bi/service-dataflows-on-premises-gateways)
* [Developer resources for Power BI dataflows](/power-bi/service-dataflows-developer-resources)

For more information about Power Query and scheduled refresh, you can read these articles:

* [Query overview in Power BI Desktop](/power-bi/desktop-query-overview)
* [Configuring scheduled refresh](/power-bi/refresh-scheduled-refresh)

For more information about Common Data Model, you can read its overview article:

* [Common Data Model - overview](/powerapps/common-data-model/overview)
