---
title: Power Query Digital Construction Works Insights Connector
description: Provides basic information and prerequisites for the Digital Construction Works Insights connector, descriptions of the optional input parameters, and discusses limitations and issues you might encounter.
author: DougKlopfenstein
ms.topic: concept-article
ms.date: 11/11/2025
ms.author: dougklo
ms.subservice: connectors
---

# Digital Construction Works Insights

> [!NOTE]
>This connector is owned and provided by Digital Construction Works.

## Summary

| Item | Description |
| ------- | ------------|
| Release state | General availability |
| Products supported | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication types supported| Digital Construction Works JSON Web Token (JWT) |
| Function reference docs | &mdash; |

## Prerequisites

Use of this connector requires a Digital Construction Works Integrations Platform subscription. To learn more, go to https://www.digitalconstructionworks.com/solutions/the-dcw-integrations-platform. Visit https://www.digitalconstructionworks.com for company information.

Users of the Digital Construction Works (DCW) Integrations Platform can request a JSON Web Token (JWT) from their project administrator in order to access data using the DCW Insights connector. Users can then follow the documentation for the OData API to connect to the data sets they want to use in Power BI.

## Capabilities supported

* Import

## Connect to DCW Insights OData API from Power Query Desktop

To connect to a DCW Insights project, take the following steps:

1. Under **Get Data** in Power BI Desktop, choose the **Digital Construction Works Insights** connector from the **Online Services**.

   :::image type="content" source="./media/dcw-insights-connector/step1.png" alt-text="Screenshot of the DCW Integrations Platform Insights dialog before the API URL is entered.":::

2. In **Insights Api Url**, provide the URL to the OData API you want to connect to. You need to use `https`, and you need your full project URL and product name included in the URL. You can also enter in query string parameters if the URL calls for it.

   :::image type="content" source="./media/dcw-insights-connector/step2.png" alt-text="Screenshot of the DCW Integrations Platform Insights dialog with an API URL entered.":::

3. Select **OK**.

4. If you're connecting to this endpoint for the first time, you're asked to enter in the [JWT](#prerequisites) used to authorize you for this project. Then select **Connect**.

   :::image type="content" source="./media/dcw-insights-connector/step3.png" alt-text="Screenshot of the DCW Insights JWT authentication dialog with blank Account key in which to enter the JWT.":::

   For more information about authentication methods, go to [Authentication with a data source](../connectorauthentication.md).

   > [!NOTE]
   > If the connection isn't specified to use `https`, you're prompted to update your URL.

5. In **Navigator**, select the database information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query editor.

   :::image type="content" source="./media/dcw-insights-connector/step4.png" alt-text="Screenshot of the Power Query Desktop Navigator showing specific product data.":::

## Troubleshooting

### Always Encrypted columns

Power Query doesn't support "Always Encrypted" columns.

### OData.Feed

We use the following default settings when using [OData.Feed](odata-feed.md):

Implementation = "2.0", MoreColumns = true, ODataVersion = 4
