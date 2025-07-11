---
title: Databricks Power Query Connector
description: Provides basic information and prerequisites for using the Power Query Databricks connector.
author: DougKlopfenstein

ms.topic: conceptual
ms.date: 1/6/2025
ms.author: dougklo
ms.subservice: connectors
---

# Databricks

> [!NOTE]
>The following connector article is provided by Databricks, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Databricks website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Username/Password<br/>Personal Access Token<br/> OAuth (OIDC) |

> [!NOTE]
>Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

> [!NOTE]
>The Databricks connector for Power BI now supports the [Arrow Database Connectivity (ADBC)](https://github.com/apache/arrow-adbc/blob/main/csharp/src/Drivers/Databricks/readme.md) driver. This feature is available in preview. Learn more [here](#arrow-database-connectivity-driver-connector-implementation).

## Prerequisites

This connector is only for use with a Databricks SQL Warehouse running on AWS and using OAuth. If you're using Azure Databricks, use the [Azure Databricks](databricks-azure.md) connector. If you aren't using OAuth with your Databricks SQL Warehouse (on AWS or GCP), use the [Azure Databricks](databricks-azure.md) connector too. Databricks Community Edition isn't supported.

## Capabilities supported

* Import
* DirectQuery (Power BI semantic models)

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

To connect to Databricks from Power Query Online, take the following steps:

1. Select the **Databricks** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../where-to-get-data.md).

   Shortlist the available Databricks connector with the search box. Select the **Databricks** connector for your Databricks SQL Warehouse.

   :::image type="content" source="./media/databricks/filtered-connectors.png" alt-text="Image of the Databricks connectors.":::

2. Enter the **Server hostname** and **HTTP Path** for your Databricks SQL Warehouse. Refer to [Configure the Databricks ODBC and JDBC drivers](/azure/databricks/integrations/bi/jdbc-odbc-bi) for instructions to look up your "Server hostname" and "HTTP Path". You can optionally supply a default catalog and/or database under **Advanced options**.

   :::image type="content" source="./media/databricks/connect-setting-cred.png" alt-text="Connection Settings and Credentials.":::

3. Provide your credentials to authenticate with your Databricks SQL Warehouse. There are three options for credentials:

    * Basic. Use this option when authenticating with a user name and password. This option isn't available if your organization/account uses 2FA/MFA.
    * Account Key. Use this option when authenticating using a Personal Access Token. Refer to [Personal access tokens](/azure/databricks/sql/user/security/personal-access-tokens) for instructions on generating a Personal Access Token (PAT).
    * Organizational account. Use this option when authenticating with OAuth. Sign in to your organizational account using the browser popup.

4. Once you successfully connect, the **Navigator** appears and displays the data available on the server. Select your data in the navigator. Then select **Next** to transform the data in Power Query.

    :::image type="content" source="./media/databricks/pq-choose-data.png" alt-text="Image of Power Query navigator loading Databricks Cloud data to online app.":::

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