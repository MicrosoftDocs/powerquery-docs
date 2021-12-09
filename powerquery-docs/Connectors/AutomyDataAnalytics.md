---
title: Power Query Automy Data Analytics Connector
description: Provides basic information and prerequisites for the Automy Data Analytics connector
author: bezhan-msft
ms.service: powerquery
ms.topic: conceptual
ms.date: 9/16/2021
ms.author: bezhan
LocalizationGroup: reference
---

# Automy Data Analytics (Beta)

>[!Note]
>The following connector article is provided by ACEROYALTY, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the ACEROYALTY website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI Desktop |
| Authentication Types Supported | Automy Report Token |
| | |

## Prerequisites

Before you can sign in to Automy Data Analytics, you must have an Automy Report Token.

## Capabilities Supported

* Import

## Connect to Automy Data Analytics data

To connect to Automy Data Analytics data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, select **Automy Data Analytics**, and then select **Connect**.

   ![Get Data from Automy Data Analytics](./media/automy-data-analytics/get-ada-data.png)

2. If this is the first time you're connecting to the Automy Data Analytics connector, a third-party notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

3. Enter the Environment parameter identificator. You can find it in the detail of the selected environment in AUTOMY and  **Ok**.

4. Sign in to the connector with API Key to verify your access to Automy.

   ![API Key Dialog](./media/automy-data-analytics/auth-ada-key.png)

   Once you've succeeded, select **Connect**.

5. In the Automy Data Analytics window that appears, select the correct parameters to prepare the connection. Select the type of report and data type and completed the token information, and then select **Ok**.

   > [!NOTE]
   > You can generate an authentication token for reports using the configuration option in Automy.

6. In the **Navigator** dialog box, select the Automy tables you want. You can then either load or transform the data.

   ![Get Data from Automy Data Analytics Navigator](./media/automy-data-analytics/nav-ada-data.png)

   If you’re selecting functions, be sure to select **Transform Data** so that you can add parameters to the functions you’ve selected. More information: [Using parameters](../power-query-query-parameters.md)

   ![Load or transform data in Automy Data Analytics](./media/automy-data-analytics/param-ada-function.png)

## Limitations and issues

Users should be aware of the following limitations and issues associated with accessing Automy Data Analytics data.

* Automy Data Analytics has a built-in limit of 100,000 rows returned per connection.

* The default rate limit for an Automy Data Analytics Company is 120 requests per minute per user.

Import from Automy Data Analytics will stop and display an error message whenever the Automy Data Analytics connector reaches any of the limits listed above.

For more guidelines on accessing Automy Data Analytics, contact [support@automy.global](mailto:support@automy.global).

### Credential error in the Navigator

If a credential error occurs in the Navigator, clear your recent data source settings.

1. In Power BI Desktop, select **File** > **Data source settings**.

   ![Select Automy sources](./media/automy-data-analytics/datasource-ada-clear.png)

2. Select the data source, and then select **Clear permissions**. Establish the connection to the navigation again.
