---
title: Azure Databricks Power Query connector
description: Provides basic information and prerequisites for using Power Query's Azure Databricks connector.
author: DougKlopfenstein

ms.topic: conceptual
ms.date: 2/1/2024
ms.author: dougklo
ms.subservice: connectors
---

# Azure Databricks

> [!NOTE]
>The following connector article is provided by Databricks, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Databricks website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Azure Active Directory<br/>Personal Access Token<br/>Username / Password |

## Capabilities supported

* Import
* DirectQuery (Power BI semantic models)

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

To connect to Databricks from Power Query Online, take the following steps:

1. Select the **Azure Databricks** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../where-to-get-data.md).

    Shortlist the available Databricks connectors with the search box. Use the **Azure Databricks** connector for all Databricks SQL Warehouse data unless you've been instructed otherwise by your Databricks rep.  

    :::image type="content" source="./media/databricksazure/filtered-connectors.png" alt-text="Image of the Databricks connectors.":::

2. Enter the **Server hostname** and **HTTP Path** for your Databricks SQL Warehouse. Refer to [Configure the Databricks ODBC and JDBC drivers](/azure/databricks/integrations/bi/jdbc-odbc-bi) for instructions to look up your "Server hostname" and "HTTP Path". You can optionally supply a default catalog and/or database under **Advanced options**.

    :::image type="content" source="./media/databricksazure/azconnect-setting-cred.png" alt-text="Connection Settings and Credentials.":::

3. Provide your credentials to authenticate with your Databricks SQL Warehouse. There are three options for credentials:

    * Username / Password (useable for AWS or GCP). This option isn't available if your organization/account uses 2FA/MFA.
    * Account Key (useable for AWS, Azure or GCP). Refer to [Personal access tokens](/azure/databricks/sql/user/security/personal-access-tokens) for instructions on generating a Personal Access Token (PAT).
    * Azure Active Directory (useable only for Azure). Sign in to your organizational account using the browser popup.

4. Once you successfully connect, the **Navigator** appears and displays the data available on the server. Select your data in the navigator. Then select **Next** to transform the data in Power Query.

    :::image type="content" source="./media/databricksazure/pq-choose-data.png" alt-text="Image of Power Query navigator loading Databricks Cloud data to online app.":::

## Limitations

* The Azure Databricks connector supports [web proxy](/power-bi/connect-data/desktop-troubleshooting-sign-in#using-default-system-credentials-for-web-proxy). However, automatic proxy settings defined in .pac files aren't supported.
* In the Azure Databricks connector, the `Databricks.Query` data source isn't supported in combination with Power BI semantic model's DirectQuery mode.
