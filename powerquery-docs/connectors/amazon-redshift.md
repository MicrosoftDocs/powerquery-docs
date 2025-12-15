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

## Prerequisites

* An [Amazon Web Services (AWS) account](https://aws.amazon.com/)

## Capabilities supported

* Import
* DirectQuery (Power BI semantic models)
* Advanced options
  * Provider name
  * Batch size
  * SQL statement

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

To connect to Amazon Redshift data:

1. Select the **Amazon Redshift** option in the **Power Query - Choose data source** page.

2. In **Server**, enter the server name where your data is located. As part of the Server field, you can also specify a port in the following format: *ServerURL:Port*. In **Database**, enter the name of the Amazon Redshift database you want to access. In this example, `contoso.redshift.amazonaws.com:5439` is the server name and port number, and `dev` is the database name.

   :::image type="content" source="./media/amazon-redshift/sign-in-online.png" alt-text="Screenshot of the connection page, with the example server name, port, and database name entered.":::

    You can also choose some optional advanced options for your connection. For more information, go to [Connect using advanced options](#connect-using-advanced-options).

3. If needed, select the on-premises data gateway in **Data gateway**.

4. Select the type of authentication you want to use in **Authentication kind**, and then enter your credentials.

5. Select or clear **Use Encrypted Connection** depending on whether you want to use an encrypted connection or not.

6. Select **Next** to continue.

7. In **Navigator**, select the data you require, and then select **Transform data**. This selection opens the Power Query editor so you can filter and refine the set of data you want to use.

   :::image type="content" source="./media/amazon-redshift/navigator-online.png" alt-text="Screenshot of the online Navigator with the customers element selected, and the data from that element displayed on the right side.":::

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
