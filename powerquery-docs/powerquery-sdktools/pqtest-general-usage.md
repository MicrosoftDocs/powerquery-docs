---
title: General usage
description: Using PQTest with your extension
author: ryan-syed
ms.topic: conceptual
ms.date: 02/14/2024
ms.author: v-ryansyed
---

# General usage

The syntax for running PQTest is:

**PQTest.exe** [*Command*] [*Options*]

## Formatting output

Most commands return their results in a JSON format. Use the **\-\-prettyPrint** / **-p** option to produce formatted output.

## Extension

Most commands require you to specify the data source extension (that is, your connector's .mez file) to use. This functionality can be achieved with the **\-\-extension** / **-e** option.

## Data source

Some commands require you to provide data source information in addition to the data source extension. This information can be provided using the **\-\-dataSourceKind** / **\-dsk** and **\-\-dataSourcePath** / **\-dsp** options, or by providing
an input query file using the **\-\-queryFile** / **\-q** option. When providing a query, it should contain a single data source.

A good example of this query would be:

```powerquery-m
let
    Source = SampleExtension.Contents()
in
    Source
```

Another good example would be:

```powerquery-m
SampleExtension.Contents()
```

Providing a query that doesn't contain a data source function call, or contains calls to multiple data sources, results in an error.
