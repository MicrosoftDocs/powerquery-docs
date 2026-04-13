---
title: Power Query Cognite Data Fusion (OData) connector
description: Provides basic information, prerequisites, and instructions on how to connect to and use the Cognite Data Fusion (OData) connector.
author: evertoncolling
ms.topic: concept-article
ms.date: 9/11/2025
ms.author: whhender
ms.subservice: connectors
---

# Cognite Data Fusion (OData)

>[!Note]
>This connector is owned and provided by Cognite.

> [!NOTE]
>Use the Power Query Cognite Data Fusion (OData) connector to fetch data from Cognite's OData services. The connector is backward-compatible with existing reports, and users can authenticate with their Entra ID credentials. For new reports, we recommend using the Power Query Cognite Data Fusion (REST API) connector.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Organizational account |

## Prerequisites

[!INCLUDE [Includes_cognite-data-fusion-odata_prerequisites](includes/cognite-data-fusion-odata/cognite-data-fusion-odata-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_cognite-data-fusion-odata_capabilities-supported](includes/cognite-data-fusion-odata/cognite-data-fusion-odata-capabilities-supported.md)]

## Connect to Cognite Data Fusion from Power Query Desktop

To connect to Cognite Data Fusion from Power Query Desktop, take the following steps:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. In the Get Data dialog, search for **Cognite**, select the **Cognite Data Fusion (OData)** connector, and then select **Connect**.

   :::image type="content" source="./media/cognite-data-fusion-odata/get-data-dialog.png" alt-text="Screenshot showing how to locate the CDF OData connector in Power BI Desktop.":::

2. In the **Cognite Data Fusion (CDF)** dialog, enter details to configure the connection to CDF, and the select **OK**:

   * **Data Source Identifier**: To retrieve data from CDF, enter the CDF project name, a data model URL, or a custom OData query.
     * To authenticate as a guest user in Microsoft Entra ID, add the Entra ID tenant ID, for example, `dataSource?tenantId=MyEntraIDTenant.onmicrosoft.com`.
     * If you're passing a custom OData URL that already contains query parameters, then you can add the `tenantId` at the end with this syntax: `dataSource?$filter={Filter}&tenantId=MyEntraIDTenant.onmicrosoft.com`.

   * **CDF API URL**: Enter the URL to the Cognite API, for example, `https://api.cognitedata.com` or `https://az-eastus-1.cognitedata.com`. To access some OData services, you might also need to add the API version, for example, `https://bluefield.cognitedata.com/20230821`.

   :::image type="content" source="./media/cognite-data-fusion-odata/connection-settings.png" alt-text="Screenshot of the connection settings where you configure the CDF OData connector in Power BI Desktop.":::

3. To sign in to your CDF account, select **Sign in** and follow the authentication process with your Microsoft Entra ID account credentials.

   :::image type="content" source="./media/cognite-data-fusion-odata/sign-in.png" alt-text="Screenshot of the authentication dialog where you select the sign in button.":::

4. Once you successfully sign in, select **Connect**.

   :::image type="content" source="./media/cognite-data-fusion-odata/signed-in.png" alt-text="Screenshot of the authentication dialog where you're signed in and ready to connect.":::

5. In the **Navigator**, select the data you want to load or transform.

   :::image type="content" source="./media/cognite-data-fusion-odata/navigator.png" alt-text="Screenshot of the navigator where you select the data you want to use.":::

6. Select **Load** to import the data directly or **Transform Data** to open the Power Query editor for data filtering and transformation.

## Connect to Cognite Data Fusion from Power Query Online

[!INCLUDE [Includes_cognite-data-fusion-odata_connect-to-power-query-online](includes/cognite-data-fusion-odata/cognite-data-fusion-odata-connect-to-power-query-online.md)]

## Additional information

- Connect to Cognite Data Fusion in Power BI using the [Cognite Data Fusion (OData) connector](https://docs.cognite.com/cdf/dashboards/guides/powerbi/set_up_odata_connector).