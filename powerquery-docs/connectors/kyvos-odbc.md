---
title: Kyvos ODBC Connector
description: Provides basic information, prerequisites, and instructions on how to connect to Kyvos ODBC Connector.
author: kyvosdevelopers
ms.topic: concept-article
ms.date: 11/12/2025
ms.author: dougklo
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Kyvos ODBC Connector (Beta)

> [!NOTE]
>This connector is owned and provided by Kyvos.

## Summary

| Item | Description |
| ------ | ------ |
|Release State | Beta |
|Products| Power BI (Semantic models), Power BI (Dataflows) |
|Authentication Types Supported| Username and Password OAuth (OIDC) |

> [!NOTE]
>Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

This connector is designed for use with Microsoft Power BI and works most effectively when the [Kyvos ODBC Driver](https://www.kyvosinsights.com/kyvos-odbc-driver/) is installed on the machine running the Power BI application.

## Capabilities supported

- DirectQuery (Power BI semantic models)
- Import

## Connect to Kyvos from Power BI Desktop

To connect to Kyvos from Power BI Desktop, perform the following steps.

1. Open Power BI Desktop, navigate to **Get Data**, select the Kyvos ODBC connector, and the select **Connect**.

   :::image type="content" source="./media/kyvos-odbc/get-data.png" alt-text="Screenshot of the Get Data dialog, showing the Kyvos ODBC Connector selection.":::

2. In the **Kyvos ODBC Connector** dialog box, provide the following details:

   1. **Kyvos Server**: Enter the server details
   2. **HTTP Path**: kyvos/sql
   3. **Use SSL**: Enabled or Disabled
   4. **Data Connectivity mode**: DirectQuery

      :::image type="content" source="./media/kyvos-odbc/directquery.png" alt-text="Screenshot of the DirectQuery, showing the Kyvos ODBC Connector selection.":::

3. Select **OK**.
4. Select any of the following authentication methods:

   - **Username and password**: Provide Kyvos Web Portal credentials and then select **Connect**.

     :::image type="content" source="./media/kyvos-odbc/unp.png" alt-text="Screenshot of the Username and Password, showing the Kyvos ODBC Connector selection.":::

   - **OAuth 2.0**: Select **Sign In**.

     :::image type="content" source="./media/kyvos-odbc/oauth.png" alt-text="Screenshot of the OAuth2_0, showing the Kyvos ODBC Connector selection.":::

     1. You're redirected to a third-party Identity. To authenticate, provide your Identity Provider (IDP) credentials and the select **Sign In**.
     2. Switch to Power BI Desktop, and you're signed in.
     3. Select **Connect**.

     :::image type="content" source="./media/kyvos-odbc/connect.png" alt-text="Screenshot of the Connect, showing the Kyvos ODBC Connector selection.":::

5. On the Power BI **Navigator** window, select your database, choose the Kyvos semantic model, and the select **Load**. These settings connect Power BI to the selected Kyvos semantic model for visualization.

   :::image type="content" source="./media/kyvos-odbc/load.png" alt-text="Screenshot of the Load, showing the Kyvos ODBC Connector selection.":::

## Connect to Kyvos from the Power BI service

To connect to Kyvos from Power BI service, perform the following steps.

1. Open Power BI service.
2. Go to **Settings** > **Manage connection and gateway**.
3. Choose the **Connection** tab and then select **New**.
4. On the **New Connection** page, provide the required details.
   1. Enter the Gateway cluster name.
   2. Enter the Connection name.
   3. Select **Kyvos ODBC** from the **Connection Type** list.
   4. Enter the **Kyvos Server** name. Enter the server details.
   5. Enter the **HTTP Path** as **kyvos/sql**.
   6. Enter the **Enabled** or **Disabled** option from the **Use SSL** list.

      :::image type="content" source="./media/kyvos-odbc/new-connection.png" alt-text="Screenshot of the NewConnection dialog, showing the Kyvos ODBC Connector selection.":::

5. Choose an authentication method:
   1. **Username and Password**: Enter your Kyvos credentials.
   2. **OAuth 2.0**: Select **Edit credentials** and authenticate through IDP.
   3. Choose the required **Privacy level**.
   4. Select **Create**.
   5. Go to published semantic model > **Settings** > **Gateway and cloud connections**, select the required Gateway, and then **Maps to** appropriate connection.
   6. Select **Apply**.
   7. Now open the published Power BI workbook.

      :::image type="content" source="./media/kyvos-odbc/workbook.png" alt-text="Screenshot of the Workbook, showing the Kyvos ODBC Connector selection.":::
