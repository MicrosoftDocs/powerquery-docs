---
title: Add data to a table in Microsoft Dataverse by using Power Query
description: Step-by-step instructions for how to use Power Query to add data to a new or existing table in Microsoft Dataverse from another data source.
author: Luitwieler
ms.reviewer: dougklo
ms.date: 7/19/2024
ms.author: jeluitwi
---

# Add data to a table in Microsoft Dataverse by using Power Query

In this procedure, you create a table in [Dataverse](/powerapps/maker/data-platform/data-platform-intro) and fill that table with data from an OData feed by using Power Query. You can use the same techniques to integrate data from these online and on-premises sources, among others:

* SQL Server
* Salesforce
* IBM DB2
* Access
* Excel
* Web APIs
* OData feeds
* Text files

You can also filter, transform, and combine data before you load it into a new or existing table.

If you don't have a license for Power Apps, you can [sign up for free](/powerapps/maker/signup-for-powerapps).

## Prerequisites

Before you start to follow this article:

* Switch to an [environment](/power-platform/admin/working-with-environments) in which you can create tables.
* You must have a Power Apps per user plan or Power Apps per app plan.

## Specify the source data

1. Sign in to [Power Apps](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc).

1. In the navigation pane, select **Tables**.

    :::image type="content" source="./media/add-data-power-query/view-entities-portal.png" alt-text="Screenshot of the Power Apps Tables area." lightbox="./media/add-data-power-query/view-entities-portal.png":::

1. In the command menu, select **Import** > **Import data**.

1. In the list of data sources, select **OData**.

    :::image type="content" source="./media/add-data-power-query/choose-odata.png" alt-text="Screenshot of the Choose data source windows with the OData connector emphasized." lightbox="./media/add-data-power-query/choose-odata.png":::

1. Under **Connection settings**, type or paste the following URL, and then select **Next**:

   `https://services.odata.org/V4/Northwind/Northwind.svc/`

1. In the list of tables, select the **Customers** check box, and then select **Next**.

    :::image type="content" source="./media/add-data-power-query/select-table.png" alt-text="Screenshot of the Choose data windows where you select the Customers table.":::

1. (optional) Modify the schema to suit your needs by choosing which columns to include, transforming the table in one or more ways, adding an index or conditional column, or making other changes.

1. In the lower-right corner, select **Next**.

## Specify the target table

1. Under **Load settings**, select **Load to new table**.

    :::image type="content" source="./media/add-data-power-query/new-entity-name.png" alt-text="Screenshot of the Map tables windows with Load to new table emphasized.":::

    You can give the new table a different name or display name, but leave the default values to follow this tutorial exactly.

1. In the **Unique primary name column** list, select **ContactName**, and then select **Next**.

    You can specify a different primary-name column, map a different column in the source table to each column in the table that you're creating, or both. You can also specify whether Text columns in your query output should be created as either Multiline Text or Single-Line Text in the Dataverse. To follow this tutorial exactly, leave the default column mapping.

1. Select **Refresh manually** for Power Query - Refresh Settings, and then select **Publish**.

1. Under **Dataverse** (near the left edge), select **Tables** to show the list of tables in your database.

    The **Customers** table that you created from an OData feed appears as a custom table.

    :::image type="content" source="./media/add-data-power-query/entity-list.png" alt-text="Screenshot of the list of standard and custom tables." lightbox="./media/add-data-power-query/entity-list.png":::

> [!WARNING]
> Existing data might be altered or deleted when loading data to a Dataverse table while having the **Delete rows that no longer exist in the query output** enabled or a primary key column defined.

If you select **Load to existing table**, you can specify a table into which you add data from the **Customers** table. You could, for example, add the data to the **Account** table with which the Dataverse ships. Under **Column mapping**, you can further specify that data in the **ContactName** column from the **Customers** table should be added to the **Name** column in the **Account** table.

:::image type="content" source="./media/add-data-power-query/existing-entity.png" alt-text="Screenshot of Map tables, with Load to existing table, the Destination table, and column mapping emphasized." lightbox="./media/add-data-power-query/existing-entity.png":::

If an [error message about permissions](/powerapps/maker/data-platform/troubleshoot-power-query-issues) appears, contact your administrator.
