---
title: Include file for the Limitations and considerations section of the Power Query Active Directory connector documentation
description: Include file for the Limitations and considerations section of the Power Query Active Directory connector documentation
ms.reviewer: whhender
ms.date: 03/10/2026
ms.topic: include
---

### Some objects in the Navigator return empty tables

The Power Query Active Directory connector supports search in the Schema and Domain partitions, but not in the Configuration partition. This limitation is the current design. So if there are any objects that reside in the Configuration partition, Power Query doesn't load data for those objects into the navigator.
