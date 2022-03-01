---
title: Using Web.Contents when creating Power Query connectors
description: Use Web.Contents when creating Power Query connectors
author: cpopell


ms.topic: conceptual
ms.date: 2/28/2022
ms.author: dougklo

LocalizationGroup: reference
---

# Web.Contents
[`Web.Contents`](/powerquery-m/web-contents) is the primary way to access web-based data that doesn't offer an OData specification. This requires more effort--depending on what the API is expecting, you'll have to specify a number of different options (documented in detail in the function).

Using `Web.Contents` as opposed to the OData specification means that you will have to handle navigation and schema functionality in your connector, rather than having it immediately available. This will require additional work, documented in [Handling Navigation Tables](HandlingNavigationTables.md) and [Handling Schema](HandlingSchema.md).

>**Note:** What is returned by Web.Contents is the binary value. To get usable information out of it, you will have to convert it. In the below example, after the binary for a url passed in as a parameter is acquired, it's converted to json via the [`Json.Document`](/powerquery-m/json-document) function. The resulting Record will then still need to be turned into a table.
```
TripPinImpl = (url as text) =>
    let
        source = Web.Contents(url, [ Headers = DefaultRequestHeaders ]),
        json = Json.Document(source)
    in
        json;
```
