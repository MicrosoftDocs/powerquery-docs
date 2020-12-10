---
title: Power Query SQL Server connector
description: Includes basic information about products that use the connector, supported authentication types, prerequisites, and connection instructions.
author: cpopell
ms.service: powerquery
ms.topic: conceptual
ms.date: 12/12/2019
ms.author: gepopell
LocalizationGroup: reference
---

# SQL Server
 
## Summary
 
Release State: General Availability

Products: Power BI Desktop, Power BI Service (Enterprise Gateway), Dataflows in PowerBI.com (Enterprise Gateway), Dataflows in PowerApps.com (Enterprise Gateway), Excel, Flow

Authentication Types Supported: Database (Username/Password), Windows

[M Function Reference](https://docs.microsoft.com/powerquery-m/sql-database)

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.
 
## Prerequisites
By default, Power BI installs an OLE DB driver for SQL Server. However, for optimal performance, we recommend that the customer installs the [SQL Server Native Client](https://docs.microsoft.com/sql/relational-databases/native-client/applications/installing-sql-server-native-client) before using the SQL Server connector. SQL Server Native Client 11.0 and SQL Server Native Client 10.0 are both supported in the latest version.

 
## Capabilities Supported
* Import
* DirectQuery (Power BI only, learn more)
* Advanced options
    * Command timeout in minutes
    * Native SQL statement
    * Relationship columns
    * Navigate using full hierarchy
    * SQL Server failover support
    
## Connect to SQL Server database
To make the connection, take the following steps:
 
1.  From the Power Query **Get Data** dialog (or **Data** tab in the Excel ribbon), select **Database > SQL Server database**.
 
![SQL Server database connection builder in Power BI](../images/SQLServerBuilder.png)
 
2. In the **SQL Server database** dialog that appears, provide the name of the server and database (optional). Optionally, you may provide a command timeout and a native query (SQL statement), as well as select whether or not you want to include relationship columns and navigate using full hierarchy. Once you're done, select **Connect**.
3. Select the authentication type and input those credentials in the dialogue when prompted.

![SQL Server database authentication](../images/SQLServerAuth.png)

>[!Note]
> If the connection is not encrypted, you'll be prompted with the following dialog.

![SQL Server database encryption support](../images/EncryptionWarning.png)

Select **OK** to connect to the database by using an unencrypted connection, or follow the [instructions](https://docs.microsoft.com/sql/database-engine/configure-windows/enable-encrypted-connections-to-the-database-engine) to setup encrypted connections to SQL Server.

## Troubleshooting

### Always Encrypted columns

Power Query doesn't support 'Always Encrypted' columns.

## Next steps

[Optimize Power Query when expanding table columns](../optimize-expanding-table-columns.md)
