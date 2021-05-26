---
title: Power Query SumTotal connector
description: Provides basic information and prerequisites for the SumTotal connector, and outlines limitations and issues.
author: bezhan-msft
ms.service: powerquery
ms.topic: conceptual
ms.date: 5/25/2021
ms.author: bezhan
LocalizationGroup: reference
---

# SumTotal (Beta)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Datasets) |
| Authentication types | OAuth 2.0 |
| Function Reference Documentation | - | 
| | |

## Prerequisites

You must have a SumTotal hosted environment with standard permissions to access the portal, and read permissions to access data within tables.

## Capabilities supported

* Import

## Finding your SumTotal hosted URL

Copy the SumTotal hosted root URL in full. This root URL is the unique URL specific to your instance. The URL will be in the format of **https://\<*yourdomain*>.sumtotal.host/**. Make sure not to copy the rest of the URL. Keep this URL somewhere handy so you can use it later.

## Connect to SumTotal BI from Power BI Desktop

>[!NOTE]
>The Power Query SumTotal connector is currently only suited towards OData API endpoints. For more information, read the [SumTotal OData API specification](https://marketplace.sumtotalsystems.com/Home/ODataAPI).

To connect to SumTotal from Power BI Desktop:

1. In the **Get Data** experience, select **SumTotal** in the **Other** category, and then select **Connect**.

3. Enter the server URL address of the data you want to load.

>[!NOTE] 
>You'll be prompted with a script error; this is expected to load JS/CSS scripts that login form uses. Select **Yes**.

4. When the table is loaded in the **Navigator** experience, you'll be presented with the list of OData API entities that are currently supported by the connector. You can select to load one or multiple entities.

5. When you've finished selecting entities, select **Load** or  **Transform Data**.

>[!NOTE]
>If this is the first time you're connecting to this site, 
select **Sign in** and input your credentials. Then select **Connect**.

## Known issues and limitations

This section describes any limitations or considerations of the SumTotal connector.

### SumTotal OData API performance and throttling limits

For information about OData API performance and throttling limits for SumTotal connections, read the [SumTotal's OData API specification](https://marketplace.sumtotalsystems.com/Home/ODataAPI) under the **Important Notes** section. These limitations apply to both the SumTotal connector (which uses the OData API) and the 'actual' OData Hosted API when accessing the same endpoints.

### Table retrieval rate

Most default tables will be retrieved at approximately 1000 rows per second using the SumTotal connector. If you require faster retrieval rates, consider using the **RowVersionId** filter Parameter that you can pass directly into the environment hosted URL by appending it as a query string parameter, for example, **https://{host}.sumtotalystems.com/?rowVersionId=1234**.

