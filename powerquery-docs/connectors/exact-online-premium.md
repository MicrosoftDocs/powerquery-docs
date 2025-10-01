---
title: Power Query Exact Online Premium connector
description: Provides basic information and prerequisites for the Exact Online Premium connector, supported authentication types, outlines limitations and issues.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 09/11/2025
ms.author: dougklo
ms.subservice: connectors
---

# Exact Online Premium Power Query custom connector

>[!Note]
>This connector is owned and provided by Exact Online.


## Summary

| Item                             | Description                                      |
| -------------------------------- | ------------------------------------------------ |
| Release State                    | General Availability                             |
| Products                         | Power BI (Semantic models)                       |
| Authentication Types Supported   | OAuth                                            |
| Function Reference Documentation | [Web.Contents](/powerquery-m/web-contents)<br/>[Odbc.DataSource](/powerquery-m/odbc-datasource)   |

## Prerequisites

- An **Exact Online Premium subscription** is required.

- You need to have the **ODBC Connector version 18** installed. Go to the [download page](/sql/connect/odbc/download-odbc-driver-for-sql-server) to download the latest driver.

- In Exact Online, your IP address needs to be allowed access.
  - Open the **Master data** screen
  - Locate the **Microsoft Office 365** section and add the IP address to the Power BI access list

  > [!NOTE]
  >The Microsoft Office 365 menu also contains downloadable report templates for Power BI, which can be used with this connector.

- In order to refresh data, an **on-premises data gateway** must be available. You can follow [this link](/data-integration/gateway/service-gateway-install) to learn how to install it; we recommend installing it on a managed machine that is always on.
  - Note that the ODBC driver is also required to be installed on this same machine.

## Capabilities supported

- Import
- Direct Query (Power BI semantic models)

## Connect to Exact Online Premium

To connect to Exact Online Premium:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Database** from the categories on the left, select **Exact Online Premium**, and then select **Connect**.

   :::image type="content" source="media/exact-online-premium/exact-online-premium-select-connector.png" alt-text="Get Data screen showing Exact Online Premium connector under Database section.":::

1. If this is the first time you're getting data through the Exact Online Premium connector, a preview connector notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

1. To sign in to your Exact Online Premium account, select **Sign in**.

   :::image type="content" source="media/exact-online-premium/exact-online-premium-not-signed-in.png" alt-text="Screenshot with login highlighted, showing the sign in button.":::

1. In the window that appears, provide your user name and password to sign in to your Exact Online Premium account and select **Next**.

   :::image type="content" source="media/exact-online-premium/exact-online-premium-login.png" alt-text="Screenshot showing Exact Online login screen.":::

1. Once you've successfully signed in, select **Connect**.

   :::image type="content" source="media/exact-online-premium/exact-online-premium-signed-in.png" alt-text="Screenshot with user signed in, showing the Connect button.":::

1. In **Navigator**, select the information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in the Power Query editor.

   :::image type="content" source="media/exact-online-premium/exact-online-premium-navigator.png" alt-text="Navigator screen showing Exact Online content.":::

1. Finally, select the data usage mode (import or direct query)

## Limitations

You should be aware of the following limitation associated with accessing Exact Online Premium data.

ODBC: ERROR [42000] [Microsoft][ODBC Driver 18 for SQL Server][SQL Server]Cannot open server '*(servername)*' requested by the login. Client with IP address '*(ip address)*' is not allowed to access the server.

This likely happens because the IP address is not on the allowed list for Power BI. Follow the steps under Prerequisites above to resolve.

## Next steps

You can find additional information and templates for this connector on our [documentation page](https://support.exactonline.com/community/s/knowledge-base#All-All-HNO-Concept-premium-powerbi-powerbi-introductionc).
