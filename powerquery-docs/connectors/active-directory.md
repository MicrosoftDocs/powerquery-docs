---
title: Power Query Active Directory connector
description: Provides basic information, prerequisites, and connection instructions, along with troubleshooting information for the Active Directory connector.
author: bezhan-msft
ms.topic: conceptual
ms.date: 9/12/2022
ms.author: bezhan
---

# Active Directory

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Excel<br/>Analysis Services |
| Authentication Types Supported | Windows |
| Function Reference Documentation | [ActiveDirectory.Domains](/powerquery-m/activedirectory-domains) |

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities Supported

* Import

## Limitations and issues

### Some objects in the Navigator return empty tables

The Power Query Active Directory connector supports search in the Schema and Domain partitions, but not in the Configuration partition. This limitation is the current design. So if there are any objects that reside in the Configuration partition, Power Query doesn't load data for those objects into the Navigator.
