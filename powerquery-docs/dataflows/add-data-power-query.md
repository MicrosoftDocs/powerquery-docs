---
title: Add data to a table in Microsoft Dataverse by using Power Query
description: Step-by-step instructions for how to use Power Query to add data to a new or existing table in Microsoft Dataverse from another data source.
author: Luitwieler
ms.reviewer: whhender
ms.topic: how-to
ms.date: 10/3/2024
ms.author: jeluitwi
ms.subservice: dataflows
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

    :::image type="content" source="./media/add-data-power-query/view-entities-portal.png" alt-text="Screenshot of the navigation pane with the Tables tab selected and the Tables pane open." lightbox="./media/add-data-power-query/view-entities-portal.png":::

1. In the command menu, select **Import** > **Import data**.

1. In the list of data sources, select **OData**.

    :::image type="content" source="./media/add-data-power-query/choose-odata.png" alt-text="Screenshot of the Power Query Data sources selection open and the OData connector emphasized." lightbox="./media/add-data-power-query/choose-odata.png":::

1. Under **Connection settings**, type or paste the following URL, and then select **Next**:

   `https://services.odata.org/V4/Northwind/Northwind.svc/`

1. In the list of tables, select the **Customers** check box, and then select **Next**.

    :::image type="content" source="./media/add-data-power-query/select-table.png" alt-text="Screenshot of the Power Query navigator dialog, with the Customers table selected.":::

1. (optional) Modify the schema to suit your needs by choosing which columns to include, transforming the table in one or more ways, adding an index or conditional column, or making other changes.

1. In the lower-right corner, select **Next**.

## Specify the target table (Preview)

1. Under **Load settings**, select **Load to new table**.

    :::image type="content" source="./media/add-data-power-query/load-to-new-table.png" alt-text="Screenshot of the load settings menu with Load to new table set." lightbox="./media/add-data-power-query/load-to-new-table.png":::

    You can give the new table a different name or display name, but leave the default values to follow this tutorial exactly.

1. In the **Unique primary name column** list, select **ContactName**, and then select **Next**.

    You can specify a different primary-name column, map a different column in the source table to each column in the table that you're creating, or both. You can also specify whether Text columns in your query output should be created as either Multiline Text or Single-Line Text in the Dataverse. To follow this tutorial exactly, leave the default column mapping.

1. Select **Refresh manually** for Power Query - Refresh Settings, and then select **Publish**.

1. Under **Dataverse** (near the left edge), select **Tables** to show the list of tables in your database.

    The **Customers** table that you created from an OData feed appears as a custom table.

    :::image type="content" source="./media/add-data-power-query/entity-list.png" alt-text="Screenshot of the list of standard and custom tables with the Customers table emphasized." lightbox="./media/add-data-power-query/entity-list.png":::

> [!WARNING]
> Existing data might be altered or deleted when loading data to a Dataverse table while having the **Delete rows that no longer exist in the query output** enabled or a primary key column defined.

## Load to existing table (Preview)

If you select **Load to existing table**, you can specify an existing Dataverse table to load data to.

When you select the table dropdown, there can be up to three recommended Dataverse tables to select from at the top of the dropdown, followed by all other Dataverse tables. These table recommendations are based on comparing the column metadata (column names and column types) with the column metadata of existing Dataverse tables. Up to three Dataverse tables are recommended with the strongest recommendation listed first. If no recommendations are found, the dropdown defaults to only listing all tables.

:::image type="content" source="./media/add-data-power-query/recommended-tables.png" alt-text="Screenshot of the Choose destination settings dialog with the recommended tables." lightbox="./media/add-data-power-query/recommended-tables.png":::

After selecting which Dataverse table to load data into, you then choose the import method. Append is selected by default and adds the data as more rows to the previously selected Dataverse table. Merge updates existing rows within your Dataverse table. If **Merge** is selected, there's an option to select the primary key column that you want to use.

:::image type="content" source="./media/add-data-power-query/import-method-selection.png" alt-text="Screenshot of the Choose destination settings dialog with the import method choice displayed." lightbox="./media/add-data-power-query/import-method-selection.png":::

## Column mapping (Preview)

After you select a destination Dataverse table and specify the import method, the columns are grouped into mapped, possible match, and unmapped. You can toggle between these groupings by selecting the **Mapped**, **Possible match**, or **Unmapped** tabs at the top or stay in the default **Show all** tab that lists all mappings.  

:::image type="content" source="./media/add-data-power-query/column-mapping.png" alt-text="Screenshot of the Choose destination settings dialog with the column mapping choices displayed." lightbox="./media/add-data-power-query/column-mapping.png":::

The source and destination column mappings are grouped as follows:

* **Mapped**: High confidence semantic match between the meanings of the column names and both column data types are the same.

* **Unmapped**: There's no high confidence semantic column matches found for this column. If this column is a required column, you must manually select a source column to map this data to before proceeding.

* **Possible match**: Semantic match between the meanings of the column names, but the source and destination column data types are different.

When manual changes are made to the mapping the source column, the status changes to **Mapped** unless the column data types are different. In that case, the status updates to **Possible match**. As with all possible matches, a recommended action message recommends that you go back one step in the dataflow and change the source column type to match the destination column type in the Dataverse table.  

## Known Limitations

Currently, AI Assisted mapping can only detect type mismatches between columns. Other column mapping challenges in the following list aren't detected as they require previewing the records of incoming data:

* **Truncation**: High confidence in semantic match between source and destination, but at least one record in the source has more characters than the character limit of the destination column.

* **Value Limits**: High confidence in semantic match between source and destination, but at least one record in the source contains a value outside the range of the value limits set by the destination column.

* **Lookup Values**: High confidence in semantic match between source and destination, but at least one record in the source contains a value not present in the lookup value set by the destination column.

If an [error message about permissions](/powerapps/maker/data-platform/troubleshoot-power-query-issues) appears, contact your administrator.

Suggestions for table selection and column mapping are provided by a solution that might be unavailable in a specific Power Platform environment. If this solution can't be detected, suggestions for table selection and column mapping aren't provided by the system. However, you can continue to proceed manually.
