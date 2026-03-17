---
title: Include file for the Connect to Power Query Online section of the Cognite Data Fusion Rest API connector documentation
description: Include file for the Connect to Power Query Online section of the Cognite Data Fusion Rest API connector documentation
author: whhender
ms.author: whhender
ms.date: 03/06/2026
ms.topic: include
---

To connect to Cognite Data Fusion from Power Query Online, take the following steps:

1. Select the **Cognite Data Fusion (REST API)** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../../../where-to-get-data.md).

   :::image type="content" source="../../media/cognite-data-fusion-rest/online-get-data.png" alt-text="Screenshot of the get data window with Cognite Data Fusion (REST API) emphasized.":::

2. In the **Connection settings** section, enter the following information:

   * **CDF project**: Enter the name of the CDF project you're connecting to.
   * **CDF organization**: Enter the organization to use to sign in to CDF.

   :::image type="content" source="../../media/cognite-data-fusion-rest/online-connection-settings.png" alt-text="Screenshot of the Cognite Data Fusion (REST API) online connection settings.":::

3. In the **Connection credentials** section:
   * If you're connecting to CDF for the first time, select **Create new connection** from the **Connection** dropdown menu.
   * If you connected previously, you can select an existing connection from the **Connection** dropdown menu.
   * For the data gateway: If your organization uses a gateway to access CDF, select the appropriate gateway from the dropdown menu. If data gateway is set to **(none)**, the connector uses the Power BI service to connect to CDF directly.
   * You can also select the Privacy Level for the data connection at this stage.
   * For new connections, select **Sign in** and follow the authentication process.

   :::image type="content" source="../../media/cognite-data-fusion-rest/online-connection-credentials.png" alt-text="Screenshot of the Cognite Data Fusion (REST API) online connection credentials.":::

4. Once you successfully sign in, select **Next**.

5. In the **Choose data** section, select the function you want to use, and then select **Create** to open the Power Query editor and retrieve data from CDF.

   :::image type="content" source="../../media/cognite-data-fusion-rest/online-navigator.png" alt-text="Screenshot of the Power Query Online Navigator showing the available functions.":::

