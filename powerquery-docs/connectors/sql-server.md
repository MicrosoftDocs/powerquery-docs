---
title: Power Query SQL Server connector
description: Includes basic information about products that use the connector, supported authentication types, prerequisites, and connection instructions.
author: whhender
ms.topic: concept-article
ms.date: 10/22/2025
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# SQL Server

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Database/Basic (Username/Password)<br/>Windows<br/>Organizational account (if the specified server supports it)<br/>Service principal |
| M Function Reference | [Sql.Database](/powerquery-m/sql-database)<br/>[Sql.Databases](/powerquery-m/sql-databases) |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities Supported

* Import
* DirectQuery (Power BI semantic models)
* Advanced options
  * Command timeout in minutes
  * Native SQL statement
  * Relationship columns
  * Navigate using full hierarchy
  * SQL Server failover support

## Connect to SQL Server database from Power Query Desktop

To make the connection, take the following steps:

1. Select the **SQL Server database** option in the connector selection. For more information, go to [Where to get data](../where-to-get-data.md).

2. In the **SQL Server database** dialog that appears, provide the name of the server and database (optional).

   :::image type="content" source="./media/sql-server-database/select-database-desktop.png" alt-text="Screenshot of the SQL Server database connection builder in Power Query Desktop.":::

3. Select either the **Import** or **DirectQuery** data connectivity mode (Power BI Desktop only).

4. Select **OK**.

5. If you're connecting to this database for the first time, select the authentication type, input your credentials, and select the level to apply the authentication settings to. Then select **Connect**.

   :::image type="content" source="./media/sql-server-database/signin-desktop.png" alt-text="Screenshot of the SQL Server database authentication.":::

   > [!NOTE]
   > If the connection isn't encrypted, you're prompted with the following dialog.

   :::image type="content" source="./media/sql-server-database/encryption-warning.png" alt-text="Screenshot of the SQL Server database encryption support warning.":::

    Select **OK** to connect to the database by using an unencrypted connection, or follow these [instructions](/sql/database-engine/configure-windows/enable-encrypted-connections-to-the-database-engine) to set up encrypted connections to SQL Server. Additionally, when encryption is enabled for SQL servers using self-signed certificates, review this [section](#sql-server-certificate-isnt-trusted-on-the-client-power-bi-desktop-or-on-premises-data-gateway) to add the SQL servers to the Power Query Desktop client's trust list.

6. In **Navigator**, select the database information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in the Power Query editor.

   :::image type="content" source="./media/sql-server-database/navigator-desktop.png" alt-text="Screenshot of the Power Query Navigator showing the employee data." lightbox="./media/sql-server-database/navigator-desktop.png":::

## Connect to SQL Server database from Power Query Online

To make the connection, take the following steps:

1. Select the **SQL Server database** option in the connector selection. For more information, go to [Where to get data](../where-to-get-data.md).

2. In the **SQL Server database** dialog that appears, provide the name of the server and database (optional).

   :::image type="content" source="./media/sql-server-database/select-database-online.png" alt-text="Screenshot of the SQL Server database connection builder in Power Query Online.":::

3. If the SQL server isn't online, select an on-premises data gateway. Additionally, if using the port with servername, use the value `servername*` as the server name in the connection settings.

4. If you're connecting to this database for the first time, select the authentication kind and input your credentials.

5. If the connection isn't encrypted, and the connection dialog contains a **Use Encrypted Connection** check box, clear the check box.

6. Select **Next** to continue.

7. In **Navigator**, select the data you require, and then select **Transform data**.

   :::image type="content" source="./media/sql-server-database/navigator-online.png" alt-text="Screenshot of the Power Query Online Navigator showing the Human Resources employee data." lightbox="./media/sql-server-database/navigator-online.png":::

## Connect using advanced options

Both Power Query Desktop and Power Query Online provide a set of advanced options that you can add to your query if needed. The following table lists all of the advanced options you can set in Power Query Desktop and Power Query Online.

| Advanced option | Description |
| --------------- | ----------- |
| Command timeout in minutes | If your connection lasts longer than 10 minutes (the default time out), you can enter another value in minutes to keep the connection open longer. |
| SQL statement | For information, go to [Import data from a database using native database query](../native-database-query.md). |
| Include relationship columns | If checked, includes columns that might have relationships to other tables. If this box is cleared, you can't see those columns. |
| Navigate using full hierarchy | If checked, the Navigator displays the complete hierarchy of tables in the database you're connecting to. If cleared, Navigator displays only the tables whose columns and rows contain data. |
| Enable SQL Server failover support | If checked, when a node in the SQL Server [failover group](/sql/sql-server/failover-clusters/windows/windows-server-failover-clustering-wsfc-with-sql-server) isn't available, Power Query moves from that node to another when failover occurs. If cleared, no failover occurs. This option is only available in Power Query Online.|
| Enable cross database folding | This option is only available in Power Query Online. |

Once you select the advanced options you require, select **OK** in Power Query Desktop or **Next** in Power Query Online to connect to your SQL Server database.

## Limitations

### SQL Server certificate isn't trusted on the client (Power BI Desktop or on-premises data gateway)

When establishing a connection to an on-premises SQL Server using the on-premises data gateway or Power BI Desktop and the SQL Server utilizes a self-signed certificate, it's possible that the refresh operation for a Fabric semantic model or dataflow can fail with the following error message:

```Microsoft SQL: A connection was successfully established with the server, but then an error occurred during the login process. (provider: SSL Provider, error: 0 - The certificate chain was issued by an authority that is not trusted.)```

To troubleshoot this error when using on-premises data gateway, change the gateway configurations to update the `SqlTrustedServers` setting using the following steps:

1. On the local machine where the on-premises data gateway is installed, navigate to **C:\Program Files\On-premises data gateway**.
2. Make a backup of the configuration file named **Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config**.
3. Open the original **Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config** configuration file and locate the `SqlTrustedServers` entry.
4. Update the `SqlTrustedServers` value with the names of the SQL servers to trust and connect to.

   The value contains a comma-delimited list of server names and supports **\*** as a wild card. So for instance in the following example:

   `<setting name="SqlTrustedServers" serializeAs="String"> <value>contososql*,mysvr</value> </setting>`

   the value `contososql*,mysvr` matches `contososql6`, `contososqlazure`, and `mysvr`, but doesn't match `mysvr.microsoft.com`.

To troubleshoot this error when using Power BI Desktop, modify the value of the environment variable `PBI_SQL_TRUSTED_SERVERS` to include the SQL Servers. The supported values are the same as outlined for gateway configuration (as described in step 4 above).

For connections to SQL Server from Power BI Desktop and on-premises data gateway versions starting with February 2025 or later, follow one of these options:

* Follow the solution mentioned previously to add the environment variable `PBI_SQL_TRUSTED_SERVERS`.
* Ask your SQL administrators to acquire a certificate from a well-known certificate authority.
* Change the setting `SqlTrustedServers` on the gateway config file.

### Always Encrypted columns

Power Query doesn't support 'Always Encrypted' columns.

### Microsoft Entra ID authentication

Microsoft Entra ID (Organizational account) authentication is only supported in the SQL Server connector if the specified server also supports Microsoft Entra ID authentication. Otherwise, you might encounter a `The OAuth authentication method isn't supported in this data source` error.

In Power BI service, the Microsoft Entra ID authentication method shows up as `OAuth2`.

## Related content

[Optimize Power Query when expanding table columns](../optimize-expanding-table-columns.md)
