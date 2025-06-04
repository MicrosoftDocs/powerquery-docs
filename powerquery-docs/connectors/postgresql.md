---
title: Power Query PostgreSQL connector
description: Provides basic information, prerequisites, and instructions on how to connect to your database, along with native query folding instructions and troubleshooting tips.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 6/4/2025
ms.author: dougklo
ms.subservice: connectors
---

# PostgreSQL

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Database (Username/Password) |
| Function Reference Documentation | [PostgreSQL.Database](/powerquery-m/postgresql-database) |

> [!NOTE]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

Power BI Desktop has included the Npgsql provider for PostgreSQL connector since December 2019, eliminating the need for additional installation. Starting with the October 2024 version, it incorporates Npgsql version 4.0.17. Separate Npgsql GAC installation will override this default version.

The PostgreSQL connector is supported for cloud connection and via VNet data gateway or on-premises data gateway. Since the June 2025 release, the on-premises data gateway includes the Npgsql provider, so no extra installation is needed. Separate Npgsql GAC installation will override this default version.

For Power BI Desktop versions released before December 2019 and on-premises data gateway released before June 2025, you must install the Npgsql provider on your local machine to use the PostgreSQL connector. To install the Npgsql provider, go to the [releases page](https://github.com/Npgsql/Npgsql/releases), search for the latest v4.0.x version, and download and run the .msi file. The provider architecture (32-bit or 64-bit) needs to match the architecture of the product where you intend to use the connector. When installing, make sure that you select Npgsql GAC Installation to ensure Npgsql itself is added to your machine. When installing the Npqsql, we recommend version 4.0.17. **Npgsql 4.1 and up won't work due to .NET version incompatibilities.**

:::image type="content" source="media/postgresql/postgres-1.png" alt-text="Screenshot of the Npgsql installer with GAC Installation selected.":::

## Capabilities Supported

- Import
- DirectQuery (Power BI semantic models)
- Advanced options
  - Command timeout in minutes
  - Native SQL statement
  - Relationship columns
  - Navigate using full hierarchy

## Connect to a PostgreSQL database from Power Query Desktop

Once the matching Npgsql provider is installed, you can connect to a PostgreSQL database. To make the connection, take the following steps:

1. Select the **PostgreSQL database** option in the connector selection. For more information, go to [Where to get data](../where-to-get-data.md).

2. In the **PostgreSQL database** dialog that appears, provide the name of the server and database.

   :::image type="content" source="./media/postgresql/server-name-database.png" alt-text="Screenshot of the PostgreSQL connection builder in Power BI.":::

3. Select either the **Import** or **DirectQuery** data connectivity mode.

4. If you're connecting to this database for the first time, input your PostgreSQL credentials in the **User name** and **Password** boxes of the **Database** authentication type. Select the level to apply the authentication settings to. Then select **Connect**.

    :::image type="content" source="./media/postgresql/sign-in-desktop.png" alt-text="Screenshot of the authentication dialog where you enter your PostgreSQL user name and password.":::

   For more information about using authentication methods, go to [Authentication with a data source](../connectorauthentication.md).

5. If the connection isn't encrypted, you're prompted with the following message.

   :::image type="content" source="./media/postgresql/encryption-warning.png" alt-text="Screenshot of the Azure SQL database encryption support dialog.":::

   Select **OK** to connect to the database by using an unencrypted connection, or follow the instructions in [Enable encrypted connections to the Database Engine](/sql/database-engine/configure-windows/enable-encrypted-connections-to-the-database-engine) to set up encrypted connections to PostgreSQL database.

6. In **Navigator**, select the database information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query editor.

   :::image type="content" source="./media/postgresql/navigator-desktop.png" alt-text="Screenshot of the Power Query Desktop Navigator showing the Human Resources employee data in PostgreSQL database." lightbox="./media/postgresql/navigator-desktop.png":::

## Connect to a PostgreSQL database from Power Query Online

To make the connection, take the following steps:

1. Select the **PostgreSQL database** option in the connector selection. For more information, go to [Where to get data](../where-to-get-data.md).

2. In the **PostgreSQL database** dialog that appears, provide the name of the server and database.

   :::image type="content" source="./media/postgresql/server-name-online.png" alt-text="PostgreSQL connection builder in Power Query Online.":::

3. Select the name of the on-premises data gateway you want to use.

4. Select the **Basic** authentication kind and input your PostgreSQL credentials in the **Username** and **Password** boxes.

5. If your connection isn't encrypted, clear **Use Encrypted Connection**.

6. Select **Next** to connect to the database.

7. In **Navigator**, select the data you require, then select **Transform data** to transform the data in Power Query editor.

## Connect using advanced options

Power Query Desktop provides a set of advanced options that you can add to your query if needed.

:::image type="content" source="./media/postgresql/postgresql-advanced-options.png" alt-text="Screenshot of the advanced options included in the PostgreSQL connection dialog box.":::

The following table lists all of the advanced options you can set in Power Query Desktop.

| Advanced option | Description |
| --------------- | ----------- |
| Command timeout in minutes | If your connection lasts longer than 10 minutes (the default time-out), you can enter another value in minutes to keep the connection open longer. This option is only available in Power Query Desktop. |
| SQL statement | For information, go to [Import data from a database using native database query](../native-database-query.md). |
| Include relationship columns | If checked, includes columns that might have relationships to other tables. If this box is cleared, those columns aren't displayed. |
| Navigate using full hierarchy | If checked, the navigator displays the complete hierarchy of tables in the database you're connecting to. If cleared, the navigator displays only the tables whose columns and rows contain data. |

Once you select the advanced options you require, select **OK** in Power Query Desktop to connect to your PostgreSQL database.

## Native query folding

By default, native query folding is enabled. Operations that are capable of folding are applied on top of your native query according to normal Import or Direct Query logic. Native Query folding isn't applicable with optional parameters present in [Value.NativeQuery](/powerquery-m/value-nativequery).

In the rare case that folding doesn't work with native query folding enabled, you can disable it. To disable native query folding, set the `EnableFolding` flag to `false` for [Value.NativeQuery](/powerquery-m/value-nativequery) in the advanced editor.

Sample:
`Value.NativeQuery(target as any, query, null, [EnableFolding=false])`

## Troubleshooting

Your native query might throw the following error:

`We cannot fold on top of this native query. Please modify the native query or remove the 'EnableFolding' option.`

A basic troubleshooting step is to check if the query in [Value.NativeQuery](/powerquery-m/value-nativequery) throws the same error with a `limit 1` clause around it:

`select * from (query) _ limit 1`
