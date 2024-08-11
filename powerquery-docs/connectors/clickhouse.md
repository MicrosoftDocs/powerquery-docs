---
title: Power Query ClickHouse connector
description: Provides basic information, prerequisites, and instructions on how to connect to ClickHouse
author: bentsileviav
#ms.topic: conceptual
#ms.date: 8/11/2024
#ms.author: bentsileviav
---

# ClickHouse

> [!NOTE]
> The following connector article is provided by ClickHouse, Inc. the owner of this connector and a member of the
> Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or
> have changes you would like to see made to this article, visit the ClickHouse website and use the support channels
> there.

## Summary

| Item                           | Description                                                                    |
|--------------------------------|--------------------------------------------------------------------------------|
| Release State                  | Preview                                                                        |
| Products                       | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | ClickHouse (Username/Password)                                                 |

> [!NOTE]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific
> capabilities.

## Prerequisites

* A running ClickHouse setup
* Customers must install the [ClickHouse ODBC driver](https://github.com/ClickHouse/clickhouse-odbc) before using the
  connector

## Capabilities supported

* Import
* DirectQuery (Power BI semantic models)

## Connect to ClickHouse from Power Query Desktop

On the Power BI Desktop start screen, click "Get Data".

<img src={require('./media/clickhouse/powerbi_05.png').default} class="image" alt="Getting started with Power BI
Desktop"
style={{width: '50%', 'background-color': 'transparent'}}/>
<br/>

Search for "ClickHouse"

<img src={require('./media/clickhouse/powerbi_06.png').default} class="image" alt="Choosing the data source"
style={{width:
'50%', 'background-color': 'transparent'}}/>
<br/>

Select the connector, and fill the following boxes:

* Server (required field) - Your instance domain/address. Make sure to add it with no prefixes/suffixes.
* Port (required field) - Your instance port.
* Database - Your database name.
* Options - Any ODBC option as listed
  in [ClickHouse ODBC GitHub Page](https://github.com/ClickHouse/clickhouse-odbc#configuration)
* Data Connectivity mode - Choose DirectQuery for querying ClickHouse directly. In case you have a small load, you can
  choose import mode, and the entire data will be loaded to Power BI.

<img src={require('./media/clickhouse/powerbi_07.png').default} class="image" alt="Filling ClickHouse instance
information"
style={{width: '50%', 'background-color': 'transparent'}}/>
<br/>

* Specify username and password

<img src={require('./media/clickhouse/powerbi_08.png').default} class="image" alt="Username and password prompt"
style={{width:
'50%', 'background-color': 'transparent'}}/>
<br/>

Finally, you should see the databases and tables in the Navigator view. Select the desired table and click "Load" to
import the data from ClickHouse.

<img src={require('./media/clickhouse/powerbi_09.png').default} class="image" alt="Navigator view" style={{width: '50%',
'background-color': 'transparent'}}/>
<br/>

Once the import is complete, your ClickHouse Data should be accessible in Power BI as usual.
<br/>

## Connect to ClickHouse from Power Query Online

ClickHouse connector integration with Power BI cloud service requires to initiate a data gateway.

What is a data gateway? 
> The on-premises data gateway acts as a bridge to provide quick and secure data transfer between on-premises data (data that isn't in the cloud) and several Microsoft cloud services. These cloud services include Power BI, PowerApps, Power Automate, Azure Analysis Services, and Azure Logic Apps. By using a gateway, organizations can keep databases and other data sources on their on-premises networks, yet securely use that on-premises data in cloud services.

Why such a gateway is required?
>Both custom and certified connectors with extra components (for example, ODBC driver) need the extra component to be installed on the end user machine and require the on-premises data gateway.
Steps required for the integration:

1. Follow all steps listed in the PowerBI desktop usage above.
2. Install the data gateway, detailed instructions can be found in [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install).
3. Follow [this Microsoft example on how to configure your Power BI service to work with the Gateway](/power-bi/connect-data/service-gateway-sql-tutorial#connect-the-dataset-to-the-sql-server-database)