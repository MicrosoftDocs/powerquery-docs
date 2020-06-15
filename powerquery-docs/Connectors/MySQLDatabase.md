---
title: MySQL database
description: Power Query MySQL database connector reference
author: DougKlopfenstein
ms.service: powerquery
ms.topic: conceptual
ms.date: 06/08/2020
ms.author: v-douklo
LocalizationGroup: reference
---

# MySQL database
 
## Summary
 
Release State: General Availability

Products: Power BI Desktop, Power BI Service (Enterprise Gateway), Dataflows in PowerBI.com (Enterprise Gateway), Dataflows in PowerApps.com (Enterprise Gateway), Excel

Authentication Types Supported: Database (Username/Password), Windows

Function Reference Documentation: [Sql.Database](https://docs.microsoft.com/powerquery-m/sql-database), [Sql.Databases](https://docs.microsoft.com/en-us/powerquery-m/sql-databases)

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.
 
## Prerequisites

By default, Power BI installs an OLE DB driver for MySQL database. However, for optimal performance, we recommend that the customer installs the [SQL Server Native Client](https://docs.microsoft.com/sql/relational-databases/native-client/applications/installing-sql-server-native-client?view=sql-server-ver15) before using the MySQL database connector. SQL Server Native Client 11.0 and SQL Server Native Client 10.0 are both supported in the latest version.

 
## Capabilities Supported
* Import
* Advanced options
    * Command timeout in minutes
    * Native SQL statement
    * Relationship columns
    * Navigate using full hierarchy
    
## Connect to MySQL database

To make the connection, take the following steps:
 
1. Select the **MySQL database** option in the connector selection.
 
2. If you're connecting from Power BI desktop or Excel:

   1. In the **MySQL database** dialog, provide the name of the server and database. 

      ![Enter MySQL database connection](./media/mysql-database/signin.png)

   2. Optionally, you may provide a command timeout and a [native query (SQL statement)](native-database-query.md), as well as select whether or not you want to include relationship columns and navigate using full hierarchy. Once you're done, select **OK**.

   3. Select the **Database** authentication type and input your MySQL credentials in the **User name** and **Password** boxes.

      ![MySQL database authentication](./media/mysql-database/enter-credentials.png)

      Also be sure to select the level to apply your credentials to.

<!--      >[!Note]
      > If the connection is not encrypted, you'll be prompted with the following dialog.

      ![SQL Server database encryption support](../images/EncryptionWarning.png)

      Select **OK** to connect to the database by using an unencrypted connection, or follow these [instructions](https://docs.microsoft.com/sql/database-engine/configure-windows/enable-encrypted-connections-to-the-database-engine?view=sql-server-ver15) to set up encrypted connections to SQL Server. -->

3. If you're connecting using an online service:

    1. In the **MySQL database** dialog, provide the name of the server and database. Select the **Basic** authentication kind and input your MySQL credentials in the **Username** and **Password** boxes. If required, include the name of an on-premises data gateway.

       ![On premises MySQL database connection](./media/mysql-database/service-signin.png)

4. In the **Navigator**, select the data you require, then either load or transform the data.

   ![Load or transform the data](./media/mysql-database/navigator.png)
