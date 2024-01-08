---
title: Connect to data using generic interfaces
description: Learn how to connect different data sources with generic interfaces.
author: bezhan-msft
ms.topic: conceptual
ms.date: 1/8/2024
ms.author: miescobar
---

# Connect to data using generic interfaces

You can connect to a multitude of different data sources using built-in connectors that range from Access databases to Zendesk resources. You can also connect to all sorts of *other* data sources to further expand your connectivity options, by using the generic interfaces (such as ODBC or REST APIs) built into Power Query Desktop and Power Query Online.

![Screenshot of the Power Query Desktop Get Data dialog, showing the O D B C selection.](media/connect-using-generic-interfaces/get-generic-data-1.png)

[![Screenshot of the Power Query Online Choose data source page, showing the O D B C selection.](media/connect-using-generic-interfaces/get-generic-data-2.png)](media/connect-using-generic-interfaces/get-generic-data-2.png#lightbox)

## Power Query data interfaces

Power Query includes an ever-growing collection of connectors that are built to connect to a specific data source. For example, the [SharePoint list](connectors/sharepoint-list.md) connector provides specific fields and supporting information during the connection sequence that are designed for SharePoint lists. Other data sources found in the window that appears when you choose to get data (in Power Query Desktop) or choose a data source (in Power Query Online) work in the same way.

In addition, you can also connect to data sources that aren't identified in the get data and choose data source lists by using one of the following generic data interfaces:

* ODBC
* OLE DB
* OData
* REST APIs
* R Scripts

By providing the appropriate parameters in the connection windows that these generic interfaces provide, the world of data sources you can access and use in Power Query grows significantly.

In the following sections, you can find lists of data sources that can be accessed by these generic interfaces.

## Data sources accessible through ODBC

The [ODBC](connectors/odbc.md) connector in Power Query lets you import data from any third-party ODBC driver simply by specifying a Data Source Name (DSN) or a connection string. As an option, you can also specify a SQL statement to execute against the ODBC driver.

![Screenshot of the O D B C connector dialog, showing the D S N and Advanced options.](media/connect-using-generic-interfaces/odbc-data-source.png)

## Data sources accessible through OLE DB

The OLE DB connector in Power Query lets you import data from any third-party OLE DB driver simply by specifying a connection string. As an option, you can also specify a SQL statement to execute against the OLE DB driver.

![Screenshot of the O L E D B connector dialog, showing the Connection string and Advanced options.](media/connect-using-generic-interfaces/ole-db-data-source.png)

The following list details a few examples of the data sources that Power Query can connect to using the generic OLE DB interface.

| Power Query generic connector | External data source | Link for more information |
| --- | --- | --- |
| OLE DB |SAS OLE DB |[SAS provider for OLE DB](https://support.sas.com/downloads/package.htm?pid=648) |
| OLE DB |Sybase OLE DB |[Sybase provider for OLE DB](http://infocenter.sybase.com/help/index.jsp?topic=/com.sybase.infocenter.dc35888.1550/doc/html/jon1256941734395.html) |

## Data sources accessible through OData

The [OData feed](connectors/odata-feed.md) connector in Power Query lets you import data from any OData URL simply by typing in or pasting the OData URL. You can add multiple URL parts by typing or pasting those links in the text boxes provided in the **OData feed** window.

![Screenshot of the OData Feed dialog, showing the U R L parts and preview fields.](media/connect-using-generic-interfaces/odata-data-source.png)

The following list details a few examples of the data sources that Power Query can connect to using the generic OData interface.

| Power Query generic connector | External data source | Link for more information |
| --- | --- | --- |
| OData |Coming soon |Check back soon for OData data sources |

## Data sources accessible through REST APIs

You can connect to data sources using the REST APIs and thereby use data from all sorts of data sources that support REST.

![Screenshot of the Query dialog, showing the data sources.](media/connect-using-generic-interfaces/rest-api-data-source.png)

The following list details a few examples of the data sources that Power BI Desktop can connect to using the generic REST APIs interface.

| Power BI Desktop generic connector | External data source | Link for more information |
| --- | --- | --- |
| REST APIs |Couchbase DB |[Couchbase REST API information](https://powerbi.microsoft.com/blog/visualizing-data-from-couchbase-server-v4-using-power-bi/) |

## Data sources accessible through R Script

You can use R scripts to access data sources, and use that data in Power BI Desktop.

![Screenshot of the R Script dialog, showing the execution script.](media/connect-using-generic-interfaces/r-script-data-source.png)

The following list details a few examples of the data sources that Power BI Desktop can connect to using the generic R scripts interface.

| Power BI Desktop generic connector | External data source | Link for more information |
| --- | --- | --- |
| R Script |SAS Files |[R script guidance from CRAN](https://cran.r-project.org/doc/manuals/R-data.html) |
| R Script |SPSS Files |[R script guidance from CRAN](https://cran.r-project.org/doc/manuals/R-data.html) |
| R Script |R Statistical Files |[R script guidance from CRAN](https://cran.r-project.org/doc/manuals/R-data.html) |
