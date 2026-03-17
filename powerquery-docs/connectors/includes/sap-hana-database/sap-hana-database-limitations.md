---
title: Include file for the Limitations section of the Power Query SAP HANA database connector documentation
description: Include file for the Limitations section of the Power Query SAP HANA database connector documentation
author: whhender
ms.author: whhender
ms.date: 03/06/2026
ms.topic: include
---

The following limitations apply to the Power Query SAP HANA database connector.

### Connect to SAP HANA database over proxy

The SAP HANA database connector doesn't support connecting to cloud database through proxy. To work around, use the [ODBC connector](../../odbc.md) instead and specify the proxy settings in DSN or connection string.

