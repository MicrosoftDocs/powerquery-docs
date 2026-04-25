---
title: Include file for the Limitations and considerations section of the Power Query Google Bigquery connector documentation
description: Include file for the Limitations and considerations section of the Power Query Google Bigquery connector documentation
ms.date: 03/10/2026
ms.topic: include
---

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

:::image type="content" source="/power-query/connectors/media/google-bigquery/google-bigquery-nested-fields.png" alt-text="Screenshot of the Navigator showing Google BigQuery nested fields support." lightbox="/power-query/connectors/media/google-bigquery/google-bigquery-nested-fields.png":::

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

The Google BigQuery connector uses [Google BigQuery Storage API](https://cloud.google.com/bigquery/docs/reference/storage) by default. This feature is controlled by the advanced option called [UseStorageApi](/power-query/connectors/google-bigquery#connect-using-advanced-options). You might encounter issues with this feature if you use granular permissions. In this scenario, you might see the following error message or fail to get any data from your query:

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

Some users might experience issues when connecting to BigQuery using the `Implementation="2.0"` path and receive the error `Cannot execute <ExecuteQueryInternalAsync>b__2 after 5 tries`. This issue could be due to a few factors:

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
