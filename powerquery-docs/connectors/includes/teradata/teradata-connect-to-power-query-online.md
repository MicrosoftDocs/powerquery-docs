---
title: Include file for the Connect to Power Query Online section of the Power Query Teradata database connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query Teradata database connector documentation
ms.date: 03/06/2026
ms.topic: include
---

To make the connection, take the following steps:

1. Select the **Teradata database** option in the **Choose data source** page. More information: [Where to get data](/power-query/where-to-get-data)

2. Specify the Teradata server to connect to in **Server**.

3. Select the name of your on-premises data gateway.

   > [!NOTE]
   > You must select an on-premises data gateway for this connector, whether the Teradata database is on your local network or online.

4. If this is the first time you're connecting to this Teradata database, select the type of credentials for the connection in **Authentication kind**. Choose **Basic** if you plan to use an account that's created in the Teradata database instead of Windows authentication. For more information about using and managing authentication, go to [Authentication with a data source](/power-query/connector-authentication).

5. Enter your credentials.

6. Select **Use Encrypted Connection** if you want to use an encrypted connection, or clear the option if you want to use an unencrypted connection.

   :::image type="content" source="/power-query/connectors/media/teradata-database/data-source-online.png" alt-text="Screenshot of the connect to data sources screen for a Teradata database online connection, showing contoso.teradata.ws as the example server.":::

7. Select **Next** to continue.

8. In **Navigator**, select the data you require, then select **Transform data** to transform the data in the Power Query editor.

   :::image type="content" source="/power-query/connectors/media/teradata-database/navigator-online.png" lightbox="/power-query/connectors/media/teradata-database/navigator-online.png" alt-text="Screenshot of the navigator, with a table selected as an example.":::
