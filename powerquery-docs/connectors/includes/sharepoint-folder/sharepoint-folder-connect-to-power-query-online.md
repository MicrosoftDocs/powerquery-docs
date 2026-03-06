---
title: Include file for the Connect to Power Query Online section of the Power Query SharePoint folder connector connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query SharePoint folder connector connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

To connect to a SharePoint folder:

1. From the **Data sources** page, select **SharePoint folder**.

2. Paste the SharePoint site URL you copied in [Determine the site URL](#determine-the-site-url) to the **Site URL** text box in the **SharePoint folder** dialog box. In this example, the site URL is `https://contoso.sharepoint.com/marketing/data`.

   :::image type="content" source="../../media/sharepoint-folder/online-signin.png" alt-text="Screenshot of the online folder selection and sign in.":::

3. If the SharePoint folder is on-premises, enter the name of an on-premises data gateway.

4. Select the authentication kind, and enter any credentials that are required.

5. Select **Next**.

6. When you select the SharePoint folder you want to use, the file information about all of the files in that SharePoint folder are displayed. In addition, file information about any files in any subfolders is also displayed.

   :::image type="content" source="../../media/sharepoint-folder/folder-info-online.png" alt-text="Screenshot of the online Navigator showing the folder information." lightbox="../../media/sharepoint-folder/folder-info-online.png":::

7. Select **Combine** to combine the data in the files of the selected SharePoint folder and load the data into the Power Query editor for editing.

   > [!NOTE]
   >The **Combine** button is the easiest way to combine data found in the files of the SharePoint folder you specify. You could also use the **Transform Data** buttons to combine the files as well, but that requires more manual steps.

