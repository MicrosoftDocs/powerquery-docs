---
title: Power Query JSON connector
description: Provides basic information and connection instructions, along with instructions on loading from the web and basic troubleshooting information.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 7/16/2025
ms.author: dougklo
ms.subservice: connectors
---

# JSON

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Anonymous<br/>Basic (Web only)<br/>Organizational Account<br/>Web API (Web only)<br/>Windows |
| Function Reference Documentation | [Json.Document](/powerquery-m/json-document) |

> [!NOTE]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities supported

* Import

## Load a local JSON file from Power Query Desktop

To load a local JSON file:

1. Select the **JSON** option in the **Get Data** selection. This selection launches a local file browser where you can select your JSON file.

   :::image type="content" source="./media/json/json-get-data.png" alt-text="Image of the file browser with two JSON files to choose from.":::

2. Select **Open** to open the file.

Loading the JSON file automatically launches the Power Query editor. Power Query uses automatic table detection to seamlessly flatten the JSON data into a table. From the editor, you can then continue to transform the data if you want, or you can just close and apply. More information: [Automatic table detection from JSON files](#automatic-table-detection-from-json-files)

:::image type="content" source="./media/json/convert-table.png" alt-text="Screenshot of the Power Query editor with the JSON data flattened into a table." lightbox="./media/json/convert-table.png":::

## Load a local JSON file from Power Query Online

To load a local JSON file:

1. From the **Data sources** page, select **JSON**.

2. Enter the path to the local JSON file.

   :::image type="content" source="./media/json/connect-service.png" alt-text="Screenshot of the JSON connection setting dialog from the online service." lightbox="./media/json/connect-service.png":::

3. Select an on-premises data gateway from **Data gateway**.

4. If authentication is required, enter your credentials.

5. Select **Next**.

Loading the JSON file automatically launches the Power Query editor. Power Query uses automatic table detection to seamlessly flatten the JSON data into a table. From the editor, you can then continue to transform the data if you want, or you can just save and close to load the data. More information: [Automatic table detection from JSON files](#automatic-table-detection-from-json-files)

:::image type="content" source="./media/json/convert-table-online.png" alt-text="Screenshot of the online Power Query editor with the JSON data flattened into a table." lightbox="./media/json/convert-table-online.png":::

## Load from the web

To load a JSON file from the web, select the [Web connector](./web/web.md), enter the web address of the file, and follow any credential prompts.

## Automatic table detection from JSON files

Importing data from JSON files (or Web APIs) can be challenging for end users. Here's an example of JSON file with multiple levels of nested data.

:::image type="content" source="./media/json/sample-json-file.png" alt-text="Screenshot of the contents of a JSON file with nested data.":::

With the addition of automatic table detection capabilities, using the JSON connector in Power Query automatically applies transformation steps to flatten the JSON data into a table. Previously, users had to flatten records and lists manually.

:::image type="content" source="./media/json/automatic-table-detection.png" alt-text="Screenshot of the Power Query editor demonstrating automatic table detection." lightbox="./media/json/automatic-table-detection.png":::

## Troubleshooting

If you see the following message, it might be because the file is invalid. For example, it's not really a JSON file, or is malformed, or you might be trying to load a JSON Lines file.

:::image type="content" source="./media/json/unable-connect.png" alt-text="Screenshot of the unable to connect message when trying to connect to a JSON file.":::

If you're trying to load a JSON Lines file, the following sample M code converts all JSON Lines input to a single flattened table automatically:

```powerquery-m
let
    // Read the file into a list of lines
    Source = Table.FromColumns({Lines.FromBinary(File.Contents("C:\json-lines-example.json"), null, null)}),
    // Transform each line using Json.Document
    #"Transformed Column" = Table.TransformColumns(Source, {"Column1", Json.Document})
in
    #"Transformed Column"
```

Then you need to use an *Expand* operation to combine the lines together.
