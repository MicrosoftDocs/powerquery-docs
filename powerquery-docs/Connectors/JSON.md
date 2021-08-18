---
title: Power Query JSON connector
description: Provides basic information and connection instructions, along with instructions on loading from the web and basic troubleshooting information.
author: dougklopfenstein
ms.service: powerquery
ms.topic: conceptual
ms.date: 8/18/2021
ms.author: bezhan
LocalizationGroup: reference
---

# JSON

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Power Apps (Dataflows)<br/>Excel<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Anonymous<br/>Basic (Web only)<br/>Organizational Account<br/>Web API (Web only)<br/>Windows |
| Function Reference Documentation | [Json.Document](/powerquery-m/json-document) |
| | |

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities supported

* Import

## Load a local JSON file from Power Query Desktop

To load a local JSON file:

1. Select the **JSON** option in the **Get Data** selection. This selection launches a local file browser where you can select your JSON file.

   ![JSON file selection.](./media/json/json-get-data.png)

2. Select **Open** to open the file.

Loading the JSON file will automatically launch the Power Query Editor. From the editor, you can transform the data if you want, or you can just close and apply.

![Convert to a table.](./media/json/convert-table.png)

JSON data might not always be imported into Power Query as a table. However, you can always use the available Power Query ribbon transforms to convert it to a table.

## Load a local JSON file from Power Query Online

To load a local JSON file:

1. From the **Data sources** page, select **JSON**.

2. Enter the path to the local JSON file.

   ![JSON selection from online service.](./media/json/connect-service.png)

3. Select an on-premises data gateway from **Data gateway**.

4. If authentication is required, enter your credentials.

Loading the JSON file will automatically launch the Power Query Editor. From the editor, you can transform the data if you want, or you can just close and apply.

![Convert to a table.](./media/json/convert-table.png)

JSON data might not always be imported into Power Query as a table. However, you can always use the available Power Query ribbon transforms to convert it to a table.

## Load from the web

To load a JSON file from the web, select the [Web connector](./web/web.md), enter the web address of the file, and follow any credential prompts.

## Troubleshooting

If you see the following message, it might be because the file is invalid, for example, it's not really a JSON file, or is malformed. Or you might be trying to load a JSON Lines file.

![Unable to connect message.](./media/json/unable-connect.png)

If you're trying to load a JSON Lines file, the following sample M code converts all JSON Lines input to a single flattened table automatically:

```
let
    // Read the file into a list of lines
    Source = Table.FromColumns({Lines.FromBinary(File.Contents("C:\json-lines-example.json"), null, null)}),
    // Transform each line using Json.Document
    #"Transformed Column" = Table.TransformColumns(Source, {"Column1", Json.Document})
in
    #"Transformed Column"
```

You'll then need to use an *Expand* operation to combine the lines together.
