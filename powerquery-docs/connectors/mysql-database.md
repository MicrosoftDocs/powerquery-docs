---
title: Power Query MySQL database connector
description: Provides basic information about products that use the connector, supported authentication types, prerequisites, and connection instructions.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 1/24/2024
ms.author: dougklo
ms.subservice: connectors
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
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

You need to install the [Oracle MySQL Connector/NET](https://dev.mysql.com/downloads/connector/net/) package prior to using this connector in Power BI Desktop. For Power Query Online (dataflows) or Power BI service, if your MySQL server is not cloud accessible and an on-premises data gateway is needed, the component Oracle MySQL Connector/NET must also be correctly installed on the machine running the on-premises data gateway. To determine if the package has installed correctly, open a PowerShell window and run the following command:

`[System.Data.Common.DbProviderFactories]::GetFactoryClasses()|ogv`

If the package is installed correctly, the MySQL Data Provider is displayed in the resulting dialog. For example:

:::image type="content" source="./media/mysql-database/data-provider.png" alt-text="Screenshot of the data provider dialog with the MySQL data provider emphasized." lightbox="./media/mysql-database/data-provider.png":::

If the package doesn't install correctly, work with your MySQL support team or reach out to MySQL.

> [!NOTE]
> The MySQL connector isn't supported on the **Personal Mode** of the on-premises data gateway. It's only supported on the on-premises data gateway **(standard mode)**

## Capabilities Supported

* Import
* Advanced options
  * Command timeout in minutes
  * Native SQL statement
  * Relationship columns
  * Navigate using full hierarchy

## Connect to MySQL database from Power Query Desktop

To make the connection, take the following steps:

1. Select the **MySQL database** option in the connector selection. More information: [Where to get data](../where-to-get-data.md)

2. In the **MySQL database** dialog, provide the name of the server and database.

   :::image type="content" source="./media/mysql-database/signin.png" alt-text="Screenshot of the MySQL database connection dialog.":::

3. Select the **Database** authentication type and input your MySQL credentials in the **User name** and **Password** boxes.

   :::image type="content" source="./media/mysql-database/enter-credentials.png" alt-text="Screenshot of the authentication dialog with the Database authentication kind selected.":::

4. Select the level to apply your credentials to.

5. Once you're done, select **OK**.

   > [!NOTE]
   > If the connection isn't encrypted, you'll be prompted with the following dialog.

   :::image type="content" source="./media/mysql-database/encryption-warning.png" alt-text="Screenshot of the encryption support dialog asking whether to use an unencrypted connection.":::

   Select **OK** to connect to the database by using an unencrypted connection, or follow the [instructions](/sql/database-engine/configure-windows/enable-encrypted-connections-to-the-database-engine) to set up encrypted connections to SQL Server.

6. In **Navigator**, select the data you require, then either load or transform the data.

   :::image type="content" source="./media/mysql-database/navigator.png" alt-text="Screenshot of the Navigator, with one item selected and the selection's data displayed." lightbox="./media/mysql-database/navigator.png":::

## Connect to MySQL database from Power Query Online

To make the connection, take the following steps:

1. Select the **MySQL database** option in the connector selection. More information: [Where to get data](../where-to-get-data.md)

2. In the **MySQL database** dialog, provide the name of the server and database.  

   :::image type="content" source="./media/mysql-database/service-signin.png" alt-text="Screenshot of the Connection settings dialog with server and database sample entries filled in.":::

3. If the MySQL server is not accessible from the cloud, include the name of your on-premises data gateway (personal mode is not supported).

4. Select the **Basic** authentication kind and input your MySQL credentials in the **Username** and **Password** boxes.

5. If your connection isn't encrypted, clear **Use Encrypted Connection**.

6. Select **Next** to connect to the database.

7. In **Navigator**, select the data you require, then select **Transform data** to transform the data in Power Query Editor.

## Connect using advanced options

Power Query provides a set of advanced options that you can add to your query if needed.

The following table lists all of the advanced options you can set in Power Query Desktop.

| Advanced option | Description |
| --------------- | ----------- |
| Command timeout in minutes | If your connection lasts longer than 10 minutes (the default timeout), you can enter another value in minutes to keep the connection open longer. |
| SQL statement | For information, go to [Import data from a database using native database query](../native-database-query.md). |
| Include relationship columns | If checked, includes columns that might have relationships to other tables. If this box is cleared, those columns aren't included. |
| Navigate using full hierarchy | If checked, the navigator displays the complete hierarchy of tables in the database you're connecting to. If cleared, the navigator displays only the tables whose columns and rows contain data. |

Once you've selected the advanced options you require, select **OK** in Power Query Desktop or **Next** in Power Query Online to connect to your MySQL database.

## Limitations

The following limitations apply to the Power Query MySQL database connector.

### MySQL connections cannot be used with personal gateways.

If the MySQL database is not accessible from the cloud, configure MySQL on-premises connections by upgrading to an Enterprise Gateway instead of using a personal On-premises Data Gateway. For cloud-based MySQL servers, a gateway is not required.

### It is not possible to mashup MySQL on-premises data with R and Python. 

For cases where Python or R is used with a MySQL database on-premises connection, use one of the following methods:

- Make the MySQL server database accessible from the cloud.
- Move the MySQL on-premises data to a different dataset and use the Enterprise Gateway exclusively for that purpose. 
