---
title: Append data
description: In Power Query you can append multiple queries. This article demonstrates how to append table queries in Power Query.
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
---

# Append data

In Power Query you can append multiple tables into a single table. The append operation creates a new table schema from all the column headers from the tables to be combined and appends the tables one on top of the other into a single table.

## To append queries

You can find the *Append queries* icon in the **Home** tab under the *Combine* group. From the dropdown, you'll see two options:

* **Append queries** - displays the Append window with the currently selected query as the initial table,  also called the primary table, to be appended.
* **Append queries as new** - displays the Appned window without any preselected tables for the Append operation.

![Append queries icons](images/me-append-queries-icons.png)

The append operation requires at least two tables. Within the Append window we have two modes:
* **Two tables** - This is the default behavior where we select a primary table and a table to be appended to the primary table.

![Two tables Append window](images/me-append-queries-two-window.png)

* **Three or more tables** - This is an optional behavior where we can select the tables to be combined from a list of available tables.

![Three or more tables Append window](images/me-append-queries-three-or-more-window.png)

>[!Note]
>The tables will be appended in the order in which they are selected, starting with the Primary table for the **two tables** mode and from the first table in the *tables to append* list for the **Three or more tables** mode.

### Append two tables

For demonstration purposes, this article will be using two tables with sample data:

* **Online Sales** - sales made via an online channel.

![Sample online sales table](images/me-append-queries-sample-online-sales.png)

* **Store Sales** - sales made through the company's physical locations.

![Sample store sales table](images/me-append-queries-sample-store-sales.png)

To append these tables first select the **Online Sales** query. Once the query has been selected and it shows in the Data Preview pane in the middle of the screen, go to the Home tab and click the *Append queries* button which will create a new step inside the **Online Sales** query. The **Online Sales** table will be the Primary table and the table to append to the priamry table will be the **Store Sales**.

![Sample append two tables](images/me-append-queries-sample-two-tables-window.png)

Power Query performs the append operation based on the names of the column headers found on both tables and not on their ordinal position. The final appended table will have all columns from all tables appended. 

In the event that one table doesn't have columns found in another table, *null* values will appear in the correspondant column as shown in the *Referer* column of the final query.

![Sample output append two tables](images/me-append-queries-sample-two-tables-output.png)

### Append three or more tables

In this demonstration, we want to not only append the **Online Sales** and **Store Sales** tables, but also a new table called **Wholesale Sales**:

![Sample wholesale sales table](images/me-append-queries-sample-wholesale-sales.png)

The new approach for this example is to select the **Append queries as new** option and select the *Three or more tables* mode. From this **Append** window we can select from the **Available table(s)** list the tables that we want to append. Once selected, the tables to append will appear on the list to the right under the **Tables to append** section:

![Three or more tables sample append window](images/me-append-queries-sample-three-more-tables-window.png)

After hitting OK, a new query will be created with all of our tables appended:

![Three or more tables sample append output](images/me-append-queries-sample-three-more-tables-output.png)
