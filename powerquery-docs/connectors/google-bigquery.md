---
title: Google BigQuery connector
description: Provides basic information and prerequisites for the Google BigQuery connector for Power Query.
author: whhender
ms.topic: concept-article
ms.date: 04/09/2026
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Google BigQuery

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Customer Insights (Dataflows) |
| Authentication Types Supported | Organizational account<br/>Service account |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Google BigQuery connector versions

Power Query supports two implementations of the Google BigQuery connector:

- **V1 (ODBC-based)** – Legacy implementation based on ODBC.
- **V2 (ADBC-based)** – New implementation built on Apache Arrow Database Connectivity (ADBC), designed to deliver improved performance, reliability, and scalability for large analytical workloads.

The V2 connector is the recommended option for new workloads in supported experiences. Learn more about [the V2 connector feature](#new-google-bigquery-connector-implementation-preview).


## Prerequisites

[!INCLUDE [Includes_google-bigquery_prerequisites](includes/google-bigquery/google-bigquery-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_google-bigquery_capabilities-supported](includes/google-bigquery/google-bigquery-capabilities-supported.md)]

## Connect to Google BigQuery data from Power Query Desktop

> [!NOTE]
> Effective July 2021, Google discontinued support for sign-ins to Google accounts from embedded browser frameworks. Due to this change, you need to [update](https://powerbi.microsoft.com/downloads/) your Power BI Desktop version to June 2021 or later to support signing in to Google.

To connect to Google BigQuery from Power Query Desktop, take the following steps:

1. Select **Google BigQuery** in the get data experience. The get data experience in Power Query Desktop varies between apps. For more information about the Power Query Desktop get data experience for your app, go to [Where to get data](../where-to-get-data.md).

2. If you want to use any advanced options, select **Advanced options**. Otherwise, select **OK** to continue. For more information, go to [Connect using advanced options](#connect-using-advanced-options).

    :::image type="content" source="./media/google-bigquery/sign-in-advanced-options.png" alt-text="Screenshot of the initial dialog box with the advanced options selection.":::

3. The Google BigQuery connector supports connecting through an organizational account or a service account sign-in. This example uses the organizational account to sign in. Select **Sign In** to continue.

    :::image type="content" source="./media/google-bigquery/sign-in.png" alt-text="Screenshot of the authentication dialog used to sign in to Google BigQuery.":::

    You can also sign in using a Google service account. In this case, select **Service Account Login** and enter your service account email and your service account JSON key file contents. Then select **Connect**.

4. A **Sign in with Google** dialog appears. Select your Google account and approve connecting to Power BI Desktop.

    :::image type="content" source="./media/google-bigquery/sign-into-google.png" alt-text="Screenshot of the sign in to Google dialog." lightbox="./media/google-bigquery/sign-into-google.png":::

5. Once signed in, select **Connect** to continue.

    :::image type="content" source="./media/google-bigquery/connect-to-google-bigquery-data.png" alt-text="Screenshot of the authentication dialog where you connect to Google BigQuery data.":::

6. Once you successfully connect, a **Navigator** window appears and displays the data available on the server. Select your data in the navigator. Then select either **Transform Data** to transform the data in Power Query or **Load** to load the data in Power BI Desktop.

    :::image type="content" source="./media/google-bigquery/navigator-bigquery.png" alt-text="Screenshot of the Power Query navigator loading Google BigQuery data to desktop app." lightbox="./media/google-bigquery/navigator-bigquery.png":::

## Connect to Google BigQuery data from Power Query Online

[!INCLUDE [Includes_google-bigquery_connect-to-power-query-online](includes/google-bigquery/google-bigquery-connect-to-power-query-online.md)]

## Connect using advanced options

Both Power Query Desktop and Power Query Online provide a set of advanced options that you can add to your query if needed.

The following table lists all of the advanced options you can set in Power Query Desktop and Power Query Online.

| Advanced option | Description |
| --------------- | ----------- |
| Billing Project ID | A project against which Power Query runs queries. Permissions and billing are tied to this project. If no Billing Project ID is provided, by default the first available project returned by Google APIs is used. |
| Use Storage API | A flag that enables using the [Storage API of Google BigQuery](https://cloud.google.com/bigquery/docs/reference/storage). This option is true by default. This option can be set to false to not use the Storage API and use REST APIs instead. |
| Connection timeout duration | The standard connection setting (in seconds) that controls how long Power Query waits for a connection to complete. You can change this value if your connection doesn't complete before 15 seconds (the default value.) |
| Command timeout duration | How long Power Query waits for a query to complete and return results. The default depends on the driver default. You can enter another value in minutes to keep the connection open longer. |
| Project ID | The project that you want to run native queries on. |
| SQL statement | For information, go to [Import data from a database using native database query](../native-database-query.md). In this version of native database query functionality, you need to use fully qualified table names in the format `Database.Schema.Table`, for example `SELECT * FROM DEMO_DB.PUBLIC.DEMO_TABLE`. This option is only available in Power Query Desktop. |

Once you select the advanced options you require, select **OK** in Power Query Desktop or **Next** in Power Query Online to connect to your Google BigQuery data.

## New Google BigQuery connector implementation (Preview)

Since May 2025, we introduced a new implementation for the Google BigQuery connector to enhance the integration with Google BigQuery, currently available in preview. It uses [Arrow Database Connectivity (ADBC)](https://github.com/apache/arrow-adbc/blob/main/csharp/src/Drivers/BigQuery/readme.md) instead of ODBC to connect to and retrieve data from Google BigQuery which improves performance especially for large result sets. As we continue to enhance and add new capabilities to this connector, we encourage you to upgrade to the latest version to try it out and [provide us feedback](https://aka.ms/gbq-connector-feedback).

> [!NOTE]
> This feature is supported in the 64-bit version of Power BI Desktop and doesn't work in the 32-bit version.

To access this feature in Power BI Desktop, navigate to **Options and settings** (under the **File** tab) > **Options** > **Preview features**, and then select the checkbox to enable the **Use new Google BigQuery connector implementation** option. Once the option is on, all the newly created connections automatically use the new connector implementation. 

Your existing connections remain unchanged. You can try out the feature by adding the `Implementation="2.0"` flag in `GoogleBigQuery.Database` in your queries as follows. This property differentiates the version of the connector you're using.

To access this feature in Dataflow Gen2, after you configure getting data from Google BigQuery, go to **Advanced editor** in the top ribbon, and add the `Implementation="2.0"` flag in `GoogleBigQuery.Database` in your queries as follows to use this new connector.

```powerquery-m
Source = GoogleBigQuery.Database([Implementation = "2.0"])
```

> [!NOTE]
> When you use the on-premises data gateway, note the minimal supported version is May 2025. You're recommended to use the latest version to evaluate this feature with the most current capabilities.

To aid with diagnosing any potential issue, you can find the `Implementation` as "2.0" and `DriverType` as "ADBC" in your Mashup logs.

Currently, this connector has the following known limitations: 

- Relationships are not supported.
- Proxy is not supported.

## Limitations and considerations

[!INCLUDE [Includes_google-bigquery_limitations-and-considerations](includes/google-bigquery/google-bigquery-limitations-and-considerations-include.md)]
