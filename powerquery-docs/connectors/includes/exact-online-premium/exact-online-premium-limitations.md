---
title: Include file for the Limitations section of the Power Query Exact Online Premium connector connector documentation
description: Include file for the Limitations section of the Power Query Exact Online Premium connector connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

You should be aware of the following limitation associated with accessing Exact Online Premium data.

ODBC: ERROR [42000] [Microsoft][ODBC Driver 18 for SQL Server][SQL Server]Cannot open server '*(servername)*' requested by the login. Client with IP address '*(ip address)*' is not allowed to access the server.

This likely happens because the IP address is not on the allowed list for Power BI. Follow the steps under Prerequisites above to resolve.

