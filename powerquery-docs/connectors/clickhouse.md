---
title: Power Query ClickHouse connector
description: Provides basic information, prerequisites, and instructions on how to connect to ClickHouse
author: bentsileviav
ms.topic: concept-article
ms.date: 9/11/2025
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# ClickHouse

>[!Note]
>This connector is owned and provided by ClickHouse, Inc.

## Summary

| Item                           | Description                                                                    |
|--------------------------------|--------------------------------------------------------------------------------|
| Release State                  | General Availability                                                           |
| Products                       | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | ClickHouse (Username/Password)                                                 |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

[!INCLUDE [Includes_clickhouse_prerequisites](includes/clickhouse/clickhouse-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_clickhouse_capabilities-supported](includes/clickhouse/clickhouse-capabilities-supported.md)]

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

[!INCLUDE [Includes_clickhouse_connect-to-power-query-online](includes/clickhouse/clickhouse-connect-to-power-query-online.md)]

## More Resources

For more information and examples, visit the following resources

* [ClickHouse's official documentation](https://clickhouse.com/docs/en/integrations/powerbi).
* [The connector's GitHub repository](https://github.com/ClickHouse/power-bi-clickhouse).
