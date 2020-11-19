---
title: Power Query Web connector
description: Provides basic information and how to connect to your data, along with the supported file types and instructions on using the on-premises data gateway and authentication types.
author: dougklopfenstein
ms.service: powerquery
ms.topic: conceptual
ms.date: 10/12/2020
ms.author: v-douklo
LocalizationGroup: reference
---

# Web

## Summary

Release State: General Availability

Products: Power BI Desktop, Power BI Service (Enterprise Gateway), Dataflows in PowerBI.com (Enterprise Gateway), Dataflows in PowerApps.com (Enterprise Gateway), Excel

Authentication Types Supported: Anonymous, Windows, Basic, Web API, Organizational Account

Function Reference Documentation: [Web.Page](https://docs.microsoft.com/powerquery-m/web-page), [Web.BrowserContents](https://docs.microsoft.com/powerquery-m/web-browsercontents)

## Prerequisites

* Internet Explorer 10

## Capabilities supported

* Basic
* Advanced
   * URL parts
   * Command timeout
   * HTTP request header parameters

## Load Web data using a basic URL

To load data from a web site using a basic URL:

1. Select **Get Data > Web** in Power BI or **From Web** in the **Data** ribbon in Excel. 

2. Choose the **Basic** button and enter a URL address in the text box. For example, enter `https://en.wikipedia.org/wiki/List_of_states_and_territories_of_the_United_States`. Then select **OK**.

   ![Text file selection](../../images/webbasicurl.png)

   If the URL address you enter is invalid, a warning icon (![Warning icon](../../images/webwarning.png)) will appear next to the **URL** textbox.

3. Select the authentication method to use for this web site. In this example, select **Anonymous**. Then select the level to you want to apply these settings to&mdash;in this case, **https://en.wikipedia.org/**. Then select **Connect**.

   ![Web credentials selection](../../images/webcredentials.png)

   The level you select for the authentication method determines what part of a URL will have the authentication method applied to it. If you select the top-level web address, the authentication method you select here will be used for that URL address or any subaddress within that address. However, you might not want to set the top URL address to a specific authentication method because different subaddresses could require different authentication methods. For example, if you were accessing two separate folders of a single SharePoint site and wanted to use different Microsoft Accounts to access each one.
   
   Once you've set the authentication method for a specific web site address, you won't need to select the authentication method for that URL address or any subaddress again. For example, if you select the https://en.wikipedia.org/ address in this dialog, any web page that begins with this address won't require that you select the authentication method again.  

   >[!Note]
   >If you need to change the authentication method later, see [Changing the authentication method](#changing-the-authentication-method). 

4. From the **Navigator** dialog, you can select a table, then either transform the data in the Power Query editor by selecting **Transform Data**, or load the data by selecting **Load**.

   ![Web table selection](../../images/webnavigator.png)

   The right side of the **Navigator** dialog displays the contents of the table you select to transform or load. If you're uncertain which table contains the data you're interested in, you can select the **Web View** tab. The web view lets you see the entire contents of the web page, and highlights each of the tables that have been detected on that site. You can select the check box above the highlighted table to obtain the data from that table.

   On the lower left side of the **Navigator** dialog, you can also select the **Add table using examples** button. This selection presents an interactive window where you can preview the content of the web page and enter sample values of the data you want to extract. For more information on using this feature, see [Get webpage data by providing examples](https://docs.microsoft.com/power-bi/desktop-connect-to-web-by-example).

## Load Web data using an advanced URL

When you select **Get Data > From Web**, in most instances you'll enter URLs in the Basic setting. However, in some cases you may want to assemble a URL from its separate parts, set a timeout for the browser, or provide individualized URL header data. In this case, in the **From Web** dialog, select the **Advanced** option.

![Web advanced URL assembly](../../images/webadvancedurl.png)

Use the **URL parts** section of the dialog to assemble the URL you want to use to get data. The first part of the URL in the **URL parts** section most likely would consist of the scheme, authority, and path of the URI (for example, http://contoso.com/products/). The second text box could include any queries or fragments that you would use to filter the information provided to the web site. If you need to add more than one part, select **Add part** to add another URL fragment text box. As you enter each part of the URL, the complete URL that will be used when you select **OK** is displayed in the **URL preview** box.

Depending on how long the POST request takes to process data, you may need to prolong the time the request continues to stay connected to the web site. In this case, you can use the optional **Command timeout in minutes** to extend the number of minutes you stay connected.

You can also add specific request headers to the POST you send to the web site using the optional **HTTP request header parameters** drop-down box. 

## Open files on the web

Normally, when you open a file, you'll use the specific file-type connector to open that file, for example, the JSON connector to open a JSON file or the CSV connector to open a CSV file. However, if the file you want to open is located on the web, you must use the Web connector to open that file. As in the local case, you'll then be presented with the table that the connector loads by default, which you can then either Load or Transform.

The following file types are supported by the Web Connector:

* Access database
* [CSV document](../textcsv.md)
* [Excel workbook](../excel.md)
* [JSON](../json.md)
* Text file
* HTML page
* [XML tables](../xml.md)
* PDF

For example, you could use the following steps to open a JSON file on the https://contoso.com/products web site:

1. Select **Get Data > Web** in Power BI or **From Web** in the **Data** ribbon in Excel. 

2. Choose the **Basic** button and enter the following address in the text box:

    `https://contoso.com/products/Example_JSON.json`

    ![Open JSON file from the web](../../images/webJson.png)

    Then select **OK**.

3. Select **Anonymous** as the authentication type, and then select **Connect**.

4. Power Query Editor will now open with the data contained in the JSON file. Select the **View** tab in the Power Query Editor, then select **Formula Bar** to turn on the formula bar in the editor.

    ![Open the Formula Bar](../../images/webFormulaBar.png)

    As you can see, the Web Connector returns the web contents from the URL you supplied, and then automatically wraps the web contents in the appropriate document type specified by the URL (`Json.Document` in this example).

## Troubleshooting

### Using a gateway with the Web connector

If you're using the Web connector through an on-premises data gateway, you must have Internet Explorer 10 installed on the gateway machine.  This installation will ensure that the `Web.Page` call through the gateway will work correctly. 

### Changing the authentication method

In some cases, you may need to change the authentication method you use to access a particular site. If this change is necessary, see [Change the authentication method](../../connectorauthentication.md#change-the-authentication-method).

### Limitations on Web connector authentication for HTML content

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

### Capturing Web Requests & Certificate Revocation

We've strengthened the security of web connections to protect your data. However, this means that certain scenarios, like capturing web requests with Fiddler, will no longer work by default. To enable those scenarios:

1. Open Power BI Desktop.
2. Under the **File** tab, select **Options and settings** > **Options**.
3. In **Options**, under **Global** > **Security**, uncheck **Enable certificate revocation check**.

   ![a](../../images/web-certificate-revocation.png)

4. Select **OK**.
5. Restart Power BI Desktop.

>[!IMPORTANT]
>Be aware that unchecking **Enabel certificate revocation check** will make web connections less secure.

To set this scenario in Group Policy, use the "DisableCertificateRevocationCheck" key under the registry path "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Power BI Desktop". Setting "DisableCertificateRevocationCheck" to 0 will always enable the check (stopping Fiddler and similar software from working) and setting "DisableCertificateRevocationCheck" to 1 will always disable the check (enabling Fiddler and similar software).
