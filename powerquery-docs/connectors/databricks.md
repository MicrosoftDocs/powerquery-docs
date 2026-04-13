---
title: Databricks Power Query Connector
description: Provides basic information and prerequisites for using the Power Query Databricks connector.
author: whhender

ms.topic: concept-article
ms.date: 10/29/2025
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Databricks

>[!Note]
>This connector is owned and provided by Databricks.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Username/Password<br/>Personal Access Token<br/> OAuth (OIDC) |

> [!NOTE]
>Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

> [!NOTE]
>The Databricks connector for Power BI now supports the [Arrow Database Connectivity (ADBC)](https://github.com/apache/arrow-adbc/blob/main/csharp/src/Drivers/Databricks/readme.md) driver. This feature is available in preview. Learn more [here](#arrow-database-connectivity-driver-connector-implementation-preview).

## Prerequisites

[!INCLUDE [Includes_databricks_prerequisites](includes/databricks/databricks-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_databricks_capabilities-supported](includes/databricks/databricks-capabilities-supported.md)]

## Connect to Databricks from Power Query Desktop

To connect to Databricks from Power Query Desktop, take the following steps:

1. In the Get Data experience, search for **Databricks** to shortlist the **Databricks** connector. You should only use the **Databricks** connector here for your Databricks SQL Warehouse data (running on AWS) if you're using OAuth for authentication.

    :::image type="content" source="./media/databricks/get-data-dbc.png" alt-text="Get Data from Databricks Cloud.":::

2. Provide the **Server hostname** and **HTTP Path** for your Databricks SQL Warehouse. Refer to [Configure the Databricks ODBC and JDBC drivers](/azure/databricks/integrations/bi/jdbc-odbc-bi) for instructions to look up your "Server hostname" and "HTTP Path". Enter this information accordingly. You can optionally supply a default catalog and/or database under **Advanced options**. Select **OK** to continue.

    :::image type="content" source="./media/databricks/dbc-sql-endpoint.png" alt-text="Specify your Databricks SQL Warehouse.":::

3. Provide your credentials to authenticate with your Databricks SQL Warehouse. You have three options for credentials:

    * Databricks Client Credentials. Refer to [Databricks OAuth M2M](https://docs.databricks.com/aws/en/dev-tools/auth/oauth-m2m) for instructions on generating Databricks OAuth M2M Client Credentials.
    * Personal Access Token. Refer to [Personal access tokens](/azure/databricks/sql/user/security/personal-access-tokens) for instructions on generating a Personal Access Token (PAT).
    * OAuth (OIDC). Sign in to your organizational account using the browser popup.

      :::image type="content" source="./media/databricks/dbc-pat.png" alt-text="Specify an appropriate token.":::

    > [!NOTE]
    > Once you enter your credentials for a particular Databricks SQL Warehouse, Power BI Desktop caches and reuses those same credentials in subsequent connection attempts. You can modify those credentials by going to **File > Options and settings > Data source settings**. More information: [Change the authentication method](../ConnectorAuthentication.md#change-the-authentication-method)

4. Once you successfully connect, the **Navigator** shows the data available to you on the cluster. You can choose either **Transform Data** to transform the data using Power Query or **Load** to load the data in Power Query Desktop.

    :::image type="content" source="./media/databricks/navigator-with-filter.png" alt-text="Image of Power Query navigator loading Databricks Cloud data to desktop app.":::

## Connect to Databricks data from Power Query Online

[!INCLUDE [Includes_databricks_connect-to-power-query-online](includes/databricks/databricks-connect-to-power-query-online.md)]

## Arrow Database Connectivity driver connector implementation (Preview)

You can use the [Arrow Database Connectivity (ADBC)](https://github.com/apache/arrow-adbc/blob/main/csharp/src/Drivers/Databricks/readme.md) driver for the Databricks connector in Power BI. As we continue to enhance and add new capabilities to this connector, we recommend that you to upgrade to the latest version to try it out and [submit product feedback](https://docs.databricks.com/aws/en/resources/ideas).

To switch to the ADBC driver:

1. Open your desired dashboard in Power BI.
1. Select **Transform Data**.
1. Select **Advanced Editor** in the **Query** option section.
1. Specify `Implementation="2.0"` for ADBC.

    ```powerquery-m
    let
        Source = DatabricksMultiCloud.Catalogs("<instance-name>.cloud.databricks.net", "/sql/1.0/warehouses/<sql-warehouse-id>",
            [Catalog=null, Database=null, EnableAutomaticProxyDiscovery=null, Implementation="2.0"]),
        powerbi_Database = Source{[Name="powerbi",Kind="Database"]}[Data],
        default_Schema = powerbi_Database{[Name="default",Kind="Schema"]}[Data],
        dashboard_data_Table = default_Schema{[Name="dashboard_data",Kind="Table"]}[Data]
    in
        dashboard_data_Table
    ```
