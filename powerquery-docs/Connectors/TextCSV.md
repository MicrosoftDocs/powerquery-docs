---
title: Text/CSV
description: Power Query Text/CSV connector reference
author: cpopell
ms.service: powerquery
ms.topic: conceptual
ms.date: 1/9/2020
ms.author: gepopell
LocalizationGroup: reference
---

# Text/CSV

## Summary

Release State: General Availability
Products: Power BI Desktop, Power BI Service (Enterprise Gateway), Dataflows in PowerBI.com (Enterprise Gateway), Dataflows in PowerApps.com (Enterprise Gateway), Excel

Function Reference Documentation: [File.Contents](https://docs.microsoft.com/powerquery-m/file-contents), [Lines.FromBinary](https://docs.microsoft.com/powerquery-m/lines-frombinary), [Csv.Document](https://docs.microsoft.com/powerquery-m/csv-document)

## Capabilities supported

* Import

## Load from Text/CSV File

To load a local text or csv file, all you need to do is select the **Text/CSV** option in the connector selection. This will launch a local file browser and allow you to select your text file. 

![Text file selection](../images/textcsvbrowse.png)

Power Query will treat CSVs as structured files with a comma as a delimiter&mdash;a special case of a text file. If you choose a text file, Power Query will automatically attempt to determine if it has delimiter separated values, and what that delimiter is. If it can infer this, it'll automatically treat it as a structured data source.

### Unstructured Text
If your text file doesn't have structure you'll get a single column with a new row per line encoded in the source text. As a sample for unstructured text, you can consider a notepad file with the following contents:

```
Hello world.
This is sample data.
```

When you load it, you're presented with a navigation screen that loads each of these lines into their own row.

![Loading data from a simple unstructured text file](../images/textrawnavigator.png)

There's only one thing you can configure on this dialog, which is the **File Origin** dropdown select. This lets you select [which character set](https://docs.microsoft.com/windows/win32/intl/code-page-identifiers) was used to generate the file. Currently, character set is not inferred, and UTF-8 will only be inferred if it starts with a [UTF-8 BOM](https://docs.microsoft.com/globalization/encoding/byte-order-mark).

![File culture selection for Text/CSV](../images/textfileorigindropdown.png)

### CSV

You can find a sample CSV file [here](https://go.microsoft.com/fwlink/?LinkID=619356).

In addition to file origin, CSV also supports specifying the delimiter, as well as how data type detection will be handled.

![Loading data from a csv file](../images/csvload.png)

Delimiters available include colon, comma, equals sign, semicolon, space, tab, a custom delimiter (which can be any string), and a fixed width (splitting up text by some standard number of characters).

![Delimiter selection for a csv file](../images/csvdelimeterdropdown.png)

The final dropdown allows you to select how you want to handle data type detection. It can be done based on the first 200 rows, on the entire data set, or you can choose to not do automatic data type detection and instead let all columns default to 'Text'. Warning: if you do it on the entire data set it may cause the initial load of the data in the editor to be slower.

![Data type inference selection for a csv file](../images/csvdatatypedropdown.png)

Since inference can be incorrect, it is worth double checking settings before loading.

### Structured Text

When Power Query can detect structure to your text file, it'll treat it as a delimiter separated value file, and give you the same options available when opening a CSV&mdash;which is essentially just a file with an extension indicating the delimiter type.

For example, if you save the following below as a text file, it'll be read as having a tab delimiter rather than unstructured text.
```
Column 1	Column 2	Column 3
This is a string.	1	ABC123
This is also a string.	2	DEF456
```

![Loading data from a structured text file](../images/textcolumnnavigator.png)

This can be used for any kind of other delimiter based file.

### Editing Source

When editing the source step, you'll be presented with a slightly different dialog than when initially loading. Depending on what you are currently treating the file as (that is, text or csv) you'll be presented with a screen with a variety of dropdowns.

![Editing the source step on a query accessing a CSV file](../images/csveditsource.png)

The **Line breaks** dropdown will allow you to select if you want to apply linebreaks that are inside quotes or not. 

![Editing the line break style for a CSV file](../images/csveditlinebreak.png)

For example, if you edit the 'structured' sample provided above, you can add a line break.

```
Column 1	Column 2	Column 3
This is a string.	1	"ABC
123"
This is also a string.	2	"DEF456"
```

If **Line breaks** is set to **Ignore quoted line breaks**, it will load as if there was no line break (with an extra space).

![Loading of a CSV file with quoted line breaks ignored](../images/csvignorelinebreaks.png)

If **Line breaks** is set to **Apply all line breaks**, it will load an extra row, with the content after the line breaks being the only content in that row (exact output may depend on structure of the file contents).

![Loading of a CSV file with quoted line breaks applied](../images/csvapplylinebreaks.png)

The **Open file as** dropdown will let you edit what you want to load the file as&mdash;important for troubleshooting. Note that for structured files that aren't technically CSVs (such as a tab separated value file saved as a text file), you should still have **Open file as** set to CSV. This also determines which dropdowns are available in the rest of the dialog.

![Changing the type of file](../images/csveditloadas.png)

## Troubleshooting

### Loading Files from the Web

Due to how the connector works, in some cases a file may be requested twice when being retrieved from a web endpoint. To avoid this, wrap your Web.Contents function with a Binary.Buffer function, which will allow the engine to avoid the second call.

### Unstructured text being interpreted as structured

In rare cases, a document that has similar comma numbers across paragraphs might be interpreted to be a CSV. If this happens, edit the **Source** step in the Query Editor, and select **Text** instead of **CSV** in the **Open File As** dropdown select.
