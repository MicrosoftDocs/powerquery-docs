---
title: Power Query Hive LLAP connector
description: Provides basic information and prerequisites for the Hive LLAP connector, along with how to connect to your Hive LLAP data.
author: whhender
ms.topic: concept-article
ms.date: 11/12/2025 
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Hive LLAP

## Summary

| Item                             | Description                                                                  |
| -------------------------------- | ---------------------------------------------------------------------------- |
| Release State                    | General Availability                                                         |
| Products                         | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported   | Basic (Username/Password)<br/>Windows                                        |
| Function Reference Documentation | &mdash;                                                                      |

## Prerequisites

An Apache Hive LLAP username and password.

## Capabilities Supported

- Import
- Direct Query (Power BI semantic models)
- Thrift Transport Protocol
  - HTTP
  - Standard

## Connect to Hive LLAP data from Power Query Desktop

To connect to an Apache Hive LLAP server:

1. Select the **Hive LLAP** option from **Get Data**.

2. Enter the **URL** to the Adobe Hive LLAP server. You can also enter an optional port number. Typically, the URL looks like `http://[hostname]:[port number]`. The components of the URL are:

   - The `hostname` (for example, `hivellaphttp.southcentralus.contoso.com`) is the hostname or IP address of the Apache Hive server.
   - The `port number` (for example, 10500) is the port number for the Apache Hive server. If the `port number` isn't specified, the default value is 10501 for the HTTP transport protocol and 10500 for the standard transport protocol.

   :::image type="content" source="./media/hive-llap/server-selection.png" alt-text="Screenshot of the Hive LLAP connection builder.":::

3. In **Thrift Transport Protocol**, select either **Standard** for TCP mode, or **HTTP** for HTTP mode.

4. Select either the **Import** or **DirectQuery** data connectivity mode. For more information, go to [Use DirectQuery in Power BI Desktop](/power-bi/connect-data/desktop-use-directquery).

5. Select **OK** to continue.

6. The first time you connect to a data source (identified by each unique URL), you're prompted to enter account credentials. Select the appropriate type of authentication and enter your credentials for the connection.

   - **Windows**: Select this authentication type if you want to connect using Windows authentication.
   - **Basic**: Select this authentication type if you want to connect using Apache Hive LLAP authentication. Enter your Apache Hive LLAP **User name** and **Password**.

   For more information, go to [Authentication with a data source.](../ConnectorAuthentication.md).

   :::image type="content" source="./media/hive-llap/authentication.png" alt-text="Screenshot of the Basic authentication screen for the Apache Hive LLAP connection, with username and password entries.":::

7. Select **Connect** to connect to the Apache Hive LLAP data.

8. In **Navigator**, select the data you require. Then select either **Transform data** to transform the data in Power Query Editor or **Load** to load the data in Power BI Desktop.

   :::image type="content" source="./media/hive-llap/navigator.png" alt-text="Screenshot of the Apache Hive LLAP import data navigator." lightbox="./media/hive-llap/navigator.png":::

## Connect to Hive LLAP data from Power Query Online

To connect to the Apache Hive LLAP server:

1. Select the **Hive LLAP** option in the **Power Query - Choose data source** page.

   :::image type="content" source="./media/hive-llap/connect-online.png" alt-text="Screenshot of the connect to data source page with all of the selections not yet filled in.":::

2. Enter the **URL** to the Adobe Hive LLAP server. You can also enter an optional port number. Typically, the URL looks like `http://[hostname]:[port number]`. The components of the URL are:

   - The `hostname` (for example, `hivellaphttp.southcentralus.contoso.com`) is the hostname or IP address of the Apache Hive server.
   - The `port number` (for example, 10500) is the port number for the Apache Hive server. If the `port number` isn't specified, the default value is 10501 for the HTTP transport protocol and 10500 for the standard transport protocol.

3. In **Thrift Transport Protocol**, select either **Standard** for TCP mode, or **HTTP** for HTTP mode.

4. If necessary, select the name of your on-premises data gateway.

5. If you're connecting to this Hive LLAP data for the first time, select the type of credentials for the connection in **Authentication kind**.

6. Enter your credentials.

7. Select **Use Encrypted Connection** if you want to use an encrypted connection, or clear the option if you want to use an unencrypted connection.

8. Select **Next** to continue.

9. In **Navigator**, select the data you require, then select **Transform data** to transform the data in the Power Query editor.

## Kerberos-based single sign-on (SSO) for Hive LLAP

The Hive LLAP connector now supports Kerberos-based single sign-on (SSO).

To use this feature:

1. Sign in to your Power BI account, and navigate to the **Gateway management** page.

2. Add a new data source under the gateway cluster you want to use.

3. Select the connector in the **Data Source Type** list.

4. Expand the **Advanced Settings** section.

5. Select the option to **Use SSO via Kerberos for DirectQuery queries** or **Use SSO via Kerberos for DirectQuery and Import queries**.

   :::image type="content" source="./media/hive-llap/kerberos-sso.png" alt-text="Screenshot of the Add data source dialog showing the Kerberos advanced settings." lightbox="./media/hive-llap/kerberos-sso.png":::

For more information, go to [Configure Kerberos-based SSO from Power BI service to on-premises data sources](/power-bi/connect-data/service-gateway-sso-kerberos).

## Troubleshooting

### SSL Error in Power BI Desktop

You might come across the following "SSL_connect" error after entering the authentication information for the connector and selecting **Connect**.

:::image type="content" source="./media/hive-llap/unable-to-connect.png" alt-text="Unable to connect error with SSL wrong version number.":::

If this error occurs:

1. In Power BI Desktop, select **Files** > **Options and settings** > **Data source settings**.

2. In **Data source settings**, select the Hive LLAP source you created, and then select **Edit Permissions**.

   :::image type="content" source="./media/hive-llap/data-source-settings.png" alt-text="Screenshot of the Data source settings dialog where you select the Hive LLAP source and edit permissions.":::

3. In **Edit Permissions**, under **Encryption**, clear the **Encrypt connections** check box.

   :::image type="content" source="./media/hive-llap/encryption-off.png" alt-text="Screenshot of the Edit permissions dialog with the Encrypt connections box cleared.":::

4. Select **OK**, and then in **Data source settings**, select **Close**.

5. Redo the steps in [Connect to Hive LLAP data from Power Query Desktop](#connect-to-hive-llap-data-from-power-query-desktop).

### SSL Error in Power BI Service

After publishing a report in Power BI service, you need to update the credentials to the Hive data source in the cloud to refresh in Power BI service. After filling in the credentials, you might get the error:

:::image type="content" source="media/hive-llap/image.png" alt-text="Screenshot of data source credentials error.":::

If you get this error and you see the following message in a Fiddler trace, this problem is an SSL issue.

```
ODBC: ERROR [HY000] [Microsoft][ThriftExtension] (14) Unexpected response from server during a HTTP connection: Could not refill buffer
```

SSL is by default disabled when connecting directly from powerbi.com. To enable, you can use on-premises data gateway where you can enable encryption to connect and refresh reports from Power BI service.
[Enable HTTPS on Gateway](/data-integration/gateway/service-gateway-communication#force-https-communication-with-azure-relay)
