---
title: Power Query Salesforce Objects connector
description: Provides basic information, prerequisites, and information on how to connect to your data, along with a list of known issues and limitations.
author: whhender
ms.topic: concept-article
ms.date: 7/22/2025
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Salesforce Objects

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Salesforce account |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

> [!WARNING]
> By default, Salesforce doesn't support Internet Explorer 11, which is used as part of the authentication experience to online services in Power Query Desktop. Opt-in for [extended support for accessing Lightning Experience Using Microsoft Internet Explorer 11](https://help.salesforce.com/articleView?id=000333934&type=1&mode=1). You might also want to review Salesforce documentation on [configuring Internet Explorer](https://developer.salesforce.com/docs/atlas.en-us.salesforce_supported_browsers_cheatsheet.meta/salesforce_supported_browsers_cheatsheet/getstart_browser_ie.htm). At this time, users are impaired from authenticating, but stored credentials should continue to work until their existing authentication tokens expire. To resolve this issue, go to [Enabling Microsoft Edge (Chromium) for OAuth Authentication in Power BI Desktop](../oauth-edge-chromium.md).

## Prerequisites

[!INCLUDE [Includes_salesforce-objects_prerequisites](includes/salesforce-objects/salesforce-objects-prerequisites.md)]

## Capabilities Supported

[!INCLUDE [Includes_salesforce-objects_capabilities-supported](includes/salesforce-objects/salesforce-objects-capabilities-supported.md)]

## Connect to Salesforce Objects from Power Query Desktop

To connect to Salesforce Objects data:

1. Select **Salesforce Objects** from the product-specific data connector list, and then select **Connect**. For more information, go to [Where to get data](../where-to-get-data.md).

2. In **Salesforce Objects**, choose the **Production** URL if you use the Salesforce production URL (`https://www.salesforce.com`) to sign in.

   :::image type="content" source="media/salesforce-objects/sf-objects-url.png" alt-text="Screenshot of the Get data dialog with the production URL selected.":::

   You can also select **Custom** and enter a custom URL to sign in. This custom URL might be a custom domain you've created within Salesforce, such as `https://contoso.salesforce.com`. You can also use the custom URL selection if you're using your own CNAME record that redirects to Salesforce. Currently custom URLs only support the `salesforce.com` and `cloudforce.com` domains.
   >[!Note]
   >Lightning URLs aren't supported.

   Also, you can select **Include relationship columns**. This selection alters the query by including columns that might have foreign-key relationships to other tables. If this box is unchecked, you don't see those columns.

   Once you select the URL, select **OK** to continue.

4. Select **Sign in** to sign in to your Salesforce account.

   :::image type="content" source="media/salesforce-objects/sf-objects-sign-in.png" alt-text="Screenshot of the sign in dialog for your Salesforce account.":::

   Once you successfully sign in, select **Connect**.

5. If you're signing in for the first time using a specific app, you're asked to verify your authenticity by entering a code sent to your email address. You're then asked whether you want the app you're using to access the data. For example, you're asked if you want to allow Power BI Desktop to access your Salesforce data. Select **Allow**.

6. In the **Navigator** dialog, select the Salesforce Objects you want to load. You can then either select **Load** to load the data or select **Transform Data** to transform the data.

## Connect to Salesforce Objects from Power Query Online

[!INCLUDE [Includes_salesforce-objects_connect-to-power-query-online](includes/salesforce-objects/salesforce-objects-connect-to-power-query-online.md)]

## Specifying a Salesforce API version

We require you to specify a supported Salesforce API version to use the Salesforce connector. You can do so by modifying the query using the Power Query advanced editor. For example, `Salesforce.Data("https://login.salesforce.com/", [ApiVersion=48])`.

If you specify a version that Salesforce doesn't support, you encounter an error message indicating that you specified an unsupported ApiVersion.

For more information on Salesforce API versions and support, visit the [Salesforce website](https://help.salesforce.com/s/articleView?id=000381744&type=1).

## Limitations and considerations

[!INCLUDE [Includes_salesforce-objects_limitations-and-considerations](includes/salesforce-objects/salesforce-objects-limitations-and-considerations-include.md)]
