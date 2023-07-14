---
title: Power Query Amazon OpenSearch Service connector
description: Provides basic information and prerequisites for the Amazon OpenSearch Service connector, includes descriptions of the optional input parameters, and discusses limitations and issues you might encounter.
author: bezhan-msft
ms.topic: conceptual
ms.date: 7/13/2023
ms.author: bezhan
---

# Amazon OpenSearch Service (Beta)

>[!Note]
>The following connector article is provided by Amazon, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the OpenSearch website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Basic |

## Prerequisites

* Microsoft Power BI Desktop
* [OpenSearch](https://opensearch.org/docs/latest/opensearch/install/index/)
* [OpenSearch SQL ODBC driver](https://opensearch.org/docs/latest/search-plugins/sql/sql/odbc/)

## Capabilities supported

* Import
* DirectQuery (Power BI Datasets)

## Connect to OpenSearch Project

1. Open Power BI Desktop.

2. Select **Home** > **Get Data** > **More** > **Other**, select **OpenSearch Project**, and then select **Connect**.

3. You'll get a warning for using a third-party service. Select **Continue**.

4. Enter host and port values and select your preferred SSL option. Then select **OK**.

5. Select an authentication option. Enter credentials if necessary, and then select **Connect**.

6. Select the required table. Data preview will then be loaded.

7. Select **Load**.

8. Select the required columns for creating a graph.

## Troubleshooting

If you get an error indicating the driver wasn't installed, install the [OpenSearch SQL ODBC Driver](https://opensearch.org/docs/latest/search-plugins/sql/sql/odbc/).

If you get a connection error:

1. Check if the host and port values are correct.
2. Check if the authentication credentials are correct.
3. Check if the server is running.
