---
title: Power Query Active Directory connector
description: Provides basic information, prerequisites, and connection instructions, along with troubleshooting information for the Active Directory connector.
author: whhender
ms.topic: concept-article
ms.date: 1/31/2024
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Active Directory

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Excel<br/>Analysis Services |
| Authentication Types Supported | Windows |
| Function Reference Documentation | [ActiveDirectory.Domains](/powerquery-m/activedirectory-domains) |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities Supported

[!INCLUDE [Includes_active-directory_capabilities-supported](includes/active-directory/active-directory-capabilities-supported.md)]

## Prerequisites

[!INCLUDE [Includes_active-directory_prerequisites](includes/active-directory/active-directory-prerequisites.md)]

## Connect to Active Directory from Power Query Desktop

1. Select **Active Directory** in the get data experience. The get data experience in Power Query Desktop varies between apps. For more information about the Power Query Desktop get data experience from your app, go to [Where to get data](../where-to-get-data.md).

1. In the **Active Directory** dialog box, provide the domain for your Active Directory.

    :::image type="content" source="media/active-directory/enter-domain.png" alt-text="Screenshot of Active Directory window with a domain entered.":::

1. You can choose to use your current windows credentials or enter alternate credentials. Then select **Connect**.

    > [!TIP]
    >You may need to add the domain suffix to your username. For example: domain\username.

    :::image type="content" source="media/active-directory/add-credentials.png" alt-text="Screenshot of Windows credentials page with alternate credentials selected and a username and password added.":::

1. In **Navigator**, review and/or select data from your database. Then select **OK**.
    > [!NOTE]
    > The navigator doesn't load data for the configuration partition. More information: [Limitations and issues](#limitations-and-issues)

## Connect to Active Directory from Power Query Online

[!INCLUDE [Includes_active-directory_connect-to-power-query-online](includes/active-directory/active-directory-connect-to-power-query-online.md)]

## Limitations and issues

### Some objects in the Navigator return empty tables

The Power Query Active Directory connector supports search in the Schema and Domain partitions, but not in the Configuration partition. This limitation is the current design. So if there are any objects that reside in the Configuration partition, Power Query doesn't load data for those objects into the navigator.
