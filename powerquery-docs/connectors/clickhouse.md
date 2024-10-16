---
title: Power Query ClickHouse connector
description: Provides basic information, prerequisites, and instructions on how to connect to ClickHouse
author: bentsileviav
ms.topic: conceptual
ms.date: 9/30/2024
ms.author: dougklo
---

# ClickHouse (Beta)

> [!NOTE]
> The following connector article is provided by ClickHouse, Inc. the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the ClickHouse website and use the support channels there.

## Summary

| Item                           | Description                                                                    |
|--------------------------------|--------------------------------------------------------------------------------|
| Release State                  | Preview                                                                        |
| Products                       | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | ClickHouse (Username/Password)                                                 |

> [!NOTE]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

* A running ClickHouse setup.
* Customers must install the [ClickHouse ODBC driver](https://github.com/ClickHouse/clickhouse-odbc) before using the
  connector.

## Capabilities supported

* Import
* DirectQuery (Power BI semantic models)

## Connect to ClickHouse from Power Query Desktop

1. On the Power BI Desktop start screen, select **Get Data**.

   :::image type="content" source="./media/clickhouse/powerbi-05.png" alt-text="Getting started with Power BI Desktop.":::

1. Search for **ClickHouse**.

   :::image type="content" source="./media/clickhouse/powerbi-06.png" alt-text="Choosing the data source.":::

1. Select the connector, and fill the following boxes:

   * **Server** (required field): Your instance domain/address. Make sure to add it with no prefixes or suffixes.
   * **Port** (required field): Your instance port.
   * **Database**: Your database name.
   * **Options**: Any ODBC option as listed in the [ClickHouse ODBC GitHub Page](https://github.com/ClickHouse/clickhouse-odbc#configuration).
   * **Data Connectivity mode**: Choose **DirectQuery** for querying ClickHouse directly. In case you have a small load, you can choose import mode, and the entire data is loaded to Power BI.

   :::image type="content" source="./media/clickhouse/powerbi-07.png" alt-text="Filling ClickHouse instance information.":::

1. Specify your username and password.

   :::image type="content" source="./media/clickhouse/powerbi-08.png" alt-text="Username and password prompt.":::

Finally, you should see the databases and tables in the **Navigator** view. Select the desired table and select **Load** to
import the data from ClickHouse.

:::image type="content" source="./media/clickhouse/powerbi-09.png" alt-text="Navigator view.":::

Once the import is complete, your ClickHouse Data should be accessible in Power BI as usual.

## Connect to ClickHouse from Power Query Online

ClickHouse connector integration with Power BI cloud service requires you to initiate a data gateway.

**What is a data gateway?** 
> The on-premises data gateway acts as a bridge to provide quick and secure data transfer between on-premises data (data that isn't in the cloud) and several Microsoft cloud services. These cloud services include Power BI, PowerApps, Power Automate, Azure Analysis Services, and Azure Logic Apps. By using a gateway, organizations can keep databases and other data sources on their on-premises networks, yet securely use that on-premises data in cloud services.

**Why is such a gateway required?**
> Both custom and certified connectors with extra components (for example, an ODBC driver) need the extra component to be installed on the end user machine and require the on-premises data gateway.

Steps required for the integration:

1. Follow all steps listed in the [Power BI Desktop usage](#connect-to-clickhouse-from-power-query-desktop).
2. Install the data gateway. Detailed instructions can be found in [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install).
3. Follow [this Microsoft example on how to configure your Power BI service to work with the Gateway](/power-bi/connect-data/service-gateway-sql-tutorial#connect-the-dataset-to-the-sql-server-database).

## More Resources

For more information and examples, visit the following resources

* [ClickHouse's official documentation](https://clickhouse.com/docs/en/integrations/powerbi).
* [The connector's GitHub repository](https://github.com/ClickHouse/power-bi-clickhouse).
