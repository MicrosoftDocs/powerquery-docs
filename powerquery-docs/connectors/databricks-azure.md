---
title: Azure Databricks Power Query connector
description: Provides basic information and prerequisites for using Power Query's Azure Databricks connector.
author: whhender
ms.topic: concept-article
ms.date: 2/11/2026
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Azure Databricks

>[!Note]
>This connector is owned and provided by Databricks.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Azure Active Directory<br/>Personal Access Token<br/>Username / Password |

> [!NOTE]
>The Azure Databricks connector for Power BI now supports the [Arrow Database Connectivity (ADBC)](https://github.com/apache/arrow-adbc/blob/main/csharp/src/Drivers/Databricks/readme.md) driver. This feature is available in preview. Learn more [here](#arrow-database-connectivity-driver-connector-implementation-preview).

## Network prerequisites

For private networks, you'll need to implement the following network settings:

- `*.blob.core.windows.net*` and `*.store.core.windows.net` need to be open in your network environment.
- [This list of certificate downloads and revocations](/azure/security/fundamentals/azure-certificate-authority-details#certificate-downloads-and-revocation-lists) also need to be added to your allow list.
- If firewall support is enabled on your Databricks workspace storage account, you must configure either a virtual network data gateway or an on-premises data gateway to allow private access to the storage account. This ensures that the Fabric Power BI service can continue to access the workspace storage account and that CloudFetch continues to function correctly. Alternatively, you can disable CloudFetch with the configuration `EnableQueryResultDownload=0`.

## Capabilities supported

[!INCLUDE [Includes_databricks-azure_capabilities-supported](includes/databricks-azure/databricks-azure-capabilities-supported.md)]

## Connect to Databricks (AWS, Azure or GCP) from Power Query Desktop

To connect to Databricks from Power Query Desktop, take the following steps:

1. In the Get Data experience, search for **Databricks** to shortlist the Databricks connector, **Azure Databricks**. Use the **Azure Databricks** connector for all Databricks SQL Warehouse data unless you've been instructed otherwise by your Databricks rep.

    :::image type="content" source="./media/databricksazure/get-data-dbc.png" alt-text="Get Data from Databricks Cloud.":::

2. Provide the **Server hostname** and **HTTP Path** for your Databricks SQL Warehouse. Refer to [Configure the Databricks ODBC and JDBC drivers](/azure/databricks/integrations/bi/jdbc-odbc-bi) for instructions to look up your "Server hostname" and "HTTP Path". Enter this information accordingly. You can optionally supply a default catalog and/or database under **Advanced options**. Select **OK** to continue.

    :::image type="content" source="./media/databricksazure/azdbc-sql-endpoint.png" alt-text="Specify your Databricks SQL Warehouse.":::

3. Provide your credentials to authenticate with your Databricks SQL Warehouse. There are three options for credentials:

    * Databricks Client Credentials. Refer to [Databricks OAuth M2M](/azure/databricks/dev-tools/auth/oauth-m2m) for instructions on generating Databricks OAuth M2M Client Credentials.
    * Personal Access Token (useable for AWS, Azure or GCP). Refer to [Personal access tokens](/azure/databricks/sql/user/security/personal-access-tokens) for instructions on generating a Personal Access Token (PAT).
    * Azure Active Directory (useable only for Azure). Sign in to your organizational account using the browser popup.

      :::image type="content" source="./media/databricksazure/azdbc-pat.png" alt-text="Specify an appropriate token.":::

    > [!NOTE]
    > Once you enter your credentials for a particular Databricks SQL Warehouse, Power BI Desktop caches and reuses those same credentials in subsequent connection attempts. You can modify those credentials by going to **File > Options and settings > Data source settings**. More information: [Change the authentication method](../ConnectorAuthentication.md#change-the-authentication-method)

4. Once you successfully connect, the **Navigator** shows the data available to you on the cluster. You can choose either **Transform Data** to transform the data using Power Query or **Load** to load the data in Power Query Desktop.

    :::image type="content" source="./media/databricksazure/navigator-with-filter.png" alt-text="Image of Power Query navigator loading Databricks Cloud data to desktop app.":::

## Connect to Databricks data from Power Query Online

[!INCLUDE [Includes_databricks-azure_connect-to-power-query-online](includes/databricks-azure/databricks-azure-connect-to-power-query-online.md)]

## Arrow Database Connectivity driver connector implementation (Preview)

You can use the [Arrow Database Connectivity (ADBC)](https://github.com/apache/arrow-adbc/blob/main/csharp/src/Drivers/Databricks/readme.md) driver for the Azure Databricks connector in Power BI. As we continue to enhance and add new capabilities to this connector, we recommend that you to upgrade to the latest version to try it out and [submit product feedback](/azure/databricks/resources/ideas).

To switch to the ADBC driver:

1. Open your desired dashboard in Power BI.
1. Select **Transform Data**.
1. Select **Advanced Editor** in the **Query** option section.
1. Specify `Implementation="2.0"` for ADBC.
    ```powerquery-m
    let
        Source = Databricks.Catalogs("adb-<workspace-id>.<random-number>.azuredatabricks.net", "/sql/1.0/warehouses/<sql-warehouse-id>",
            [Catalog=null, Database=null, EnableAutomaticProxyDiscovery=null, Implementation="2.0"]),
        powerbi_Database = Source{[Name="powerbi",Kind="Database"]}[Data],
        default_Schema = powerbi_Database{[Name="default",Kind="Schema"]}[Data],
        dashboard_data_Table = default_Schema{[Name="dashboard_data",Kind="Table"]}[Data]
    in
        dashboard_data_Table
    ```

## Limitations

[!INCLUDE [Includes_databricks-azure_limitations](includes/databricks-azure/databricks-azure-limitations.md)]

