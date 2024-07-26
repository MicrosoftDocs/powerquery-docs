---
title: Connect to data sources for dataflows
description: Learn how to connect to data sources for dataflows.
author: Luitwieler
ms.topic: conceptual
ms.date: 7/24/2024
ms.author: jeluitwi
---

# Connect to data sources for dataflows

With Microsoft Power BI and Power Platform dataflows, you can connect to many different data sources to create new dataflows, or add new tables to an existing dataflow.

This article describes how to create dataflows by using these data sources. For an overview of how to create and use dataflows, go to [Creating a dataflow](/power-bi/service-dataflows-create-use) for Power BI service and [Create and use dataflows in Power Apps](/powerapps/maker/data-platform/create-and-use-dataflows).

## Create a dataflow from a data source

To create a dataflow from a data source, you first have to connect to your data.

# [Power BI service](#tab/power-bi-service)

To connect to data in Power BI:

1. Open a workspace.
2. Select **New**.
3. Select **Dataflow** from the drop-down menu.
4. Under **Define new tables**, select **Add new tables**.

:::image type="content" source="media/data-sources/dataflows-data-sources-pbi-online.png" alt-text="Screenshot of the Power BI service where you add tables from the new dataflow command.":::

# [Power Apps](#tab/power-apps)

To connect to data in Power Apps:

1. Select **More** > **Dataflows**.
2. Select **New Dataflow**.
3. In the **New Dataflow** dialog box, enter a name for the new dataflow.
4. Select **Create**.

:::image type="content" source="media/data-sources/dataflows-data-sources-pa-online.png" alt-text="Screenshot of the Power Apps new dataflow dialog, where you select the name of your new dataflow.":::

---

## Data sources for dataflows

Once you create the dataflow from the dataflow authoring tool, you're presented with the **Choose data source** page. Either use **Search** to search for the name of the connector, or select **View more** to see a list of all the connectors available in Power BI service.

:::image type="content" source="media/data-sources/power-bi-service-search-view-more.png" alt-text="Screenshot of the Choose data source page with the search box and the view more selection emphasized." lightbox="media/data-sources/power-bi-service-search-view-more.png":::

If you choose to view more connectors, you can still use **Search** to search for the name of the connector, or choose a category to see a list of connectors associated with that category.

:::image type="content" source="media/data-sources/power-bi-service-view-more.png" alt-text="Screenshot of the Choose data source page displayed after selecting view more, including the categories at the top and then the list of connectors." lightbox="media/data-sources/power-bi-service-view-more.png":::

The following categories appear as tabs in the **New source** page:

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

:::image type="content" source="media/data-sources/dataflows-data-sources-05.png" alt-text="Screenshot of the New source page with the database tab selected and the SQL Server database connector emphasized.":::

A connection window for the selected data connection is displayed. If credentials are required, you're prompted to provide them. The following image shows a server and database being entered to connect to a SQL Server database.

:::image type="content" source="media/data-sources/dataflows-data-sources-06.png" alt-text="Screenshot of the connection settings and connection credentials for a data connection.":::

After the server URL or resource connection information is provided, enter the credentials to use for access to the data. You might also need to enter the name of an on-premises data gateway. Then select **Next**.

Power Query Online initiates and establishes the connection to the data source. It then presents the available tables from that data source in the **Navigator** window.

:::image type="content" source="media/data-sources/dataflows-data-sources-07.png" alt-text="Screenshot of the navigator window showing the tables in the data source.":::

You can select tables and data to load by selecting the check box next to each in the left pane. To transform the data you chose, select **Transform data** from the bottom of the **Navigator** window. A Power Query editor page appears, where you can edit queries and perform any other transformations you want to the selected data.

:::image type="content" source="media/data-sources/dataflows-data-sources-08.png" alt-text="Screenshot of the Power Query editor where you edit queries and transform data.":::

## Related content

This article showed which data sources you can connect to for dataflows. The following articles go into more detail about common usage scenarios for dataflows:

* [Self-service data prep in Power BI](create-use.md)
* [Using incremental refresh with dataflows](incremental-refresh.md)
* [Creating computed tables in dataflows](computed-tables.md)
* [Link tables between dataflows](linked-tables.md)

For information about individual Power Query connectors, go to the [connector reference list of Power Query connectors](../connectors/index.md), and select the connector you want to learn more about.

The following articles discuss how to use Power Query connectors in more detail:

* [Where to get data](../where-to-get-data.md)
* [Alternatives to out-of-box connectivity in Power BI Desktop](../connector-alternatives)
* [Connect to data using generic interfaces](../connect-using-generic-interfaces)

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
