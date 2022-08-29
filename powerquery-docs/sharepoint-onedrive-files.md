---
title: SharePoint and OneDrive for Business files import
description: All available methods in Power Query to get files from your SharePoint or OneDrive for Business accounts.
author: ptyx507
ms.date: 11/18/2020
ms.author: miescobar
---

# SharePoint and OneDrive for Business files import

Power Query offers a series of ways to gain access to files that are hosted on either SharePoint or OneDrive for Business.

## Browse files

>[!NOTE]
>Currently, you can only browse for OneDrive for Business files of the authenticated user inside of Power Query Online for PowerApps.

Power Query provides a **Browse OneDrive** button next to the **File path or URL** text box when you create a dataflow in PowerApps using any of these connectors:

* [Excel](connectors/excel.md)
* [JSON](connectors/json.md)
* [PDF](connectors/pdf.md)
* [XML](connectors/xml.md)
* [TXT/CSV](connectors/textcsv.md)

![Browse OneDrive... button inside the Connection settings window for the Excel connector.](images/sp-browse-button.png)

When you select this button, you'll be prompted to go through the authentication process. After completing this process, a new window appears with all the files inside the OneDrive for Business of the authenticated user. 

![New window to browse the files from the OneDrive for Business of the authenticated user.](images/sp-browse-window.png)

You can select the file of your choice, and then select the **Open** button. After selecting **Open**, you'll be taken back to the initial connection settings page where you'll see that the **File path or URL** text box now holds the exact URL to the file you've selected from OneDrive for Business.

![Connection settings window with the url to the selected file hosted on OneDrive for Business.](images/sp-browse-url.png)

You can select the **Next** button at the bottom-right corner of the window to continue the process and get your data.

## From the Web connector using a file URL

1. Navigate to your OneDrive for Business location using a browser. Right-click the file you want to use, and select **Open in Excel**.
   
   > [!NOTE]
   > Your browser interface might not look exactly like the following image. There are many ways to select **Open in Excel** for files in your OneDrive for Business browser interface. You can use any option that allows you to open the file in Excel.
   
   ![Screenshot of OneDrive in a browser, showing the Open in Excel selection.](images/odb-links_02.png)

2. In Excel, select **File** > **Info**, and then select the **Copy path** button.
   
   ![Screenshot of the Info menu, showing the Copy path button selection.](images/onedrive-copy-path.png)

To use the link you just copied in Power Query, take the following steps:

1. Select **Get Data** > **Web**.
   
   ![Screenshot of the Get Data ribbon in Power BI Desktop, showing the Web selection.](images/power-bi-web-link-onedrive.png)

2. In the **From Web** dialog box, select the **Basic** option and paste the link in **URL**.

3. Remove the **?web=1** string at the end of the link so that Power Query can properly navigate to your file, and then select **OK**.
   
    ![Screenshot of the From Web dialog, showing how to remove a string from the URL field.](images/power-bi-web-link-confirmation.png) 

4. If Power Query prompts you for credentials, choose either **Windows** (for on-premises SharePoint sites) or **Organizational Account** (for Microsoft 365 or OneDrive for Business sites). The select **Connect**.
   
   ![Screenshot of the Power BI Desktop credential prompt, emphasizing Windows or Organizational account selection.](images/odb-links_06.png)

   >[!CAUTION]
   >When working with files hosted on OneDrive for Home, the file that you want to connect to needs to be publicly available. When setting the authentication method for this connection, select the **Anonymous** option.

When the **Navigator** dialog box appears, you can select from the list of tables, sheets, and ranges found in the Excel workbook. From there, you can use the OneDrive for Business file just like any other Excel file. You can create reports and use it in datasets like you would with any other data source.

> [!NOTE]
> To use a OneDrive for Business file as a data source in the Power BI service, with **Service Refresh** enabled for that file, make sure you select **OAuth2** as the **Authentication method** when configuring your refresh settings. Otherwise, you may encounter an error (such as, *Failed to update data source credentials*) when you attempt to connect or to refresh. Selecting **OAuth2** as the authentication method remedies that credentials error.

## SharePoint folder connector

You can read a detailed step-by-step guide on how to connect to the files hosted on your SharePoint site in the [SharePoint folder](connectors/sharepointfolder.md) article.

After successfully establishing the connection, you'll be prompted with a table preview that shows the files in your SharePoint site. Select the **Transform data** button at the bottom right of the window.

![Table preview after connecting to a SharePoint site using the SharePoint folder connector showing the files found in the SharePoint site.](images/sp-folder-preview.png)

Selecting the **Transform Data** button will take you to a view of the data called the *File system view*. Each of the rows in this table represents a file that was found in your SharePoint site.

![Table preview of the files in the SharePoint site after selecting the Transform data button.](images/sp-transform-data-me.png)

The table has a column named **Content** that contains your file in a binary format. The values in the **Content** column have a different color than the rest of the values in the other columns of the table, which indicates that they're selectable.

By selecting a **Binary** value in the **Content** column, Power Query will automatically add a series of steps in your query to navigate to the file and interpret its contents where possible.

For example, from the table shown in the previous image, you can select the second row where the **Name** field has a value of **02-February.csv**. Power Query will automatically create a series of steps to navigate and interpret the contents of the file as a CSV file.

![Contents of a CSV file with the name 02-February.csv that were automatically interpreted by Power Query as shown in the Applied steps section.](images/sp-file-preview-me.png)

>[!NOTE]
>You can interact with the table by applying filters, sortings, and other transforms before navigating to the file of your choice. Once you've finished these transforms, select the **Binary** value you want to view. 

### OneDrive for Business experience

The SharePoint folder connector and its experience also work for files hosted on OneDrive for Business. However, the URL that you need to use is different from the one you would use for a SharePoint site. To locate your unique URL, go to your OneDrive for Business portal and copy the URL from your browser. This URL may look similar to the following example:

`https://contoso-my.sharepoint.com/personal/user123_contoso_com/_layouts/15/onedrive.aspx`

You don't need the full URL, but only the first few parts. The URL you need to use in Power Query will have the following format:

`https://<unique_tenant_name>.sharepoint.com/personal/<user_identifier>`

For example:

`https://contoso-my.sharepoint/personal/user123_contoso_com`

## SharePoint.Contents function

While the SharePoint folder connector offers you an experience where you can see all the files available in your SharePoint or OneDrive for Business site at once, you can also opt for a different experience. In this experience, you can navigate through your SharePoint or OneDrive for Business folders and reach the folder or file(s) that you're interested in.

This experience is provided through the [`SharePoint.Contents`](/powerquery-m/sharepoint-contents) function. Take the following steps to use this function:

1. Create a Blank Query.

2. Change the code in the formula bar to be `SharePoint.Contents("url")` where `url` is the same format used for the SharePoint folder connector. For example:

   `SharePoint.Contents("https://contoso.sharepoint.com/marketing/data")`

   >[!NOTE]
   >By default, this function tries to use SharePoint API Version 14 to connect. If you aren't certain of the API version being used by your SharePoint site, you might want to try using the following example code: `SharePoint.Contents("https://contoso.sharepoint.com/marketing/data", [ApiVersion="Auto"])`.

3. Power Query will request that you add an authentication method for your connection. Use the same authentication method that you'd use for the SharePoint files connector.

4. Navigate through the different documents to the specific folder or file(s) that you're interested in.

    For example, imagine a SharePoint site with a *Shared Documents* folder. You can select the **Table** value in the **Content** column for that folder and navigate directly to that folder.

    ![Table Preview after connecting to the SharePoint site with the function SharePoint.Contents where there's a folder with the name Shared Documents.](images/sp-navigate-level-1-me.png)

    Inside this *Shared Documents* folder there's a folder where the company stores all the sales reports. This folder is named *Sales Reports*. You can select the **Table** value on the **Content** column for that row.

    ![Table preview after navigating to the Shared Documents folder.](images/sp-navigate-level-2-me.png)


    With all the files inside the *Sales Reports* folder, you could select the **Combine files** button (see [Combine files overview](combine-files-overview.md)) to combine the data from all the files in this folder to a single table. Or you could navigate directly to a single file of your choice by selecting the **Binary** value from the **Content** column.

     ![Table preview after navigating to the Sales Reports folder.](images/sp-navigate-level-3-me.png)

>[!NOTE]
> The experience provided by the `SharePoint.Contents` function is optimal for SharePoint and OneDrive for Business environments with a large number of files.