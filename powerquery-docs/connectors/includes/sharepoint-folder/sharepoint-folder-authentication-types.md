---
title: Include file for the authentication types section of the Power Query SharePoint folder connector documentation
description: Include file for the authentication types section of the Power Query SharePoint folder connector documentation
ms.date: 04/06/2026
ms.topic: include
---

The SharePoint Folder connector supports the following authentication methods, depending on the hosting experience:

- **Organizational account**: Uses a user’s Microsoft Entra ID to authenticate to SharePoint.
- **Workspace identity**: In **Microsoft Fabric**, supported experiences (such as **Dataflows Gen2** and **Power BI**) can authenticate to **SharePoint Files** using **workspace identity**. This enables Fabric to access SharePoint file content using the workspace’s managed identity, without relying on user credentials or legacy ACS-based authentication.
