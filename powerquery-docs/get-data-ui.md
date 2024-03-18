---
title: Get data UI
description: Describes the new modern UI of the Power Query Online get data experience.
author: TauseefSiddique
ms.topic: conceptual
ms.date: 9/22/2023
ms.author: dougklo
---

# Get data experience

Getting data from available data sources is usually the first encounter you have with Power Query. This article provides an explanation of the different modules in the modern get data experience.

> [!NOTE]
> Each of these Power Query get data experiences contain different feature sets. More information: [Where can you use Power Query?](power-query-what-is-power-query.md#where-can-you-use-power-query)

## Modern get data experience

The get data experience allows you to discover and connect to your data.

The procedures for where to start getting data in Power BI Desktop are described in [Data sources in Power BI Desktop](/power-bi/connect-data/desktop-data-sources).

:::image type="content" source="media/where-to-get-data/power-bi-desktop-data-select.png" alt-text="Screenshot of the Data field in the Home ribbon of Power BI Desktop.":::

The new modular experience in Power Query Online is separated into different modules located on the left side navigation bar. These modules include:

* **Home** (all)
* **Templates** (Power BI service only)
* **OneLake Data Hub** (Fabric only)
* **New** (all)
* **Upload** (all)
* **Blank Table** (all)
* **Blank Query** (all)

## Home

The home page acts as a summary of all the modules and presents you with different options to expedite the process and get you closer to your data. Typically, this module contains any existing data sources and gives you the option to use a new data source, table, and upload files. From the home page, you can select **View more** on the right side of the **New sources** and **OneLake data hub** sections to visit those modules.

:::image type="content" source="media/get-data-ui/home.png" alt-text="Screenshot of the Choose data source page with the Home module on the right side emphasized." lightbox="media/get-data-ui/home.png":::

## Templates

A dataflow template provides a predefined set of entities and field mappings to enable flow of data from your source to the destination, in the Common Data Model. A dataflow template commoditizes the movement of data, which in turn reduces overall burden and cost for a business user. It provides you with a head start to ingest data wherein you don’t need to worry about knowing and mapping the source and destination entities and fields&mdash;we do it for you, through dataflow templates. For more information about templates, go to [Introducing dataflow templates; A quick and efficient way to build your sales leaderboard and get visibility over your sales pipeline](https://powerbi.microsoft.com/blog/introducing-dataflow-templates-a-quick-and-efficient-way-to-build-your-sales-leaderboard-and-get-visibility-over-your-sales-pipeline).

:::image type="content" source="media/get-data-ui/templates.png" alt-text="Screenshot of the Templates page with the Templates module on the right side emphasized." lightbox="media/get-data-ui/templates.png":::

## OneLake data hub

The OneLake data hub makes it easy to find, explore, and use the Fabric data items in your organization that you have access to. It provides information about the items and entry points for working with them. For more information on the OneLake data hub, go to [OneLake Data Hub](/fabric/get-started/onelake-data-hub).

:::image type="content" source="media/get-data-ui/onelake.png" alt-text="Screenshot of the OneLake data hub module." lightbox="media/get-data-ui/onelake.png":::

## New

The **new** module provides a full list of connectors that you can select from. On this page, you can search for a connector across all categories by using the search bar at the top of page. You can also navigate across the categories to find a specific connector to integrate with. Selecting a connector here opens the connection settings window, which begins the process of connecting. For more information on using connectors, go to [Getting data overview](get-data-experience.md).

:::image type="content" source="media/get-data-ui/new.png" alt-text="New Module Screenshot." lightbox="media/get-data-ui/new.png":::

## Upload

The **Upload** module lets you upload your files directly. The following connectors support this capability:  

* [Excel](connectors/excel.md)
* [JSON](connectors/json.md)
* [PDF](connectors/pdf.md)
* [Text/CSV](connectors/text-csv.md)
* [XML](connectors/xml.md)

This module is an extension of this capability and lets you select the browse button to upload a local file, or even drag and drop a file. For more information on uploading files, go to [Upload a file](upload-file.md).

:::image type="content" source="media/get-data-ui/upload.png" alt-text="Upload Module Screenshot." lightbox="media/get-data-ui/upload.png":::

## Blank table

The **Blank table** module provides a quick start in creating a table in a dataflow.

:::image type="content" source="media/get-data-ui/blank-table.png" alt-text="Blank Query Module Screenshot." lightbox="media/get-data-ui/blank-table.png":::

## Blank query

The **Blank query** module lets you write or paste your own M script to create a new query.

:::image type="content" source="media/get-data-ui/blank-query.png" alt-text="Blank Table Module Screenshot.":::
