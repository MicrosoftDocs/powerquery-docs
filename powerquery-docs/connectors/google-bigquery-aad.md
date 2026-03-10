---
title: Google BigQuery (Microsoft Entra ID)
description: Provides basic information and prerequisites for the Google BigQuery (Microsoft Entra ID) connector for Power Query.
author: whhender
ms.topic: concept-article
ms.date: 07/01/2025
ms.author: whhender
ms.subservice: connectors
---

# Google BigQuery (Microsoft Entra ID)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products Supported | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows) |
| Authentication Types Supported | Organizational account |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

> [!NOTE]
>
> Since July 2025, we introduced a new implementation for the Google BigQuery (Microsoft Entra ID) connector, currently available in preview. Learn more about [this feature](#new-google-bigquery-connector-implementation-preview).

## Prerequisites

[!INCLUDE [Includes_google-bigquery-aad_prerequisites](includes/google-bigquery-aad/google-bigquery-aad-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_google-bigquery-aad_capabilities-supported](includes/google-bigquery-aad/google-bigquery-aad-capabilities-supported.md)]

## Connect to Google BigQuery (Microsoft Entra ID) data from Power Query Desktop

To connect to Google BigQuery (Microsoft Entra ID) from Power Query Desktop, take the following steps:

1. In the Get Data experience, search for and select **Google BigQuery (Microsoft Entra ID)**. More information: [Where to get data](../where-to-get-data.md)

   :::image type="content" source="media/google-bigquery-aad/get-data-desktop.png" alt-text="Screenshot with the Get Data dialog, with emphasis on the Google BigQuery (Microsoft Entra ID) connector.":::

2. Specify a **Billing Project ID**, which is required for the use of this connector. If you want to use any advanced options, select **Advanced options**. Otherwise, select either **Import** or **DirectQuery**, and then select **OK** to continue. More information: [Connect using advanced options](#connect-using-advanced-options)

   :::image type="content" source="media/google-bigquery-aad/project-id-desktop.png" alt-text="Screenshot of the Google BigQuery (Microsoft Entra ID) dialog, where you enter your billing project ID, select Import or DirectQuery, and optionally select advanced options.":::

3. The Google BigQuery (Microsoft Entra ID) connector supports connecting through a Microsoft Entra ID account. Select **Sign In** to continue.

   :::image type="content" source="media/google-bigquery-aad/sign-in-desktop.png" alt-text="Screenshot of the authentication dialog, indicating that you aren't currently signed in.":::

4. Once signed in, select **Connect** to continue.

   :::image type="content" source="media/google-bigquery-aad/signed-in-desktop.png" alt-text="Screenshot of the authentication dialog after you have signed in.":::

5. Once you successfully connect, a **Navigator** window appears and displays the data available on the server. Select your data in the navigator. Then select either **Transform Data** to transform the data in Power Query or **Load** to load the data in Power BI Desktop.

## Connect to Google BigQuery (Microsoft Entra ID) data from Power Query Online

[!INCLUDE [Includes_google-bigquery-aad_connect-to-power-query-online](includes/google-bigquery-aad/google-bigquery-aad-connect-to-power-query-online.md)]

## Connect using advanced options

Both Power Query Desktop and Power Query Online provide a set of advanced options that you can add to your query if needed.

The following table lists all of the advanced options you can set in Power Query Desktop and Power Query Online.

| Advanced option | Description |
| --------------- | ----------- |
| Use Storage API | A flag that enables using the [Storage API of Google BigQuery](https://cloud.google.com/bigquery/docs/reference/storage). This option is true by default. This option can be set to false to not use the Storage API and use REST APIs instead. |
| Connection timeout duration | The standard connection setting (in seconds) that controls how long Power Query waits for a connection to complete. You can change this value if your connection doesn't complete before 15 seconds (the default value.) |
| Command timeout duration | How long Power Query waits for a query to complete and return results. The default depends on the driver default. You can enter another value in minutes to keep the connection open longer. |
| Audience Uri | The URI that contains the *\<workforce pool ID>* that must be changed to the workforce-pool name used when setting up the [OIDC configuration](#oidc-configurations). The format for the Audience Uri value is `//iam.googleapis.com/locations/global/workforcePools/<workforce pool ID>/providers/azuread`. The default value for the *\<workforce pool ID>* is `powerquery-<TenantId>`, where *\<TenantId>* is your current Power BI tenant ID. If you update the Audience Uri, the string you enter will be used as-is. |
| ProjectID | The project that you want to run native queries on. This option is only available in Power Query Desktop. |
| Native query | For information, go to [Import data from a database using native database query](../native-database-query.md). In this version of native database query functionality, you need to use fully qualified table names in the format `Database.Schema.Table`, for example `SELECT * FROM DEMO_DB.PUBLIC.DEMO_TABLE`. This option is only available in Power Query Desktop. |

Once you've selected the advanced options you require, select **OK** in Power Query Desktop or **Next** in Power Query Online to connect to your Google BigQuery data.

## New Google BigQuery connector implementation (Preview)

Since July 2025, we introduced a new implementation for the Google BigQuery (Microsoft Entra ID) connector to enhance the integration with Google BigQuery, currently available in preview. It uses [Arrow Database Connectivity (ADBC)](https://github.com/apache/arrow-adbc/blob/main/csharp/src/Drivers/BigQuery/readme.md) instead of ODBC to connect to and retrieve data from Google BigQuery which improves performance especially for large result sets. As we continue to enhance and add new capabilities to this connector, we encourage you to upgrade to the latest version to try it out and [provide us feedback](https://aka.ms/gbq-connector-feedback).

> [!NOTE]
>
> This feature is supported in the 64-bit version of Power BI Desktop and doesn't work in the 32-bit version.

To access this feature in Power BI Desktop, navigate to **Options and settings** (under the **File** tab) > **Options** > **Preview features**, and then select the checkbox to enable the **Use new Google BigQuery connector implementation** option. Once the option is on, all the newly created connections automatically use the new connector implementation. 

Your existing connections remain unchanged. You can try out the feature by adding the `Implementation="2.0"` flag in `GoogleBigQueryAad.Database` in your queries as follows. This property differentiates the version of the connector you're using.

To access this feature in Dataflow Gen2, after you configure getting data from Google BigQuery, go to **Advanced editor** in the top ribbon, and add the `Implementation="2.0"` flag in `GoogleBigQueryAad.Database` in your queries as follows to use this new connector.

```powerquery-m
Source = GoogleBigQueryAad.Database([Implementation = "2.0"])
```

> [!NOTE]
> When you use the on-premises data gateway, note the minimal supported version is July 2025. You're recommended to use the latest version to evaluate this feature with the most current capabilities.

To aid with diagnosing any potential issue, you can find the `Implementation` as "2.0" and `DriverType` as "ADBC" in your Mashup logs.

Currently, this connector has the following known limitations: 

- Relationships are not supported.
- Proxy is not supported.

## Limitations and considerations

[!INCLUDE [Includes_google-bigquery-aad_limitations-and-considerations](includes/google-bigquery-aad/google-bigquery-aad-limitations-and-considerations-include.md)]

## Enable Microsoft Entra ID single sign-on (SSO) for Google BigQuery

We support Microsoft Entra ID SSO through both Power BI Service (cloud) and also through the on-premises data gateway. For more information about enabling Microsoft Entra ID SSO for all connectors, go to [Overview of single sign-on (SSO) for on-premises data gateways in Power BI](/power-bi/connect-data/service-gateway-sso-overview). Confirm directly with your Google contact that your system and accounts are set up correctly for Microsoft Entra ID SSO prior to attempting to connect in Power BI.

### Microsoft Entra ID single sign-on (SSO) through Power BI service

To configure a new connection in Power BI service:

1. In Power BI service, select **Admin portal** from the settings list.

   :::image type="content" source="./media/google-bigquery/admin-portal.png" alt-text="Screenshot of the setting menu opened, with the Admin portal emphasized.":::

2. Enable the **Google BigQuery SSO** option.

   :::image type="content" source="./media/google-bigquery/gbq-sso.png" alt-text="Screenshot of the Google BigQuery SSO option with the Enabled button enabled.":::

### Microsoft Entra ID single sign-on (SSO) for Google BigQuery with an on-premises data gateway

Before you can enable Microsoft Entra ID SSO for Google BigQuery, you must first enable Microsoft Entra ID SSO for all data sources that support Microsoft Entra ID SSO with an on-premises data gateway. Also, ensure you've upgraded to at least the December 2022 release of the on-premises data gateway:

1. In Power BI service, select **Admin portal** from the settings list.

   :::image type="content" source="./media/google-bigquery/admin-portal.png" alt-text="Another screenshot of the Settings menu with the Admin portal emphasized.":::

2. Under **Integration settings**, enable **Azure AD Single-Sign On (SSO) for Gateway**.

Once you've enabled Microsoft Entra ID SSO for all data sources, then enable Microsoft Entra ID SSO for Google BigQuery:

1. Enable the **Google BigQuery SSO** option.

2. Select **Manage gateways** from the settings list.

   :::image type="content" source="./media/google-bigquery/manage-gateways.png" alt-text="Screenshot of the Settings menu with Manage gateways emphasized.":::

3. Select a gateway, and then select **Choose Data Source**.

4. Under the **Data Source Settings** tab, enter a value in **Billing Project ID**. The **Billing Project ID** parameter is required when using Microsoft Entra ID and needs to be specified in **Advanced settings**. Also, select **Use SSO via Azure AD for DirectQuery queries**.
