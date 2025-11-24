---
title: Power Query SharePoint list connector
description: Provides basic information about how to connect to your data, along with troubleshooting tips for obtaining the root SharePoint address and changing the authentication method.
author: DougKlopfenstein
ms.topic: concept-article
ms.date: 11/21/2025
ms.author: dougklo
ms.subservice: connectors
---

# SharePoint list

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Anonymous<br/>Windows<br/>Microsoft Account |
| Function Reference Documentation | [SharePoint.Contents](/powerquery-m/sharepoint-contents)<br/>[SharePoint.Files](/powerquery-m/sharepoint-files)<br/>[SharePoint.Tables](/powerquery-m/sharepoint-tables) |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

> [!NOTE]
>Microsoft Entra ID/OAuth for SharePoint on-premises isn't supported using the on-premises data gateway.

## Capabilities supported

* Site URL

## Determine the site URL

When you're connecting to a SharePoint site, you're asked to enter the site URL. To find the site URL that contains your SharePoint list, first open a page in SharePoint. From a page in SharePoint, you can usually get the site address by selecting **Home** in the navigation pane, or the icon for the site at the top. Copy the address from your web browser's address bar and save for later.

:::image type="content" source="./media/sharepoint-list/sharepoint-address.png" alt-text="Screenshot showing the locations of Home in the SharePoint navigation pane, the icon at the top of the site, and the resulting URL address.":::

## Connect to a SharePoint list from Power Query Desktop

To connect to a SharePoint list:

1. From **Get Data**, select **SharePoint List**. For more information, go to [Where to get data](../where-to-get-data.md).

2. Paste the SharePoint site URL you copied in [Determine the site URL](#determine-the-site-url) to the **Site URL** field in the open dialog box.

   :::image type="content" source="./media/sharepoint-list/sharepoint-list-url.png" alt-text="Screenshot of the SharePoint lists dialog with the Site URL filled in.":::

   If the URL address you enter is invalid, a :::image type="icon" source="./media/sharepoint-list/web-warning.png"::: warning icon appears next to the **Site URL** textbox.

   Select **OK** to continue.

3. If you're visiting this site address for the first time, select the appropriate authentication method. Enter your credentials and chose which level to apply these settings to. Then select **Connect**.

   :::image type="content" source="./media/sharepoint-list/sharepoint-list-sign-in.png" alt-text="Screenshot of the authentication dialog where you enter your credentials.":::

    For more information about authentication methods and level settings, go to [Authentication with a data source](../connectorauthentication.md).

4. From the **Navigator**, you can select a location, then either transform the data in the Power Query editor by selecting **Transform Data**, or load the data by selecting **Load**.

   :::image type="content" source="./media/sharepoint-list/sharepoint-list-navigator.png" alt-text="Screenshot of the Navigator dialog where you select the items you want to use." lightbox="./media/sharepoint-list/sharepoint-list-navigator.png":::

## Connect to a SharePoint list from Power Query Online

To connect to a SharePoint list:

1. From the **Data sources** page, select **SharePoint list**. For more information, go to [Where to get data](../where-to-get-data.md).

2. Paste the SharePoint site URL you copied in [Determine the site URL](#determine-the-site-url) to the **Site URL** field in the open dialog box.

   :::image type="content" source="./media/sharepoint-list/sharepoint-list-url-online.png" alt-text="Screenshot of the online SharePoint list page with the Site URL information filled in.":::

3. Enter the name of an on-premises data gateway if needed.

4. Select the authentication kind, and enter any credentials that are required.

5. Select **Next**.

6. From the **Navigator**, you can select a location, then transform the data in the Power Query editor by selecting **Next**.

   :::image type="content" source="./media/sharepoint-list/sharepoint-list-navigator-online.png" alt-text="Screenshot of the online Navigator where you select the items you want to use." lightbox="./media/sharepoint-list/sharepoint-list-navigator-online.png":::

## Troubleshooting

### Use root SharePoint address

Make sure you supply the root address of the SharePoint site, without any subfolders or documents. For example, use a link similar to the following address: `https://contoso.sharepoint.com/teams/ObjectModel/`

### Inconsistent behavior around boolean data

When you use the SharePoint list connector, Boolean values are represented inconsistently as TRUE/FALSE or 1/0 in Power BI Desktop and Power BI service environments. This inconsistency might result in wrong data, incorrect filters, and empty visuals.

This issue only happens when the **Data Type** isn't explicitly set for a column in the Query View of Power BI Desktop. You can tell that the data type isn't set by seeing the "ABC 123" image on the column and "Any" data type in the ribbon.

:::image type="content" source="./media/sharepoint-list/boolean-any.png" alt-text="Screenshot of the data type any on a boolean column.":::

The user can force the interpretation to be consistent by explicitly setting the data type for the column through the Power Query editor. For example, the following image shows the column with an explicit Boolean type.

:::image type="content" source="./media/sharepoint-list/boolean-explicit.png" alt-text="Screenshot of the same column with the explicit boolean type set.":::

### Using OData to access a SharePoint List

If you use an OData feed to access a SharePoint List, there's an approximately 2100 character limitation to the URL you use to connect. For more information, go to [Maximum URL length](odata-feed.md#maximum-url-length).

### Microsoft Entra ID authentication

Microsoft Entra ID authentication isn't supported for on-premises SharePoint sources.

## Related content

[Optimize Power Query when expanding table columns](../optimize-expanding-table-columns.md)
