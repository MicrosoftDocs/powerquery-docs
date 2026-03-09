---
title: Power Query Cognite Data Fusion (REST API) connector
description: Provides basic information, prerequisites, and instructions on how to connect to and use the Cognite Data Fusion (REST API) connector.
author: evertoncolling
ms.topic: concept-article
ms.date: 9/11/2025
ms.author: whhender
ms.subservice: connectors
---

# Cognite Data Fusion (REST API)

>[!Note]
>This connector is owned and provided by Cognite.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | OAuth (OIDC) |

## Prerequisites

[!INCLUDE [Includes_cognite-data-fusion-rest-api_prerequisites](includes/cognite-data-fusion-rest-api/cognite-data-fusion-rest-api-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_cognite-data-fusion-rest-api_capabilities-supported](includes/cognite-data-fusion-rest-api/cognite-data-fusion-rest-api-capabilities-supported.md)]

## Connect to Cognite Data Fusion from Power Query Desktop

To connect to Cognite Data Fusion from Power Query Desktop, take the following steps:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. In the Get Data dialog, search for **Cognite**, select the **Cognite Data Fusion (REST API)** connector, and then select **Connect**.

   :::image type="content" source="./media/cognite-data-fusion-rest/get-data-dialog.png" alt-text="Screenshot showing how to locate the CDF REST API connector in Power BI.":::

2. In the **Cognite Data Fusion (CDF)** dialog box, enter details to configure the connection to CDF, and then select **OK**:

   * **CDF project**: Enter the name of the CDF project you're connecting to.
   * **CDF organization**: Enter the organization to use to sign in to CDF.

   :::image type="content" source="./media/cognite-data-fusion-rest/connection-settings.png" alt-text="Screenshot of the connection settings where you configure the CDF REST API connector in Power BI.":::

3. To sign in to your CDF account, select **Sign in** and follow the authentication process.

   :::image type="content" source="./media/cognite-data-fusion-rest/sign-in.png" alt-text="Screenshot of the authentication dialog where you select the sign in button.":::

4. Once you successfully sign in, select **Connect**.

   :::image type="content" source="./media/cognite-data-fusion-rest/signed-in.png" alt-text="Screenshot of the authentication dialog where you're signed in and ready to connect.":::

5. In the **Navigator**, a list of available functions is displayed. Select the function you want to use, and then select **Transform Data** to open the Power Query editor and retrieve data from CDF.

   :::image type="content" source="./media/cognite-data-fusion-rest/navigator.png" alt-text="Screenshot showing how to select functions using the REST API connector in Power BI.":::

## Connect to Cognite Data Fusion from Power Query Online

[!INCLUDE [Includes_cognite-data-fusion-rest-api_connect-to-power-query-online](includes/cognite-data-fusion-rest-api/cognite-data-fusion-rest-api-connect-to-power-query-online.md)]

## Additional information

- Connect to Cognite Data Fusion in Power BI using the [Cognite Data Fusion (REST API) connector](https://docs.cognite.com/cdf/dashboards/guides/powerbi/set_up_rest_connector).