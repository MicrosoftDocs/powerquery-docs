---
title: SoftOne BI connector
description: This article provides information for the SoftOne BI connector and a tutorial for usage.
author: basilrormose
ms.topic: conceptual
ms.date: 9/11/2025
ms.author: dougklo
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# SoftOne BI (Beta)

>[!Note]
>This connector is owned and provided by SoftOne.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Basic (Soft1/Atlantis Web Services) |

## Prerequisites

You must have the Soft1 ERP/CRM or Atlantis ERP product installed with a licensed SoftOne BI connector module. A web account must be configured in the application with access to the SoftOne BI Connector service. This account information and your installation serial number are validated during authentication by the SoftOne BI connector.

The SoftOne BI connector is supported from Soft1 Series 5 version 500.521.11424 or later and Atlantis ERP version 3.3.2697.1 or later.

## Capabilities supported

* Import

## Connection instructions

SoftOne provides many templates as Power BI template files (.pbit) that you can use or customize which provides you with a start to your BI project. For example, Sales & Collections, and Finance.

To connect in Power BI Desktop using a new report, follow the steps below. If you're connecting from a report created using one of the SoftOne BI templates, see [Using a provided template](#using-a-provided-template) later in this article.

### Connect to your Soft1 or Atlantis data store from scratch

To load data from your installation with Power Query Desktop:

1. Select **Get Data > More... > Online Services** in Power BI Desktop and search for **SoftOne BI**. Select **Connect**.

    :::image type="content" source="media/softone-bi/softone-bi-select.png" alt-text="Select the SoftOne BI connector.":::

1. Select **Sign in**. An authentication form is displayed.

    :::image type="content" source="media/softone-bi/softone-bi-login.png" alt-text="Enter your installation serial number and Web Account credentials.":::

    > [!NOTE]
    >
    >* If you enter incorrect credentials, you'll receive a message stating that your sign in failed due to invalid credentials.
    >* If the SoftOne BI Connector is not activated, or the Web Account that you're using is not configured with the service, you'll receive a message stating that access is denied because the selected module is not activated.

1. After signing in with SoftOne Web Services, you can connect to your data store.

    :::image type="content" source="media/softone-bi/softone-bi-connect-data-store.png" alt-text="Connect to your data store.":::

    Selecting **Connect** takes you to the navigation table and display the available tables from the data store from which you can select the data required.

1. In the navigator, you should now see the tables in your data store. Fetching the tables can take some time.

    :::image type="content" source="media/softone-bi/softone-bi-navtable.png" alt-text="Sample navigation table.":::

    You must have uploaded the data from your Soft1 or Atlantis installation (per the product documentation) to see any tables. If you haven't uploaded your data, you won't see any tables displayed in the Navigation Table.

    :::image type="content" source="media/softone-bi/softone-bi-no-data.png" alt-text="No data tables - data has not been uploaded.":::

    In this case, you need to go back to your application and upload your data.

### Using a provided template

1. Open the selected template, Power BI Desktop attempts to load the data from the data store, and prompts for credentials.

    :::image type="content" source="media/softone-bi/softone-bi-open-template.png" alt-text="Enter your credentials.":::

1. Select **Sign in** and enter your credentials (Serial number, username, and password).

    :::image type="content" source="media/softone-bi/softone-bi-login.png" alt-text="Enter the your installation serial number and Web Account credentials.":::

1. Once you're authenticated, select **Connect**.

    :::image type="content" source="media/softone-bi/softone-bi-connect-data-store.png" alt-text="Connect to your data store.":::

    Power BI Desktop then fetches the data from the data store.

1. After the refresh completes, you're ready to start customizing the report or to publish it as is to the Power BI Service.

    :::image type="content" source="media/softone-bi/softone-bi-sales-overview.png" alt-text="Sales overview.":::

> [!IMPORTANT]
> If you're working with more than one Soft1/Atlantis installation, then when switching between data stores, you must clear the SoftOne BI credentials saved by Power BI Desktop.
