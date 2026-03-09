---
title: Include file for the Connect to Power Query Online section of the Power Query Sybase database connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query Sybase database connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

To make the connection, take the following steps:

1. Select the **Sybase database** option in the **Choose data source** page. More information: [Where to get data](../../../where-to-get-data.md)

2. Specify the Sybase server to connect to in **Server** and the database where your data is stored in **Database**.

3. Select the name of your on-premises data gateway.

   > [!NOTE]
   > You must select an on-premises data gateway for this connector, whether the Sybase database is on your local network or online.

4. If this is the first time you're connecting to this Sybase server and database, select the type of credentials for the connection in **Authentication kind**. Choose **Basic** if you plan to use an account that's created in the Sybase database instead of Windows authentication.  For more information about using and managing authentication, go to [Authentication with a data source](../../../connector-authentication.md).

5. Enter your credentials.

6. Select **Use Encrypted Connection** if you want to use an encrypted connection, or clear the option if you want to use an unencrypted connection.

   :::image type="content" source="../../media/sybase-database/data-source-online.png" lightbox="../../media/sybase-database/data-source-online.png" alt-text="Screenshot of the connect to data source page for the Sybase database online connection, showing a server value of test.corp.contoso.com.":::
7. Select **Next** to continue.

8. In **Navigator**, select the data you require, then select **Transform data** to transform the data in the Power Query editor.

