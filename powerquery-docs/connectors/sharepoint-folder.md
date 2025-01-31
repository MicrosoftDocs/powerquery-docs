---
title: Power Query SharePoint folder connector
description: Provides basic information, prerequisites, and how to connect to your data, along with troubleshooting tips when combining files and using filename special characters.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 1/24/2024
ms.author: dougklo
ms.subservice: connectors
---

# SharePoint folder

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights |
| Authentication Types Supported | Anonymous<br/>Microsoft Account<br/>Windows<br/>Organizational Account |
| Function Reference Documentation | [SharePoint.Contents](/powerquery-m/sharepoint-contents)<br/>[SharePoint.Files](/powerquery-m/sharepoint-files) |

> [!NOTE]
>Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

> [!NOTE]
>Microsoft Entra ID/OAuth for SharePoint on-premises isn't supported using the on-premises data gateway.

## Capabilities supported

* Folder path
* Combine
  * Combine and load
  * Combine and transform

## Determine the site URL

When you're connecting to a SharePoint site, you're asked to enter the site URL. To find the site URL that contains your SharePoint folder, first open a page in SharePoint. From a page in SharePoint, you can usually get the site address by selecting **Home** in the navigation pane, or the icon for the site at the top. Copy the address from your web browser's address bar and save for later.

:::image type="content" source="./media/sharepoint-list/sharepoint-address.png" alt-text="Screenshot emphasizing the locations of Home in the navigation pane, the icon at the top of the site, and the resulting URL address.":::

## Connect to a SharePoint folder from Power Query Desktop

To connect to a SharePoint folder:

1. From **Get Data**, select **SharePoint folder**. More information: [Where to get data](where-to-get-data.md)

2. Paste the SharePoint site URL you copied in [Determine the site URL](#determine-the-site-url) to the **Site URL** text box in the **SharePoint folder** dialog box. In this example, the site URL is `https://contoso.sharepoint.com/marketing/data`. If the site URL you enter is invalid, a :::image type="icon" source="./media/sharepoint-folder/warning.png"::: warning icon appears next to the URL text box.

   :::image type="content" source="./media/sharepoint-folder/url-select.png" alt-text="Screenshot of the SharePoint folder dialog with the URL entered in Site URL.":::

   Select **OK** to continue.

3. If you're visiting this site address for the first time, select the appropriate authentication method. Enter your credentials and choose which level to apply these settings to. Then select **Connect**.

   :::image type="content" source="./media/sharepoint-folder/signin.png" alt-text="SharePoint folder desktop authentication.":::

   For more information about authentication methods and level settings, go to [Authentication in desktop apps](../connectorauthentication.md).

4. When you select the SharePoint folder you want to use, the file information about all of the files in that SharePoint folder are displayed. In addition, file information about any files in any subfolders is also displayed.

   :::image type="content" source="./media/sharepoint-folder/folder-info.png" alt-text="Screenshot of the Navigator showing the folder information." lightbox="./media/sharepoint-folder/folder-info.png":::

5. Select **Combine & Transform Data** to combine the data in the files of the selected SharePoint folder and load the data into the Power Query editor for editing. Or select **Combine & Load** to load the data from all of the files in the SharePoint folder directly into your app.

   :::image type="content" source="./media/sharepoint-folder/combine-folder-files.png" alt-text="Screenshot of the Navigator with the combine options under the Combine button." lightbox="./media/sharepoint-folder/combine-folder-files.png":::

> [!NOTE]
>The **Combine & Transform Data** and **Combine & Load** buttons are the easiest ways to combine data found in the files of the SharePoint folder you specify. You could also use the **Load** button or the **Transform Data** buttons to combine the files as well, but that requires more manual steps.

## Connect to a SharePoint folder from Power Query Online

To connect to a SharePoint folder:

1. From the **Data sources** page, select **SharePoint folder**.

2. Paste the SharePoint site URL you copied in [Determine the site URL](#determine-the-site-url) to the **Site URL** text box in the **SharePoint folder** dialog box. In this example, the site URL is `https://contoso.sharepoint.com/marketing/data`.

   :::image type="content" source="./media/sharepoint-folder/online-signin.png" alt-text="Screenshot of the online folder selection and sign in.":::

3. If the SharePoint folder is on-premises, enter the name of an on-premises data gateway.

4. Select the authentication kind, and enter any credentials that are required.

5. Select **Next**.

6. When you select the SharePoint folder you want to use, the file information about all of the files in that SharePoint folder are displayed. In addition, file information about any files in any subfolders is also displayed.

   :::image type="content" source="./media/sharepoint-folder/folder-info-online.png" alt-text="Screenshot of the online Navigator showing the folder information." lightbox="./media/sharepoint-folder/folder-info-online.png":::

7. Select **Combine** to combine the data in the files of the selected SharePoint folder and load the data into the Power Query editor for editing.

   > [!NOTE]
   >The **Combine** button is the easiest way to combine data found in the files of the SharePoint folder you specify. You could also use the **Transform Data** buttons to combine the files as well, but that requires more manual steps.

## Troubleshooting

### Combining files

All of the files in the SharePoint folder you select are included in the data to be combined. If you have data files located in a subfolder of the SharePoint folder you select, all of these files are also included. To ensure that combining the file data works properly, make sure that all of the files in the folder and the subfolders have the same schema.

In some cases, you might have multiple folders on your SharePoint site containing different types of data. In this case, you need to delete the unnecessary files. To delete these files:

1. In the list of files from the SharePoint folder you chose, select **Transform Data**.

   :::image type="content" source="./media/sharepoint-folder/list-folder-files.png" alt-text="Screenshot of the sample list of SharePoint folder files." lightbox="./media/sharepoint-folder/list-folder-files.png":::

2. In the Power Query editor, scroll down to find the files you want to keep.  

   :::image type="content" source="./media/sharepoint-folder/transform-file-table.png" alt-text="Screenshot of the Power Query editor where you find the files to keep." lightbox="./media/sharepoint-folder/transform-file-table.png":::

3. In this example, the required files are the last rows in the table. Select **Remove Rows**, enter the value of the last row before the files to keep (in this case 909), and select **OK**.

   :::image type="content" source="./media/sharepoint-folder/remove-rows.png" alt-text="Screenshot of the Power Query editor with the Remove rows option emphasized." lightbox="./media/sharepoint-folder/remove-rows.png":::

4. Once you remove all the unnecessary files, select **Combine Files** from the **Home** ribbon to combine the data from all of the remaining files.

For more information about combining files, go to [Combine files in Power Query](../combine-files-overview.md).

### Filename special characters

If a filename contains certain special characters, it may lead to authentication errors because of the filename being truncated in the URL. If you're getting unusual authentication errors, make sure all of the filenames you're using don't contain any of the following special characters.

`# % $`

If these characters are present in the filename, the file owner must rename the file so that it does NOT contain any of these characters.

### Permissions

When requesting document library contents, you should have Read access to the SharePoint site, the document library, and any folders leading to the requested file.

### Microsoft Entra ID authentication

Microsoft Entra ID authentication isn't supported for on-premises SharePoint sources.
