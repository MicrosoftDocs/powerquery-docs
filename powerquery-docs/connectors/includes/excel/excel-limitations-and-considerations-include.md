---
title: Include file for the Limitations and considerations section of the Power Query Excel connector documentation
description: Include file for the Limitations and considerations section of the Power Query Excel connector documentation
ms.date: 03/10/2026
ms.topic: include
---

* Power Query Online is unable to access encrypted Excel files. Since Excel files labeled with sensitivity types other than "Public" or "Non-Business" are encrypted, they aren't accessible through Power Query Online.
* Power Query Online doesn't support password-protected Excel files.
* The [Excel.Workbook](/powerquery-m/excel-workbook) `useHeaders` option converts numbers and dates to text using the current culture, and thus behaves differently when run in environments with different operating system cultures set. We recommend using [Table.PromoteHeaders](/powerquery-m/table-promoteheaders) instead.
