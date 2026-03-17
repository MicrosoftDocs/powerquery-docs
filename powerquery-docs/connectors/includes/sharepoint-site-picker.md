---
title: Sharepoint Site Picker
description: SharePoint site picker empowers you to quickly find and select the correct SharePoint site during connection creation.
ms.reviewer: xupzhou
ms.topic: include
ms.date: 03/04/2026
ms.service: powerquery
---
The SharePoint site picker allows you to find and select the correct SharePoint site during connection creation, without navigating to separate pages to locate and copy URLs manually.

**Simplified site selection**: Instead of copying URLs manually, use the Site URL dropdown to choose from your Recent sites, Favorite sites, and all sites you can access.

:::image type="content" source="../media/sharepoint-folder/simplified-site-selection.jpg" alt-text="Screenshot of selecting SharePoint site from SharePoint Site Picker.":::

**Quick search experience**: Type keywords in the dropdown search box to quickly locate relevant sites. After selecting a site, you can immediately proceed to load data for analysis.

:::image type="content" source="../media/sharepoint-folder/search-site.jpg" alt-text="Screenshot of searching SharePoint site.":::

> [!NOTE]
>- SharePoint site picker is available for SharePoint sources in Dataflow Gen2 and Gen1, Power BI Web modeling, Pipelines, Copy Job, and Lakehouse shortcuts, and as a destination in Dataflow Gen2.
>- The first time you use the SharePoint site picker, an authentication window appears. Select the same account you're currently signed in with. If you close or ignore the window, the site picker won't work, though you can still manually paste SharePoint site URLs as before.
>- When using the SharePoint site picker, you could encounter issues searching for sites hosted in regions outside your own geography.