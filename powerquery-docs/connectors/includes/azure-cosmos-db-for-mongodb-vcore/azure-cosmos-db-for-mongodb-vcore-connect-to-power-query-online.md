---
title: Include file for the Connect to Power Query Online section of the Azure Cosmos DB for MongoDB vCore Data Connector connector documentation
description: Include file for the Connect to Power Query Online section of the Azure Cosmos DB for MongoDB vCore Data Connector connector documentation
ms.date: 03/06/2026
ms.topic: include
---

To connect to Azure Cosmos DB for MongoDB vCore database from Power Query Online:

1. Select the **Azure Cosmos DB for MongoDB vCore** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](/power-query/where-to-get-data).

   :::image type="content" source="/power-query/connectors/media/azure-cosmos-db-for-mongodb-vcore/online-select-mongodb-vcore.png" alt-text="Screenshot showing Azure Cosmos DB for MongoDB vCore icon in Power Query online.":::

1. In the **Azure Cosmos DB for MongoDB vCore** dialog that appears, enter the Cosmos DB endpoint. Optionally provide a **Database Name** and a **Collection Name**. If a database name isn't provided, the upcoming **Navigator** screen shows all databases and their respective collections. Specifying both database and collection names only shows that collection. Specifying a collection name without a database name results in a connection error.

   :::image type="content" source="/power-query/connectors/media/azure-cosmos-db-for-mongodb-vcore/online-connect-endpoint-sign-in.png" alt-text="Screenshot showing Azure Cosmos DB for MongoDB vCore Connection dialog in Power Query online." lightbox="../../media/azure-cosmos-db-for-mongodb-vcore/online-connect-endpoint-sign-in.png":::

1. You can select an existing a connection or a data gateway. You can connect by specifying  the basic authentication kind specifying the username and password associated with the endpoint in the  **connection credentials** section and select **Next**.

1. Select one or multiple tables to import and use, then select Transform Data to transform data in the Power Query editor.

