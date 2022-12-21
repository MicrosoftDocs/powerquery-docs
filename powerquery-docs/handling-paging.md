---
title: Handling paging for Power Query connectors
description: Manage paging for Power Query connectors
author: ptyx507x
ms.topic: conceptual
ms.date: 2/28/2022
ms.author: miescobar
---

# Paging

REST APIs typically have some mechanism to transmit large volumes of records broken up into *pages* of results. Power Query has the flexibility to support many different paging mechanisms. However, since each paging mechanism is different, some amount of modification of the paging examples is likely to be necessary to fit your situation.

## Typical Patterns

The heavy lifting of compiling all page results into a single table is performed by the [`Table.GenerateByPage()` helper function](HelperFunctions.md#tablegeneratebypage), which can generally be used with no modification. The code snippets presented in the `Table.GenerateByPage()` helper function section describe how to implement some common paging patterns. Regardless of pattern, you'll need to understand:
1. How do you request the next page of data?
2. Does the paging mechanism involve calculating values, or do you extract the URL for the next page from the response?
3. How do you know when to stop paging?
4. Are there parameters related to paging (such as "page size") that you should be aware of?
