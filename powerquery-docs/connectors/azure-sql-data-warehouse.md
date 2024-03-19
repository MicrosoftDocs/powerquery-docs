---
title: Power Query Azure Synapse Analytics (SQL DW) connector
description: Provides basic information, prerequisites, and supported capabilities for the connector, and instructions on how to connect to your database using the connector.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 2/16/2024
ms.author: dougklo
---

# Azure Synapse Analytics (SQL DW)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Database (Power BI Desktop, Excel)<br/>Microsoft Account (all)<br/>Basic (online service)<br/>Service principal |
| Function Reference Documentation | [Sql.Database](/powerquery-m/sql-database)<br/>[Sql.Databases](/powerquery-m/sql-databases) |

> [!NOTE]
>The service principal authentication type isn't supported when using an on-premises data gateway or a virtual network (VNet) data gateway.

> [!NOTE]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

By default, Power BI installs an OLE DB driver for Azure Synapse Analytics (SQL DW). However, for optimal performance, we recommend that the customer installs the [SQL Server Native Client](/sql/relational-databases/native-client/applications/installing-sql-server-native-client) before using the Azure Synapse Analytics (SQL DW) connector. SQL Server Native Client 11.0 and SQL Server Native Client 10.0 are both supported in the latest version.

## Capabilities Supported

* Import
* DirectQuery (Power BI semantic models)
* Advanced options
  * Command timeout in minutes
  * Native SQL statement
  * Relationship columns
  * Navigate using full hierarchy
  * SQL Server failover support
  * Enable cross database folding

## Connect to Azure Synapse Analytics (SQL DW) from Power Query Desktop

To make the connection from Power Query Desktop:

1. Select the **Azure Synapse Analytics SQL** option in the connector selection.

2. In the **SQL Server database** dialog that appears, provide the name of the server and database (optional). In this example, `TestAzureSQLServer` is the server name and `AdventureWorks2012` is the database.

    :::image type="content" source="./media/azure-sql-database/signin.png" alt-text="Enter Azure Synapse Analytics (SQL DW) connection.":::

3. Select either the **Import** or **DirectQuery** data connectivity mode.

   You can also select and enter advanced options that will modify the connection query, such as a command timeout or a native query (SQL statement). More information: [Connect using advanced options](#connect-using-advanced-options)

4. Select **OK**.

5. If this is the first time you're connecting to this database, select the authentication type, input your credentials, and select the level to apply the authentication settings to. Then select **Connect**.

   :::image type="content" source="./media/azure-sql-database/enter-credentials.png" alt-text="Azure Synapse Analytics (SQL DW) authentication.":::

   > [!NOTE]
   > Although the Windows authentication type is displayed, Azure Synapse Analytics SQL doesn't support the Windows authentication type. Use either the **Database** or the **Microsoft account** authentication types.

   For more information about authentication methods, go to [Authentication with a data source](../connectorauthentication.md).

   If the connection is not encrypted, you'll be prompted with the following dialog.

   :::image type="content" source="./media/azure-sql-database/encryption-warning.png" alt-text="Azure Synapse Analytics (SQL DW) encryption support.":::

   Select **OK** to connect to the database by using an unencrypted connection, or follow the instructions in [Enable encrypted connections to the Database Engine](/sql/database-engine/configure-windows/enable-encrypted-connections-to-the-database-engine) to set up encrypted connections to Azure Synapse Analytics (SQL DW).

6. In **Navigator**, select the database information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

## Connect to Azure Synapse Analytics (SQL DW) from Power Query Online

To make the connection from Power Query Online:

1. Select the **Azure Synapse Analytics (SQL DW)** option in the connector selection.

2. In the **Azure Synapse Analytics (SQL DW)** dialog that appears, provide the name of the server and database (optional). In this example, `TestAzureSQLServer` is the server name and `AdventureWorks2012` is the database.

   :::image type="content" source="./media/azure-sql-database/dw-service-signin.png" alt-text="Enter Data Warehouse online connection.":::

   You can also select and enter advanced options that will modify the connection query, such as a command timeout or a native query (SQL statement). More information: [Connect using advanced options](#connect-using-advanced-options)

3. If this is the first time you're connecting to this database, select the authentication kind and input your credentials.

4. If required, select the name of your on-premises data gateway.

5. If the connection is not encrypted, clear the **Use Encrypted Connection** check box.

6. Select **Next** to continue.

7. In **Navigator**, select the data you require, and then select **Transform data**.

## Connect using advanced options

Both Power Query Desktop and Power Query Online provide a set of advanced options that you can add to your query if needed.

:::image type="content" source="./media/azure-sql-database/advanced-options.png" alt-text="Display of advanced options available in Power Query.":::

The following table lists all of the advanced options you can set in Power Query Desktop and Power Query Online.

| Advanced option | Description |
| --------------- | ----------- |
| Command timeout in minutes | If your connection lasts longer than 10 minutes (the default timeout), you can enter another value in minutes to keep the connection open longer. |
| SQL statement | For information, go to [Import data from a database using native database query](../native-database-query.md). |
| Include relationship columns | If checked, includes columns that might have relationships to other tables. If this box is cleared, you won’t see those columns. |
| Navigate using full hierarchy | If checked, the navigator displays the complete hierarchy of tables in the database you're connecting to. If cleared, the navigator displays only the tables whose columns and rows contain data. |
| Enable SQL Server Failover support | If checked, when a node in the Azure SQL [failover group](/azure/azure-sql/database/auto-failover-group-overview?tabs=azure-powershell) isn't available, Power Query moves from that node to another when failover occurs. If cleared, no failover occurs. |
 Enable cross database folding | This option is only available in Power Query Online. |

Once you've selected the advanced options you require, select **OK** in Power Query Desktop or **Next** in Power Query Online to connect to Azure Synapse Analytics.

## Troubleshooting

### Always Encrypted columns

Power Query doesn't support 'Always Encrypted' columns.
