---
title: How to migrate queries from Power Query in the desktop (Power BI and Excel) to dataflows
description: How to migrate queries from Power Query in the desktop (Power BI and Excel) to dataflows.
author: Luitwieler
ms.topic: conceptual
ms.date: 1/6/2023
ms.author: jeluitwi

---
# How to migrate queries from Power Query in the desktop (Power BI and Excel) to dataflows

If you already have queries in Power Query, either in Power BI Desktop or in Excel, you might want to migrate the queries into dataflows. The migration process is simple and straightforward. In this article, you'll learn the steps to do so.

To learn how to create a dataflow in Microsoft Power Platform, go to [Create and use dataflows in Power Platform](/data-integration/dataflows/dataflows-integration-overview). To learn how to create a dataflow in Power BI, go to [Creating and using dataflows in Power BI](/power-bi/service-dataflows-create-use).

## Migrating the queries from the desktop

To migrate queries from Power Query in the desktop tools:

1. Open Power Query Editor:

   * In Power BI Desktop on the **Home** tab, select **Transform data**.

     :::image type="content" source="media/how-to-migrate-queries/opening-power-query-editor.png" alt-text="Open Power Query Editor.":::

   * In Excel on the **Data** tab, select **Get Data**> **Launch Power Query Editor**.

     :::image type="content" source="media/how-to-migrate-queries/launch-query-editor-from-excel.png" alt-text="Open Power Query Editor from Excel.":::

2. Copy the queries:

   If you've organized your queries into folders (called *groups* in Power Query):

   1. In the **Queries** pane, select **Ctrl** as you select the folders you want to migrate to the dataflow.
   2. Select **Ctrl**+C.

      :::image type="content" source="media/how-to-migrate-queries/select-folders.png" alt-text="Select and copy folders.":::

   If you don't have folders:

   1. In the **Queries** pane, select **Ctrl** as you select the queries you want to migrate.
   1. Select **Ctrl**+C.

      :::image type="content" source="media/how-to-migrate-queries/select-queries.png" alt-text="Select and copy queries.":::

3. Paste the copied queries into a dataflow:

   1. Create a dataflow, if you don't have one already.

      :::image type="content" source="media/how-to-migrate-queries/create-pbi-dataflow.png" alt-text="Create a Power BI dataflow.":::

   2. Open the dataflow in Power Query Editor, and in the **Queries** pane, select **Ctrl**+V to paste the copied folders or queries.

      :::image type="content" source="media/how-to-migrate-queries/paste-in-dataflow.png" alt-text="Paste queries or folders into the dataflow.":::

   The image below shows an example of successfully copied folders.

   :::image type="content" source="media/how-to-migrate-queries/copied-successfully.png" alt-text="Copy and paste is done successfully.":::

4. Connect the on-premises data gateway.

   If your data source is an on-premises source, you need to perform an extra step. Examples of on-premises sources can be Excel files in a shared folder in a local domain, or a SQL Server database hosted in an on-premises server.

   A dataflow, as a cloud-based service, requires the on-premises data gateway to connect to the on-premises data source. You need to [install and configure the gateway](/data-integration/gateway/service-gateway-install) for that source system, and then add [the data source for it](/data-integration/gateway/service-gateway-manage). After you've completed these steps, you can select the on-premises data gateway when you create the table in the dataflow.

   :::image type="content" source="media/how-to-migrate-queries/setup-gateway-for-copied-query.png" alt-text="Gateway setup.":::

   The gateway isn't needed for data sources residing in the cloud, such as an Azure SQL database.

5. Configure the connection to the data source by selecting **Configure connection** and entering credentials or anything else you need to connect to the data source at this stage.

   :::image type="content" source="media/how-to-migrate-queries/configure-connection.png" alt-text="Configure the connection.":::

6. Verify the connection:

   If you've done all the steps successfully, you'll see a preview of the data in the Power Query Editor.

## Some Power Query Desktop functions require a gateway in Power Query Online

Some of the functions might require a gateway, even if their source is not located on-premises. Among these are functions such as [Web.BrowserContents](/powerquery-m/web-browsercontents) and [Web.Page](/powerquery-m/web-page). If this happens, you might get an error message indicating which specific function isn't supported. The figure below shows an example of one of these scenarios.

:::image type="content" source="media/how-to-migrate-queries/migrate-to-dataflow-error.png" alt-text="Unsupported functions in the dataflow.":::

If a scenario like this happens, you have two options. You can set up the gateway for that data source, or you can update the query in the Power Query Editor for the dataflow by using a set of steps that are supported without the need for the gateway.

## Refresh the dataflow tables

After migrating your queries to the dataflow, you must refresh the dataflow to get data loaded into these tables. You can refresh a dataflow manually or configure an automatic refresh based on the schedule of your choice.

:::image type="content" source="media/how-to-migrate-queries/schedule-refresh.png" alt-text="Refresh the dataflow.":::

## Get data from Power Query Desktop

You can now get data from dataflow tables in Power BI Desktop by using the Power Platform dataflow or Dataverse connectors (depending on what type of dataflow you're using, analytical or standard). More information: [Connect to data created by Power Platform dataflows in Power BI Desktop](/power-bi/desktop-connect-dataflows)

:::image type="content" source="media/how-to-migrate-queries/get-data-from-dataflow.png" alt-text="Get data from dataflows in Power BI Desktop.":::
