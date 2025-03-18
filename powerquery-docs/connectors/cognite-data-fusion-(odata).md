---
title: Power Query Cognite Data Fusion (OData) connector
description: Provides basic information, prerequisites, and instructions on how to connect to and use the Cognite Data Fusion (OData) connector.
author: evertoncolling
ms.topic: conceptual
ms.date: 3/18/2025
ms.author: dougklo
ms.subservice: connectors
---

# Cognite Data Fusion (OData)

> [!NOTE]
>The following connector article is provided by Cognite, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Cognite website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Organizational account |

## Prerequisites

This connector works with Cognite Data Fusion (CDF) environments that are federated with Microsoft Entra ID (formerly Azure Active Directory). To use this connector, you need:

* A valid Cognite Data Fusion project that's federated with Microsoft Entra ID
* A user account with access to the CDF project through Microsoft Entra ID
* Appropriate access permissions within the CDF project

## Capabilities supported

* Import

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

To connect to Cognite Data Fusion from Power Query Online, take the following steps:

1. Select the **Cognite Data Fusion (OData)** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../where-to-get-data.md).

   :::image type="content" source="./media/cognite-data-fusion-odata/online-get-data.png" alt-text="Screenshot of the get data window with Cognite Data Fusion (OData) emphasized.":::

2. In the **Connection settings** section, enter the following information:

   * **Data Source Identifier**: To retrieve data from CDF, enter the CDF project name, a data model URL, or a custom OData query.
      * To authenticate as a guest user in Microsoft Entra ID, add the Entra ID tenant ID, for example, `dataSource?tenantId=MyEntraIDTenant.onmicrosoft.com`.
      * If you're passing a custom OData URL that already contains query parameters, then you can add the `tenantId` at the end with this syntax: `dataSource?$filter={Filter}&tenantId=MyEntraIDTenant.onmicrosoft.com`.
   * **CDF API URL**: Enter the URL to the Cognite API, for example, `https://api.cognitedata.com` or `https://az-eastus-1.cognitedata.com`. To access some OData services, you might also need to add the API version, for example, `https://bluefield.cognitedata.com/20230821`.

   :::image type="content" source="./media/cognite-data-fusion-odata/online-connection-settings.png" alt-text="Screenshot of the Cognite Data Fusion (OData) online connection settings.":::

3. In the **Connection credentials** section:
   * If you're connecting to CDF for the first time, select **Create new connection** from the **Connection** dropdown menu.
   * If you connected previously, you can select an existing connection from the **Connection** dropdown menu.
   * For the data gateway: If your organization uses a gateway to access CDF, select the appropriate gateway from the dropdown menu. If data gateway is set to **(none)**, the connector uses the Power BI service to connect to CDF directly.
   * You can also select the Privacy Level for the data connection at this stage.
   * For new connections, select **Sign in** and follow the authentication process.

   :::image type="content" source="./media/cognite-data-fusion-odata/online-connection-credentials.png" alt-text="Screenshot of the Cognite Data Fusion (OData) online connection credentials.":::

4. Once you successfully sign in, select **Next**.

5. In the **Choose data** section, select the data you require, and then select **Create** to open the Power Query editor and retrieve data from CDF.

   :::image type="content" source="./media/cognite-data-fusion-odata/online-navigator.png" alt-text="Screenshot of the Power Query Online Navigator showing the available tables.":::

## Additional information

- Connect to Cognite Data Fusion in Power BI using the [Cognite Data Fusion (OData) connector](https://docs.cognite.com/cdf/dashboards/guides/powerbi/set_up_odata_connector).