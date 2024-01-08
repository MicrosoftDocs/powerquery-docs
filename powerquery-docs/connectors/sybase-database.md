---
title: Power Query Sybase database connector
description: Provides basic information and prerequisites for the connector, and instructions on how to connect to your Sybase database.
author: bezhan-msft
ms.topic: conceptual
ms.date: 1/8/2024
ms.author: dougklo
---

# Sybase database

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Excel<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Database<br/>Windows |

> [!NOTE]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

Before you can connect to a Sybase database, you need the [SAP SQL Anywhere](https://scn.sap.com/docs/DOC-35857?d96a349c52fc4f68eea46a47ccb3d360) driver installed on your computer. Select the driver that matches your Excel installation (32-bit or 64-bit).

## Capabilities Supported

* Import
* Advanced options
  * Command timeout in minutes
  * SQL statement
  * Include relationship columns
  * Navigate using full hierarchy

## Connect to a Sybase database from Power Query Desktop

To make the connection, take the following steps:

1. Select the **Sybase database** option from **Get Data**. More information: [Where to get data](../where-to-get-data.md)

2. Specify the Sybase server to connect to in **Server** and the database where your data is stored in **Database**.

   ![Enter the Sybase database connection.](./media/sybase-database/connection-settings.png)

3. Select **OK**.

4. If this is the first time you're connecting to this Sybase server and database, select the authentication type you want to use, enter your credentials, and then select **Connect**. For more information about using and managing authentication, go to [Authentication with a data source](../connectorauthentication.md).

   ![Enter your Sybase database credentials.](./media/sybase-database/enter-credentials.png)

5. In **Navigator**, select the data you require, then either select **Load** to load the data or **Transform Data** to transform the data.

   [![Select the data you require from the database](./media/sybase-database/navigator-desktop.png)](./media/sybase-database/navigator-desktop.png#lightbox)

## Connect to a Sybase database from Power Query Online

To make the connection, take the following steps:

1. Select the **Sybase database** option in the **Choose data source** page. More information: [Where to get data](../where-to-get-data.md)

2. Specify the Sybase server to connect to in **Server** and the database where your data is stored in **Database**.

3. Select the name of your on-premises data gateway.

   > [!NOTE]
   > You must select an on-premises data gateway for this connector, whether the Sybase database is on your local network or online.

4. If this is the first time you're connecting to this Sybase server and database, select the type of credentials for the connection in **Authentication kind**. Choose **Basic** if you plan to use an account that's created in the Sybase database instead of Windows authentication.  For more information about using and managing authentication, go to [Authentication with a data source](../connectorauthentication.md).

5. Enter your credentials.

6. Select **Use Encrypted Connection** if you want to use an encrypted connection, or clear the option if you want to use an unencrypted connection.

   [![Enter Sybase database online connection.](./media/sybase-database/data-source-online.png)](./media/sybase-database/data-source-online.png#lightbox)

7. Select **Next** to continue.

8. In **Navigator**, select the data you require, then select **Transform data** to transform the data in the Power Query editor.

## Connect using advanced options

Power Query provides a set of advanced options that you can add to your query if needed.

The following table lists all of the advanced options you can set in Power Query.

| Advanced option | Description |
| --------------- | ----------- |
| Command timeout in minutes | If your connection lasts longer than 10 minutes (the default timeout), you can enter another value in minutes to keep the connection open longer. |
| SQL statement | For information, go to [Import data from a database using native database query](../native-database-query.md). |
| Include relationship columns | If checked, includes columns that might have relationships to other tables. If this box is cleared, you won’t see those columns. |
| Navigate using full hierarchy | If checked, the navigator displays the complete hierarchy of tables in the database you're connecting to. If cleared, the navigator displays only the tables whose columns and rows contain data. |

Once you've selected the advanced options you require, select **OK** in Power Query Desktop or **Next** in Power Query Online to connect to your Sybase database.
