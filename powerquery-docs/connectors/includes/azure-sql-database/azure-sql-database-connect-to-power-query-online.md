---
title: Include file for the Connect to Power Query Online section of the Power Query Azure SQL database connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query Azure SQL database connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

To connect to an Azure SQL database from Power Query Online, take the following steps:

1. Select the **Azure SQL database** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../../../where-to-get-data.md).

   :::image type="content" source="../../media/azure-sql-database/get-data-online.png" alt-text="Screenshot of the get data window with Azure SQL database emphasized.":::

2. In **Azure SQL database**, provide the name of the server and database.

   :::image type="content" source="../../media/azure-sql-database/service-signin.png" alt-text="Screenshot of entering the Azure SQL database online connection.":::

   You can also select and enter advanced options that will modify the connection query, such as a command timeout or a native query (SQL statement). More information: [Connect using advanced options](#connect-using-advanced-options)

3. If this is the first time you're connecting to this database, select the authentication kind and input your credentials.

4. If necessary, select the name of your on-premises data gateway.

5. If the connection is not encrypted, clear the **Use Encrypted Connection** check box.

6. Select **Next** to continue.

7. In **Navigator**, select the data you require, and then select **Transform data**.

   :::image type="content" source="../../media/azure-sql-database/navigator-online.png" alt-text="Screenshot of Power Query Online Navigator showing the Human Resources employee data.":::

