---
title: Power Query SharePoint list connector
description: Provides basic information about how to connect to your data, along with troubleshooting tips for obtaining the root SharePoint address and changing the authentication method.
author: bezhan-msft
ms.topic: conceptual
ms.date: 7/14/2023
ms.author: bezhan
---

# SharePoint list

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Anonymous<br/>Windows<br/>Microsoft Account |
| Function Reference Documentation | [SharePoint.Contents](/powerquery-m/sharepoint-contents)<br/>[SharePoint.Files](/powerquery-m/sharepoint-files)<br/>[SharePoint.Tables](/powerquery-m/sharepoint-tables) |

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

>[!NOTE]
>AAD/OAuth for SharePoint on-premises isn’t supported using the on-premises data gateway.

## Capabilities supported

* Site URL

## Determine the site URL

When you're connecting to a SharePoint site, you'll be asked to enter the site URL. To find the site URL that contains your SharePoint list, first open a page in SharePoint. From a page in SharePoint, you can usually get the site address by selecting **Home** in the navigation pane, or the icon for the site at the top. Copy the address from your web browser's address bar and save for later.

   ![Image with the locations of Home in the navigation pane, the icon at the top of the site, and the resulting URL address.](./media/sharepoint-list/sharepoint-address.png)

## Connect to a SharePoint list from Power Query Desktop

To connect to a SharePoint list:

1. From **Get Data**, select **SharePoint List**.

2. Paste the SharePoint site URL you copied in [Determine the site URL](#determine-the-site-url) to the **Site URL** field in the open dialog box.

   ![Image of the SharePoint lists dialog with the Site URL filled in.](./media/sharepoint-list/sharepoint-list-url.png)

   If the URL address you enter is invalid, a ![Warning icon.](./media/sharepoint-list/web-warning.png) warning icon will appear next to the **Site URL** textbox.

   Select **OK** to continue.

3. If this is the first time you've visited this site address, select the appropriate authentication method. Enter your credentials and chose which level to apply these settings to. Then select **Connect**.

   ![Choose Microsoft account.](./media/sharepoint-list/sharepoint-list-sign-in.png)

    For more information about authentication methods and level settings, go to [Authentication with a data source](../connectorauthentication.md).

4. From the **Navigator**, you can select a location, then either transform the data in the Power Query editor by selecting **Transform Data**, or load the data by selecting **Load**.

   ![Select the list checkbox.](./media/sharepoint-list/sharepoint-list-navigator.png)

## Connect to a SharePoint list from Power Query Online

To connect to a SharePoint list:

1. From the **Data sources** page, select **SharePoint list**.

2. Paste the SharePoint site URL you copied in [Determine the site URL](#determine-the-site-url) to the **Site URL** field in the open dialog box.

   ![Image of the online SharePoint list page with the Site URL information filled in.](./media/sharepoint-list/sharepoint-list-url-online.png)

3. Enter the name of an on-premises data gateway if needed.

4. Select the authentication kind, and enter any credentials that are required.

5. Select **Next**.

6. From the **Navigator**, you can select a location, then transform the data in the Power Query editor by selecting **Next**.

   ![Select the list checkbox in navigator.](./media/sharepoint-list/sharepoint-list-navigator-online.png)

## Troubleshooting

### Use root SharePoint address

Make sure you supply the root address of the SharePoint site, without any subfolders or documents. For example, use link similar to the following: `https://contoso.sharepoint.com/teams/ObjectModel/`

### Inconsistent behavior around boolean data

When using the SharePoint list connector, Boolean values are represented inconsistently as TRUE/FALSE or 1/0 in Power BI Desktop and Power BI service environments. This may result in wrong data, incorrect filters, and empty visuals.

This issue only happens when the **Data Type** is not explicitly set for a column in the Query View of Power BI Desktop. You can tell that the data type isn't set by seeing the "ABC 123" image on the column and "Any" data type in the ribbon as shown below.

![Data type any on a boolean column.](./media/sharepoint-list/boolean-any.png)

The user can force the interpretation to be consistent by explicitly setting the data type for the column through the Power Query Editor. For example, the following image shows the column with an explicit Boolean type.

![Column with explicit boolean type.](./media/sharepoint-list/boolean-explicit.png)

### Using OData to access a SharePoint List

If you use an OData feed to access a SharePoint List, there's an approximately 2100 character limitation to the URL you use to connect. More information: [Maximum URL length](odata-feed.md#maximum-url-length)

### Azure Active Directory authentication

Azure Active Directory authentication (AAD) isn't supported for on-premises SharePoint sources.

## Next steps

[Optimize Power Query when expanding table columns](../optimize-expanding-table-columns.md)
