---
title: Include file for the Limitations and considerations section of the Power Query Parquet connector documentation
description: Include file for the Limitations and considerations section of the Power Query Parquet connector documentation
ms.date: 03/10/2026
ms.topic: include
---

The Power Query Parquet connector only supports reading files from the local filesystem, Azure Blob Storage, and Azure Data Lake Storage Gen2.

It might be possible to read small files from other sources using the [Binary.Buffer](/powerquery-m/binary-buffer) function to buffer the file in memory. However, if the file is too large you're likely to get the following error:

`Error: Parquet.Document cannot be used with streamed binary values.`

Using the `Binary.Buffer` function in this way may also affect performance.
