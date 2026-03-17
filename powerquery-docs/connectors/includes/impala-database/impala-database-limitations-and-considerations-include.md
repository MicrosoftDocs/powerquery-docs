---
title: Include file for the Limitations and considerations section of the Power Query Impala Database connector documentation
description: Include file for the Limitations and considerations section of the Power Query Impala Database connector documentation
author: whhender
ms.author: whhender
ms.date: 03/10/2026
ms.topic: include
---

Here are a few considerations and limitations to keep in mind with the Impala connector:

* The Impala connector is supported on the on-premises data gateway, using any of the three supported authentication mechanisms.
* The Impala connector uses the Impala driver, which limits the size of string types to 32 K by default.
* The Impala connector doesn't support overriding the **Realm** option for Kerberos authentication.
