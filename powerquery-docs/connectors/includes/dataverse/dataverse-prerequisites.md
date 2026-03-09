---
title: Include file for the Prerequisites section of the Power Query Dataverse connector documentation
description: Include file for the Prerequisites section of the Power Query Dataverse connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

You must have a Dataverse environment.

You must have read permissions to access data within tables.

To use the Dataverse connector, the **TDS endpoint** setting must be enabled in your environment. More information: [Manage feature settings](/power-platform/admin/settings-features) and [Troubleshooting connection problems using SQL to Query data](/power-apps/developer/data-platform/dataverse-sql-query#troubleshooting-connection-problems)

To use the Dataverse connector, one of TCP ports 1433 or 5558 need to be open to connect. Port 1433 is used automatically. However, if port 1433 is blocked, you can use port 5558 instead. To enable port 5558, you must append that port number to the Dataverse environment URL, such as *yourenvironmentid.crm.dynamics.com, 5558*. More information: [SQL Server connection issue due to closed ports](#sql-server-connection-issue-due-to-closed-ports)

> [!NOTE]
> If you're using Power BI Desktop and need to use port 5558, you must create a source with the Dataverse environment URL, such as *yourenvironmentid.crm.dynamics.com,5558*, in Power Query M. More information: [Finding your Dataverse environment URL](#finding-your-dataverse-environment-url)

