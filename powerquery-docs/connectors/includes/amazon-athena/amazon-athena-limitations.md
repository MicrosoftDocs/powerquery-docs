---
title: Include file for the Limitations section of the Power Query Amazon Athena connector connector documentation
description: Include file for the Limitations section of the Power Query Amazon Athena connector connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

When you use the Amazon Athena Connector through an on-premises data gateway, driver information must be registered under the System Data Source Name (DSN), not the User DSN. If the driver is registered under the User DSN, a `Data source name not found and no default driver specified` error occurs when connecting through the on-premises data gateway. A Windows limitation causes this error. In Windows, User DSNs are stored in the HKEY_CURRENT_USER section of the Windows Registry. This means they're tied specifically to the user profile under which they were created. When an application runs as a Windows Service, it typically operates under a service account (for example, LocalSystem, NetworkService, or a custom domain account) with its own security context. These accounts don't load the interactive user's profile and therefore don't have access to that user's HKEY_CURRENT_USER registry section. For more information, go to the [Amazon Athena ODBC v2 driver public documentation for Windows](https://docs.aws.amazon.com/athena/latest/ug/odbc-v2-driver-getting-started-windows.html).
