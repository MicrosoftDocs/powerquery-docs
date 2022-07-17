---
title: Auto-login for Azure Active Directory (AAD) sources
description: Power Query enables you to automatically login to a select set of data sources that use the Azure Active Directory as its authentication kind based on the current authenticated user.
author: ptyx507x

ms.reviewer: 
ms.date: 7/18/2022
ms.author: miescobar
---

# Auto-login for Azure Active Directory (AAD) data sources

The auto-login feature for Azure Active Directory (AAD) data sources leverages the information derived from the currently authenticated user in the Power Query Online experience to request a new access token for a selected data source during the connection settings and authentication step of the [Get data](/powerquery-docs/get-data-experience.md#1-connection-settings-and-authentication) process. 
It does this in an effort to expedite the authentication process and minimize the time it takes to start working with your data.

>[!NOTE]
>This functionality is currently only available in Power Query Online and is enabled by default in the Power Query Online experience for a select set of connectors. >There is no setting to configure or enable this feature.

When selecting a connector that has this capability, it will automatically log you in with the **Organizational account** set as the authentication kind.

![Connect to data source dialog showing the SharePoint folder connector experience where the user Test Account has been automatically logged in using the Organizational account as the authentication kind]()