---
title: SoftOne BI connector
description: This article provides information for the SoftOne BI connector and a tutorial for usage.
author: basilrormose
ms.service: powerquery
ms.topic: 
ms.date: 
ms.author: bezhan
ms.reviewer: kvivek
LocalizationGroup: reference
---

# SoftOne BI

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Preview |
| Products | Power BI (Datasets) |
| Authentication Types Supported | Basic (Soft1/Atlantis Web Services) |

## Prerequisites

You'll need to have the Soft1 ERP/CRM or Atlantis ERP product installed with a licensed SoftOne BI connector module. A web account must be configured in the application with access to the SoftOne BI Connector service. This account information and your installation serial number will be validated during authentication by the SoftOne BI connector.

The SoftOne BI connector is supported from Soft1 Series 5 version 500.521.11424 or later and Atlantis ERP version 3.3.2697.1 or later.

## Capabilities supported

* Import

## Connection instructions 

SoftOne provides many templates as Power BI template files (.pbit) that you can use or customize which will provide you with a start to your BI project. For example, Sales & Collections, and Finance.

To connect in Power BI Desktop using a new report, follow the steps below. If you're connecting from a report created using one of the SoftOne BI templates, refer to [using a provided template](#using-a-provided-template).

### Connect to your Soft1 or Atlantis data store from scratch

To load data from your installation with Power Query Desktop:

1. Select **Get Data > More... > Online Services** in Power BI Desktop and search for **SoftOne BI**.

![Select the SoftOne BI connector](media/softone-bi/softone-bi-select.png)

2. Then select **Connect**, and then **Sign in**.

![Sign in via the connector](media/softone-bi/softone-bi-connect.png)

3. An authentication form will display.

![Enter your installation serial number and Web Account credentials](media/softone-bi/softone-bi-login.png)

>[!NOTE]
>* If you enter incorrect credentials, you'll receive a message on the login form that your login failed due to invalid credentials.
>* If the SoftOne BI Connector is not activated, or the Web Account that you're using is not configured with the service, you'll receive a message that access is denied because the selected module is not activated.

4. After signing in with SoftOne Web Services, you can connect to your data store.

![Connect to your data store](media/softone-bi/softone-bi-connect-data-store.png)

Selecting **Connect** will take you to the navigation table and display the available tables from the data store from which you may select the data required.

5. In the navigator, you should now see the tables in your data store. Fetching the tables can take some time.

![Sample navigation table](media/softone-bi/softone-bi-navtable.png)


You must have uploaded the data from your Soft1 or Atlantis installation (per the product documentation) to see any tables. If you haven't uploaded your data, you won't see any tables displayed in the Navigation Table.

![No data tables - data has not been uploaded](media/softone-bi/softone-bi-no-data.png)

In this case, you'll need to go back to your application and upload your data.

### Using a provided template

1. Open the selected template, Power BI Desktop will attempt to load the data from the data store, and will prompt for credentials. 

![Enter your credentials](media/softone-bi/softone-bi-open-template.png)

2. Select **Sign in** and enter your credentials (Serial number, username, and password).

![Enter the your installation serial number and Web Account credentials](media/softone-bi/softone-bi-login.png)

3. Once you're authenticated, select **Connect**. 

![Connect to your data store](media/softone-bi/softone-bi-connect-data-store.png)

4. Power BI Desktop will fetch the data from the data store.

![Refreshing the data](media/softone-bi/softone-bi-refresh.png)

5. Once the refresh has completed, you're ready to start customizing the report or to publish it as is to the Power BI Service.

![Sales overview](media/softone-bi/softone-bi-sales-overview.png)

[!IMPORTANT]
If you're working with more that one Soft1/Atlantis installation, then when switching between data stores, you must clear the SoftOne BI credentials saved by Power BI Desktop.


