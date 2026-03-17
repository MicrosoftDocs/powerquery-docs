---
title: Include file for the Limitations and considerations section of the Power Query Pdf connector documentation
description: Include file for the Limitations and considerations section of the Power Query Pdf connector documentation
author: whhender
ms.author: whhender
ms.date: 03/10/2026
ms.topic: include
---

### Accessing large PDF files

You can use the following strategies to improve performance and reduce timeouts when you access large PDF files. These strategies require that you edit your usage of the [Pdf.Tables](/powerquery-m/pdf-tables) function in either the formula bar or advanced editor.

* Try selecting pages one at a time or one small range at a time using the `StartPage` or `EndPage` options, iterating over the entire document as needed.
* If the PDF document is one single, huge table, the `MultiPageTables` option can be collecting very large intermediate values, so disabling it might help.

A full list of available options can be found in [Pdf.Tables](/powerquery-m/pdf-tables).

### Handling multi-line rows

In cases where multi-line rows aren't properly identified, you might be able to clean up the data using UI operations or custom M code. For example, you could copy misaligned data to adjacent rows using [Table.FillDown](/powerquery-m/table-filldown), or group and combine adjacent rows using [Table.Group](/powerquery-m/table-group).

### Power BI dataflows in a Premium capacity	

When working with the PDF connector on dataflows in a Premium capacity, the PDF connector doesn't properly make the connection. To enable the PDF connector to work on dataflows in a Premium capacity, configure that dataflow to use a gateway, and confirm the connection to that dataflow goes through the gateway.
