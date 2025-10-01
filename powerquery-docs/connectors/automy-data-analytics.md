---
title: Power Query Automy Data Analytics Connector
description: Provides basic information and prerequisites for the Automy Data Analytics connector
author: cquintero89
ms.topic: conceptual
ms.date: 9/15/2025
ms.author: dougklo
ms.subservice: connectors
---

# Automy Data Analytics

>[!Note]
>This connector is owned and provided by AUTOMY.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Automy Report Token |

## Prerequisites

Before you can sign in to Automy Data Analytics, you must have an Automy Report Token.

## Capabilities Supported

* Import
* Optional date range parameters for certain tables and functions

## New Features in Version 1.2.1

- **Added Tables:**
  - **Delegations**
  - **Delegation Items**
  - **Delegated Tasks**
  - **Instance Approvers**
- **Optional Date Range Parameters:**
  - Added optional `start` and `end` parameters to certain tables and functions to support filtering by date range.

## Connect to Automy Data Analytics data

To connect to Automy Data Analytics data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, select **Automy Data Analytics**, and then select **Connect**.

   :::image type="content" source="./media/automy-data-analytics/get-ada-data.png" alt-text="Get Data from Automy Data Analytics.":::

2. If this is the first time you're connecting to the Automy Data Analytics connector, a third-party notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

3. Sign in to the connector with API Key to verify your access to Automy.

   :::image type="content" source="./media/automy-data-analytics/auth-ada-key.png" alt-text="API Key Dialog.":::

   Once you've succeeded, select **Connect**.

4. In the Automy Data Analytics window that appears, select the correct parameters to prepare the connection. Select the type of report and data type and complete the token information, and then select **Ok**.

   > [!NOTE]
   > You can generate an authentication token for reports using the configuration option in Automy.

5. In the **Navigator** dialog box, select the Automy tables you want. You can then either load or transform the data.

   :::image type="content" source="./media/automy-data-analytics/nav-ada-data.png" alt-text="Get Data from Automy Data Analytics Navigator.":::

   If you’re selecting functions, be sure to select **Transform Data** so that you can add parameters to the functions you’ve selected. More information: [Using parameters](../power-query-query-parameters.md)

   :::image type="content" source="./media/automy-data-analytics/param-ada-function.png" alt-text="Load or transform data in Automy Data Analytics.":::

## Limitations and issues

Users should be aware of the following limitations and issues associated with accessing Automy Data Analytics data.

* Automy Data Analytics has a built-in limit of 100,000 rows returned per connection.

* The default rate limit for an Automy Data Analytics Company is 120 requests per minute per user.

Import from Automy Data Analytics will stop and display an error message whenever the Automy Data Analytics connector reaches any of the limits listed above.

For more guidelines on accessing Automy Data Analytics, contact [support@automy.global](mailto:support@automy.global).

### Credential error in the Navigator

If a credential error occurs in the Navigator, clear your recent data source settings.

1. In Power BI Desktop, select **File** > **Data source settings**.

   :::image type="content" source="./media/automy-data-analytics/datasource-ada-clear.png" alt-text="Select Automy sources.":::

2. Select the data source, and then select **Clear permissions**. Establish the connection to the navigation again.