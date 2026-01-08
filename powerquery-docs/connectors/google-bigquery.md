---
title: Google BigQuery connector
description: Provides basic information and prerequisites for the Google BigQuery connector for Power Query.
author: whhender
ms.topic: concept-article
ms.date: 10/16/2025
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

> [!NOTE]
> Effective July 2021, Google discontinued support for sign-ins to Google accounts from embedded browser frameworks. Due to this change, you need to [update](https://powerbi.microsoft.com/downloads/) your Power BI Desktop version to June 2021 or later to support signing in to Google.

> [!NOTE]
>
> Since May 2025, we introduced a new implementation for the Google BigQuery connector, currently available in preview. Learn more about [this feature](#new-google-bigquery-connector-implementation-preview).

## Prerequisites

You need a Google account or a Google service account to sign in to Google BigQuery.

## Capabilities supported

* Import
* DirectQuery (Power BI semantic models)

## Connect to Google BigQuery data from Power Query Desktop

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

To connect to Google BigQuery from Power Query Online, take the following steps:

1. Select the **Google BigQuery** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../where-to-get-data.md).

   :::image type="content" source="./media/google-bigquery/get-data-online.png" alt-text="Screenshot of the Get Data dialog with emphasis on the Google BigQuery connector." lightbox="./media/google-bigquery/get-data-online.png":::

2. In the **Google BigQuery Database** dialog, you might need to either create a new connection or select an existing connection. Select either an organizational or service account to sign in. If you're using on-premises data, select an on-premises data gateway. Then select **Sign in**.

    :::image type="content" source="./media/google-bigquery/sign-in-online.png" alt-text="Screenshot of the Connect to data source dialog where you sign in to Google BigQuery." lightbox="./media/google-bigquery/sign-in-online.png":::

3. A **Sign in with Google** dialog appears. Select your Google account and approve connecting.

    > [!NOTE]
    >Although the sign in dialog box says you continue to Power BI Desktop once you sign in, you're sent to your online app instead.

    :::image type="content" source="./media/google-bigquery/sign-into-google-online.png" alt-text="Screenshot of the Google sign in dialog where you sign in to your account.":::

4. If you want to use any advance options, select **Advanced options**. More information: [Connect using advanced options](#connect-using-advanced-options)

5. Once signed in, select **Next** to continue.

    :::image type="content" source="./media/google-bigquery/connect-online-to-data.png" alt-text="Screenshot of the Connect to data source dialog with the user successfully signed in." lightbox="./media/google-bigquery/connect-online-to-data.png":::

6. Once you successfully connect, a **Navigator** window appears and displays the data available on the server. Select your data in the navigator. Then select **Next** to transform the data in Power Query.

    :::image type="content" source="./media/google-bigquery/navigator-bigquery-online.png" alt-text="Screenshot of the Power Query navigator loading Google BigQuery data to online app." lightbox="./media/google-bigquery/navigator-bigquery-online.png":::

## Connect using advanced options

Both Power Query Desktop and Power Query Online provide a set of advanced options that you can add to your query if needed.

The following table lists all of the advanced options you can set in Power Query Desktop and Power Query Online.

| Advanced option | Description |
| --------------- | ----------- |
| Billing Project ID | A project against which Power Query runs queries. Permissions and billing are tied to this project. If no Billing Project ID is provided, by default the first available project returned by Google APIs is used. |
| Use Storage Api | A flag that enables using the [Storage API of Google BigQuery](https://cloud.google.com/bigquery/docs/reference/storage). This option is true by default. This option can be set to false to not use the Storage API and use REST APIs instead. |
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

This section describes any limitations or considerations of the Google BigQuery connector.

### Connecting to Google BigQuery in Power BI Desktop

There are a few limits and considerations to keep in mind when using the Google BigQuery connector with Power BI.

#### Connector availability

The Google BigQuery connector is available in Power BI Desktop and in the Power BI service. In the Power BI service, the connector can be accessed using the Cloud-to-Cloud connection from Power BI to Google BigQuery.

#### "Access Denied" error

When you try to connect to Google BigQuery from Power BI Desktop, you might get the following error message:

`Datasource.Error: ODBC: ERROR [HY000][Microsoft][BigQuery] (100) Error interacting with REST API: Access Denied: Project <project name>: The user <user name> bigquery.jobs.create permissions in project <project name>.`

In this case, you might need to enter a Billing Project ID in the **Billing Project** advanced option in the Power Query **Connection settings**.

In addition, if you also create a report in Power BI service using a gateway, you might still get this error. In this case, you must manually include the Billing Project ID in the M code for the connection using the Power Query editor or the Power Query formula bar. For example:

`Source = GoogleBigQuery.Database([BillingProject="Include-Billing-Project-Id-Here"])`

#### Single cloud connection support

Google BigQuery doesn't support multiple cloud connections because it lacks a parameters field to configure more than one. As a result, only a single cloud connection can be used.

### Nested fields

To optimize performance considerations, Google BigQuery does well with large data sets when denormalized, flattened, and nested.

The Google BigQuery connector supports nested fields, which are loaded as text columns in JSON format.

:::image type="content" source="./media/google-bigquery/google-bigquery-nested-fields.png" alt-text="Screenshot of the Navigator showing Google BigQuery nested fields support." lightbox="./media/google-bigquery/google-bigquery-nested-fields.png":::

Users should select **Transform Data** and then use the JSON parsing capabilities in the Power Query editor to extract the data.

1. Under the **Transforms** ribbon tab, the **Text Column** category, select **Parse** and then **JSON**.
2. Extract the JSON record fields using the **Expand Column** option.

### Setting up a Google service account

For more information on setting up or using Google service accounts, go to [Creating and managing service account keys](https://cloud.google.com/iam/docs/creating-managing-service-account-keys) in the Google docs.

### Authenticating through a Google service account

When you authenticate through a Google service account in Power BI Desktop, there's a specific credential format required by the connector.

* Service Account Email: must be in email format.
* Service Account JSON key file contents: once this JSON key is downloaded, all new lines must be removed from the file so that the contents are in one line. Once the JSON file is in that format, the contents can be pasted into this field.

When you authenticate through a Google service account in Power BI service or Power Query Online, users need to use "Basic" authentication. The **Username** field maps to the **Service Account Email** field, and the **Password** field maps to the **Service Account JSON key file contents** field. The format requirements for each credential remain the same in both Power BI Desktop, Power BI service, and Power Query Online.

### Unable to authenticate with Google BigQuery Storage API

The Google BigQuery connector uses [Google BigQuery Storage API](https://cloud.google.com/bigquery/docs/reference/storage) by default. This feature is controlled by the advanced option called [UseStorageApi](#connect-using-advanced-options). You might encounter issues with this feature if you use granular permissions. In this scenario, you might see the following error message or fail to get any data from your query:

`ERROR [HY000] [Microsoft][BigQuery] (131) Unable to authenticate with Google BigQuery Storage API. Check your account permissions`

You can resolve this issue by adjusting the user permissions for the BigQuery Storage API correctly. These storage API permissions are required to access data correctly with BigQueryStorage API:

* `bigquery.readsessions.create`: Creates a new read session via the BigQuery Storage API.
* `bigquery.readsessions.getData`: Reads data from a read session via the BigQuery Storage API.
* `bigquery.readsessions.update`: Updates a read session via the BigQuery Storage API.

These permissions typically are provided in the `BigQuery.User` role. For more information, go to [Google BigQuery Predefined roles and permissions](https://cloud.google.com/bigquery/docs/access-control).

If the above steps don't resolve the problem, you can disable the BigQuery Storage API.

### Unable to use DateTime type data in Direct Query mode

There's a known issue where the `DateTime` type isn't supported through Direct Query. Selecting a column with the `DateTime` type causes an `Invalid query` error or a visual error.

### Limitations on querying column that has the same name as table name

When querying a column that has the same name as the table name, BigQuery interprets the column as a `struct` that includes all columns in the table instead of the specified column. For example, `SELECT debug FROM dataset.debug` returns a `struct` with all columns in the debug table, instead of the specified debug column. This behavior isn't intuitive and a fix is being investigated. There are three workarounds available:

* Workaround 1: Wrap the table with a view that doesn't conflict the column name&mdash;`CREATE VIEW dataset.new_view AS SELECT * FROM dataset.debug`
* Workaround 2: Rename the column to avoid conflicts with the table name&mdash;`ALTER TABLE dataset.debug RENAME COLUMN debug to new_debug`
* Workaround 3: Change the SELECT query to use table.column to reference the conflict column&mdash;`SELECT debug.debug FROM dataset.debug`

### Materialized views aren't supported in the Power BI Desktop navigator

A known issue is that the Google BigQuery connector doesn't currently support materialized views in the Power BI Desktop navigator.

* Workaround: Utilize native query SQL statements to fetch materialized views from Google BigQuery.

### HTTP Error 403: quotaExceeded (Quota exceeded: Your user exceeded quota for concurrent project.lists requests)

* The quota is exceeded across the customer account usage of project.lists API calls to Google. When multiple reports refresh simultaneously, it might trigger an error in different queries or reports. To prevent the error, schedule report refreshes at staggered intervals.
* Update query to include a Billing Project ID - `GoogleBigQuery.Database([BillingProject="Include-Billing-Project-Id-Here"])`.
* Calls to `GoogleBigQuery.Database` should be in the same query as the schema and table selection to avoid the error.

### ExecuteQueryInternalAsync failure when using ADBC

Some users mignt experience issues when connecting to BigQuery using the `Implementation="2.0"` path and receive the error `Cannot execute <ExecuteQueryInternalAsync>b__2 after 5 tries`. This issue could be due to a few factors:

* The permission issue outlined in the following section.
* If `LargeResultDataset` is passed, then the driver attempts to create the output dataset with the name provided. This creation requires the correct permissions to do so.
* When no region is explicitly specified during dataset creation, the BigQuery API defaults to the US multi-region. This behavior is driven by the API itself and not by the connector or client configuration.

#### Workaround Options

##### Manual Dataset Creation

To avoid unexpected region defaults, manually create the dataset in your desired region using the [BigQuery Console](https://console.cloud.google.com/).

##### Desktop Connector Configuration

If you're using Power BI Desktop and encounter errors while navigating tables:

1. Go to **File** > **Options and settings** > **Options**
2. Under **Preview features**, uncheck the option **Use new Google BigQuery connector implementation**.

If you receive this message along with additional details that contains `Last exception: ...`, where `...` are additional details of the failure, [create a case](https://devblogs.microsoft.com/premier-developer/opening-an-incident-using-microsoft-premier-online-now-services-hub/) for further investigation.

### Permission issues connecting with ADBC

Some environments might require additional permissions to connect using `Implementation="2.0"`/ADBC. This is because the ADBC path uses different BigQuery APIs to query and load data than ODBC does. The required permissions are outlined in the driver's [GitHub repository](https://github.com/apache/arrow-adbc/tree/main/csharp/src/Drivers/BigQuery#permissions).  

### Unable to refresh partitioned models with ADBC

A known issue in the Google BigQuery connector is that partitioned semantic models might not refresh correctly. This often shows with the `Cannot execute <ReadChunkWithRetries>b__0 after 5 tries` error. A recent fix was published for this issue and should be deployed in October 2025. If you receive this message along with additional details that contains `Last exception: ...`, where `...` are additional details of the failure, [create a case](https://devblogs.microsoft.com/premier-developer/opening-an-incident-using-microsoft-premier-online-now-services-hub/) for further investigation.
