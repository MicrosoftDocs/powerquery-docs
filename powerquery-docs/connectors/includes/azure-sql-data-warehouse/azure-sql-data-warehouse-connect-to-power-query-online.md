---
title: Include file for the Connect to Power Query Online section of the Power Query Azure Synapse Analytics (SQL DW) connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query Azure Synapse Analytics (SQL DW) connector documentation
ms.date: 03/06/2026
ms.topic: include
---

To make the connection from Power Query Online:

1. Select the **Azure Synapse Analytics (SQL DW)** option in the connector selection.

2. In the **Azure Synapse Analytics (SQL DW)** dialog that appears, provide the name of the server and database (optional). In this example, `testazuresqlserver` is the server name and `AdventureWorks2012` is the database.

   :::image type="content" source="/power-query/connectors/media/azure-sql-database/dw-service-signin.png" alt-text="Screenshot of the Connect to data source page where you enter the online connection information.":::

   You can also select and enter advanced options that modify the connection query, such as a command timeout or a native query (SQL statement). More information: [Connect using advanced options](/power-query/connectors/azure-sql-data-warehouse#connect-using-advanced-options)

3. If you're connecting to this database for the first time, select the authentication kind and input your credentials.

4. Select **Next** to continue.

5. In **Navigator**, select the data you require, and then select **Transform data**.

