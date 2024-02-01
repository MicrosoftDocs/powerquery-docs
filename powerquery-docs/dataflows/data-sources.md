---
title: Connect to data sources for dataflows
description: Learn how to connect to data sources for dataflows.
author: bensack
ms.topic: conceptual
ms.date: 6/13/2023
ms.author: bensack
---

# Connect to data sources for dataflows

With Microsoft Power BI and Power Platform dataflows, you can connect to many different data sources to create new dataflows, or add new tables to an existing dataflow.

This article describes how to create dataflows by using these data sources. For an overview of how to create and use dataflows, go to [Creating a dataflow](/power-bi/service-dataflows-create-use) for Power BI service and [Create and use dataflows in Power Apps](/powerapps/maker/data-platform/create-and-use-dataflows).

## Create a dataflow from a data source

To create a dataflow from a data source, you'll first have to connect to your data.

# [Power BI service](#tab/power-bi-service)

To connect to data in Power BI:

1. Open a workspace.
2. Select **New**.
3. Select **Dataflow** from the drop-down menu.
4. Under **Define new tables**, select **Add new tables**.

![Add tables from the new dataflow command.](media/data-sources/dataflows-data-sources-pbi-online.png)

# [Power Apps](#tab/power-apps)

To connect to data in Power Apps:

1. Select **Data** > **Dataflows**.
2. Select **New Dataflow**.
3. In the **New Dataflow** dialog box, enter a name for the new dataflow.
4. Select **Create**.

![Add](media/data-sources/dataflows-data-sources-pa-online.png)

---

## Data sources for dataflows

Once you've created the dataflow from the dataflow authoring tool, you'll be presented with the **Choose data source** dialog box.

![Get data categories for dataflows.](media/data-sources/dataflows-data-sources-04.png)

Data sources for dataflows are organized into the following categories, which appear as tabs in the **Choose data source** dialog box:

* All categories
* File
* Database
* Power Platform
* Azure
* Online Services
* Other

For a list of all of the supported data sources in Power Query, go to [Connectors in Power Query](../connectors/index.md).

## Connect to a data source

To connect to a data source, select the data source. This section uses one example to show how the process works, but each data connection for dataflows is similar in process. Different connectors might require specific credentials or other information, but the flow is similar. In this example, **SQL Server database** is selected from the **Database** data connection category.

![Select SQL Server database from Databases category.](media/data-sources/dataflows-data-sources-05.png)

A connection window for the selected data connection is displayed. If credentials are required, you're prompted to provide them. The following image shows a server and database being entered to connect to a SQL Server database.

![Credentials or URLs for data connections.](media/data-sources/dataflows-data-sources-06.png)

After the server URL or resource connection information is provided, enter the credentials to use for access to the data. You may also need to enter the name of an on-premises data gateway. Then select **Next**.

Power Query Online initiates and establishes the connection to the data source. It then presents the available tables from that data source in the **Navigator** window.

![Navigator window shows tables in the data source.](media/data-sources/dataflows-data-sources-07.png)

You can select tables and data to load by selecting the check box next to each in the left pane. To transform the data you've chosen, select **Transform data** from the bottom of the **Navigator** window. A Power Query Online dialog box appears, where you can edit queries and perform any other transformations you want to the selected data.

![Edit queries and transform in Power Query Editor.](media/data-sources/dataflows-data-sources-08.png)

## Connecting to additional data sources

There are additional data connectors that aren't shown in the Power BI dataflows user interface, but are supported with a few additional steps.

You can take the following steps to create a connection to a connector that isn't displayed in the user interface:

1. Open Power BI Desktop, and then select **Get data**.
2. Open Power Query Editor in Power BI Desktop, right-click the relevant query, and then select **Advanced Editor**, as shown in the following image. From there, you can copy the M script that appears in the **Advanced Editor** window.

    ![Copy the M script from the Advanced Editor in Power BI Desktop.](media/data-sources/dataflows-data-sources-09.png)

3. Open the Power BI dataflow, and then select **Get data** for a blank query.

    ![Create a blank query for a dataflow.](media/data-sources/dataflows-data-sources-10.png)

4. Paste the copied query into the blank query for the dataflow.

    ![Copy the M script into the editor window.](media/data-sources/dataflows-data-sources-11.png)

Your script then connects to the data source you specified.

The following list shows which connectors you can currently use by copying and pasting the M query into a blank query:

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
* [Creating computed tables in dataflows](computed-tables.md)
* [Link tables between dataflows](linked-tables.md)

For information about individual Power Query connectors, go to the [connector reference list of Power Query connectors](../connectors/index.md), and select the connector you want to learn more about.

Additional information about dataflows and related information can be found in the following articles:

* [Create and use dataflows in Power BI](/power-bi/service-dataflows-create-use)
* [Using dataflows with on-premises data sources](/power-bi/service-dataflows-on-premises-gateways)
* [Developer resources for Power BI dataflows](/power-bi/service-dataflows-developer-resources)
* [Dataflows and Azure Data Lake integration (Preview)](/power-bi/service-dataflows-azure-data-lake-integration)

For more information about Power Query and scheduled refresh, you can read these articles:

* [Query overview in Power BI Desktop](/power-bi/desktop-query-overview)
* [Configuring scheduled refresh](/power-bi/refresh-scheduled-refresh)

For more information about Common Data Model, you can read its overview article:

* [Common Data Model - overview](/powerapps/common-data-model/overview)
