---
title: Power Query MySQL database connector
description: Provides basic information about products that use the connector, supported authentication types, prerequisites, and connection instructions.
author: bezhan-msft
ms.topic: conceptual
ms.date: 6/16/2023
ms.author: bezhan
---

# MySQL database

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Power Apps (Dataflows)<br/>Excel<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Windows (Power BI Desktop, Excel, online service with gateway)<br/>Database (Power BI Desktop, Excel)<br/>Basic (online service with gateway) |
| Function Reference Documentation | [MySQL.Database](/powerquery-m/mysql-database) |

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

Users need to install the [Oracle MySQL Connector/NET](https://dev.mysql.com/downloads/connector/net/) package prior to using this connector in Power BI Desktop. Currently, only version 8.0.26 is supported; other newer versions might cause a `This connector requires one or more additional components to be installed before it can be used.` error message. This component must also be installed on the machine running the on-premises data gateway in order to use this connector in Power Query Online (dataflows) or Power BI Service.

## Capabilities Supported

* Import
* Advanced options
  * Command timeout in minutes
  * Native SQL statement
  * Relationship columns
  * Navigate using full hierarchy

## Connect to MySQL database from Power Query Desktop

To make the connection, take the following steps:

1. Select the **MySQL database** option in the connector selection.

2. In the **MySQL database** dialog, provide the name of the server and database.

   ![Enter MySQL database connection.](./media/mysql-database/signin.png)

3. Select the **Database** authentication type and input your MySQL credentials in the **User name** and **Password** boxes.

   ![MySQL database authentication.](./media/mysql-database/enter-credentials.png)

4. Select the level to apply your credentials to.

5. Once you're done, select **OK**.

   >[!Note]
   > If the connection is not encrypted, you'll be prompted with the following dialog.

   ![MySQL database encryption support.](./media/mysql-database/encryption-warning.png)

   Select **OK** to connect to the database by using an unencrypted connection, or follow the [instructions](/sql/database-engine/configure-windows/enable-encrypted-connections-to-the-database-engine) to set up encrypted connections to SQL Server.

6. In **Navigator**, select the data you require, then either load or transform the data.

   ![Load or transform the data.](./media/mysql-database/navigator.png)

## Connect to MySQL database from Power Query Online

To make the connection, take the following steps:

1. Select the **MySQL database** option in the connector selection.

2. In the **MySQL database** dialog, provide the name of the server and database.  

   ![On premises MySQL database connection.](./media/mysql-database/service-signin.png)

3. If necessary, include the name of your on-premises data gateway.

4. Select the **Basic** authentication kind and input your MySQL credentials in the **Username** and **Password** boxes.

5. If your connection isn't encrypted, clear **Use Encrypted Connection**.

6. Select **Next** to connect to the database.

7. In **Navigator**, select the data you require, then select **Transform data** to transform the data in Power Query Editor.

## Connect using advanced options

Power Query Desktop provides a set of advanced options that you can add to your query if needed.

![Advanced options included in the MySQL connection dialog box.](./media/mysql-database/advanced-options.png)

The following table lists all of the advanced options you can set in Power Query Desktop.

| Advanced option | Description |
| --------------- | ----------- |
| Command timeout in minutes | If your connection lasts longer than 10 minutes (the default timeout), you can enter another value in minutes to keep the connection open longer. This option is only available in Power Query Desktop. |
| SQL statement | For information, go to [Import data from a database using native database query](../native-database-query.md). |
| Include relationship columns | If checked, includes columns that might have relationships to other tables. If this box is cleared, you won’t see those columns. |
| Navigate using full hierarchy | If checked, the navigator displays the complete hierarchy of tables in the database you're connecting to. If cleared, the navigator displays only the tables whose columns and rows contain data. |

Once you've selected the advanced options you require, select **OK** in Power Query Desktop to connect to your MySQL database.
