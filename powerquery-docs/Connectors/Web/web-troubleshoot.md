---
title: Troubleshooting the Power Query Web connector
description: Provides troubleshooting tips for errors that might occur when using the Power Query Web connector to connect to a web site.
author: dougklopfenstein
ms.service: powerquery
ms.topic: conceptual
ms.date: 10/28/2020
ms.author: v-douklo
LocalizationGroup: reference
---

# Troubleshooting the Web connector

## Using a gateway with the Web connector

If you're using the Web connector through an on-premises data gateway, you must have Internet Explorer 10 installed on the gateway machine.  This installation will ensure that the `Web.Page` call through the gateway will work correctly. 

## Changing the authentication method

In some cases, you may need to change the authentication method you use to access a particular site. If this change is necessary, see [Change the authentication method](../../connectorauthentication.md#change-the-authentication-method).

## Limitations on Web connector authentication for HTML content

>[!NOTE]
> The limitations described in this section only apply to HTML web pages. Opening other kinds of files from the web using this connector isn't affected by these limitations.

The legacy Power Query Web connector automatically creates a `Web.Page` query that supports authentication. The only limitation occurs if you select Windows authentication in the authentication method dialog box. In this case, the **Use my current credentials** selection works correctly, but **Use alternate credentials** wouldn't authenticate.

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
7. If you are copying to Power BI Desktop:
    1. In the **Home** tab, select **Advanced Editor**.
    2. Paste the copied `Web.Page` query in the editor, and then select **Done**.
8. If you are copying to Power Query Online:
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

