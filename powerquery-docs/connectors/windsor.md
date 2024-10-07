---
title: Power Query Windsor connector
description: Provides basic information and prerequisites for the Windsor connector, supported authentication types, outlines limitations and issues.
author: lanceris
ms.author: miescobar
ms.topic: conceptual
ms.date: 06/19/2024
---

# Windsor Power Query custom connector

> [!NOTE]
>The following connector article is provided by Windsor, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the https://windsor.ai/ website and use the support channels there.

## Summary
| Item | Description                                                                       |
| ---- |-----------------------------------------------------------------------------------|
| Release State | Preview                                                                     |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/> Power Apps (Dataflows) |
| Authentication Types Supported | OAuth                                  |
| Function reference docs | &mdash; |


## Prerequisites
Before using the connector, you need to create a [Windsor](https://onboard.windsor.ai/) account and save at least one query.

Follow these steps to create and save a query:

1. [Sign in to the Windsor.ai account.](https://onboard.windsor.ai/login) via Email + Password, Microsoft account, or Google account.

2. Select a data source and sign in to your platform account to create a connection between your data source and Windsor.

3. Select **Next (Data Preview)** bottom left or **2. Preview and Destination** on top.

4. Configure your query using controls on the right side and select the **Get Data** button, if present, to preview data.
   1. Select **Data Source** to fetch data. By default **all** is selected, which gets data from all data sources you have connected.
   1. Define a date range. Use a flexible date range, for example **Last 7 days**, and always get data for the previous seven days.
   1. Choose the fields. [See our full list of supported fields](https://windsor.ai/data-field/all/).
   1. Pick the accounts to fetch data from.

5. When you are satisfied with the result, select the **Save Query** button, give your query a recognizable name, and select **Save**.
    
    :::image type="content" source="media/windsor/windsor-save-query.png" alt-text="Save Query at Windsor Onboard.":::

    The queries you save here are available to you in Power BI Desktop once you sign in to the Windsor connector.


## Capabilities supported
* Import 

## Connection instructions
To connect to Windsor
1. Open Power Query.

2. Go to the **Home** ribbon and select **Get Data**.

3. Search for Windsor. Select it, and then select **Connect**.

   :::image type="content" source="media/windsor/windsor-pbi-connector-list.png" alt-text="Screenshot of the Get data dialog where you select the connector from the list.":::

5. Select **Sign in** to sign in to your Windsor account.  

   :::image type="content" source="media/windsor/windsor-pbi-signin.png" alt-text="Screenshot of the authentication dialog wher you sign in to Windsor.":::

6. Sign in to Windsor Onboard in the window that appears. Enter your email and password or select **Sign in with Microsoft** / **Sign in with Google** and choose the account that you used to sign in to the Windsor Onboard in step 1 in [Prerequisites](#prerequisites).

   :::image type="content" source="media/windsor/windsor-signin.png" alt-text="Screenshot showing the connection selector.":::

7. Select **Connect**.  

   :::image type="content" source="media/windsor/windsor-pbi-connect.png" alt-text="Screenshot of the sign-in confirmation.":::

9. Once the Navigator dialog box loads, you can preview all the queries you saved in your Windsor account on the onboard. Select the checkboxes next to any queries with data you’d like to use for your report.

   :::image type="content" source="media/windsor/windsor-pbi-navigator.png" alt-text="Screenshot of the navigator view with the list of teams, groups and queries.":::
     
   The preview loads with the saved query settings. However, you can make some changes before loading the data to your report by using the settings above the preview:
   
   - Under **Accounts** you can choose a different set of accounts for the same query settings. Select **Ok** and **Apply** to load the preview with the changes.
   - You can choose a new set of fields using the **Fields** dropdown. Remember to select **Ok** and **Apply** the changes.
   - You can append selected fields to existing ones by setting **Append fields to existing** to **TRUE**
   - If you want to check the data for a different time period than the one specified in the saved query, select the necessary option in the **Date range type** or **Start date**/**End date** field and select **Apply**. When you select options like **This month** or **Year to date**, the refreshes always bring the latest data to your report. When you leave **End date** empty and it isn't set in the query. Todays date is used internally and refreshes bring the latest data to your report.

    If you make changes to only one of the fields, other settings remain the same as you saved them on the Windsor Onboard.

    Once you see the dataset you’d like to use, select **Load** to use it in Power Query, or **Transform Data** to refine it in the Power Query editor first.

## Limitations
- Windsor Onboard must be used to create and manage queries.
- The timeout limit for polling the query results is 30 minutes.

## Known issues

*Expression.Error: Empty response, please check your query at onboard.windsor.ai/app/data-preview*

Reason:
- The data is missing for selected query. Check that this query works and shows data in Windsor Onboard.

*Expression.Error: Error*

Possible reasons:
- The data source was disconnected. Check that the data source is connected at `https://onboard.windsor.ai/`. Select **Show only connected** to show the data sources you have connected.

## Related content

You might also find the following Windsor help page useful:

- [Windsor: Power BI Desktop Connector](https://windsor.ai/power-bi-desktop-connector-installation-guide/)
