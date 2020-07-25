---
title: Connect to data sources for dataflows
description: Learn how to connect to data sources for dataflows
author: bensack
manager: kfile
ms.reviewer: ''

ms.service: dataflows
ms.topic: conceptual
ms.date: 08/15/2019
ms.author: bensack

LocalizationGroup: Data from files
---
# Connect to data sources for dataflows

With Power Platform dataflows, you can connect to many different data sources to create new dataflows, or add new entities to an existing dataflow.

This article lists the many available data sources for creating or adding to dataflows, and describes how to create those dataflows using these data sources.

For an overview of how to create and use dataflows, see [Creating and using dataflows in Power BI](https://docs.microsoft.com/power-bi/service-dataflows-create-use).

## Create a dataflow entity from a data source

To connect to data, launch the dataflow authoring tool and select **Get Data**. The following image shows the **Get data** button in the dataflow authoring tool. 

![Add entities using Get Data](media/dataflows-data-sources/dataflows-data-sources-03.png)


## Data sources for dataflows

You can view the available data sources by selecting **Get Data** from the dataflow authoring tool, which then displays a dialog for selecting the categories and each data source, as shown in the following image.

![Get data categories for dataflows](media/dataflows-data-sources/dataflows-data-sources-04.png)

Data sources for dataflows are organized into the following categories, which appear across the top of the **Get data** dialog:

* All categories
* File
* Database
* Power Platform
* Azure
* Online Services
* Other

The **All categories** category contains all data sources, from all categories. 

The **File** category includes the following available data connections for dataflows:

* Access
* Excel
* JSON
* Text/CSV
* XML

The **Database** category includes the following available data connections for dataflows:

* IBM DB2 Database
* MySQL Database
* Oracle Database
* PostgreSQL Database
* SQL Server Database
* Sybase Database
* Teradata Database
* Vertica

The **Power Platform** category includes the following available data connections for dataflows:

* Power BI dataflows
* Power Platform dataflows

The **Azure** category includes the following available data connections for dataflows:

* Azure Blobs
* Azure Data Explorer
* Azure SQL Data Warehouse
* Azure SQL Database
* Azure Tables

The **Online Services** includes the following available data connections for dataflows:

* Amazon Redshift
* Common Data Service for Apps
* Microsoft Exchange Online
* Salesforce Objects
* Salesforce Reports
* SharePoint Online List
* Smartsheet

The **Other** category includes the following available data connections for dataflows:

* Active Directory
* OData
* SharePoint List
* Web API
* Web page
* Blank table
* Blank Query


## Connect to a data source

To connect to a data source, select the data source. This section uses one example to show how the process works, but each data connection for dataflows is similar in process. Different connectors might require specific credentials or other information, but the flow is similar. In this example, you see in the following image that **Common Data Service for Apps** is selected from the **Online services** data connection category.

![Select Common Data Service for Apps](media/dataflows-data-sources/dataflows-data-sources-05.png)

A connection window for the selected data connection is displayed. If credentials are required, you're prompted to provide them. The following image shows a Server URL being entered to connect to a Common Data Service server.

![Credentials or URLs for data connections](media/dataflows-data-sources/dataflows-data-sources-06.png)

Once the Server URL or resource connection information is provided, select **Sign in** to enter the credentials to use for the data access, then select **Next**.

**Power Query Online** initiates and establishes the connection to the data source. It then presents the available tables from that data source in the **Navigator** window, as shown in the following image.

![Navigator window shows tables in the data source](media/dataflows-data-sources/dataflows-data-sources-07.png)

You can select tables and data to load by selecting the checkbox next to each in the left pane. To load the data, select **OK** from the bottom of the **Navigator** pane. A Power Query Online dialog appears. In this dialog, you can edit queries and perform any other transformation you want to perform to the selected data.

![Edit queries and transform in Power Query Editor](media/dataflows-data-sources/dataflows-data-sources-08.png)

That's all there is to it. Other data sources have similar flows, and use Power Query Online to edit and transform the data you bring into your dataflow.

## Connecting to additional data sources

There are additional data connectors that aren't shown in the Power BI dataflows user interface, but are supported with a few additional steps. 

You can take the following steps to create a connection to a connector that isn't displayed in the user interface:

1. Open **Power BI Desktop** and select **Get Data**.
2. Open **Power Query Editor** in Power BI Desktop, then right-click on the relevant query and open the **Advanced Editor**, as shown in the following image. From there, you can copy the M script that appears in the Advanced Editor.

    ![Copy the M script from the Advanced Editor in Power BI Desktop](media/dataflows-data-sources/dataflows-data-sources-09.png) 

3. Open the Power BI dataflow, and select **Get data** for a blank query.

    ![Create a blank query for a dataflow](media/dataflows-data-sources/dataflows-data-sources-10.png) 

4. Paste the copied query into the blank query for the dataflow.

    ![Copy the M script into the editor window](media/dataflows-data-sources/dataflows-data-sources-11.png) 

Your script then connects to the data source you specified. 

The following list shows which connectors you can currently use by copying and pasting the M query into a blank query:

* SAP Business Warehouse 
* Azure analysis Services
* Adobe Analytics
* ODBC
* OLE DB
* Folder
* SharePoint Online folder
* SharePoint folder
* Hadoop HDFS
* Azure HDInsight (HDFS)
* Hadoop file HDFS
* Informix (beta)

That's all there is to connecting to data sources in Power BI dataflows.


## Next Steps

This article showed which data sources you can connect to for dataflows. The following articles go into more detail about common usage scenarios for dataflows. 

* [Self-service data prep in Power BI](create-use.md)
* [Using incremental refresh with dataflows](incremental-refresh.md)
* [Creating computed entities in dataflows](computed-entities.md)
* [Link entities between dataflows](linked-entities.md)

Additional information about dataflows and related information can be found in the following articles:

* [Create and use dataflows in Power BI](https://docs.microsoft.com/power-bi/service-dataflows-create-use)
* [Using dataflows with on-premises data sources](https://docs.microsoft.com/power-bi/service-dataflows-on-premises-gateways)
* [Developer resources for Power BI dataflows](https://docs.microsoft.com/power-bi/service-dataflows-developer-resources)
* [Dataflows and Azure Data Lake integration (Preview)](https://docs.microsoft.com/power-bi/service-dataflows-azure-data-lake-integration)

For more information about Power Query and scheduled refresh, you can read these articles:
* [Query overview in Power BI Desktop](https://docs.microsoft.com/power-bi/desktop-query-overview)
* [Configuring scheduled refresh](https://docs.microsoft.com/power-bi/refresh-scheduled-refresh)

For more information about the Common Data Model, you can read its overview article:
* [Common Data Model - overview ](https://docs.microsoft.com/powerapps/common-data-model/overview)

