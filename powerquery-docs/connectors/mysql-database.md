---
title: Power Query MySQL database connector
description: Provides basic information about products that use the connector, supported authentication types, prerequisites, and connection instructions.
author: whhender
ms.topic: concept-article
ms.date: 5/21/2025
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# MySQL database

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Windows (Power BI Desktop, Excel, online service with gateway)<br/>Database (Power BI Desktop, Excel)<br/>Basic (online service with and without gateway) |
| Function Reference Documentation | [MySQL.Database](/powerquery-m/mysql-database) |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

[!INCLUDE [Includes_mysql-database_prerequisites](includes/mysql-database/mysql-database-prerequisites.md)]

## Capabilities Supported

[!INCLUDE [Includes_mysql-database_capabilities-supported](includes/mysql-database/mysql-database-capabilities-supported.md)]

## Connect to MySQL database from Power Query Desktop

To make the connection, take the following steps:

1. Select the **MySQL database** option in the connector selection. For more information, go to [Where to get data](../where-to-get-data.md).

2. In the **MySQL database** dialog, provide the name of the server and database.

   :::image type="content" source="./media/mysql-database/signin.png" alt-text="Screenshot of the MySQL database connection dialog.":::

3. Select the **Database** authentication type and input your MySQL credentials in the **User name** and **Password** boxes.

   :::image type="content" source="./media/mysql-database/enter-credentials.png" alt-text="Screenshot of the authentication dialog with the Database authentication kind selected.":::

4. Select the level to apply your credentials to.

5. Once you're done, select **OK**.

6. If the connection isn't encrypted, you're prompted with the following dialog.

   :::image type="content" source="./media/mysql-database/encryption-warning.png" alt-text="Screenshot of the encryption support dialog asking whether to use an unencrypted connection.":::

   Select **OK** to connect to the database by using an unencrypted connection, or follow the [instructions](/sql/database-engine/configure-windows/enable-encrypted-connections-to-the-database-engine) to set up encrypted connections to SQL Server.

7. In **Navigator**, select the data you require, then either load or transform the data.

   :::image type="content" source="./media/mysql-database/navigator.png" alt-text="Screenshot of the Navigator, with one item selected and the selection's data displayed." lightbox="./media/mysql-database/navigator.png":::

## Connect to MySQL database from Power Query Online

[!INCLUDE [Includes_mysql-database_connect-to-power-query-online](includes/mysql-database/mysql-database-connect-to-power-query-online.md)]

## Connect using advanced options

Power Query provides a set of advanced options that you can add to your query if needed.

The following table lists all of the advanced options you can set in Power Query Desktop.

| Advanced option | Description |
| --------------- | ----------- |
| Command timeout in minutes | If your connection lasts longer than 10 minutes (the default time-out), you can enter another value in minutes to keep the connection open longer. |
| SQL statement | For information, go to [Import data from a database using native database query](../native-database-query.md). |
| Include relationship columns | If checked, includes columns that might have relationships to other tables. If this box is cleared, those columns aren't included. |
| Navigate using full hierarchy | If checked, the navigator displays the complete hierarchy of tables in the database you're connecting to. If cleared, the navigator displays only the tables whose columns and rows contain data. |

Once you select the advanced options you require, select **OK** in Power Query Desktop or **Next** in Power Query Online to connect to your MySQL database.

## Limitations and considerations

[!INCLUDE [Includes_mysql-database_limitations-and-considerations](includes/mysql-database/mysql-database-limitations-and-considerations.md)]
