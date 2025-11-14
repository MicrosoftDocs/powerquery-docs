---
title: Power Query MicroStrategy for Power BI connector
description: Provides basic information about products that use the MicroStrategy for Power BI connector, supported authentication types, prerequisites, and connection instructions.
author: pawjastrzebski
ms.topic: conceptual
ms.date: 11/12/2025
ms.author: dougklo
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# MicroStrategy for Power BI

> [!NOTE]
>This connector is owned and provided by Microstrategy.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Basic<br />OAuth 2.0 |

## Prerequisites

Your organization must have a configured MicroStrategy environment. The user account on the MicroStrategy environment must have access to the Power BI connector.

## Capabilities Supported

* Import
* Data refresh

## Connect to MicroStrategy using Power BI Desktop

To connect to MicroStrategy using Power BI Desktop:

1. In Power BI Desktop, select **Home** > **Get Data**.

2. From the categories on the left, select **Other** > **MicroStrategy for Power BI**. Then select **Connect**.

3. If you're connecting to the MicroStrategy for Power BI connector for the first time, a third-party notice appears. Select **Don't warn me again with this connector**, and then select **Continue**.

4. Enter a valid MicroStrategy Library URL, for example, `https://.../MicroStrategyLibrary`.

   :::image type="content" source="./media/micro-strategy-for-power-bi/pbi-standard-login.png" alt-text="Screenshot of the connection dialog with the standard environment URL example.":::

   > [!NOTE]
   >If you want to utilize OIDC authentication, you must add a **#OIDCMode** string to the end of the URL.
   >
   >OIDC authentication is available starting in version 2.4.5 of the connector.

   :::image type="content" source="./media/micro-strategy-for-power-bi/pbi-oidc-login.png" alt-text="Screenshot of the connection dialog with the OIDC environment URL example.":::

5. (optional) Select the authentication mode. This option only affects basic authentication.

6. (optional) Fill out the advanced options, as necessary.

7. Select **OK**.

8. Select the authentication mode you want to use.

   :::image type="content" source="./media/micro-strategy-for-power-bi/pbi-login-screen-2.png" alt-text="Screenshot of the Microstrategy authentication method selection dialog.":::

   1. Standard/LDAP

      1. Provide **user** and **password**.

      2. Select **Connect**.

   2. Library/OIDC

      > [!IMPORTANT]
      >To utilize OIDC authentication, you must add the `https://oauth.powerbi.com/views/oauthredirect.html` URL to the list of reply URLs in your IdP settings.

      1. Select **Sign in**. A popup appears with the external sign-in site (either MicroStrategyLibrary or OIDC provider).

      2. Follow the required steps to authenticate with the chosen method.

      3. After the popup closes, select **Connect**.

9. Choose the report or cube you want to import to Power BI by navigating through the **Navigation Table**.

## Refresh MicroStrategy data using Power BI Online

> [!NOTE]
>The scheduled refresh functionality isn't available for Library authentication.

To refresh MicroStrategy data using Power BI Online:

1. Publish the semantic model imported with Power BI Desktop using the **MicroStrategy for Power BI** connector.

2. Open the **Settings** page for the published semantic model.

3. If you're connecting to this database for the first time, select the authentication type and enter your credentials.

4. If necessary, select the name of your on-premises data gateway.

Now follow the steps required to set up the scheduled refresh/refresh in Power BI Online.
