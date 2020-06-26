---
title: How to migrate queries from Power Query in the desktop (Power BI and Excel) to dataflows
description: How to migrate queries from Power Query in the desktop (Power BI and Excel) to dataflows
author: radacad
ms.service: powerquery
ms.topic: conceptual
ms.date: 05/25/2020
ms.author: gepopell

---
# How to migrate queries from Power Query in the desktop (Power BI and Excel) to dataflows

If you already have queries in Power Query, either in Power BI Desktop or in Excel, you might want to migrate the queries into dataflows. Although there's no migration tool or service available at this stage, the migration process is simple and straightforward. In this article, you'll learn the steps to do so.

## Copy queries from the Desktop

To copy queries from Power Query in the desktop tools (such as Excel or Power BI): 

1. In Power BI Desktop, open Power Query Editor by selecting **Transform Data** in the **Home** ribbon.

![Open Power Query Editor](media/OpeningPowerQueryEditor.png)

2. In Excel, this option is under **Data > Get Data > Launch Power Query Editor**.

![Launch Power Query Editor from Excel](media/LaunchQueryEditorfromExcel.png)

## If you have folders

If you've organized your queries into folders (which are called groups in Power Query), then copy them using the method below.

In the **Queries** pane, select the folders you want to migrate to the dataflow by holding the **Ctrl** key on the keyboard, and then the mouse-left-click. Once you've selected all the folders, copy them all using **Ctrl+C**.

![Select and Copy folders](media/SelectFolders.png)

## If you don't have folders

If you aren't using folders in the Power Query, then you can select queries using the same approach of holding the **Ctrl** key on the keyboard, and then the mouse-left click. Once you've selected all the queries, copy them all using **Ctrl+C**.

![Copy Queries](media/SelectQueries.png)

### Paste the script into the dataflow

1. Create a dataflow if you don't have one already.

   ![Create a Power BI dataflow](media/CreatePBIDataflow.png)

   The following articles will help you create the dataflow in Power BI or Power Platform:

   -   [Create and use dataflows in Power Platform](https://docs.microsoft.com/data-integration/dataflows/dataflows-integration-overview)
    
   -   [Creating and using dataflows in Power BI](https://docs.microsoft.com/power-bi/service-dataflows-create-use)

2. Paste the copied folders or queries in the **Queries** pane of the dataflow Power Query Editor using **Ctrl+V**.

   ![Paste queries or folders into the dataflow](media/PasteInDataflow.png)

   The image below shows an example of copied folders.

   ![Copy & Paste is done successfully](media/CopiedSuccessfully.png)

### Connect the on-premises data gateway

If your data source is an on-premises source, then you need to do this extra step. Examples of on-premises sources can be Excel files in a shared folder in a local domain, or a SQL Server database hosted in an on-premises server.

Dataflow, as a cloud-based service, requires the on-premises data gateway to connect to the on-premises data source. If the source is an on-premises source, you should [install and configure the gateway](https://docs.microsoft.com/data-integration/gateway/service-gateway-install) for that source system, and then add [the data source for it](https://docs.microsoft.com/data-integration/gateway/service-gateway-manage). Once these are all ready, you can select the on-premises data gateway when creating the entity in the dataflow.

![Gateway setup](media/SetupGatewayForCopiedQuery.png)

The gateway isn't needed if the data source isn't an on-premises data source, such as an Azure SQL Database.

### Configure Connection

In the next step, configure the connection to the data source using the **Configure connection** option, enter credentials, or anything else needed to
connect to the data source at this stage.

![Configure the connection](media/ConfigureConnection.png)

### Verification

If you've done all the steps successfully, you should see the data values in the dataflow entity. 

## Some Power Query functions aren't available

Remember that although most of your queries will be working fine after setting up the gateway and connection configuration, there are a few that won't. Because not all the functions that are supported in Power Query in desktop tools are yet fully supported in Power Query in the dataflow, you might get an error message when you use specific functions. The figure below shows an example of one of these scenarios.

![Unsupported functions in the dataflow](media/MigrateToDataflowError.png)

If a scenario like this happens, you need to redevelop your query in Power Query using a set of steps that are supported in the dataflow. The list of functions that aren't yet supported in the dataflow is minimal, and functions are getting supported gradually. 

## Refresh the dataflow entities

After migrating your queries to the dataflow, set up a scheduled refresh for your dataflow. You must refresh the dataflow to get data loaded into these entities. You can also do a refresh for the first time as a manual refresh.

![Refresh the dataflow](media/scheduleRefresh.png)

## Get Data from Power Query Desktop

You can get data from the dataflow entity now in Power BI Desktop using Power BI dataflows, Power Platform dataflows, or Common Data Services (depending on what type of dataflow you're using).

![Get data from Dataflows in the Desktop](media/GetDatafromDataflow.png)

To learn more about how to get data from dataflow entities in Power Query Desktop, see [Connect to data created by Power Platform dataflows in Power BI Desktop](https://docs.microsoft.com/power-bi/desktop-connect-dataflows).
