---
title: Best practices for reusing dataflows across environments and workspaces
description: Best practices for reusing dataflows across environments and workspaces
author: Luitwieler
ms.topic: concept-article
ms.date: 1/26/2024
ms.author: jeluitwi
ms.subservice: dataflows
ms.custom: sfi-image-nochange
---

# Best practices for reusing dataflows across environments and workspaces

This article discusses a collection of best practices for reusing dataflows effectively and efficiently. Read this article to avoid design pitfalls and potential performance issues as you develop dataflows for reuse.

## Separate data transformation dataflows from staging/extraction dataflows

If a dataflow performs all the actions, it's hard to reuse its tables in other dataflows or for other purposes. The best dataflows to reuse are those dataflows that do only a few actions. Creating dataflows that specialize in one specific task is one of the best ways to reuse them. If you have a set of dataflows that you use as [staging dataflows](best-practices-for-dimensional-model-using-dataflows.md#staging-dataflows), their only action is to extract data as-is from the source system. These dataflows can be reused in multiple other dataflows.

If you have data transformation dataflows, you can split them into dataflows that do common transformations. Each dataflow can do just a few actions. These few actions per dataflow ensure that the output of that dataflow is reusable by other dataflows.

:::image type="complex" source="media/best-practices-reusing-dataflows/multi-layered-dataflow.png" alt-text="Dataflow doing only a few actions.":::
   Image with data being extracted from a data source to staging dataflows, where the tables are either stored in Dataverse or Azure Data Lake storage. Then the data is moved to transformation dataflows where the data is transformed and converted to the data warehouse structure. Finally, the data is loaded to a Power BI semantic model.
:::image-end:::

## Use multiple workspaces

Each workspace (or environment) is available only for members of that workspace. If you build all your dataflows in one workspace, you're minimizing the reuse of your dataflows. You can have some generic workspaces for dataflows that are processing company-wide tables. You can also have some workspace for dataflows to process tables across multiple departments. And you can also have some workspaces for dataflows to be used only in specific departments.

:::image type="content" source="media/best-practices-reusing-dataflows/separate-workspaces.png" alt-text="Image showing the separate workspaces.":::

## Set the correct access levels on workspaces

To give access to dataflows in other workspaces to use the output of a dataflow in a workspace, you just need to give them View access in the workspace. To learn more about other roles in a Power BI workspace, go to [Roles in the new workspaces](/power-bi/collaborate-share/service-roles-new-workspaces).

:::image type="content" source="media/best-practices-reusing-dataflows/power-bi-workspace-add-members.png" alt-text="Screenshot showing how to access to the Power BI workspace.":::

## Endorsement on the dataflow in Power BI

There can be many dataflows created in a tenant organization, and it can be hard for the users to know which dataflow is most reliable. Authors of a dataflow, or those users who have edit access to it, can endorse the dataflow at three levels: no endorsement, promoted, or certified.

These levels of endorsement help users find reliable dataflows easier and faster. The dataflow with a higher endorsement level appears first. The Power BI administrator can delegate the ability to endorse dataflows to the certified level to other people. More information: [Endorsement - Promoting and certifying Power BI content](/power-bi/collaborate-share/service-endorsement-overview)

:::image type="content" source="media/best-practices-reusing-dataflows/dataflow-endorsement-power-query.png" alt-text="Screenshot of the Power Query Navigator showing the promoted and certified endorsement labels on specific dataflows." lightbox="media/best-practices-reusing-dataflows/dataflow-endorsement-power-query.png":::

## Separate tables in multiple dataflows

You can have multiple tables in one dataflow. One of the reasons you might split tables in multiple dataflows is what you learned earlier in this article about separating the data ingestion and data transformation dataflows. Another good reason to have tables in multiple dataflows is when you want a different refresh schedule than other tables.

In the example shown in the following image, the sales table needs to be refreshed every four hours. The date table needs to be refreshed only once a day to keep the current date record updated. And a product-mapping table just needs to be refreshed once a week. If you have all of these tables in one dataflow, you have only one refresh option for them all. However, if you split these tables into multiple dataflows, you can schedule the refresh of each dataflow separately.

:::image type="content" source="media/best-practices-reusing-dataflows/dataflows-with-different-schedules.png" alt-text="Image showing dataflows with different schedules for the refresh.":::

## Good table candidates for dataflow tables

When you develop solutions using Power Query in the desktop tools, you might ask yourself; which of these tables are good candidates to be moved to a dataflow? The best tables to be moved to the dataflow are those tables that need to be used in more than one solution, or more than one environment or service. For example, the Date table shown in the following image needs to be used in two separate Power BI files. Instead of duplicating that table in each file, you can build the table in a dataflow as a table, and reuse it in those Power BI files.

:::image type="content" source="media/best-practices-reusing-dataflows/shared-table-in-dataflow.png" alt-text="Image showing a shared table used in a dataflow.":::
