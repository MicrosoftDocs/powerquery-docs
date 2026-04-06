---
title: Power Query Amazon Redshift connector
description: Provides basic information, prerequisites, and instructions on how to connect to Amazon Redshift data.
author: whhender
ms.topic: concept-article
ms.date: 11/10/2025
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Amazon Redshift

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights |
| Authentication Types Supported | Amazon Redshift<br />Basic<br/>Microsoft account<br/>Organizational account |

> [!NOTE]
>Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

> [!NOTE]
> The Redshift connector implementation 2.0 is available in Desktop and Gateway since March 2026. Learn more about [this feature](#redshift-connector-implementation-20).

## Prerequisites

[!INCLUDE [Includes_amazon-redshift_prerequisites](includes/amazon-redshift/amazon-redshift-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_amazon-redshift_capabilities-supported](includes/amazon-redshift/amazon-redshift-capabilities-supported.md)]

## Connect to Amazon Redshift data from Power Query Desktop

To connect to Amazon Redshift data:

1. Select the **Amazon Redshift** option in the **Get Data** selection.

2. In **Server**, enter the server name where your data is located. As part of the Server field, you can also specify a port in the following format: *ServerURL:Port*. In **Database**, enter the name of the Amazon Redshift database you want to access. In this example, `contoso.redshift.amazonaws.com:5439` is the server name and port number, `dev` is the database name, and **Data Connectivity mode** is set to **Import**.

   :::image type="content" source="./media/amazon-redshift/sign-in.png" alt-text="Screenshot of the Amazon Redshift connection dialog, with the example server name, port, and database name entered.":::

   You can also choose some optional advanced options for your connection. For more information, go to [Connect using advanced options](#connect-using-advanced-options).

   After you finish filling in and selecting all the options you need, select **OK**.

3. If you're connecting to this database for the first time, enter your credentials in the **User name** and **Password** boxes of the Amazon Redshift authentication type. Then select **Connect**.

   :::image type="content" source="./media/amazon-redshift/authentication.png" alt-text="Screenshot of the authentication dialog, with Amazon Redshift selected as the authentication type.":::

   For more information, go to [Authentication with a data source](../connectorauthentication.md).

4. Once you successfully connect, a **Navigator** window appears and displays the data available on the server. Choose one or more of the elements you want to import.

   :::image type="content" source="./media/amazon-redshift/navigator.png" alt-text="Screenshot of the Navigator with the customers element selected, and the data from that element displayed on the right side.":::

5. Once you select the elements you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in the Power Query editor.

6. Select either the **Import** or **DirectQuery** data connectivity mode, and then select **OK**.

   :::image type="content" source="./media/amazon-redshift/connection-settings.png" alt-text="Screenshot of the connection settings, with Import and DirectQuery as the settings you can select.":::

## Connect to Amazon Redshift data from Power Query Online

[!INCLUDE [Includes_amazon-redshift_connect-to-power-query-online](includes/amazon-redshift/amazon-redshift-connect-to-power-query-online.md)]

## Connect using advanced options

Power Query provides a set of advanced options that you can add to your query if needed.

The following table describes all of the advanced options you can set in Power Query.

| Advanced option | Description |
| --------------- | ----------- |
| Provider Name | Provides an Amazon Resource Name (ARN), which uniquely identifies AWS resources. |
| Batch size | Specifies the maximum number of rows to retrieve at a time from the server when fetching data. A small number translates into more calls to the server when retrieving a large data set. A large number of rows might improve performance, but could cause high memory usage. The default is single row fetch. |
| SQL Statement | For information, go to [Import data from a database using native database query](../native-database-query.md). This option is only available in Power BI Desktop. |

## Enable Microsoft Entra ID single sign-on (SSO) for Amazon Redshift

We support Microsoft Entra ID SSO through both Power BI service (cloud) and also through the on-premises data gateway. For more information about enabling Microsoft Entra ID SSO for all connectors, go to [Overview of single sign-on (SSO) for on-premises data gateways in Power BI](/power-bi/connect-data/service-gateway-sso-overview).

### Microsoft Entra ID single sign-on (SSO) through Power BI service

To configure a new connection in Power BI service:

1. In Power BI service, select **Admin portal** from the settings list.

   :::image type="content" source="./media/amazon-redshift/admin-portal.png" alt-text="Screenshot of the opened settings menu, with the Admin portal emphasized.":::

2. Enable the **Redshift SSO** option.

   :::image type="content" source="./media/amazon-redshift/redshift-sso.png" alt-text="Screenshot of the Redshift SSO option with the Enabled button enabled.":::

### Microsoft Entra ID single sign-on (SSO) for Amazon Redshift with an on-premises data gateway

Before you can enable Microsoft Entra ID SSO for Amazon Redshift, you must first enable Microsoft Entra ID SSO for all data sources that support Microsoft Entra ID SSO with an on-premises data gateway:

1. In Power BI service, select **Admin portal** from the settings list.

   :::image type="content" source="./media/amazon-redshift/admin-portal.png" alt-text="Screenshot of the Settings menu with the Admin portal emphasized.":::

2. Under **Tenant settings**, enable **Azure AD Single-Sign On (SSO) for Gateway**.

   :::image type="content" source="./media/amazon-redshift/aad-sso-for-gateway.png" alt-text="Screenshot of the Microsoft Entra ID SSO for gateway dialog, with the Enabled selection enabled.":::

Once you enable Microsoft Entra ID SSO for all data sources, then enable Microsoft Entra ID SSO for Amazon Redshift:

1. Enable the **Redshift SSO** option.

   :::image type="content" source="./media/amazon-redshift/redshift-sso.png" alt-text="Screenshot of the Redshift SSO dialog with the Enabled option enabled.":::

2. Select **Manage gateways** from the settings list.

   :::image type="content" source="./media/amazon-redshift/manage-gateways.png" alt-text="Screenshot of the Settings menu with Manage gateways emphasized.":::

3. Select a gateway, and then select **Choose Data Source**.

4. Under the **Data Source Settings** tab, enter a value in **Provider Name**. The **Provider Name** parameter is required when using Microsoft Entra ID and needs to be specified in **Advanced settings**.

   Also select **Use SSO via Azure AD for DirectQuery queries**.

   :::image type="content" source="./media/amazon-redshift/gateway-settings.png" alt-text="Screenshot of the Data Source Settings tab with the Provider Name and Use SSO via Azure AD for DirectQuery queries advanced settings emphasized.":::

## Redshift connector implementation 2.0

In March 2026, we introduced a new implementation for the Amazon Redshift connector to enhance the integration with Redshift. This connector is available as a preview in Power Query desktop.

The Redshift connector implementation 2.0 is built using the open-source [Amazon Redshift 2.x](https://github.com/aws/amazon-redshift-odbc-driver/) driver. To enable this in the desktop, go to **File** > **Options and settings** > **Options** > **Preview features**

Enable the **Use new Amazon Redshift connector implementation** feature:
 
:::image type="content" source="./media/amazon-redshift/enable-2x-preview-desktop.png" alt-text="Screenshot of the preview option dialog with Use new Amazon Redshift connector implementation checked.":::

This will add the [Implementation=”2.0”] option to your connection, which tells Power BI to use the new driver.

```powerquery-m
let
    Source = AmazonRedshift.Database("my.redshift.amazonaws.com","dev",[Implementation="2.0"]),
    northwind = Source{[Name="northwind"]}[Data],
    orders1 = northwind{[Name="orders"]}[Data]
in
    orders1
```

This will only be added for new Redshift connections after you enable the option in Power Query desktop. You can add this option to any existing connection by adding the [Implementation="2.0"]) option as well.

Using this new implementation option enables users to trial and preview the Redshift V2 driver. All connections will be automatically migrated to the V2 driver in a future iteration.
You can also see which version of the Redshift driver you are using in your Mashup logs:

```json
{
   "Start":"2026-02-16T23:20:18.7947784Z",
   "Action":"Engine/Module/AmazonRedshift/IO/AmazonRedshift/Version",
   "ResourceKind":"AmazonRedshift",
   "ResourcePath":"my.redshift.amazonaws.com;dev",
   "HostProcessId":"36784",
   "PartitionKey":"Section1/orders/orders1",
   "Implementation":"2.0",
   "DriverName":"Amazon Redshift ODBC Driver",
   "UseV2Features":"True",
   "ProductVersion":"2.153.0.0 (Main)+fdaf4307c2163bd9933182691631ca4d966ba1ac",
   "ActivityId":"26731f64-bb59-4e1e-ac6d-394dd9e6a5ff",
   "Process":"Microsoft.Mashup.Container.NetFX45",
   "Pid":37024,
   "Tid":1,
   "Duration":"00:00:00.0000192"
}
```

This will continue to roll out to all services where the connector is used and we will update this document as those products come online.
