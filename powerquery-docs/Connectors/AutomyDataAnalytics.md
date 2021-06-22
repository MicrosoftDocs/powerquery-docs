---
title: Power Query Automy Data Analytics connector
description: Provides basic information and prerequisites for the connector, descriptions of the optional input parameters, and discusses limitations and issues you might encounter.
author: Carlos Quintero
ms.service: powerquery
ms.topic: conceptual
ms.date: 5/24/2021
ms.author: cquintero89
LocalizationGroup: reference
---

# Automy Data Analytics
 
## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI Desktop |
| Authentication Types Supported | Automy Report Token |
| | |
## Prerequisites
Before you can sign in to Automy Data Analytics, you must have an Automy Token Report.

 
## Capabilities Supported
* Import

## Connect to Automy Data Analytics data

To connect to Automy Data Analytics data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, select **Automy Data Analytics**, and then select **Connect**.

![Get Data from Automy Data Analytics](./media/automy-data-analytics/get-ada-data.png)

2. If this is the first time you're getting data through the Automy Data Analytics connector, a third-party notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

3. Sign in to the connector with API Key to verify your access to an Automy. 
  
![API Key Dialog](./media/automy-data-analytics/auth-ada-key.png)
  
    Once you've succeeded, select **Connect**.

3. In the Automy Data Analytics window that appears, select the correct parameters to prepared the connection. Select the type of report and data type and completed the token information, following the chart below;and then select **Ok**.

> [!NOTE]
> You can generate an authentication token for reports using the configuration option in Automy.

4. In the **Navigator** dialog box, select the Automy tables you want to load. You can then either load or transform the data.

![Get Data from Automy Data Analytics](./media/automy-data-analytics/nav-ada-data.png)

5. In the case of selecting functions, they will have to be invoked with the parameters requested from the **Transform Data** option in Power Query Editor.

![Load or transform data](./media/automy-data-analytics/param-ada-function.png)


### Credential error in the Navigator

Do one of the following:
-   Clear cache within Power BI (**File**, **Options**, **Clear cache)** and restart the connector, or
-   Select **Cancel** and select **Refresh** (top right).

![Authentication error](./media/automy-data-analytics/error-ada-token.png)

If you still receive a credential error after you clear cache, also clear your recent sources. 

1. Select (**File**, **Data source settings**)**

![Select Automy sources](./media/automy-data-analytics/datasource-ada-clear.png)

2. Clear data source and establish the connection to the navigation again.


## Limitations and issues

You should be aware of the following limitations and issues associated with accessing Automy Data Analytics data.

* Automy Data Analytics has a built-in limit of 100k rows returned per connection.

* The default rate limit for an Automy Data Analytics Company is 120 requests per minute per user.

Import from Automy Data Analytics will stop and display an error message whenever the Automy Data Analytics connector hits any of the limits listed above.

For additional guidelines on accessing Automy Data Analytics, contact support@automy.global
