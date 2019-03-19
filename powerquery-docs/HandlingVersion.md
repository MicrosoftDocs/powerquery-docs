---
title: Versioning for Power Query connectors
description: Manage versioning for Power Query connectors
author: cpopell

ms.service: powerquery
ms.topic: conceptual
ms.date: 03/19/2018
ms.author: gepopell

LocalizationGroup: reference
---

# Versioning
Versioning is not currently supported in Power Query. However, we plan on lighting up this functionality in the future and encourage all connector developers to take advantage of it. This is required for certified connectors.

## Throwing an Error with the `error` Expression
Throwing an error in Power Query is as simple as invoking the `error` expression:
```
let
    Source = "foo",
    Output = error "error message"
in
    Output
```
