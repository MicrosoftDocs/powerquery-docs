---
title: Power Query CloudBluePSA connector
description: Provides basic information and prerequisites for the operation of the CloudBluePSA connector in conjunction with the API.
author: mohsad06
ms.topic: conceptual
ms.date: 2/1/2024
ms.author: dougklo
---

# CloudBluePSA (Beta)

> [!NOTE]
> The following connector article is provided by CloudBluePSA, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the CloudBluePSA website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | API Key |
| Function Reference Documentation | [CloudBluePSA Connector.Help](https://help.harmonypsa.com/articles/#!cloudblue-psa-4-28-publication/using-the-power-bi-connector) |

## Prerequisites

Before you can use the CloudBluePSA connector, you must have a CloudBluePSA instance (username/password) and an API key. Sign in to your PSA instance, which is usually at a URL similar to `YOUR_COMPANY_NAME.cloudbluepsa.io`, and then navigate to **Setup > Employees > Find employees** and add a new API user, which gives you an API key.

## Capabilities

* Import

## Connect to CloudBluePSA from Power Query Desktop

To connect to CloudBluePSA data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop.

1. Select the **Search** box and start typing **CloudBluePSA**. Then select **CloudBluePSA** from the list on the right, and select **Connect**.

   :::image type="content" source="./media/cloudbluepsa/get-data.png" alt-text="Screenshot of the Get Data dialog for CloudBluePSA.":::

1. In the **Retrieve all pages of data** window that appears, copy and paste the **URL** generated on the **GET** side of the API endpoint of your choice. Then in **Filter**, copy and paste the constructed filter on the same API endpoint. For example:

   **URL:**\
   `https://INSTANCE_URL/webapi/v1.3/tickets/getticketsreport`

   **Filter:**\ 
   `{  "pageno": 1,  "pagesize": 10,  "filters": [{"field": "Type", "op": "cn", "data": "n"}], "filterop": "AND",  "sortcolumn": "Name",  "sortorder": "Asc",  "resulttype": "Json",  "includeccysymbols": true,  "gridcolumns": "RefNumber,Type,Name"}`

   :::image type="content" source="./media/cloudbluepsa/retrieve-all-pages-of-data.png" alt-text="Screenshot showing Retrieve all pages of data for CloudBluePSA.":::

1. Select **OK**.

1. Provide your **API key** generated in CloudBluePSA and select **Connect**.

1. You need to select **Transform Data** and this selection opens the Power Query editor.  

1. Expand the **Data** column, then select **OK**.

   ![Screenshot of the Expand Data Column dialog.](./media/cloudbluepsa/expand-1.png)

1. Expand the **Column1.1** column. This time, on the list of columns, all the grid columns included in the filter are displayed. Select as many columns as required, and then select **OK**. 
All the selected data is now displayed, and can be reshaped and used to create reports as required.

   ![Screenshot showing the expanded Data Column1.1.](./media/cloudbluepsa/expand-1-1.png)

1. Select **Close & Apply**. You can now start using your data.

## Connect to CloudBluePSA from PowerQuery Online

To connect to CloudBluePSA:

1. From **Choose data source**, start typing in the search box: **CloudBluePSA**.

   :::image type="content" source="./media/cloudbluepsa/power-query-search-box.png" alt-text="Screenshot showing how to search for the connector in Power Query Online.":::

1. In **Connect to data source**, provide the **URL** and **Filter** as defined and generated in your instance, as shown in the example inside each text box. Finally paste your **API key** in the **Account Key** field.

   :::image type="content" source="./media/cloudbluepsa/power-query-connect-to-data-source.png" alt-text="Screenshot showing how to complete the Connect to data source.":::

1. Select **Next**.

1. In the **Navigator** screen, select the **Expand** button next to the **Data** column, and then select **OK**.

   ![Screenshot showing how to expand the Data Column.](./media/cloudbluepsa/power-query-expand-1.png)

1. Two new columns now appear. Select the **Expand** button next to the **Column1.1** column and then select **OK**. You can now start using your data.

   ![Screenshot showing how to expand the Column1.1 Column.](./media/cloudbluepsa/power-query-expand-1-1.png)

## Additional Resources

You might also find the following CloudBluePSA information useful:

* [CloudBluePSA Help Center](https://help.harmonypsa.com/home/)
* [Connecting Power BI to the API](https://help.harmonypsa.com/articles/#!cloudblue-psa-4-28-publication/connecting-powerbi-to-the-api)
* [API](https://help.harmonypsa.com/articles/#!cloudblue-psa-4-28-publication/api)
  * [Creating an API Key](https://help.harmonypsa.com/articles/#!cloudblue-psa-4-28-publication/creating-an-api-key)
  * [Using the API](https://help.harmonypsa.com/articles/#!cloudblue-psa-4-28-publication/using-the-api)
