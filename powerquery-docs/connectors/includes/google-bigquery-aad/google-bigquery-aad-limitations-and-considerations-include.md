---
title: Include file for the Limitations and considerations section of the Power Query Google Bigquery Aad connector documentation
description: Include file for the Limitations and considerations section of the Power Query Google Bigquery Aad connector documentation
ms.date: 03/10/2026
ms.topic: include
---

This section describes any limitations or considerations of the Google BigQuery (Microsoft Entra ID) connector.

### OIDC configurations

The Google BigQuery (Microsoft Entra ID) connector utilizes Microsoft Entra ID JWT tokens to connect Microsoft Entra ID-based authentication with Google's Workforce Federation feature. So, the setup on the authentication side must be an [OIDC-based set up](https://cloud.google.com/sdk/gcloud/reference/iam/workforce-pools/providers/create-oidc) to align with the Microsoft Entra ID JWT tokens. Reach out to your Google BigQuery point-of-contact for further information on authentication setup and support on the Google side.

### Connecting to Google BigQuery (Microsoft Entra ID) in Power BI Desktop

There are a few limits and considerations to keep in mind when using the Google BigQuery connector with Power BI.

#### Nested fields

To optimize performance considerations, Google BigQuery does well with large data sets when denormalized, flattened, and nested.

The Google BigQuery (Microsoft Entra ID) connector supports nested fields, which are loaded as text columns in JSON format.

:::image type="content" source="/power-query/connectors/media/google-bigquery/google-bigquery-nested-fields.png" alt-text="Screenshot of the Google BigQuery nested fields support." lightbox="/power-query/connectors/media/google-bigquery/google-bigquery-nested-fields.png":::

Users should select **Transform Data** and then use the JSON parsing capabilities in the Power Query editor to extract the data.

1. Under the **Transforms** ribbon tab, the **Text Column** category, select **Parse** and then **JSON**.
2. Extract the JSON record fields using the **Expand Column** option.

### Unable to authenticate with Google BigQuery Storage API

The Google BigQuery (Microsoft Entra ID) connector uses [Google BigQuery Storage API](https://cloud.google.com/bigquery/docs/reference/storage) by default. This feature is controlled by the advanced option called [UseStorageApi](/power-query/connectors/google-bigquery-aad#connect-using-advanced-options). You might encounter issues with this feature if you use granular permissions. In this scenario, you might see the following error message or fail to get any data from your query:

`ERROR [HY000] [Microsoft][BigQuery] (131) Unable to authenticate with Google BigQuery Storage API. Check your account permissions`

You can resolve this issue by adjusting the user permissions for the BigQuery Storage API correctly. These storage API permissions are required to access data correctly with BigQueryStorage API:

* `bigquery.readsessions.create`: Creates a new read session via the BigQuery Storage API.
* `bigquery.readsessions.getData`: Reads data from a read session via the BigQuery Storage API.
* `bigquery.readsessions.update`: Updates a read session via the BigQuery Storage API.

These permissions typically are provided in the `BigQuery.User` role. More information, [Google BigQuery Predefined roles and permissions](https://cloud.google.com/bigquery/docs/access-control)

If the above steps don't resolve the problem, you can disable the BigQuery Storage API.

### Unable to use DateTime type data in DirectQuery mode

There's a known issue where the DateTime type isn't supported through DirectQuery. Selecting a column with the DateTime type causes an "Invalid query" error or a visual error.
