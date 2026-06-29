---
title: Power Query Text/CSV connector
description: Provides basic information and connection instructions, along with troubleshooting tips when loading files from the web and when unstructured text is interpreted as structured.
author: whhender
ms.topic: concept-article
ms.date: 06/29/2026
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Text/CSV

## Summary

| Item | Description |
| ---- | ----------- |
| Release state | General availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Function Reference Documentation | [File.Contents](/powerquery-m/file-contents)<br/>[Lines.FromBinary](/powerquery-m/lines-frombinary)<br/>[Csv.Document](/powerquery-m/csv-document) |

> [!NOTE]
>Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities supported

[!INCLUDE [Includes_text-csv_capabilities-supported](includes/text-csv/text-csv-capabilities-supported.md)]

## Connect to local text/CSV file from Power Query Desktop

To load a local text or CSV file:

1. Select the **Text/CSV** option in **Get Data**. This action launches a local file browser where you can select your text file.

   :::image type="content" source="./media/text-csv/text-csv-browse.png" alt-text="Screenshot of the open file browser whey you make your text file selection." lightbox="./media/text-csv/text-csv-browse.png":::

   Select **Open** to open the file.

1. From the **Navigator**, you can either transform the data in the Power Query editor by selecting **Transform Data**, or load the data by selecting **Load**.

   :::image type="content" source="./media/text-csv/text-csv-navigator.png" alt-text="Screenshot of the sample text in the Navigator." lightbox="./media/text-csv/text-csv-navigator.png":::

## Connect to text/CSV file from Power Query Online

[!INCLUDE [Includes_text-csv_connect-to-power-query-online](includes/text-csv/text-csv-connect-to-power-query-online.md)]

## Load from the web

To load a text or CSV file from the web, select the [Web connector](./web/web.md), enter the web address of the file, and follow any credential prompts.

## Text/CSV delimiters

Power Query treats CSVs as structured files with a comma as a delimiter - a special case of a text file. If you choose a text file, Power Query automatically attempts to determine if it has delimiter separated values, and what that delimiter is. If it can infer a delimiter, it automatically treats it as a structured data source.

### Unstructured text

If your text file doesn't have structure, you get a single column with a new row for each line encoded in the source text. As a sample for unstructured text, consider a Notepad file with the following contents:

```
Hello world.
This is sample data.
```

When you load it, you're presented with a navigation screen that loads each of these lines into their own row.

:::image type="content" source="./media/text-csv/text-raw-navigator.png" alt-text="Screenshot of the navigator with loaded data from a simple unstructured text file." lightbox="./media/text-csv/text-raw-navigator.png":::

You can configure only one option on this dialog, which is the **File Origin** dropdown select. This dropdown lets you select [which character set](/windows/win32/intl/code-page-identifiers) was used to generate the file. Currently, the character set isn't inferred, and UTF-8 is only inferred if it starts with a [UTF-8 BOM](/globalization/encoding/byte-order-mark).

:::image type="content" source="./media/text-csv/text-file-origin-dropdown.png" alt-text="Screenshot of the file culture selection for Text/CSV.":::

### CSV

You can find a sample CSV file [here](https://go.microsoft.com/fwlink/?LinkID=619356).

In addition to file origin, CSV also supports specifying the delimiter and how data type detection is handled.

:::image type="content" source="./media/text-csv/text-csv-navigator.png" alt-text="Screenshot of the navigator showing loaded data from a csv file." lightbox="./media/text-csv/text-csv-navigator.png":::

Delimiters include colon, comma, equals sign, semicolon, space, tab, a custom delimiter (which can be any string), and a fixed width (splitting up text by some standard number of characters).

:::image type="content" source="./media/text-csv/csv-delimiter-dropdown.png" alt-text="Screenshot of the delimiter selection for a csv file.":::

The final dropdown lets you select how you want to handle data type detection. You can base it on the first 200 rows or on the entire data set. You can also choose to turn off automatic data type detection and instead let all columns default to 'Text.' Warning: if you choose the entire data set, it might cause the initial load of the data in the editor to be slower.

:::image type="content" source="./media/text-csv/csv-datatype-dropdown.png" alt-text="Screenshot of the data type inference selection for a csv file.":::

Since inference can be incorrect, double check settings before loading.

### Structured text

When Power Query detects structure in your text file, it treats the text file as a delimiter separated value file. It gives you the same options available when opening a CSV. A CSV is essentially a file with an extension indicating the delimiter type.

For example, if you save the following example as a text file, Power Query reads it as having a tab delimiter rather than unstructured text.

```
Column 1	Column 2	Column 3
This is a string.	1	ABC123
This is also a string.	2	DEF456
```

:::image type="content" source="./media/text-csv/text-column-navigator.png" alt-text="Screenshot showing the loaded data from a structured text file." lightbox="./media/text-csv/text-column-navigator.png":::

You can use this structure for any kind of other delimiter-based file.

### Editing source

When you edit the source step (in the **Applied steps** pane of Power Query Desktop), you see a slightly different dialog than when you initially load the file. Depending on how you currently treat the file (as text or CSV), you see a screen with various dropdowns.

:::image type="content" source="./media/text-csv/csv-edit-source.png" alt-text="Screenshot of the dialog where you edit the source step on a query accessing a CSV file.":::

Use the **Line breaks** dropdown to select if you want to apply line breaks that are inside quotes or not.

:::image type="content" source="./media/text-csv/csv-edit-line-break.png" alt-text="Screenshot of the dropdown where you select the line break style for a CSV file.":::

For example, if you edit the 'structured' sample previously provided, you can add a line break.

```
Column 1	Column 2	Column 3
This is a string.	1	"ABC
123"
This is also a string.	2	"DEF456"
```

If you set **Line breaks** to **Ignore quoted line breaks**, the sample loads with the second half of the string under the first half in the same column.

:::image type="content" source="./media/text-csv/csv-ignore-line-breaks.png" alt-text="Loading of a CSV file with quoted line breaks ignored.":::

If you set **Line breaks** to **Apply all line breaks**, the sample loads an extra row, with the content after the line breaks being the only content in that row (exact output might depend on structure of the file contents).

:::image type="content" source="./media/text-csv/csv-apply-line-breaks.png" alt-text="Loading of a CSV file with quoted line breaks applied.":::

Use the **Open file as** dropdown to edit what you want to load the file as. This setting is important for troubleshooting. For structured files that aren't technically CSVs (such as a tab separated value file saved as a text file), keep **Open file as** set to CSV. This setting also determines which dropdowns are available in the rest of the dialog.

:::image type="content" source="./media/text-csv/csv-edit-load-as.png" alt-text="Changing the type of file.":::

## Text/CSV by Example

*Text/CSV By Example* in Power Query is a generally available feature in Power BI Desktop and Power Query Online. When you use the Text/CSV connector, you see an option to **Extract Table Using Examples** on the bottom-left corner of the navigator.

:::image type="content" source="./media/text-csv/extract-table-using-examples.png" alt-text="Using the Extract Table Using Examples option.":::

When you select that button, you're taken into the **Extract Table Using Examples** page. On this page, you specify sample output values for the data you'd like to extract from your Text/CSV file. After you enter the first cell of the column, other cells in the column are filled out. For the data to be extracted correctly, you might need to enter more than one cell in the column. If some cells in the column are incorrect, you can fix the first incorrect cell and the data is extracted again. To ensure that the data extracted successfully, check the data in the first few cells.

> [!NOTE]
>Enter the examples in column order. Once the column is successfully filled out, create a new column and begin entering examples in the new column.

:::image type="content" source="./media/text-csv/specify-sample-output-values.png" alt-text="Specify sample output values to extract data." lightbox="./media/text-csv/specify-sample-output-values.png":::

Once you complete constructing that table, you can either select to load or transform the data. Notice how the resulting queries contain a detailed breakdown of all the steps that were inferred for the data extraction. These steps are regular query steps that you can customize as needed.

:::image type="content" source="./media/text-csv/data-extraction-steps.png" alt-text="Detailed breakdown of steps for data extraction." lightbox="./media/text-csv/data-extraction-steps.png":::

## Troubleshooting

### Loading files from the web

If you're requesting text/csv files from the web and also promoting headers, and you're retrieving enough files that you need to be concerned with potential throttling, consider wrapping your `Web.Contents` call with `Binary.Buffer()`. In this case, buffering the file before promoting headers causes the file to be requested only once.

### Working with large CSV files

If you're dealing with large CSV files in the Power Query Online editor, you might receive an Internal Error. Work with a smaller sized CSV file first, apply the steps in the editor, and once you're done, change the path to the bigger CSV file. This method lets you work more efficiently and reduces your chances of encountering a timeout in the online editor. You don't expect to encounter this error during refresh time, as the service allows for a longer timeout duration.

### Unstructured text is interpreted as structured

In rare cases, Power Query interprets a document as a CSV when similar comma numbers appear across paragraphs. If this problem occurs, edit the **Source** step in the Power Query editor, and select **Text** instead of **CSV** in the **Open File As** dropdown select.

### Columns in Power BI Desktop

When you import a CSV file, Power BI Desktop generates a *columns=x* step in the Power Query editor, where *x* is the number of columns in the CSV file during initial import. If you later add more columns and set the data source to refresh, the refresh operation doesn't include any columns beyond the initial *x* count of columns.

### Error: Connection closed by host

When loading Text/CSV files from a web source and promoting headers, you might sometimes encounter the following errors: `"An existing connection was forcibly closed by the remote host"` or `"Received an unexpected EOF or 0 bytes from the transport stream."` The host might cause these errors by employing protective measures and closing a connection that might be temporarily paused, such as when waiting on another data source connection for a join or append operation. To work around these errors, try adding a [Binary.Buffer](/powerquery-m/binary-buffer) (recommended) or [Table.Buffer](/powerquery-m/table-buffer) call. These functions download the file, load it into memory, and immediately close the connection. This action prevents any pause during download and keeps the host from forcibly closing the connection before the content is retrieved.

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
