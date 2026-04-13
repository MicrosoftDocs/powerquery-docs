---
title: Power Query SQL Server Analysis Services database connector
description: Includes basic information about products that use the SQL Server Analysis Services database connector, supported authentication types, prerequisites, and connection instructions.
author: whhender
ms.topic: concept-article
ms.date: 11/24/2024
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# SQL Server Analysis Services database

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power Apps (Dataflows)<br/>Analysis Services |
| Authentication Types Supported | Basic<br/>Microsoft account<br/>Organizational account<br/>Windows |
| M Function Reference | [Sql.Database](/powerquery-m/sql-database)<br/>[Sql.Databases](/powerquery-m/sql-databases) |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

> [!NOTE]
> Proxy configuration isn't supported with this connector as it uses a TCP/IP connection. Proxy is only detected when using an [HTTP MSMDPUMP.dll endpoint](/analysis-services/instances/configure-http-access-to-analysis-services-on-iis-8-0).

## Prerequisites

[!INCLUDE [Includes_sql-server-analysis-services_prerequisites](includes/sql-server-analysis-services/sql-server-analysis-services-prerequisites.md)]

## Capabilities Supported

[!INCLUDE [Includes_sql-server-analysis-services_capabilities-supported](includes/sql-server-analysis-services/sql-server-analysis-services-capabilities-supported.md)]

## Connect to SQL Server Analysis Services database from Power Query Desktop

To make the connection, take the following steps:

1. Select the **SQL Server Analysis Services database** option in the connector selection. More information: [Where to get data](../where-to-get-data.md)

2. In the **SQL Server Analysis Services database** dialog that appears, provide the name of the server and database (optional).

   :::image type="content" source="./media/sql-server-analysis-services/select-database-desktop.png" alt-text="SQL Server Analysis Services database connection builder in Power Query Desktop.":::

   > [!NOTE]
   > Only Power BI Desktop will display the **Import** and **Connect live** options. If you're connecting using Power BI Desktop, selecting **Connect live** uses a live connection to load the connected data directly to Power BI Desktop. In this case, you can't use Power Query to transform your data before loading the data to Power BI Desktop. For the purposes of this article, the **Import** option is selected. For more information about using a live connection in Power BI Desktop, go to [Connect to Analysis Services tabular data in Power BI Desktop](/power-bi/connect-data/desktop-analysis-services-tabular-data).

3. Select **OK**.

4. If you're connecting to this database for the first time, select the authentication type and input your credentials. Then select **Connect**.

   :::image type="content" source="./media/sql-server-analysis-services/credentials-desktop.png" alt-text="SQL Server Analysis Services database authentication.":::

5. In **Navigator**, select the database information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in the Power Query editor.

   :::image type="content" source="./media/sql-server-analysis-services/navigator-desktop.png" lightbox="./media/sql-server-analysis-services/navigator-desktop.png" alt-text="Power Query Navigator showing some of the Sales Targets data.":::
## Connect to SQL Server Analysis Services database from Power Query Online

[!INCLUDE [Includes_sql-server-analysis-services_connect-to-power-query-online](includes/sql-server-analysis-services/sql-server-analysis-services-connect-to-power-query-online.md)]

## Connect using advanced options

Power Query provides an advanced option that you can add to your query if needed.

| Advanced option | Description |
| --------------- | ----------- |
| MDX or DAX statement | Optionally provides a specific MDX or DAX statement to the SQL Server Analysis Services database server to execute. |

Once you've entered a value in the advanced option, select **OK** in Power Query Desktop or **Next** in Power Query Online to connect to your SQL Server Analysis Services database.

## See also

* [Connect to Analysis Services tabular data in Power BI Desktop](/power-bi/connect-data/desktop-analysis-services-tabular-data)
* [Connect to SSAS multidimensional models in Power BI Desktop](/power-bi/connect-data/desktop-ssas-multidimensional)
* [Connect to semantic models in the Power BI service from Power BI Desktop](/power-bi/connect-data/desktop-report-lifecycle-datasets)
