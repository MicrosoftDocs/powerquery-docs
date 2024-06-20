---
title: Power Query Windsor connector
description: Provides basic information and prerequisites for the Windsor connector, supported authentication types, outlines limitations and issues.
author: lanceris
ms.topic: conceptual
ms.date: 06/19/2024
---

# Windsor Power Query custom connector

>[!Note]
>The following connector article is provided by Windsor, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the https://windsor.ai/ website and use the support channels there.

## Summary
| Item | Description                                                                       |
| ---- |-----------------------------------------------------------------------------------|
| Release State | Preview                                                                     |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/> Power Apps (Dataflows) |
| Authentication Types Supported | OAuth                                  |
| Function reference docs | &mdash; |


## Prerequisites
>Before using the connector, you need to create a [Windsor](https://onboard.windsor.ai/) account and save at least one query.

Follow these steps to create and save a query:

1. [Sign in to the Windsor.ai account.](https://onboard.windsor.ai/login) via Email + Password, Microsoft account or Google account.

2. Select a data source and sign in to your platform account to create a connection between your data source and Windsor.

3. Click "Next (Data Preview)" bottom left or "2. Preview and Destination" on top.

4. Configure your query using controls on the right side and click on "Get Data" button, if present, to preview data.
    - Select Data Source to fetch data from. Note: by default "all" will be selected, which will get data from all data source you have connected.
    - Define a date range - use a flexible date range, for example “Last 7 days", and always get data for the previous seven days.
    - Choose fields. [See our full list of supported fields](https://windsor.ai/data-field/all/)
    - Pick accounts to fetch data from.

5. When you are satisfied with the result, click on Save Query button, give your query a recognizable name and click "Save".
    
    :::image type="content" source="media/windsor/windsor-save-query.png" alt-text="Save Query at Windsor Onboard.":::

    The queries you save here are available to you in Power BI Desktop once you sign in to the Windsor connector.


## Capabilities supported
* Import 
* Data import from multiple sources

## Connection instructions
To connect to Windsor
1. Open Power BI Desktop.

2. Go to the **Home** ribbon and select **Get Data**.

3. Search for Windsor. Select it, and click **Connect**.
   :::image type="content" source="media/windsor/windsor-pbi-connector-list.png" alt-text="Select the connector from list.":::

5. Select **Sign in** to sign in to your Windsor account.  

   :::image type="content" source="media/windsor/windsor-pbi-signin.png" alt-text="Connecting to Windsor.":::

6. Login to Windsor Onboard in the window that appared: Enter email and password or select **Sign in with Microsoft** / **Sign in with Google** and choose the account that you used to sign in to the Windsor Onboard in **Prerequisites** step 1.

   :::image type="content" source="media/windsor/windsor-signin.png" alt-text="Screenshot showing the connection selector.":::

7. Select **Connect**.  

   :::image type="content" source="media/windsor/windsor-pbi-connect.png" alt-text="Screenshot of sign-in confirmation.":::

9. Once the Navigator dialog box loads, you're able to preview all the queries you saved in your Windsor account on the onboard. Select the checkboxes next to any queries with data you’d like to use for your report.  
   :::image type="content" source="media/windsor/windsor-pbi-navigator.png" alt-text="Navigator view with the list of teams, groups and queries.":::  
   The preview loads with the saved query settings, however, you can make some changes before loading the data to your report by using the settings above the preview:
   - Under **Accounts** you can choose a different set of accounts for the same query settings. Select **Ok** and **Apply** to load the preview with the changes.
   - You can choose a new set of fields using the **Fields** dropdown. Remember to select **Ok** and **Apply** the changes.
   - You can append selected fields to existing ones by setting **Append fields to existing** to **TRUE**
   - If you want to check the data for a different time period than the one specified in the saved query, select the necessary option in the **Date range type** or **Start date**/**End date** field and select **Apply**. When you select options like **This month** or **Year to date**, the refreshes always bring the latest data to your report. When you leave **End date** empty and it is not set in query - today date will be used internally and refreshes will bring the latest data to your report.

    If you make changes to only one of the fields, other settings remain the same as you saved them on the Windsor Onboard.

    Once you see the dataset you’d like to use, select **Load** to use it in Power BI Desktop, or **Transform Data** to refine it in the Power Query Editor first.

## Limitations
- Windsor Onboard must be used to create and manage queries
- The timeout limit for polling the query results is 30 minutes

## Known issues

*Expression.Error: Empty response, please check your query at onboard.windsor.ai/app/data-preview*

Reason:
- The data is missing for selected query, check that this query works and shows data in Windsor Onboard.

*Expression.Error: Error*

Possible reasons:
- The data source was disconnected. Please check that the data source is connected at https://onboard.windsor.ai/. Click **Show only connected** to show the data sources you have connected.

## Next steps

You might also find the following Windsor help page useful:

* [Windsor: Power BI Desktop Connector](https://windsor.ai/power-bi-desktop-connector-installation-guide/)