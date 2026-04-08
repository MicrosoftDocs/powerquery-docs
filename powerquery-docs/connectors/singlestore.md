---
title: Power Query SingleStore connector
description: Provides basic information, prerequisites, and instructions on how to connect to your SingleStore data.
author: whhender
ms.topic: concept-article
ms.date: 9/11/2025
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# SingleStore

>[!Note]
>This connector is owned and provided by SingleStore.

## Summary

| Item | Description |
| --- | --- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Basic<br/>Windows |

## Capabilities supported

[!INCLUDE [Includes_singlestore_capabilities-supported](includes/singlestore-capabilities-supported.md)]

> [!NOTE]
> Existing reports created using the `SingleStoreODBC.Query` (CustomSQL functionality) function call continue to be supported. SingleStore recommends using native database queries for new reports.

## Connect to SingleStore

To connect Microsoft Power BI Desktop to SingleStore DB or Managed Service:

1. In the **Home** ribbon, from the **Get Data** list, select **More**.

2. In the **Get Data** dialog, select **SingleStore Direct Query Connector**.

    :::image type="content" source="./media/singlestore/ss-get-data-connector.png" alt-text="Locate the SingleStore Connectors in Get Data dialog.":::

3. In the connection configuration dialog, enter or select the following:

   * **Server**: Enter the IP address or the hostname of the SingleStore cluster.
   * **Database**: Enter the name of the SingleStore database to connect with.
   * **Data Connectivity mode**: Select **Import** or **DirectQuery**.
   * (Optional) To ingest data using a native database query, enter the SQL query in the **Native query** box.

    :::image type="content" source="./media/singlestore/ss-db-select-mode.png" alt-text="Enter server IP / hostname and database and select the connectivity mode.":::

4. In the **SingleStore Direct Query Connector** dialog box, in the left pane, select the authentication type (either **Windows** or **Basic**).

    > [!NOTE]
    > SingleStoreDB Cloud users can only use **Basic** authentication.

    * For **Windows** authentication, [set up a SingleStore server for Kerberos authentication](https://docs.singlestore.com/db/v9.0/security/authentication/kerberos-authentication). Then select the **Connect** button.

       > [!NOTE]
       > You need to run Power BI with the user account that maps to the SingleStore user. Therefore, if the Windows user is 'administrator'@domain, then the database user must be 'administrator'. You may need to create the database user.

       :::image type="content" source="./media/singlestore/ss-db-windows.png" alt-text="Select Windows authentication.":::

    * For **Basic** authentication, enter the username and password used to connect to SingleStore, and then select the **Connect** button.

       :::image type="content" source="./media/singlestore/ss-db-basic.png" alt-text="Select Basic authentication.":::

5. Once authenticated&mdash;for Import or DirectQuery mode&mdash;in the **Navigator** dialog box, choose the desired tables and select the **Load** button.

    :::image type="content" source="./media/singlestore/ss-nav-load.png" alt-text="Select tables in the Navigator dialog and select Load.":::

You can now use Power BI to explore SingleStore data.

## Limitations of Native Database Queries

* To run a native database query using the connector, the user must only have read-only access to the SingleStore databases.
* DDL queries are not supported.
* If the SQL query is specified outside the connector dialog (the connection configuration step), Power BI may prompt you to approve the query for your credentials.

Refer to [Limitations and issues](https://learn.microsoft.com/en-us/power-query/native-database-query#limitations-and-issues) for more information.

## Modify credentials

To modify the credentials used to connect to SingleStore:

1. In the **File** ribbon, select **Options and settings** > **Data source settings**.

2. In the **Data source settings** dialog, select **SingleStore Direct Query Connector**, and then select **Edit Permissions**.
