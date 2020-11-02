---
title: Power Query Azure SQL database connector
description: Includes basic information and prerequisites for the connector, and instructions on how to connect to your database using the connector.
author: DougKlopfenstein
ms.service: powerquery
ms.topic: conceptual
ms.date: 06/15/2020
ms.author: v-douklo
LocalizationGroup: reference
---

# Azure SQL database
 
## Summary
 
| Summary | Description |
| ------- | ------------|
|Release State | General Availability |
| Products | Power BI Desktop<br/>Power BI Service (Enterprise Gateway)<br/>Dataflows in PowerBI.com (Enterprise Gateway)<br/>Dataflows in PowerApps.com (Enterprise Gateway)<br/>Excel |
| Authentication Types Supported| Windows (Power BI Desktop, Excel, Power Query Online with gateway)<br/>Database (Power BI Desktop, Excel)<br/>Microsoft Account (all)<br/> Basic (Power Query Online) |
| Function Reference Documentation | [Sql.Database](https://docs.microsoft.com/powerquery-m/sql-database)<br/>[Sql.Databases](https://docs.microsoft.com/powerquery-m/sql-databases) |
| | |

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.
 
## Prerequisites

By default, Power BI installs an OLE DB driver for Azure SQL database. However, for optimal performance, we recommend that the customer installs the [SQL Server Native Client](https://docs.microsoft.com/sql/relational-databases/native-client/applications/installing-sql-server-native-client?view=sql-server-ver15) before using the Azure SQL database connector. SQL Server Native Client 11.0 and SQL Server Native Client 10.0 are both supported in the latest version.

 
## Capabilities Supported
* Import
* DirectQuery (Power BI only)
* Advanced options
    * Command timeout in minutes
    * Native SQL statement
    * Relationship columns
    * Navigate using full hierarchy
    * SQL Server failover support
    
## Connect to Azure SQL database from Power Query Desktop

To make the connection from Power Query Desktop, take the following steps:
 
1. Select the **Azure SQL database** option in the connector selection.
 
2. In the **SQL Server database** dialog that appears, provide the name of the server and database (optional). 

   ![Enter Azure SQL database connection](./media/azure-sql-database/signin.png)

3. If you're connecting from Power BI Desktop, select either the **Import** or **DirectQuery** data connectivity mode.

4. Optionally, you may provide a command timeout and a [native query (SQL statement)](../native-database-query.md), as well as select whether or not you want to include relationship columns and navigate using full hierarchy. You can also enable SQL Server failover support. Once you're done, select **OK**.

5. If this is the first time you're connecting to this database, select the authentication type, input your credentials, and select the level to apply the authentication settings to. Then select **Connect**.

   ![Azure SQL database authentication](./media/azure-sql-database/enter-credentials.png)

   >[!Note]
   >  If the connection is not encrypted, you'll be prompted with the following dialog.

   ![Azure SQL database encryption support](../images/EncryptionWarning.png)

   Select **OK** to connect to the database by using an unencrypted connection, or follow these [instructions](https://docs.microsoft.com/sql/database-engine/configure-windows/enable-encrypted-connections-to-the-database-engine?view=sql-server-ver15) to set up encrypted connections to Azure SQL database.

To make the connection from Power Query Desktop, take the following steps:
 
1. Select the **Azure SQL database** option in the connector selection.

2. In the **Azure SQL database** dialog that appears, provide the name of the server and database.

   ![Enter Azure SQL database online connection](./media/azure-sql-database/service-signin.png)

3. If this is the first time you're connecting to this database, select the authentication kind and input your credentials.

4. If required, select the name of your on-premises data gateway.

5. If the connection is not encrypted, clear the **Use Encrypted Connection** check box.

6. Select **Next** to continue.

7. In **Navigator**, select the data you require, and then select **Transform data**.
