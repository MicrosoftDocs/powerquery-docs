---
title: Versioning for Power Query connectors
description: Manage versioning for Power Query connectors
author: cpopell


ms.topic: conceptual
ms.date: 03/19/2018
ms.author: gepopell

LocalizationGroup: reference
---

# Versioning
Versioning is not currently supported in Power Query.  We plan on enabling versioning eventually, and recommend all connector developers to use it once available. Versioning is required for certified connectors.

## Version Format in Power Query
Versioning in Power Query is a simple metadata record above the section document:

```
[Version = "1.0.0"]
section MyConnector;
```

## Semantics of Version in Power Query
Even though support for versioning is not yet supported in Power Query, you should try to follow the semantics that will be supported in the future. 

The first number is the 'major' version, which will indicate breaking changes. This number should be incremented whenever users will be required to potentially rebuild reports due to massive connector rearchitecture or removal of features.

The second number is the 'minor' version, which indicates addition of functionality. These will generally not be breaking but might cause peripheral side effects. This number should be incremented whenever functionality is added to the connector.

The final number is the 'patch' version, which indicates minor tweaks and fixes to connectors. This is the version that will change the most often, and should be incremented whenever you realize small tweaks of a connector to the public.
