---
title: Enabling Microsoft Edge (Chromium) for OAuth authentication in Power BI Desktop
description: This article describes how users can install and use Microsoft Edge (Chromium) for OAuth authentication in Power BI Desktop. 
author: mattmasson

ms.reviewer: dougklo
ms.date: 10/12/2021
ms.author: mmasson
ms.subservice: get-data
---

# Enabling Microsoft Edge (Chromium) for OAuth authentication in Power BI Desktop

If you're using OAuth authentication to connect to your data, the OAuth dialog in Power Query uses the Microsoft Internet Explorer 11 embedded control browser. However, certain web services, such as QuickBooks Online, Salesforce Reports, and Salesforce Objects no longer support Internet Explorer 11.

## October 2021 Power BI release

>[!Note]
>If you are using an earlier release of Power BI, go to [December 2020 Power BI Release](#december-2020-power-bi-release).

As of October of 2021, Power BI Desktop now uses [Microsoft Edge WebView2](https://developer.microsoft.com/en-us/microsoft-edge/webview2/), by default, for OAuth authentication for all connectors. However, you can change the default behavior using environment variables.

* To disable the use of WebView2 for specific connectors, set `PQ_ExtendEdgeChromiumOAuthDenyList` with the name(s) of the connector(s) you want to disable. Multiple connectors are separated by semicolons.

   ```
   setx PQ_ExtendEdgeChromiumOAuthDenyList   MyExtension1;MyExtension2
   ```

* To disable the use of WebView2, set `PQ_DisableEdgeChromiumOAuth` to true.

   ```
   setx PQ_DisableEdgeChromiumOAuth   true
   ```

## December 2020 Power BI release

As of December of 2020, Power BI Desktop uses [Microsoft Edge WebView2](https://developer.microsoft.com/en-us/microsoft-edge/webview2/) for OAuth authentication with certain connectors. These connectors are:

* GitHub
* QuickBooks Online
* Salesforce Reports
* Salesforce Objects
* Smartsheet
* Twilio
* Zendesk

On your Power BI Desktop machine, you can get WebView2 control either by installing the new Edge (Chromium) browser (at least beta) from [https://www.microsoftedgeinsider.com/download](https://www.microsoftedgeinsider.com/download), or by installing the [WebView2 redist package](https://developer.microsoft.com/microsoft-edge/webview2/#download-section).

All other connectors will use Internet Explorer 11 by default unless the settings are overridden using environment variables.

* To enable WebView2 for all connectors, set `PQ_EdgeChromiumOAuthAllowListAll` to true:

   ```
   setx PQ_EdgeChromiumOAuthAllowListAll   true
   ```

* To enable WebView2 for specific connectors, set `PQ_ExtendEdgeChromiumOAuthAllowList` with the name(s) of the connector(s) you want to enable. Multiple connectors are separated by semicolons.

   ```
   setx PQ_ExtendEdgeChromiumOAuthAllowList   MyExtension1;MyExtension2
   ```

* To disable the use of WebView2, set `PQ_DisableEdgeChromiumOAuth` to true.

   ```
   setx PQ_DisableEdgeChromiumOAuth   true
   ```
