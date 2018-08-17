---
title: Handling paging for Power Query connectors
description: Manage paging for Power Query connectors
author: cpopell
manager: kfile
ms.reviewer: ''

ms.service: powerquery
ms.component: power-query
ms.topic: conceptual
ms.date: 08/16/2018
ms.author: gepopell

LocalizationGroup: reference
---

# Paging

REST APIs typically have some mechanism to transmit large volumes of records broken up into *pages* of results. Power Query has the flexibility to support many different paging mechanisms, however, since each paging mechanism is different, some amount of modification of the below examples is likely to be necessary to fit your situation.

## Typical Patterns

The heavy lifting of compiling all page results into a single table is performed by the `Table.GenerateByPage()` [helper function](/HelperFunctions.md), which can generally be used with no modification. The following code snippets describe how to implement some common paging patterns. Regardless of pattern, you will need to understand:
1. How do we request the next page of data?
2. Does the paging mechanism involve calculating values, or do we extract the URL for the next page from the response?
3. How do we know when to stop paging?
4. Are there parameters related to paging (such as "page size") that we should be aware of?
