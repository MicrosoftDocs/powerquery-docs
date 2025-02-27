---
title: Power Query SharePoint Online list connector
description: Provides basic information and how to connect to your data, along with troubleshooting tips for obtaining the root SharePoint address and changing the authentication method.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 2/16/2024
ms.author: dougklo
ms.subservice: connectors
---

# SharePoint Online list

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights |
| Authentication Types Supported | Anonymous<br/>Windows<br/>Microsoft Account<br/>Service Principal |
| Function Reference Documentation | [SharePoint.Contents](/powerquery-m/sharepoint-contents)<br/>[SharePoint.Files](/powerquery-m/sharepoint-files)<br/>[SharePoint.Tables](/powerquery-m/sharepoint-tables) |

> [!NOTE]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

> [!NOTE]
> If you select Service Principal as the authentication type in Power BI service, you need to grant it app-only permissions through Azure Access Control Services (ACS). For more information, go to [Granting access using SharePoint App-Only](/sharepoint/dev/solution-guidance/security-apponly-azureacs).

## Capabilities supported

* Site URL

## Determine the site URL

When you're connecting to a SharePoint site, you'll be asked to enter the site URL. To find the site URL that contains your SharePoint Online list, first open a page in SharePoint. From a page in SharePoint, you can usually get the site address by selecting **Home** in the navigation pane, or the icon for the site at the top. Copy the address from your web browser's address bar and save for later.

   ![Image with the locations of Home in the navigation pane, the icon at the top of the site, and the resulting URL address.](./media/sharepoint-list/sharepoint-address.png)

## Connect to a SharePoint Online list from Power Query Desktop

To connect to a SharePoint Online list:

1. Select **SharePoint Online list** in the get data experience. The get data experience in Power Query Desktop varies between apps. For more information about the Power Query Desktop get data experience for your app, go to [Where to get data](../where-to-get-data.md).

2. Paste the SharePoint site URL you copied in [Determine the site URL](#determine-the-site-url) to the **Site URL** field in the open dialog box.

   :::image type="content" source="./media/sharepoint-online-list/sharepoint-online-list-url.png" alt-text="Folder selection.":::

   If the URL address you enter is invalid, a :::image type="content" source="./media/sharepoint-online-list/web-warning.png" alt-text="Warning icon."::: warning icon will appear next to the **Site URL** textbox.

   You can also select either the 1.0 implementation of this connector or the 2.0 implementation. More information: [Connect to SharePoint Online list v2.0](#connect-to-sharepoint-online-list-v20)

   Select **OK** to continue.

3. If this is the first time you've visited this site address, select the appropriate authentication method. Enter your credentials and chose which level to apply these settings to. Then select **Connect**.

   :::image type="content" source="./media/sharepoint-online-list/sharepoint-online-list-sign-in.png" alt-text="Choose Microsoft account.":::

    For more information about authentication methods and level settings, go to [Authentication with a data source](../connectorauthentication.md).

4. From the **Navigator**, you can select a location, then either transform the data in the Power Query editor by selecting **Transform Data**, or load the data by selecting **Load**.

   :::image type="content" source="./media/sharepoint-online-list/sharepoint-online-list-navigator.png" alt-text="Select the list checkbox.":::

## Connect to a SharePoint Online list from Power Query Online

To connect to a SharePoint Online list:

1. Select the **SharePoint Online list** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../where-to-get-data.md).

   :::image type="content" source="./media/sharepoint-online-list/get-data-online.png" alt-text="Screenshot of the get data window with SharePoint Online list emphasized.":::

2. Paste the SharePoint site URL you copied in [Determine the site URL](#determine-the-site-url) to the **Site URL** field in the open dialog box.

   :::image type="content" source="./media/sharepoint-online-list/sharepoint-online-list-url-online.png" alt-text="Online list selection.":::

3. Enter the name of an on-premises data gateway if needed.

4. Select the authentication kind, and enter any credentials that are required.

5. Select **Next**.

6. From the **Navigator**, you can select a location, then transform the data in the Power Query editor by selecting **Transform data**.

   :::image type="content" source="./media/sharepoint-online-list/sharepoint-online-list-navigator-online.png" alt-text="Navigator with data.":::

## Connect to SharePoint Online list v2.0

In the October 2020 release of Power BI Desktop, we introduced an updated version of the SharePoint Online list connector. This connector has improved APIs and greater usability, but isn't backwards compatible with usage of the 1.0 connector version. The 2.0 connector version is generally available as of September 2022.

To access it, you'll enter the same connector screen through step 2 in [Connect to a SharePoint Online list from Power Query Desktop](#connect-to-a-sharepoint-online-list-from-power-query-desktop). However, make sure you select **2.0** under **Implementation** if it isn't already selected.

   ![A screen showing a sample of SharePoint Online List settings.](./media/sharepoint-online-list/sharepoint-online-list-navigator-2.png)

With this update to the connector, we're making available two different views for the same data:

* **All**
* **Default**

The **All** view includes all user created and system defined columns. You can see what columns are included in the following screen.

   :::image type="content" source="./media/sharepoint-online-list/sharepoint-online-list-view.png" alt-text="A screen showing a sample of view settings for a specific view in SharePoint Online list.":::

The default view is what you'll see when looking at the list online in whichever view you've set as *Default* in your settings. If you edit this view to add or remove either user created or system defined columns, or by creating a new view and setting it as default, these changes will propagate through the connector.

   :::image type="content" source="./media/sharepoint-online-list/sharepoint-online-list-settings.png" lightbox="./media/sharepoint-online-list/sharepoint-online-list-settings.png" alt-text="A screen showing a sample of SharePoint Online list default view.":::
> [!NOTE]
> If you set the default view in your SharePoint site to **Calendar** view or **Board** view, SharePoint only returns the columns shown in the selected view. In this scenario, Power BI will not retrieve all the columns in the list, even though you choose **All** option. This is by design.

## Troubleshooting

### Use root SharePoint address

Make sure you supply the root address of the SharePoint site, without any subfolders or documents. For example, use a link similar to `https://contoso.sharepoint.com/teams/ObjectModel/`.

### Timezone issues

When using the SharePoint Online list (v1.0) connector, you may notice that timezone data doesn't match what you would expect from your browser. The SharePoint web-based client does a local timezone conversion based on the browser's knowledge of the user's timezone.

The backend API for SharePoint uses UTC time and sends this UTC time directly to Power BI. Power BI doesn't convert this UTC time, but reports it to the user.

To get time into local time, the user must do the same conversion the SharePoint client does. An example of the column operations that would do this are:

```powerquery-m
#"Changed Type" = Table.TransformColumnTypes(#"Renamed Columns",{{"Datewithtime", type datetimezone}}),
#"Timezone Shifted" = Table.TransformColumns(#"Changed Type", {"Datewithtime", DateTimeZone.ToLocal})
```

The first operation changes the type to `datetimezone`, and the second operation converts it to the computer's local time.

### SharePoint join limit

> [!NOTE]
>This issue is limited to the SharePoint Online list v2.0 connector.

The SharePoint Online list v2.0 connector uses a different API than the v1.0 connector and, as such, is subject to a maximum of 12 join operations per query, as documented in the [SharePoint Online documentation](/sharepoint/install/software-boundaries-limits-2019#list-and-library-limits) under **List view lookup threshold**. This issue will manifest as SharePoint queries failing when more than 12 columns are accessed simultaneously from a SharePoint list. However, you can work around this situation by creating a default view with less than 12 lookup columns.

### Using OData to access a SharePoint Online list

If you use an OData feed to access a SharePoint Online list, there's an approximately 2100 character limitation to the URL you use to connect. More information: [Maximum URL length](odata-feed.md#maximum-url-length)
