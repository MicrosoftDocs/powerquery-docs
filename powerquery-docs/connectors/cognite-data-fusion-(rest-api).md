---
title: Power Query Cognite Data Fusion (REST API) connector
description: Provides basic information, prerequisites, and instructions on how to connect to and use the Cognite Data Fusion (REST API) connector.
author: evertoncolling
ms.topic: conceptual
ms.date: 
ms.author: 
ms.subservice: connectors
---

# Cognite Data Fusion (REST API)

> [!NOTE]
>The following connector article is provided by Cognite, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Cognite website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Preview |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | OAuth (OIDC) |

## Prerequisites

This connector works with any valid Cognite Data Fusion (CDF) environment. To use this connector, you need:

* A valid Cognite Data Fusion project with appropriate access permissions
* A user account with access to the CDF project

## Capabilities supported

* Import

## Connect to Cognite Data Fusion from Power Query Desktop

To connect to Cognite Data Fusion from Power Query Desktop, take the following steps:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. In the Get Data dialog, search for **Cognite**, select the **Cognite Data Fusion (REST API)** connector, and then select **Connect**.

   :::image type="content" source="./media/cognite-data-fusion-rest/get-data-dialog.png" alt-text="Locate the CDF REST API connector in Power BI.":::

2. In the **Cognite Data Fusion (CDF)** dialog box, enter details to configure the connection to CDF and click **OK**:

   * **CDF project**: Enter the name of the CDF project you're connecting to.
   * **CDF organization**: Enter the organization to use to sign in to CDF.

   :::image type="content" source="./media/cognite-data-fusion-rest/connection-settings.png" alt-text="Configure the CDF REST API connector in Power BI.":::

3. To sign in to your CDF account, select **Sign in** and follow the authentication process.

   :::image type="content" source="./media/cognite-data-fusion-rest/sign-in.png" alt-text="Select sign in button.":::

4. Once you've successfully signed in, select **Connect**.

   :::image type="content" source="./media/cognite-data-fusion-rest/signed-in.png" alt-text="Signed in and ready to connect.":::

5. In the **Navigator**, you'll see a list of available functions. Select the function you want to use, and then select **Transform Data** to open the Power Query Editor and retrieve data from CDF.

   :::image type="content" source="./media/cognite-data-fusion-rest/navigator.png" alt-text="Selecting functions using the REST API connector in Power BI.":::

## Connect to Cognite Data Fusion from Power Query Online

To connect to Cognite Data Fusion from Power Query Online, take the following steps:

1. Select the **Cognite Data Fusion (REST API)** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../where-to-get-data.md).

   :::image type="content" source="./media/cognite-data-fusion-rest/online-get-data.png" alt-text="Screenshot of the get data window with Cognite Data Fusion (REST API) emphasized.":::

2. In the **Connection settings** section, enter the following information:

   * **CDF project**: Enter the name of the CDF project you're connecting to.
   * **CDF organization**: Enter the organization to use to sign in to CDF.

   :::image type="content" source="./media/cognite-data-fusion-rest/online-connection-settings.png" alt-text="Screenshot of the Cognite Data Fusion (REST API) online connection settings.":::

3. In the **Connection credentials** section:
   * If this is your first time connecting to CDF, select **Create new connection** from the **Connection** dropdown menu.
   * If you've connected previously, you can select an existing connection from the **Connection** dropdown menu.
   * For the data gateway: If your organization uses a gateway to access CDF, select the appropriate gateway from the dropdown menu. If data gateway is set to **(none)**, the connector will use the Power BI service to connect to CDF directly.
   * You may also select the Privacy Level for the data connection at this stage.
   * For new connections, select **Sign in** and follow the authentication process.

   :::image type="content" source="./media/cognite-data-fusion-rest/online-connection-credentials.png" alt-text="Screenshot of the Cognite Data Fusion (REST API) online connection credentials.":::

4. Once you've successfully signed in, select **Next**.

5. In the **Choose data** section, select the function you want to use, and then select **Create** to open the Power Query Editor and retrieve data from CDF.

   :::image type="content" source="./media/cognite-data-fusion-rest/online-navigator.png" alt-text="Screenshot of the Power Query Online Navigator showing the available functions.":::

## Additional Information

- Connect to Cognite Data Fusion in Power BI using the [Cognite Data Fusion (REST API) connector](https://docs.cognite.com/cdf/dashboards/guides/powerbi/set_up_rest_connector).