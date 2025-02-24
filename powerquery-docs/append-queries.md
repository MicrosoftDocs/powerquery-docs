---
title: Append queries
description: This article demonstrates how to append table queries in Power Query.
author: ptyx507
ms.date: 02/24/2025
ms.author: miescobar
ms.subservice: transform-data
---

# Append queries

The append operation creates a single table by adding the contents of one or more tables to another, and aggregates the column headers from the tables to create the schema for the new table.

:::image type="content" source="media/append-queries/append-queries-diagram.png" alt-text="Diagram showing the result of an append operation with null values in columns that don’t exist in one of the original tables.":::

>[!NOTE]
>When tables that don't have the same column headers are appended, all column headers from all tables are appended to the resulting table. If one of the appended tables doesn't have a column header from other tables, the resulting table shows *null* values in the respective column, as shown in the previous image in columns C and D.

You can find the **Append queries** command on the **Home** tab in the **Combine** group. On the drop-down menu, there are two options:

* **Append queries** - appends other tables to your current query.
    _For example: You have two tables, A and B. You select **Append queries** in table A, and request to append table B. Your table A query will now have an appended table that contains aggregated table from A and B. Your table B query is unchanged._
* **Append queries as new** - appends other tables to a new query.
    _For example: You have two tables, A and B. You select **Append queries as new** in table A, and request to append table B. You now have a new query called Append1 that contains an aggregated table from A and B. Both your table A and table B queries are unchanged._

:::image type="content" source="media/append-queries/append-queries-icons.png" alt-text="Screenshot of the Power Query Home tab ribbon with the Append queries commands emphasized." lightbox="media/append-queries/append-queries-icons.png":::

The append operation requires at least two tables. The **Append** dialog box has two modes:

* **Two tables**: Combine two table queries together. This mode is the default mode.
* **Three or more tables**: Allow an arbitrary number of table queries to be combined.

> [!NOTE]
>The tables are appended in the order in which they're selected, starting with the **Primary table** for the **Two tables** mode and from the primary table in the **Tables to append** list for the **Three or more tables** mode.

## Append two tables

For the example in this article, you use the following two tables with sample data:

* **Online Sales**: Sales made through an online channel.

  :::image type="content" source="media/append-queries/append-queries-sample-online-sales.png" alt-text="Screenshot of the sample online sales table with channel name (online), date, customer ID, and units columns.":::

* **Store Sales**: Sales made through the company's physical locations.

  :::image type="content" source="media/append-queries/append-queries-sample-store-sales.png" alt-text="Screenshot of the sample store sales table with date, units, referrer, customer ID, and channel name (store) columns.":::

To append these tables, first select the **Online Sales** table. On the **Home** tab, select **Append queries**, which creates a new step in the **Online Sales** query. The **Online Sales** table is the primary table. The table to append to the primary table is **Store Sales**.

:::image type="content" source="media/append-queries/append-queries-sample-two-tables-window.png" alt-text="Screenshot of the Append dialog with Store Sales set as the table to append.":::

Power Query performs the append operation based on the names of the column headers found on both tables, and not based on their relative position in the headers sections of their respective tables. The final table has all columns from all tables appended.

If one table doesn't have columns found in another table, *null* values appear in the corresponding column, as shown in the **Referrer** column of the final query.

:::image type="content" source="media/append-queries/append-queries-sample-two-tables-output.png" alt-text="Screenshot of the table with combined common columns and data, except for the Referrer column, which contains null values for the online sales rows." lightbox="media/append-queries/append-queries-sample-two-tables-output.png":::

## Append three or more tables

In this example, you want to append not only the **Online Sales** and **Store Sales** tables, but also a new table named **Wholesale Sales**.

:::image type="content" source="media/append-queries/append-queries-sample-wholesale-sales.png" alt-text="Screenshot of the sample wholesale sales table with channel name (wholesale), date, customer ID, and units columns.":::

The new approach for this example is to select **Append queries as new**, and then in the **Append** dialog box, select the **Three or more tables** option button. In the **Available table(s)** list, select each table you want to append, and then select **Add**. After all the tables you want appear in the **Tables to append** list, select **OK**.

:::image type="content" source="media/append-queries/append-queries-sample-three-more-tables-window.png" alt-text="Screenshot of the append dialog using three or more tables mode.":::

After you select **OK**, a new query is created with all your tables appended.

:::image type="content" source="media/append-queries/append-queries-sample-three-more-tables-output.png" alt-text="Screenshot with combined common columns and data from the three tables, except null values in the online and wholesale rows of the Referrer column.":::
