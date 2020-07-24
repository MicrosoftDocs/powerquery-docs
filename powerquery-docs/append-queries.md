---
title: Append data
description: This article demonstrates how to append table queries in Power Query.
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
---

# Append data

The append operation creates a single table by adding the contents of one table to another table and will have a new table schema defined by aggregation of the column headers from both tables.

![Append operation sample diagram](images/append-queries-diagram.png)

>[!NOTE]
>When appending tables that do not have the same Column headers, the result table will have all column headers from all tables appended. If one of the appended tables doesn't have a column header from other tables, the result table will show *null* values in the respective column as shown in the previous image for columns C and D.

## To append queries

You can find the **Append queries** option in the **Home** tab under the **Combine** group. From the dropdown, you'll see two options:

* **Append queries**&mdash;displays the **Append** window to add additional tables to the current query.
* **Append queries as new**&mdash;displays the **Append** window to create a new query by appending multiple tables.

![Append queries icons](images/me-append-queries-icons.png)

The append operation requires at least two tables. The **Append** window has two modes:
* **Two tables**&mdash;combine two table queries together. This mode is the default mode.
* **Three or more tables**&mdash;allow combining an arbitrary number of table queries together.

>[!Note]
>The tables will be appended in the order in which they are selected, starting with the **Primary table** for the *two tables* mode and from the first table in the **Tables to append** list for the *three or more tables* mode.

### Append two tables

For demonstration purposes, this article will be using two tables with sample data:

* **Online Sales**&mdash;sales made through an online channel.

![Sample online sales table](images/me-append-queries-sample-online-sales.png)

* **Store Sales**&mdash;sales made through the company's physical locations.

![Sample store sales table](images/me-append-queries-sample-store-sales.png)

To append these tables, first select the **Online Sales** table. From the **Home** tab inside the **Combine** group, select the **Append queries** button, which will create a new step inside the **Online Sales** query. The **Online Sales** table will be the primary table. The table to append to the primary table will be the **Store Sales**.

![Sample append two tables](images/me-append-queries-sample-two-tables-window.png)

Power Query performs the append operation based on the names of the column headers found on both tables and not on their ordinal position. The final appended table will have all columns from all tables appended. 

In the event that one table doesn't have columns found in another table, `null` values will appear in the corresponding column, as shown in the **Referer** column of the final query.

![Sample output append two tables](images/me-append-queries-sample-two-tables-output.png)

### Append three or more tables

In this demonstration, you want to not only append the **Online Sales** and **Store Sales** tables, but also a new table called **Wholesale Sales**:

![Sample wholesale sales table](images/me-append-queries-sample-wholesale-sales.png)

The new approach for this example is to select the **Append queries as new** option and then select the *Three or more tables* mode. From this **Append** window, you can select from the **Available table(s)** list the tables that you want to append. Once selected, the tables to append will appear on the list to the right under the **Tables to append** section.

![Three or more tables sample append window](images/me-append-queries-sample-three-more-tables-window.png)

After selecting **OK**, a new query will be created with all of your tables appended.

![Three or more tables sample append output](images/me-append-queries-sample-three-more-tables-output.png)
