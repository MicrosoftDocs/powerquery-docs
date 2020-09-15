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

This article lists many of the available<!--Suggested, if these lists aren't actually complete. (See note below.)--> data sources for creating or adding to dataflows, and describes how to create those dataflows by using these data sources. For an overview of how to create and use dataflows, see [Creating and using dataflows in Power BI](https://docs.microsoft.com/power-bi/service-dataflows-create-use).<!--It seems that this information is covered in get-data-experience.md. Can you link to that article here? Then you can remove the following H1 (which in any case is kind of an odd duck) and also the procedure at the end of the article (which see).-->
<!--
## Create a dataflow entity from a data source

To connect to data, open the dataflow authoring tool, and then select **Get data**.

![Add entities using the Get data command](media/dataflows-data-sources/dataflows-data-sources-03.png)
-->
## Data sources for dataflows

You can view the available data sources by selecting **Get data** from the dataflow authoring tool, which then displays a dialog box as shown in the following image.

![Get data categories for dataflows](media/dataflows-data-sources/dataflows-data-sources-04.png)

Data sources for dataflows are organized into the following categories, which appear as tabs in the **Get data** dialog box:<!--I assume it's okay not to cover the Power BI Desktop UI also? -->

* All categories
* File
* Database
* Power Platform
* Azure
* Online Services
* Other

The **All categories** category contains all data sources, from all categories. 
<!--Is it okay that my instance of Power BI Desktop shows different data sources than the ones listed here? For example, it doesn't show "Access," and it does show "Folder," "PDF," and "SharePoint folder".-->
The **File** category includes the following available data connections for dataflows:

* Access<!--Does this really belong here? Seems old-fashioned.-->
* Excel
* JSON
* Text/CSV
* XML
<!--Please verify that all the following lists are complete. I only edited for branding.-->
The **Database** category includes the following available data connections for dataflows:

* IBM DB2 Database
* MySQL Database
* Oracle Database
* PostgreSQL Database
* SQL Server Database
* Sybase Database
* Teradata Database
* Vertica

The **Power Platform** category includes the following available data connections for dataflows:<!--Also "Common Data Service"?-->

* Power BI dataflows
* Power Platform dataflows

The **Azure** category includes the following available data connections for dataflows:

* Azure Blob Storage<!--Via Cloud Style Guide.-->
* Azure Data Explorer
* Azure SQL Data Warehouse
* Azure SQL Database
* Azure Table storage<!--Via Cloud Style Guide.-->

The **Online Services** includes the following available data connections for dataflows:

* Amazon Redshift
* Common Data Service<!--This name "for Apps" is deprecated. Also, it falls into the "Power Platform" category in my Power BI Desktop.-->
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
<!--note from editor: This section is covered by get-data-experience.md. I suggest deleting it entirely. If you don't want to, please redo the images so it uses the current name for Common Data Service (and its current location, if it has indeed been moved to a different category). -->
To connect to a data source, you select it. This section uses one example to show how the process works. Each data connection for dataflows is similar, but different connectors might require specific credentials or other information. In this example, you see in the following image that **Common Data Service** is selected from the **Online services** data connection category.
<!--Need a new image.-->
![Select Common Data Service](media/dataflows-data-sources/dataflows-data-sources-05.png)

A connection window for the selected data connection is displayed. If credentials are required, you're prompted to provide them. The following image shows a URL being entered to connect to a Common Data Service server.

![Credentials or URLs for data connections](media/dataflows-data-sources/dataflows-data-sources-06.png)

After the server URL or resource connection information is provided, select **Sign in** to enter the credentials to use for access to the data, and then select **Next**.

Power Query Online initiates and establishes the connection to the data source. It then presents the available tables from that data source in the **Navigator** window, as shown in the following image.
<!--This isn't a Navigator window, can you create a new image?-->
![Navigator window shows tables in the data source](media/dataflows-data-sources/dataflows-data-sources-07.png)

You can select tables and data to load by selecting the check box next to each in the left pane. To load the data, select **OK** from the bottom of the **Navigator** window<!--Or should this be **Load**?-->. A Power Query Online dialog box appears, where you can edit queries and perform any other transformation you want to the selected data.

![Edit queries and transform in Power Query Editor](media/dataflows-data-sources/dataflows-data-sources-08.png)

## Connecting to additional data sources

There are additional data connectors that aren't shown in the Power BI dataflows user interface, but are supported with a few additional steps.

You can take the following steps to create a connection to a connector that isn't displayed in the user interface:

1. Open Power BI Desktop, and then select **Get data**.
2. Open Power Query Editor in Power BI Desktop, right-click the relevant query, and then select **Advanced Editor**, as shown in the following image. From there, you can copy the M script that appears in the **Advanced Editor** window.

    ![Copy the M script from the Advanced Editor in Power BI Desktop](media/dataflows-data-sources/dataflows-data-sources-09.png) 

3. Open the Power BI dataflow, and then select **Get data** for a blank query.

    ![Create a blank query for a dataflow](media/dataflows-data-sources/dataflows-data-sources-10.png) 

4. Paste the copied query into the blank query for the dataflow.

    ![Copy the M script into the editor window](media/dataflows-data-sources/dataflows-data-sources-11.png) 

Your script then connects to the data source you specified.

The following list shows which connectors you can currently use by copying and pasting the M query into a blank query:
<!--Is this current?-->
* SAP Business Warehouse 
* Azure Analysis Services
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

## Next steps

This article showed which data sources you can connect to for dataflows. The following articles go into more detail about common usage scenarios for dataflows:

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

For more information about Common Data Model, you can read its overview article:
* [Common Data Model - overview ](https://docs.microsoft.com/powerapps/common-data-model/overview)
