---
title: Include file for the Prerequisites section of the Power Query Exact Online Premium connector documentation
description: Include file for the Prerequisites section of the Power Query Exact Online Premium connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

- An **Exact Online Premium subscription** is required.

- You need to have the **ODBC Connector version 18** installed. Go to the [download page](/sql/connect/odbc/download-odbc-driver-for-sql-server) to download the latest driver.

- In Exact Online, your IP address needs to be allowed access.
  - Open the **Master data** screen
  - Locate the **Microsoft Office 365** section and add the IP address to the Power BI access list

  > [!NOTE]
  >The Microsoft Office 365 menu also contains downloadable report templates for Power BI, which can be used with this connector.

- In order to refresh data, an **on-premises data gateway** must be available. You can follow [this link](/data-integration/gateway/service-gateway-install) to learn how to install it; we recommend installing it on a managed machine that is always on.
  - Note that the ODBC driver is also required to be installed on this same machine.

