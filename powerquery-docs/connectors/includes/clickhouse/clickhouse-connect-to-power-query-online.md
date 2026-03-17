---
title: Include file for the Connect to Power Query Online section of the Power Query ClickHouse connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query ClickHouse connector documentation
ms.date: 03/06/2026
ms.topic: include
---

ClickHouse connector integration with Power BI cloud service requires you to initiate a data gateway.

**What is a data gateway?** 
> The on-premises data gateway acts as a bridge to provide quick and secure data transfer between on-premises data (data that isn't in the cloud) and several Microsoft cloud services. These cloud services include Power BI, PowerApps, Power Automate, Azure Analysis Services, and Azure Logic Apps. By using a gateway, organizations can keep databases and other data sources on their on-premises networks, yet securely use that on-premises data in cloud services.

**Why is such a gateway required?**
> Both custom and certified connectors with extra components (for example, an ODBC driver) need the extra component to be installed on the end user machine and require the on-premises data gateway.

Steps required for the integration:

1. Follow all steps listed in the [Power BI Desktop usage](#connect-to-clickhouse-from-power-query-desktop).
2. Install the data gateway. Detailed instructions can be found in [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install).
3. Follow [this Microsoft example on how to configure your Power BI service to work with the Gateway](/power-bi/connect-data/service-gateway-sql-tutorial#connect-the-dataset-to-the-sql-server-database).

