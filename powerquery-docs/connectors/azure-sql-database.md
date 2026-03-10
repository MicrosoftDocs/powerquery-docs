---
title: Power Query Azure SQL database connector
description: Includes basic information and prerequisites, instructions on how to connect to your database, and information about advanced connection options.
author: whhender
ms.topic: concept-article
ms.date: 2/16/2024
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Azure SQL database

## Summary

| Item | Description |
| ------- | ------------|
|Release state | General Availability |
| Products supported | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Excel<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication types supported| Windows (Power BI Desktop, Excel, Power Query Online with gateway)<br/>Database (Power BI Desktop, Excel)<br/>Microsoft Account (all)<br/> Basic (Power Query Online)<br/>Service Principal |
| Function reference docs | [Sql.Database](/powerquery-m/sql-database)<br/>[Sql.Databases](/powerquery-m/sql-databases) |

> [!NOTE]
>The service principal authentication type isn't supported when using an on-premises data gateway or a virtual network (VNet) data gateway.

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

[!INCLUDE [Includes_azure-sql-database_prerequisites](includes/azure-sql-database/azure-sql-database-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_azure-sql-database_capabilities-supported](includes/azure-sql-database/azure-sql-database-capabilities-supported.md)]

## Connect to Azure SQL database from Power Query Desktop

To connect to an Azure SQL database from Power Query Desktop, take the following steps:

1. Select **Azure SQL database** in the get data experience. The get data experience in Power Query Desktop varies between apps. For more information about the Power Query Desktop get data experience for your app, go to [Where to get data](../where-to-get-data.md).

2. In **SQL Server database**, provide the name of the server and database (optional).

   :::image type="content" source="./media/azure-sql-database/signin.png" alt-text="Enter Azure SQL database connection.":::

3. Select either the **Import** or **DirectQuery** data connectivity mode.

4. Optionally, you can select and enter advanced options that will modify the connection query, such as a command timeout or a native query (SQL statement). For information: [Connect using advance options](#connect-using-advanced-options)

5. Select **OK**.

6. If this is the first time you're connecting to this database, select the authentication type, input your credentials, and select the level to apply the authentication settings to. Then select **Connect**.

   :::image type="content" source="./media/azure-sql-database/enter-credentials.png" alt-text="Azure SQL database authentication.":::

   For more information about authentication methods, go to [Authentication with a data source](../connectorauthentication.md).

   > [!NOTE]
   >  If the connection is not encrypted, you'll be prompted with the following message.

   :::image type="content" source="./media/azure-sql-database/encryption-warning.png" alt-text="Azure SQL database encryption support.":::

   Select **OK** to connect to the database by using an unencrypted connection, or follow the instructions in [Enable encrypted connections to the Database Engine](/sql/database-engine/configure-windows/enable-encrypted-connections-to-the-database-engine) to set up encrypted connections to Azure SQL database.

7. In **Navigator**, select the database information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

   :::image type="content" source="./media/azure-sql-database/navigator-desktop.png" alt-text="Power Query Desktop Navigator showing the Human Resources employee data.":::

## Connect to Azure SQL database from Power Query Online

[!INCLUDE [Includes_azure-sql-database_connect-to-power-query-online](includes/azure-sql-database/azure-sql-database-connect-to-power-query-online.md)]

## Connect using advanced options

Both Power Query Desktop and Power Query Online provide a set of advanced options that you can add to your query if needed.

:::image type="content" source="./media/azure-sql-database/advanced-options.png" alt-text="Display of advanced options available in Power Query.":::

The following table lists all of the advanced options you can set in Power Query Desktop and Power Query Online.

| Advanced option | Description |
| --------------- | ----------- |
| Command timeout in minutes | If your connection lasts longer than 10 minutes (the default timeout), you can enter another value in minutes to keep the connection open longer. This option is only available in Power Query Desktop. |
| SQL statement | For information, go to [Import data from a database using native database query](../native-database-query.md). |
| Include relationship columns | If checked, includes columns that might have relationships to other tables. If this box is cleared, you won’t see those columns. |
| Navigate using full hierarchy | If checked, the navigator displays the complete hierarchy of tables in the database you're connecting to. If cleared, the navigator displays only the tables whose columns and rows contain data. |
| Enable SQL Server Failover support | If checked, when a node in the Azure SQL [failover group](/azure/azure-sql/database/auto-failover-group-overview?tabs=azure-powershell) isn't available, Power Query moves from that node to another when failover occurs. If cleared, no failover occurs. |

Once you've selected the advanced options you require, select **OK** in Power Query Desktop or **Next** in Power Query Online to connect to your Azure SQL database.

## Troubleshooting

### Always Encrypted columns

Power Query doesn't support 'Always Encrypted' columns.
