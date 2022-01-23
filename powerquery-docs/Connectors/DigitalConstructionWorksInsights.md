---
title: Power Query Digital Construction Works Insights Connector
description: Provides basic information and prerequisites for the Digital Construction Works Insights connector, descriptions of the optional input parameters, and discusses limitations and issues you might encounter.
author: bezhan-msft
ms.service: powerquery
ms.topic: conceptual
ms.date: 1/22/2022
ms.author: bezhan
LocalizationGroup: reference
---

# Digital Construction Works Insights (Beta)

## Summary
 
| Item | Description |
| ------- | ------------|
|Release state | Beta |
| Products supported | Power BI (Datasets) |
| Authentication types supported| Digital Construction Works JSON Web Token ("JWT") |
| Function reference docs | - |
| | |

> [!NOTE]
> This requires a Digital Construction Works Integrations Platform subscription. To learn more, go here: https://www.digitalconstructionworks.com/solutions/the-dcw-integrations-platform. Visit https://www.digitalconstructionworks.com for company info.
 
## Prerequisites

Users of the Digital Construction Works ("DCW") Integrations Platform may request a JWT from their project administrator in order to access data via the DCW Insights connector. Users can then follow the documentation for the OData API in order to connect to the datasets they wish to use in PowerBi.
 
## Capabilities supported
* Import
    
## Connect to DCW Insights OData API from Power Query Desktop

To connect to a DCW Insights project, take the following steps:
 
1. Choose the Digital Construction Works Insights connector from the Online Services category under "Get Data" in PowerBi Desktop.

    ![Enter Api Url.](./media/dcw-insights-connector/step1.png)
 
2. In **Insights Api Url**, provide the url to the OData Api you wish to connect to. You need to use "https" and you need your full project url and product name included in the url. You may also enter in query string parameters if the Url calls for it.

   ![Enter Api Url.](./media/dcw-insights-connector/step2.png)

3. Select **OK**.

4. If this is the first time you're connecting to this endpoint, you will be asked to enter in the JWT used to authorize you for this project. Then select **Connect**.

   ![DCW Insights JWT Authentication.](./media/dcw-insights-connector/step3.png)

   For more information about authentication methods, go to [Authentication with a data source](../connectorauthentication.md).

   >[!Note]
   >  If the connection is not specified to use https, you'll be prompted to update your url.

5. In **Navigator**, select the database information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

   ![Power Query Desktop Navigator showing specific product data.](./media/dcw-insights/step4.png)

## Troubleshooting

### Always Encrypted columns

Power Query doesn't support 'Always Encrypted' columns.

### OData.Feed

We leverage the following default settings when using OData.Feed

Implementation = "2.0", MoreColumns = true, ODataVersion = 4