---
title: Power Query Text/CSV connector
description: Provides basic information and connection instructions, along with troubleshooting tips when loading files from the web and when unstructured text is interpreted as structured.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 1/24/2024
ms.author: dougklo
ms.subservice: connectors
---

# Text/CSV

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Function Reference Documentation | [File.Contents](/powerquery-m/file-contents)<br/>[Lines.FromBinary](/powerquery-m/lines-frombinary)<br/>[Csv.Document](/powerquery-m/csv-document) |

> [!NOTE]
>Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities supported

* Import

## Connect to local text/CSV file from Power Query Desktop

To load a local text or CSV file:

1. Select the **Text/CSV** option in **Get Data**. This action launches a local file browser where you can select your text file.

   :::image type="content" source="./media/text-csv/text-csv-browse.png" alt-text="Text file selection.":::

   Select **Open** to open the file.

2. From the **Navigator**, you can either transform the data in the Power Query Editor by selecting **Transform Data**, or load the data by selecting **Load**.

   :::image type="content" source="./media/text-csv/text-csv-navigator.png" alt-text="Text in the Navigator.":::

## Connect to text/CSV file from Power Query Online

To load a local text or CSV file:

1. From the **Data sources** page, select **Text/CSV**.

2. In **Connection settings**, enter a file path to the local text or CSV file you want.

   :::image type="content" source="./media/text-csv/csv-connection-settings.png" alt-text="Text file selection online.":::

3. Select an on-premises data gateway from **Data gateway**.

4. Enter a username and password.

5. Select **Next**.

6. From the **Navigator**, select **Transform Data** to begin transforming the data in the Power Query Editor.

   :::image type="content" source="./media/text-csv/csv-navigator-online.png" alt-text="Transform data.":::

## Load from the web

To load a text or CSV file from the web, select the [Web connector](./web/web.md), enter the web address of the file, and follow any credential prompts.

## Text/CSV delimiters

Power Query will treat CSVs as structured files with a comma as a delimiter&mdash;a special case of a text file. If you choose a text file, Power Query will automatically attempt to determine if it has delimiter separated values, and what that delimiter is. If it can infer a delimiter, it will automatically treat it as a structured data source.

### Unstructured Text

If your text file doesn't have structure, you'll get a single column with a new row per line encoded in the source text. As a sample for unstructured text, you can consider a notepad file with the following contents:

```
Hello world.
This is sample data.
```

When you load it, you're presented with a navigation screen that loads each of these lines into their own row.

:::image type="content" source="./media/text-csv/text-raw-navigator.png" alt-text="Loading data from a simple unstructured text file.":::

There's only one thing you can configure on this dialog, which is the **File Origin** dropdown select. This dropdown lets you select [which character set](/windows/win32/intl/code-page-identifiers) was used to generate the file. Currently, character set isn't inferred, and UTF-8 will only be inferred if it starts with a [UTF-8 BOM](/globalization/encoding/byte-order-mark).

:::image type="content" source="./media/text-csv/text-file-origin-dropdown.png" alt-text="File culture selection for Text/CSV.":::

### CSV

You can find a sample CSV file [here](https://go.microsoft.com/fwlink/?LinkID=619356).

In addition to file origin, CSV also supports specifying the delimiter and how data type detection will be handled.

:::image type="content" source="./media/text-csv/text-csv-navigator.png" alt-text="Loading data from a csv file.":::

Delimiters available include colon, comma, equals sign, semicolon, space, tab, a custom delimiter (which can be any string), and a fixed width (splitting up text by some standard number of characters).

:::image type="content" source="./media/text-csv/csv-delimiter-dropdown.png" alt-text="Delimiter selection for a csv file.":::

The final dropdown allows you to select how you want to handle data type detection. It can be done based on the first 200 rows, on the entire data set, or you can choose to not do automatic data type detection and instead let all columns default to 'Text'. Warning: if you do it on the entire data set it may cause the initial load of the data in the editor to be slower.

:::image type="content" source="./media/text-csv/csv-datatype-dropdown.png" alt-text="Data type inference selection for a csv file.":::

Since inference can be incorrect, it's worth double checking settings before loading.

### Structured Text

When Power Query can detect structure to your text file, it will treat the text file as a delimiter separated value file, and give you the same options available when opening a CSV&mdash;which is essentially just a file with an extension indicating the delimiter type.

For example, if you save the following example as a text file, it will be read as having a tab delimiter rather than unstructured text.

```
Column 1	Column 2	Column 3
This is a string.	1	ABC123
This is also a string.	2	DEF456
```

:::image type="content" source="./media/text-csv/text-column-navigator.png" alt-text="Loading data from a structured text file.":::

This can be used for any kind of other delimiter-based file.

### Editing Source

When editing the source step, you'll be presented with a slightly different dialog than when initially loading. Depending on what you are currently treating the file as (that is, text or csv) you'll be presented with a screen with a variety of dropdowns.

:::image type="content" source="./media/text-csv/csv-edit-source.png" alt-text="Editing the source step on a query accessing a CSV file.":::

The **Line breaks** dropdown will allow you to select if you want to apply line breaks that are inside quotes or not.

:::image type="content" source="./media/text-csv/csv-edit-line-break.png" alt-text="Editing the line break style for a CSV file.":::

For example, if you edit the 'structured' sample provided above, you can add a line break.

```
Column 1	Column 2	Column 3
This is a string.	1	"ABC
123"
This is also a string.	2	"DEF456"
```

If **Line breaks** is set to **Ignore quoted line breaks**, it will load as if there was no line break (with an extra space).

:::image type="content" source="./media/text-csv/csv-ignore-line-breaks.png" alt-text="Loading of a CSV file with quoted line breaks ignored.":::

If **Line breaks** is set to **Apply all line breaks**, it will load an extra row, with the content after the line breaks being the only content in that row (exact output may depend on structure of the file contents).

:::image type="content" source="./media/text-csv/csv-apply-line-breaks.png" alt-text="Loading of a CSV file with quoted line breaks applied.":::

The **Open file as** dropdown will let you edit what you want to load the file as&mdash;important for troubleshooting. For structured files that aren't technically CSVs (such as a tab separated value file saved as a text file), you should still have **Open file as** set to CSV. This setting also determines which dropdowns are available in the rest of the dialog.

:::image type="content" source="./media/text-csv/csv-edit-load-as.png" alt-text="Changing the type of file.":::

## Text/CSV by Example

*Text/CSV By Example* in Power Query is a generally available feature in Power BI Desktop and Power Query Online. When you use the Text/CSV connector, you'll see an option to **Extract Table Using Examples** on the bottom-left corner of the navigator.

:::image type="content" source="./media/text-csv/extract-table-using-examples.png" alt-text="Using the Extract Table Using Examples option.":::

When you select that button, you’ll be taken into the **Extract Table Using Examples** page. On this page, you specify sample output values for the data you’d like to extract from your Text/CSV file. After you enter the first cell of the column, other cells in the column are filled out. For the data to be extracted correctly, you may need to enter more than one cell in the column. If some cells in the column are incorrect, you can fix the first incorrect cell and the data will be extracted again. Check the data in the first few cells to ensure that the data has been extracted successfully.

> [!NOTE]
>We recommend that you enter the examples in column order. Once the column has successfully been filled out, create a new column and begin entering examples in the new column.

:::image type="content" source="./media/text-csv/specify-sample-output-values.png" alt-text="Specify sample output values to extract data.":::

Once you’re done constructing that table, you can either select to load or transform the data. Notice how the resulting queries contain a detailed breakdown of all the steps that were inferred for the data extraction. These steps are just regular query steps that you can customize as needed.

:::image type="content" source="./media/text-csv/data-extraction-steps.png" alt-text="Detailed breakdown of steps for data extraction.":::

## Troubleshooting

### Loading Files from the Web

If you're requesting text/csv files from the web and also promoting headers, and you’re retrieving enough files that you need to be concerned with potential throttling, you should consider wrapping your `Web.Contents` call with `Binary.Buffer()`. In this case, buffering the file before promoting headers will cause the file to only be requested once.

### Working with large CSV files

If you're dealing with large CSV files in the Power Query Online editor, you might receive an Internal Error. We suggest you work with a smaller sized CSV file first, apply the steps in the editor, and once you're done, change the path to the bigger CSV file. This method lets you work more efficiently and reduces your chances of encountering a timeout in the online editor. We don't expect you to encounter this error during refresh time, as we allow for a longer timeout duration.

### Unstructured text being interpreted as structured

In rare cases, a document that has similar comma numbers across paragraphs might be interpreted to be a CSV. If this issue happens, edit the **Source** step in the Power Query editor, and select **Text** instead of **CSV** in the **Open File As** dropdown select.

### Columns in Power BI Desktop

When you import a CSV file, Power BI Desktop generates a *columns=x* (where *x* is the number of columns in the CSV file during initial import) as a step in Power Query Editor. If you subsequently add more columns and the data source is set to refresh, any columns beyond the initial *x* count of columns aren't refreshed.

### Error: Connection closed by host

When loading Text/CSV files from a web source and also promoting headers, you might sometimes encounter the following errors: `"An existing connection was forcibly closed by the remote host"` or `"Received an unexpected EOF or 0 bytes from the transport stream."` These errors might be caused by the host employing protective measures and closing a connection which might be temporarily paused, for example, when waiting on another data source connection for a join or append operation. To work around these errors, try adding a [Binary.Buffer](/powerquery-m/binary-buffer) (recommended) or [Table.Buffer](/powerquery-m/table-buffer) call, which will download the file, load it into memory, and immediately close the connection. This should prevent any pause during download and keep the host from forcibly closing the connection before the content is retrieved.

The following example illustrates this workaround. This buffering needs to be done before the resulting table is passed to [Table.PromoteHeaders](/powerquery-m/table-promoteheaders).

* Original:

```powerquery-m
Csv.Document(Web.Contents("https://.../MyFile.csv"))
```

* With `Binary.Buffer`:

```powerquery-m
Csv.Document(Binary.Buffer(Web.Contents("https://.../MyFile.csv")))
```

* With `Table.Buffer`:

```powerquery-m
Table.Buffer(Csv.Document(Web.Contents("https://.../MyFile.csv")))
```
