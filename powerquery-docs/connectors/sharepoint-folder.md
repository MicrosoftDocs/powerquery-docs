---
title: Power Query SharePoint Folder Connector
description: Provides basic information, prerequisites, and how to connect to your data, along with troubleshooting tips when combining files and using filename special characters.
author: whhender
ms.author: whhender
ms.date: 04/08/2026
ms.subservice: connectors
ms.topic: concept-article
ms.custom:
  - sfi-image-nochange
---

# SharePoint folder

## Summary

| Item | Description |
| --- | --- |
| Release State | General Availability |
| Products | Excel<br />Power BI (Semantic models)<br />Power BI (Dataflows)<br />Fabric (Dataflow Gen2)<br />Power Apps (Dataflows)<br />Dynamics 365 Customer Insights |
| Authentication Types Supported | Anonymous<br />Microsoft Account<br />Windows<br />Organizational Account |
| Function Reference Documentation | [SharePoint.Contents](/powerquery-m/sharepoint-contents)<br />[SharePoint.Files](/powerquery-m/sharepoint-files) |

> [!NOTE]  
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

> [!NOTE]  
> Microsoft Entra ID/OAuth for SharePoint on-premises isn't supported using the on-premises data gateway.

## Capabilities supported

[!INCLUDE [Includes_sharepoint-folder_capabilities-supported](includes/sharepoint-folder/sharepoint-folder-capabilities-supported.md)]

## Determine the site URL

When you're connecting to the document library in a SharePoint site, you're asked to enter the site URL. To find the site URL that contains your SharePoint folder, first open a page in SharePoint. From a page in SharePoint, you can usually get the site address by selecting **Home** in the navigation pane, or the icon for the site at the top. Copy the address from your web browser's address bar and save for later.

:::image type="content" source="media/sharepoint-list/sharepoint-address.png" alt-text="Screenshot emphasizing the locations of Home in the navigation pane, the icon at the top of the site, and the resulting URL address." lightbox="media/sharepoint-list/sharepoint-address.png":::

> [!NOTE]  
> A classic SharePoint URL page isn't supported and will fail to connect. Only a modern Sharepoint home page is supported.

## SharePoint site picker

[!INCLUDE [sharepoint-site-picker](includes/sharepoint-site-picker.md)]

## Connect to a SharePoint folder from Power Query Desktop

To connect to a SharePoint folder:

1. From **Get Data**, select **SharePoint folder**. More information: [Where to get data](../where-to-get-data.md)

1. Paste the SharePoint site URL you copied in [Determine the site URL](#determine-the-site-url) to the **Site URL** text box in the **SharePoint folder** dialog box. In this example, the site URL is `https://contoso.sharepoint.com/marketing/data`. If the site URL you enter is invalid, a :::image type="icon" source="media/sharepoint-folder/warning.png" border="false"::: warning icon appears next to the URL text box.

   :::image type="content" source="media/sharepoint-folder/url-select.png" alt-text="Screenshot of the SharePoint folder dialog with the URL entered in Site URL." lightbox="media/sharepoint-folder/url-select.png":::

   Select **OK** to continue.

1. If you're visiting this site address for the first time, select the appropriate authentication method. Enter your credentials and choose which level to apply these settings to. Then select **Connect**.

   :::image type="content" source="media/sharepoint-folder/signin.png" alt-text="Screenshot of SharePoint folder desktop authentication." lightbox="media/sharepoint-folder/signin.png":::

   For more information about authentication methods and level settings, go to [Authentication in desktop apps](../connectorauthentication.md).

1. Once you have connected, the file information about all of the files in that SharePoint folder are displayed. In addition, file information about any files in any subfolders is also displayed.

   :::image type="content" source="media/sharepoint-folder/folder-info.png" alt-text="Screenshot of the Navigator showing the folder information." lightbox="media/sharepoint-folder/folder-info.png":::

1. Select **Combine & Transform Data** to combine the data in the files of the selected SharePoint folder and load the data into the Power Query editor for editing. Or select **Combine & Load** to load the data from all of the files in the SharePoint folder directly into your app.

   :::image type="content" source="media/sharepoint-folder/combine-folder-files.png" alt-text="Screenshot of the Navigator with the combine options under the Combine button." lightbox="media/sharepoint-folder/combine-folder-files.png":::

> [!NOTE]  
> The **Combine & Transform Data** and **Combine & Load** buttons are the easiest ways to combine data found in the files of the SharePoint folder you specify. You could also use the **Load** button or the **Transform Data** buttons to combine the files as well, but that requires more manual steps.

## Connect to a SharePoint folder from Power Query Online

[!INCLUDE [Includes_sharepoint-folder_connect-to-power-query-online](includes/sharepoint-folder/sharepoint-folder-connect-to-power-query-online.md)]

## Troubleshooting

### Combining files

All of the files in the SharePoint folder you select are included in the data to be combined. If you have data files located in a subfolder of the SharePoint folder you select, all of these files are also included. To ensure that combining the file data works properly, make sure that all of the files in the folder and the subfolders have the same schema.

In some cases, you might have multiple folders on your SharePoint site containing different types of data. In this case, you need to delete the unnecessary files. To delete these files:

1. In the list of files from the SharePoint folder you chose, select **Transform Data**.

   :::image type="content" source="media/sharepoint-folder/list-folder-files.png" alt-text="Screenshot of the sample list of SharePoint folder files." lightbox="media/sharepoint-folder/list-folder-files.png":::

1. In the Power Query editor, scroll down to find the files you want to keep.

   :::image type="content" source="media/sharepoint-folder/transform-file-table.png" alt-text="Screenshot of the Power Query editor where you find the files to keep." lightbox="media/sharepoint-folder/transform-file-table.png":::

1. In this example, the required files are the last rows in the table. Select **Remove Rows** > **Remove Top Rows**, enter the value of the last row before the files to keep (in this case 909), and select **OK**.

   :::image type="content" source="media/sharepoint-folder/remove-rows.png" alt-text="Screenshot of the Power Query editor with the Remove rows option emphasized." lightbox="media/sharepoint-folder/remove-rows.png":::

1. Once you remove all the unnecessary files, select **Combine Files** from the **Home** ribbon to combine the data from all of the remaining files.

For more information about combining files, go to [Combine files overview](../combine-files-overview.md).

### Filename special characters

If a filename contains certain special characters, it might lead to authentication errors because of the filename being truncated in the URL. If you're getting unusual authentication errors, make sure all of the filenames you're using don't contain any of the following special characters.

`# % $`

If these characters are present in the filename, the file owner must rename the file so that it doesn't contain any of these characters.

### Permissions

When requesting document library contents, you should have Read access to the SharePoint site, the document library, and any folders leading to the requested file.

### Microsoft Entra ID authentication

Microsoft Entra ID authentication isn't supported for on-premises SharePoint sources.


