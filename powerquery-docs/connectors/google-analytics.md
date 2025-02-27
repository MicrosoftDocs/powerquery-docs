---
title: Power Query Google Analytics connector
description: Provides basic information and connection instructions, along with a list of quota limits for Power BI and instructions on validating unexpected data.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 2/18/2025
ms.author: dougklo
ms.subservice: connectors
---

# Google Analytics

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Customer Insights (Dataflows) |
| Authentication Types Supported | Google Account |
| Function Reference Documentation | [GoogleAnalytics.Accounts](/powerquery-m/googleanalytics-accounts) |

> [!NOTE]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

> [!NOTE]
> Effective July 2023, Google deprecated use of the Google Analytics API. For more information, go to the [Google announcement](https://support.google.com/analytics/answer/11583528?hl=en). The Power Query Google Analytics connector supports the legacy Universal Analytics scenario through V4 of the now-deprecated Google Universal Analytics API by using the `Implementation = "1.0"` setting. The connector also supports Google Analytics 4 scenarios through V1 of the Google Analytics Data API by using the now-default `Implementation = "2.0"` setting.

> [!NOTE]
> Effective July 2021, Google discontinued support for sign-ins to Google accounts from embedded browser frameworks. Due to this change, you need to [update](https://powerbi.microsoft.com/downloads/) your Power BI Desktop version to June 2021 or later to support signing in to Google.

## Prerequisites

Before you can sign in to Google Analytics, you must have a Google Analytics account (username/password).

## Capabilities Supported

* Import
* Google Analytics 4 (Data API)
* Google Universal Analytics (deprecated)

## Connect to Google Analytics data from Power Query Desktop

To connect to Google Analytics data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, and then select **Google Analytics**. Then select **Connect**.

   :::image type="content" source="./media/google-analytics/get-ga-data.png" alt-text="Screenshot of the Get Data desktop dialog from Google Analytics.":::

2. If you're getting data through the Google Analytics connector for the first time, a third-party notice is displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again. Then select **Continue**.

3. To connect to Google Analytics data through the legacy "Universal Analytics" API, select **Implementation 1.0**. To connect to Google Analytics data through the new Google Analytics Data API with support for Google Analytics 4, select **Implementation 2.0 (Beta)**.

4. To sign in to your Google Analytics account, select **Sign in**.

   :::image type="content" source="./media/google-analytics/sign-in.png" alt-text="Screenshot of the Authorization dialog where you select the sign in button.":::

5. In the **Sign in with Google** window that appears, provide your credentials to sign in to your Google Analytics account. You can either supply an email address or phone number. Then select **Next**.

   :::image type="content" source="./media/google-analytics/google-sign-in.png" alt-text="Screenshot of the sign in to Adobe Analytics.":::

6. Enter your Google Analytics password and select **Next**.

   :::image type="content" source="./media/google-analytics/enter-password.png" alt-text="Screenshot of the sign in dialog where you enter your password.":::

7. When asked if you want Power BI Desktop to access your Google account, select **Continue**.

   :::image type="content" source="./media/google-analytics/access-account.png" alt-text="Screenshot of the sign in process where you allow access to your Google account.":::

8. Once you successfully sign in, select **Connect**.

   :::image type="content" source="./media/google-analytics/signed-in.png" alt-text="Screenshot of the authentication dialog where you're signed in and ready to connect.":::

Once the connection is established, a list of the accounts you have access to is displayed. Drill through the account, properties, and views to see a selection of values, categorized in display folders.

You can **Load** the selected table, which brings the entire table into Power BI Desktop, or you can select **Transform Data** to edit the query, which opens Power Query editor. You can then filter and refine the set of data you want to use, and then load that refined set of data into Power BI Desktop.

:::image type="content" source="./media/google-analytics/button-select.png" alt-text="Screenshot of the load or transform data buttons.":::

## Connect to Google Analytics data from Power Query Online

To connect to Google Analytics data:

1. Select **Google Analytics** from the **Power Query - Choose data source** page.

2. From the connection page, select the implementation, enter a connection name, and choose an on-premises data gateway if necessary.

   :::image type="content" source="./media/google-analytics/ga-connect.png" alt-text="Screenshot showing the connection page with a connection name and no gateway selected.":::

3. Select **Sign in** to sign in to your Google account.

4. In the **Sign in with Google** window that appears, provide your credentials to sign in to your Google Analytics account. You can either supply an email address or phone number. Then select **Next**.

   :::image type="content" source="./media/google-analytics/google-sign-in-online.png" alt-text="Screenshot of the sign in to Adobe Analytics from Power Query Online.":::

5. Enter your Google Analytics password and select **Next**.

   :::image type="content" source="./media/google-analytics/enter-password-online.png" alt-text="Screenshot of the dialog where you enter your password from Power Query Online.":::

6. When asked if you want Power BI to access your Google account, select **Continue**.

   :::image type="content" source="./media/google-analytics/access-account-online.png" alt-text="Screenshot where you allow access to your Google account from Power Query Online.":::

7. Once you successfully sign in, select **Next**.

   Once the connection is established, a list of the accounts you have access to is displayed. Drill through the account, properties, and views to see a selection of values, categorized in display folders.

8. Select **Transform data** to edit the query in Power Query editor. You can then filter and refine the set of data you want to use, and then load that refined set of data into Power Apps.

## Limitations and issues

You should be aware of the following limitations and issues associated with accessing Google Analytics data.

### Google Analytics quota limits for Power BI

The standard limitations and quotas for Google Analytics API requests is documented in [Limits and Quotas on API Requests](https://developers.google.com/analytics/devguides/config/admin/v1/quotas). However, Power BI Desktop and Power BI service allow you to use the following enhanced number of queries.

* Queries per day: 1,500,000
* Queries per 100 seconds: 4,000

## Troubleshooting

### Validating Unexpected Data

When date ranges are very large, Google Analytics returns only a subset of values. You can use the process described in this section to understand what dates are being retrieved, and manually edit them. If you need more data, you can append multiple queries with different date ranges. If you're not sure you're getting back the data you expect, you can also use [Data Profiling](../data-profiling-tools.md) to get a quick look at what's being returned.

To make sure that the data you're seeing is the same as you would get from Google Analytics, you can execute the query yourself in Google's interactive tool. To understand what data Power Query is retrieving, you can use [Query Diagnostics](../RecordingQueryDiagnostics.md#diagnose-step) to understand what query parameters are being sent to Google Analytics.

If you follow the instructions for Query Diagnostics and run **Diagnose Step** on any **Added Items**, you can see the generated results in the Diagnostics **Data Source Query** column. We recommend running this diagnostic with as few extra operations as possible on top of your initial connection to Google Analytics. This method ensures you're not losing data in a Power Query transform rather than what's being retrieved from Google Analytics.

Depending on your query, the row containing the emitted API call to Google Analytics might not be in the same place. But for a simple Google Analytics only query, you generally see it as the last row that has content in that column.

If your error is around a date range, you can easily fix it. Go into the [Advanced Editor](/power-query/power-query-ui#the-advanced-editor). You have an M query that looks something like this (at a minimum&mdash;there might be other transforms on top of it).

```powerquery-m
let
    Source = GoogleAnalytics.Accounts(),
    #"<ID>" = Source{[Id="<ID>"]}[Data],
    #"UA-<ID>-1" = #"<ID>"{[Id="UA-<ID>-1"]}[Data],
    #"<View ID>" = #"UA-<ID>-1"{[Id="<View ID>"]}[Data],
    #"Added Items" = Cube.Transform(#"<View ID>",
        {
            {Cube.AddAndExpandDimensionColumn, "ga:source", {"ga:source"}, {"Source"}},
            {Cube.AddMeasureColumn, "Users", "ga:users"}
        })
in
    #"Added Items"
```

You can do one of two things. If you have a **Date** column, you can filter on the Date, which is the easier option. If you don't care about breaking it up by date, you can Group afterwards.

If you don't have a **Date** column, you can manually manipulate the query in the advanced editor to add one and filter on it. For example:

```powerquery-m
   let
      Source = GoogleAnalytics.Accounts(),
      #"<ID>" = Source{[Id="<ID>"]}[Data],
      #"UA-<ID>-1" = #"<ID>"{[Id="UA-<ID>-1"]}[Data],
      #"<View ID>" = #"UA-<ID>-1"{[Id="<View ID>"]}[Data],
      #"Added Items" = Cube.Transform(#"<View ID>",
          {
              {Cube.AddAndExpandDimensionColumn, "ga:date", {"ga:date"}, {"Date"}},
              {Cube.AddAndExpandDimensionColumn, "ga:source", {"ga:source"}, {"Source"}},
              {Cube.AddMeasureColumn, "Organic Searches", "ga:organicSearches"}            
         }),
      #"Filtered Rows" = Table.SelectRows(#"Added Items", each [Date] >= #date(2019, 9, 1) and [Date] <= #date(2019, 9, 30))
   in
      #"Filtered Rows"
```

## Related content

* [Google Analytics Dimensions & Metrics Explorer](https://ga-dev-tools.appspot.com/dimensions-metrics-explorer/)
* [Google Analytics Core Reporting API](https://developers.google.com/analytics/devguides/reporting/core/v3/)
