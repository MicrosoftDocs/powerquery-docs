---
title: Power Query Sybase database connector
description: Provides basic information and prerequisites for the connector, and instructions on how to connect to your Sybase database.
author: whhender
ms.topic: concept-article
ms.date: 1/24/2024
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Sybase database

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Excel<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Database<br/>Windows |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

[!INCLUDE [Includes_sybase-database_prerequisites](includes/sybase-database/sybase-database-prerequisites.md)]

## Capabilities Supported

[!INCLUDE [Includes_sybase-database_capabilities-supported](includes/sybase-database/sybase-database-capabilities-supported.md)]

## Connect to a Sybase database from Power Query Desktop

To make the connection, take the following steps:

1. Select the **Sybase database** option from **Get Data**. More information: [Where to get data](../where-to-get-data.md)

2. Specify the Sybase server to connect to in **Server** and the database where your data is stored in **Database**.

   :::image type="content" source="./media/sybase-database/connection-settings.png" alt-text="Enter the Sybase database connection.":::

3. Select **OK**.

4. If this is the first time you're connecting to this Sybase server and database, select the authentication type you want to use, enter your credentials, and then select **Connect**. For more information about using and managing authentication, go to [Authentication with a data source](../connectorauthentication.md).

   :::image type="content" source="./media/sybase-database/enter-credentials.png" alt-text="Enter your Sybase database credentials.":::

5. In **Navigator**, select the data you require, then either select **Load** to load the data or **Transform Data** to transform the data.

   :::image type="content" source="./media/sybase-database/navigator-desktop.png" lightbox="./media/sybase-database/navigator-desktop.png" alt-text="Select the data you require from the database":::
## Connect to a Sybase database from Power Query Online

[!INCLUDE [Includes_sybase-database_connect-to-power-query-online](includes/sybase-database/sybase-database-connect-to-power-query-online.md)]

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
