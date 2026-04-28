---
title: Power Query Anaplan connector
description: Provides basic information, prerequisites, and instructions on how to connect to your Anaplan data, and troubleshooting tips.
author: whhender
ms.topic: concept-article
ms.date: 11/10/2025
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Anaplan

> [!NOTE]
>This connector is owned and provided by Anaplan.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Basic<br/>Organizational account |

## Prerequisites

[!INCLUDE [Includes_anaplan_prerequisites](includes/anaplan/anaplan-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_anaplan_capabilities-supported](includes/anaplan/anaplan-capabilities-supported.md)]

## Connect to Anaplan from Power BI Desktop

### Get data

To access your saved export from Power BI desktop:

1. Select **Get data** from the ribbon menu, which displays the **Common data sources** menu.

   :::image type="content" source="./media/anaplan/get-data-more.png" lightbox="./media/anaplan/get-data-more.png" alt-text="Screenshot of the Get data option and its dropdown menu, with More emphasized.":::

2. Select **More** from the menu.

3. In **Get Data**, enter **Anaplan** into the search field, which displays the **Anaplan Connector**.

4. Select **Anaplan Connector**.

5. Select **Connect**.

### Configure the connector

Configure the connector once you download it. This step allows you to connect using Anaplan APIs.

The connector uses either basic authentication (user ID, password) or the Anaplan-configured IDP for logging into Anaplan. To use the second method, you must be designated as an Anaplan Single-Sign On (SSO) user in your Anaplan model. You can set your own configuration.

The following image shows the **Anaplan Connection Configuration** dialog.

:::image type="content" source="./media/anaplan/main-config.png" alt-text="Screenshot of the Anaplan Connection Configuration dialog.":::

1. Enter the API and authentication (auth) URLs.

   1. If you choose Basic auth, enter the following URLs, and then select **OK**.

      **Anaplan API URL**: `https://api.anaplan.com`

      **Anaplan Auth URL**: `https://auth.anaplan.com`

   2. If you prefer the Anaplan configured IDP for logging into Anaplan, enter the following URLs, and then select **OK**.

      **Anaplan API URL**: `https://api.anaplan.com`

      **Anaplan Auth URL**: `https://us1a.app.anaplan.com`

   3. Select **OK**.

2. From the next **Anaplan** dialog, choose either **Basic** or **Organizational account** (which triggers Anaplan-configured IDP).

   :::image type="content" source="./media/anaplan/basic-or-sso.png" alt-text="Screenshot of the Anaplan authentication dialog with arrows that show Basic or Organizational account (Anaplan-configured IDP) menu choices.":::

### Authenticate

You chose either basic authentication or Anaplan-configured IDP.

1. If you chose **Basic** authentication, from the **Anaplan** dialog:

    1. Enter your **User name** and **Password**.
    2. Select **Connect**.
    3. Proceed to the next step, **Get data**.

       :::image type="content" source="./media/anaplan/with-basic.png" alt-text="Screenshot of the Anaplan Connect dialog where you enter your User name and Password.":::

2. If you chose **Organizational account** (Anaplan-configured IDP), from the **Anaplan** dialog:

   1. Select **Sign in**.
   2. From **Welcome to Anaplan**, select **Log in with Single Sign-on (SSO)**.

      :::image type="content" source="./media/anaplan/sso-login.png" alt-text="Screenshot of the Anaplan dialog, with user name and password, along with SSO sign in at the bottom.":::

   3. On your company's SSO dialog, enter your user name and password.

   4. Select **Sign In**.

      > [!NOTE]
      > Your company's Anaplan-configured IDP service generates this dialog. A common ID management service is Okta.

      :::image type="content" source="./media/anaplan/okta-example.png" alt-text="Screenshot of the Sign In dialog for Okta. Okta is one example of a likely identity management tool.":::

   5. Select **Connect** on the next **Anaplan** dialog.

      :::image type="content" source="./media/anaplan/org-acct-powerbi.png" alt-text="Screenshot of the Connect dialog for the Anaplan Power BI connector.":::

### Run a Power BI export action

The Anaplan connector for Power BI uses exports to download data from your Anaplan model. Make sure you have an export action set. The navigator step is where you load and run these exports.

When you run an export action:

* Only exports that output .csv and .txt files are supported.
* If you don't see the export action in the Power BI connector, check your model role and the export actions in your model.

To run an export action, use the **Navigator** dialog to locate your export.

:::image type="content" source="./media/anaplan/export-load.png" lightbox="./media/anaplan/export-load.png" alt-text="Screenshot of the navigator dialog with Run Export Action and Load emphasized.":::

1. Search your Anaplan models to find and set your export.

   * Select the white chevron, which expands to a drop-down list.
   * You can also locate for your model name using the search field.

2. Check the box next to **ƒx Run Export Action** to select your export.

   * When you select **ƒx Run Export Action**, this selection doesn't trigger the export run. Instead this selection downloads the last version of the exported Anaplan data for preview.
   * A preview displays in the right panel. If the Anaplan export is set to **Admins only**, model users might see a blank preview, but the export runs as normal.
   * You'll see the preview the next time you set an integration with the same export.
   <!--   * See About Default Import and Export files. -->

3. Select **Load**, which starts the export. The **Load** dialog displays.

Your data then loads.

### Manage your data

Once your data loads into Power BI Desktop, you can perform data visualizations.

[How to make the most of data visualization](https://powerbi.microsoft.com/data-visualization) helps you to select **Columns**, apply **Filters**, perform **Visualizations**, and **Publish**.

:::image type="content" source="./media/anaplan/data-and-tables.png" lightbox="./media/anaplan/data-and-tables.png" alt-text="Screenshot of the data and tables.":::

### Publish a report to Power BI service

The publish step sends the report from Power BI Desktop to Power BI service.

For more information, go to [Create reports in Power BI](/power-bi/create-reports/). You need a report to begin.

To publish a report to Power BI service, select **Publish** from the Power BI Desktop report dialog.

:::image type="content" source="./media/anaplan/pbi-report.png" lightbox="./media/anaplan/pbi-report.png" alt-text="Microsoft Power BI report dialog with a left menu that displays the Publish option.":::
The report is now in Power BI service. Sign in to Power BI service to see the report.

### Schedule a refresh (Power BI service)

Once you create a semantic model in Power BI service, you can schedule a data refresh.

First, create a report in the Power BI Desktop. For more information, go to [Create reports in Power BI](/power-bi/create-reports/).

To refresh your semantic model:

1. Select **Add Data Source** (top left of dialog).

2. Select from the **Data Source Type** and **Data Source Information** dropdowns.

3. Select **Apply**.

:::image type="content" source="./media/anaplan/use1-gateway.png" alt-text="Screenshot of the Microsoft New data source dialog with arrows pointing to the button itself and two dropdowns." lightbox="./media/anaplan/use1-gateway.png":::

This image displays an example semantic model entitled **New data source**.

From the **Anaplan** dialog:

1. Select  **OAuth2** from the **Authentication method** dropdown menu.
2. Select **Sign in**.

   :::image type="content" source="./media/anaplan/gateway.PNG" alt-text="Screenshot of the Anaplan Authentication method dialog with a dropdown and Sign in button.":::

Once you create a scheduled refresh in Power BI service:

* If your scheduled refresh frequency is more than 15 days, you must reenter your sign-in credentials before the end of the 15th day. If you don't, you need to authenticate anew.
* We recommend a refresh frequency that's less than every 15 days.
* Apart from data refreshes, you need to reenter your sign-in credentials every 90 days.

## Connect to Anaplan from Power Query Online

[!INCLUDE [Includes_anaplan_connect-to-power-query-online](includes/anaplan/anaplan-connect-to-power-query-online.md)]

## Limitations and considerations

[!INCLUDE [Includes_anaplan_limitations-and-considerations](includes/anaplan/anaplan-limitations-and-considerations-include.md)]
