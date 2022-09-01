---
title: Troubleshooting the Power Query Web connector
description: Provides troubleshooting tips for errors that might occur when using the Power Query Web connector to connect to a web site.
author: bezhan-msft
ms.topic: conceptual
ms.date: 8/19/2022
ms.author: bezhan
---

# Troubleshooting the Web connector

## Connecting to Microsoft Graph

Connecting to [Microsoft Graph](/graph/overview) REST [APIs](https://graph.microsoft.com) from Power Query isn't recommended or supported. See this [article](../../connecting-to-graph.md) for more information.

## Using a gateway with the Web connector

Every use of the Web connector to get data from an HTML page requires the use of an on-premises data gateway when published to a Cloud service, whether it's Power BI Service for datasets or dataflows, or Power Apps for dataflows. (Currently, Dynamics 365 Customer Insights doesn't support the use of a gateway.) <!-- The only exception is when using Power BI Desktop with the **New web table inference** option turned on, and then publishing that report to the Power BI service. The **New web table inference** option can be enabled or disabled in Power BI Desktop by going to **File** > **Options and settings** > **Options** > **Preview features**. The option is enabled by default. -->

If you receive a `Please specify how to connect` error message when attempting to connect to an HTML page using the Web connector, ensure that you have Internet Explorer 10 or later installed on the machine that hosts your on-premises data gateway. 

## Capturing web requests and certificate revocation

We've strengthened the security of web connections to protect your data. However, this means that certain scenarios, like capturing web requests with Fiddler, will no longer work by default. To enable those scenarios:

1. Open Power BI Desktop.
2. Under the **File** tab, select **Options and settings** > **Options**.
3. In **Options**, under **Global** > **Security**, uncheck **Enable certificate revocation check**.

   ![Image with the Enable certificate revocation check box selected.](../../images/web-certificate-revocation.png)

4. Select **OK**.
5. Restart Power BI Desktop.

>[!IMPORTANT]
>Be aware that unchecking **Enable certificate revocation check** will make web connections less secure.

To set this scenario in Group Policy, use the "DisableCertificateRevocationCheck" key under the registry path "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Power BI Desktop". Setting "DisableCertificateRevocationCheck" to 0 will always enable the check (stopping Fiddler and similar software from working) and setting "DisableCertificateRevocationCheck" to 1 will always disable the check (enabling Fiddler and similar software).

## Changing the authentication method

In some cases, you may need to change the authentication method you use to access a particular site. If this change is necessary, see [Change the authentication method](../../connectorauthentication.md#change-the-authentication-method).

## Limitations on Web connector authentication for HTML content

>[!NOTE]
> The limitations described in this section only apply to HTML web pages. Opening other kinds of files from the web using this connector isn't affected by these limitations.

The legacy Power Query Web connector automatically creates a `Web.Page` query that supports authentication. The only limitation occurs if you select Windows authentication in the authentication method dialog box. In this case, the **Use my current credentials** selection works correctly, but **Use alternate credentials** won't authenticate.

The new version of the Web connector (currently available in Power BI Desktop) automatically creates a `Web.BrowserContents` query. Such queries currently only support anonymous authentication. In other words, the new Web connector can't be used to connect to a source that requires non-anonymous authentication. This limitation applies to the `Web.BrowserContents` function, regardless of the host environment.

Currently, Power BI Desktop automatically uses the `Web.BrowserContents` function. The `Web.Page` function is still used automatically by Excel and Power Query Online. Power Query Online does support `Web.BrowserContents` using an on-premises data gateway, but you currently would have to enter such a formula manually. When *Web By Example* becomes available in Power Query Online in mid-October 2020, this feature will use `Web.BrowserContents`.

The `Web.Page` function requires that you have Internet Explorer 10 installed on your computer. When refreshing a `Web.Page` query via an on-premises data gateway, the computer containing the gateway must have Internet Explorer 10 installed. If you use only the `Web.BrowserContents` function, you don't need to have Internet Explorer 10 installed on your computer or the computer containing the on-premises data gateway.

In cases where you need to use `Web.Page` instead of `Web.BrowserContents` because of authentication issues, you can still manually use `Web.Page`.

In Power BI Desktop, you can use the older `Web.Page` function by clearing the **New web table inference** preview feature:

1. Under the **File** tab, select **Options and settings** > **Options**.
2. In the **Global** section, select **Preview features**.
3. Clear the **New web table inference** preview feature, and then select **OK**.
4. Restart Power BI Desktop.

    >[!NOTE]
    >Currently, you can't turn off the use of `Web.BrowserContents` in Power BI Desktop optimized for Power BI Report Server.

You can also get a copy of a `Web.Page` query from Excel. To copy the code from Excel:

1. Select **From Web** from the **Data** tab.
2. Enter the address in the **From Web** dialog box, and then select **OK**.
3. In **Navigator**, choose the data you want to load, and then select **Transform Data**.
4. In the **Home** tab of Power Query, select **Advanced Editor**. 
5. In the **Advanced Editor**, copy the M formula.
6. In the app that uses `Web.BrowserContents`, select the **Blank Query** connector.
7. If you're copying to Power BI Desktop:
    1. In the **Home** tab, select **Advanced Editor**.
    2. Paste the copied `Web.Page` query in the editor, and then select **Done**.
8. If you're copying to Power Query Online:
    1. In the **Blank Query**, paste the copied `Web.Page` query in the blank query.
    2. Select an on-premises data gateway to use.
    3. Select **Next**. 

You can also manually enter the following code into a blank query. Ensure that you enter the address of the web page you want to load.

```powerqury-m
let
  Source = Web.Page(Web.Contents("<your address here>")),
  Navigation = Source{0}[Data]
in
  Navigation
```

## Authenticating to arbitrary services

Some services support the ability for the Web connector to authenticate with OAuth/AAD authentication out of the box. However, this won't work in most cases.

When attempting to authenticate, if you see the following error:

“We were unable to connect because this credential type isn’t supported for this resource. Please choose another credential type.”

   ![Error from connecting to an endpoint that doesn't support OAuth with the web connector.](../../images/credential-type-not-supported.png)

Please contact the service owner. They will either need to change the authentication configuration or build a custom connector.

## Web connector uses HTTP 1.1 to communicate

The Power Query Web connector communicates with a data source using HTTP 1.1. If your data source is expecting to communicate using HTTP 1.0, you might receive an error, such as `500 Internal Server Error`.

It's not possible to switch Power Query to use HTTP 1.0. Power Query always sends an `Expect:100-continue` when there's a body to avoid passing a possibly large payload when the initial call itself might fail (for example, due to a lack of permissions). Currently, this behavior can't be changed.

### See also

* [Power Query Web connector](web.md)
* [Get webpage data by providing examples](web-by-example.md)
