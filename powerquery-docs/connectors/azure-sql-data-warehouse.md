---
title: Power Query Azure Synapse Analytics (SQL DW) connector
description: Provides basic information, prerequisites, and supported capabilities for the connector, and instructions on how to connect to your database using the connector.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 10/9/2024
ms.author: dougklo
ms.subservice: connectors
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

    :::image type="content" source="./media/azure-sql-database/signin.png" alt-text="Screenshot of the SQL Server database dialog where you enter Azure Synapse Analytics (SQL DW) connection.":::

3. Select either the **Import** or **DirectQuery** data connectivity mode.

   You can also select and enter advanced options that modify the connection query, such as a command timeout or a native query (SQL statement). More information: [Connect using advanced options](#connect-using-advanced-options)

4. Select **OK**.

5. If you're connecting to this database for the first time, select the authentication type, input your credentials, and select the level to apply the authentication settings to. Then select **Connect**.

   :::image type="content" source="./media/azure-sql-database/enter-credentials.png" alt-text="Screenshot of the authentication dialog for Azure Synapse Analytics (SQL DW) authentication.":::

   > [!NOTE]
   > Although the Windows authentication type is displayed, Azure Synapse Analytics SQL doesn't support the Windows authentication type. Use either the **Database** or the **Microsoft account** authentication types.

   For more information about authentication methods, go to [Authentication with a data source](../connectorauthentication.md).

6. In **Navigator**, select the database information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

## Connect to Azure Synapse Analytics (SQL DW) from Power Query Online

To make the connection from Power Query Online:

1. Select the **Azure Synapse Analytics (SQL DW)** option in the connector selection.

2. In the **Azure Synapse Analytics (SQL DW)** dialog that appears, provide the name of the server and database (optional). In this example, `testazuresqlserver` is the server name and `AdventureWorks2012` is the database.

   :::image type="content" source="./media/azure-sql-database/dw-service-signin.png" alt-text="Screenshot of the Connect to data source page where you enter the online connection information.":::

   You can also select and enter advanced options that modify the connection query, such as a command timeout or a native query (SQL statement). More information: [Connect using advanced options](#connect-using-advanced-options)

3. If you're connecting to this database for the first time, select the authentication kind and input your credentials.

4. Select **Next** to continue.

5. In **Navigator**, select the data you require, and then select **Transform data**.

## Connect using advanced options

Both Power Query Desktop and Power Query Online provide a set of advanced options that you can add to your query if needed.

:::image type="content" source="./media/azure-sql-database/advanced-options.png" alt-text="Screenshot of the advanced options available for the connector in Power Query.":::

The following table lists all of the advanced options you can set in Power Query Desktop and Power Query Online.

| Advanced option | Description |
| --------------- | ----------- |
| Command timeout in minutes | If your connection lasts longer than 10 minutes (the default timeout), you can enter another value in minutes to keep the connection open longer. |
| SQL statement | For information, go to [Import data from a database using native database query](../native-database-query.md). |
| Include relationship columns | If checked, includes columns that might have relationships to other tables. If this box is cleared, you don’t see those columns. |
| Navigate using full hierarchy | If checked, the navigator displays the complete hierarchy of tables in the database you're connecting to. If cleared, the navigator displays only the tables whose columns and rows contain data. |
| Enable SQL Server Failover support | If checked, when a node in the Azure SQL [failover group](/azure/azure-sql/database/auto-failover-group-overview?tabs=azure-powershell) isn't available, Power Query moves from that node to another when failover occurs. If cleared, no failover occurs. |
| Enable cross database folding | This option is only available in Power Query Online. |

Once you select the advanced options you require, select **OK** in Power Query Desktop or **Next** in Power Query Online to connect to Azure Synapse Analytics.

## Troubleshooting

### Always Encrypted columns

Power Query doesn't support 'Always Encrypted' columns.
