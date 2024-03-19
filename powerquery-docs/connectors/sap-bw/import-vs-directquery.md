---
title: Import vs. DirectQuery for SAP BW
description: Describes the differences between using Import and DirectQuery mode in Power BI Desktop for SAP BW data sets.
author: dougklopfenstein
ms.topic: conceptual
ms.date: 1/25/2024
ms.author: dougklo
---

# Import vs. DirectQuery for SAP BW

> [!NOTE]
> This article discusses the differences between Import and DirectQuery modes in Power BI Desktop. For a description of using Import mode in Power Query Desktop or Power Query Online, go to the following sections:
>
>SAP BW Application Server connector:
>
>* [Connect to an SAP BW Application Server from Power Query Desktop](application-setup-and-connect.md#connect-to-an-sap-bw-application-server-from-power-query-desktop)
>* [Connect to an SAP BW Application Server from Power Query Online](application-setup-and-connect.md#connect-to-an-sap-bw-application-server-from-power-query-online)
>
>SAP BW Message Server connector:
>
>* [Connect to an SAP BW Message Server from Power Query Desktop](message-setup-and-connect.md#connect-to-an-sap-bw-message-server-from-power-query-desktop)
>* [Connect to an SAP BW Message Server from Power Query Online](message-setup-and-connect.md#connect-to-an-sap-bw-message-server-from-power-query-online)

With Power Query, you can connect to a wide variety of data sources, including online services, databases, different file formats, and others. If you are using Power BI Desktop, you can connect to these data sources in two different ways: either import the data into Power BI, or connect directly to data in the source repository, which is known as DirectQuery. When you connect to an SAP BW system, you can also choose between these two connectivity modes. For a complete list of data sources that support DirectQuery, refer to [Power BI data sources](/power-bi/connect-data/power-bi-data-sources).

The main differences between the two connectivity modes are outlined here, as well as guidelines and limitations, as they relate to SAP BW connections. For additional information about DirectQuery mode, go to [Using DirectQuery in Power BI](/power-bi/connect-data/desktop-directquery-about).

## Import Connections

When you connect to a data source with Power BI Desktop, the navigator will allow you to select a set of tables (for relational sources) or a set of source objects (for multidimensional sources).

For SAP BW connections, you can select the objects you want to include in your query from the tree displayed. You can select an InfoProvider or BEx query for an InfoProvider, expand its key figures and dimensions, and select specific key figures, characteristics, attributes (properties), or hierarchies to be included in your query.

The selection defines a query that will return a flattened data set consisting of columns and rows. The selected characteristics levels, properties and key figures will be represented in the data set as columns. The key figures are aggregated according to the selected characteristics and their levels. A preview of the data is displayed in the navigator. You can edit these queries in Power Query prior to loading the data, for example to apply filters, or aggregate the data, or join different tables.

When the data defined by the queries is loaded, it will be imported into the Power BI in-memory cache.

As you start creating your visuals in Power BI Desktop, the imported data in the cache will be queried. The querying of cached data is very fast and changes to the visuals will be reflected immediately.

However, the user should take care when building visuals that further aggregate the data, when dealing with non-additive measures. For example, if the query imported each *Sales Office*, and the *Growth %* for each one, then if the user built a visual that will *Sum* the *Growth %* values across all *Sales Offices*, that aggregation will be performed locally, over the cached data. The result wouldn't be the same as requesting the overall *Growth %* from SAP BW, and is probably not what's intended. To avoid such accidental aggregations, it's useful to set the **Default Summarization** for such columns to **Do not summarize**.

If the data in the underlying source changes, it won't be reflected in your visuals. It will be necessary to do a **Refresh**, which will reimport the data from the underlying source into the Power BI cache.

When you publish a report (.pbix file) to the Power BI service, a semantic model is created and uploaded to the Power BI server. The imported data in the cache is included with that semantic model. While you work with a report in the Power BI service, the uploaded data is queried, providing a fast response time and interactivity. You can set up a scheduled refresh of the semantic model, or re-import the data manually. For on-premise SAP BW data sources, it's necessary to configure an on-premises data gateway. Information about installing and configuring the on-premises data gateway can be found in the following documentation:

* [On-premises data gateway documentation](/data-integration/gateway/)
* [Manage gateway data source in Power BI](/power-bi/connect-data/service-gateway-data-sources)
* [Data source management in Power Platform](/power-platform/admin/onpremises-data-gateway-source-management)

## DirectQuery Connections

The navigation experience is slightly different when connecting to an SAP BW source in DirectQuery mode. The navigator will still display a list of available InfoProviders and BEx queries in SAP BW, however no Power BI query is defined in the process. You'll select the source object itself, that is, the InfoProvider or BEx query, and see the field list with the characteristics and key figures once you connect.

For SAP BW queries with variables, you can enter or select values as parameters of the query. Select the **Apply** button to include the specified parameters in the query.

Instead of a data preview, the metadata of the selected InfoCube or BEx Query is displayed. Once you select the **Load** button in **Navigator**, no data will be imported.

:::image type="content" source="load-into-directquery.png" alt-text="Load into DirectQuery.":::

You can make changes to the values for the SAP BW query variables with the **Edit Queries** option on the Power BI Desktop ribbon.

:::image type="content" source="edit-variables.png" alt-text="Edit variables.":::

As you start creating your visuals in Power BI Desktop, the underlying data source in SAP BW is queried to retrieve the required data. The time it takes to update a visual depends on the performance of the underlying SAP BW system.

Any changes in the underlying data won't be immediately reflected in your visuals. It is still necessary to do a **Refresh**, which reruns the queries for each visual against the underlying data source.

When you publish a report to the Power BI service, it again results in the creation of a semantic model in the Power BI service, just as for an import connection. However, no data is included with that model.

While you work with a report in the Power BI service, the underlying data source is queried again to retrieve the necessary data. For DirectQuery connections to your SAP BW and SAP HANA systems, you must have an [on-premises data gateway](/data-integration/gateway/service-gateway-install) installed and the [data source registered with the gateway](/power-bi/connect-data/service-gateway-data-sources).

For SAP BW queries with variables, end users can edit parameters of the query.

> [!NOTE]
>For the end user to edit parameters, the semantic model needs to be published to a premium workspace, in DirectQuery mode, and single sign-on (SSO) needs to be enabled.

## General Recommendations

You should import data to Power BI whenever possible. Importing data takes advantage of the high-performance query engine of Power BI and provides a highly interactive and fully featured experience over your data.

However, DirectQuery provides the following advantages when connecting to SAP BW:

* Provides the ability to access SAP BW data using SSO, to ensure that security defined in the underlying SAP BW source is always applied. When accessing SAP BW using SSO, the user’s data access permissions in SAP will apply, which may produce different results for different users. Data that a user isn't authorized to view will be trimmed by SAP BW.

* Ensures that the latest data can easily be seen, even if it's changing frequently in the underlying SAP BW source.

* Ensures that complex measures can easily be handled, where the source SAP BW is always queried for the aggregate data, with no risk of unintended and misleading aggregates over imported caches of the data. 

* Avoids caches of data being extracted and published, which might violate data sovereignty or security policies that apply.

Using DirectQuery is generally only feasible when the underlying data source can provide interactive queries for the typical aggregate query within seconds and is able to handle the query load that will be generated. Additionally, the list of limitations that accompany use of DirectQuery should be considered, to ensure your goals can still be met.

If you're working with either very large data sets or encounter slow SAP BW query response time in DirectQuery mode, Power BI provides options in the report to send fewer queries, which makes it easier to interact with the report. To access these options in Power BI Desktop, go to **File** > **Options and settings** > **Options**, and select **Query reduction**.

:::image type="content" source="query-reduction.png" alt-text="Setting query reduction.":::

You can disable cross-highlighting throughout your entire report, which reduces the number of queries sent to SAP BW. You can also add an **Apply** button to slicers and filter selections. You can make as many slicer and filter selections as you want, but no queries will be sent to SAP BW until you select the **Apply** button. Your selections will then be used to filter all your data.

These changes will apply to your report while you interact with it in Power BI Desktop, as well as when your users consume the report in the Power BI service.

In the Power BI service, the query cache for DirectQuery connections is updated on a periodic basis by querying the data source. By default, this update happens every hour, but it can be configured to a different interval in semantic model settings. For more information, go to [Data refresh in Power BI](/power-bi/connect-data/refresh-data).

Also, many of the general best practices described in [Using DirectQuery in Power BI](/power-bi/connect-data/desktop-directquery-about) apply equally when using DirectQuery over SAP BW. Additional details specific to SAP BW are described in [Connect to SAP Business Warehouse by using DirectQuery in Power BI](/power-bi/desktop-directquery-sap-bw).

### See also

* [Windows authentication and single sign-on](single-sign-on.md)
