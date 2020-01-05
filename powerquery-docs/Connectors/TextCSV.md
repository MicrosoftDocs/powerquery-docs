# Text/CSV

## Summary

Release State: General Availability
Products: Power BI Desktop, Power BI Service (Enterprise Gateway), Dataflows in PowerBI.com (Enterprise Gateway), Dataflows in PowerApps.com (Enterprise Gateway), Excel

Authentication Types Supported:

Function Reference Documentation: [File.Contents](https://docs.microsoft.com/en-us/powerquery-m/file-contents), [Lines.FromBinary](https://docs.microsoft.com/en-us/powerquery-m/lines-frombinary), [CSV.Document](https://docs.microsoft.com/powerquery-m/csv-document)

## Capabilities supported

* Import

## Load from Text/CSV File

To load a local text or csv file, all you need to do is select the 'Text/CSV' option in the connector selection. This will launch a local file browser and allow you to select your text file. 

![Text file selection](../images/textcsvbrowse.png)

Depending on the exact file selected, you may be presented with a few different options.

### Unstructured Text
If your text file doesn't have structure, clear or otherwise (for example a document that has similar comma usage across paragraphs might be interpreted to be a CSV), you will get a single column with a new row per line encoded in the source text.

As a sample for unstructured text, you can consider a notepad file with the following contents:

```
Hello world.
This is sample data.
```

When you load it, you're presented with a navigation screen that loads each of these lines into their own row.

![Loading data from a simple unstructured text file](../images/textrawnavigator.png)

There is only one thing you can fongire on this page, which is the File Origin dropdown select. This lets you select [which character set](https://docs.microsoft.com/windows/win32/intl/code-page-identifiers) was used to generate the file.

![File culture selection for Text/CSV](../images/textfileorigindropdown.png)

### CSV
(To read the Power BI Desktop specific file on CSV files, please see [here](https://docs.microsoft.com/en-us/power-bi/desktop-connect-csv).

If your text file has some structure to it that Power Query can detect, or if it's a csv file, it will load a table that tries to preserve this structure. You can find a sample CSV file [here](https://docs.microsoft.com/power-bi/service-comma-separated-value-files).

In addition to file origin, CSV also supports specifying the delimeter, as well as how data type detection will be handled.

![Loading data from a csv file](../images/csvload.png)

Delimeters available include colon, comma, equals sign, semicolon, space, tab, a custom delimeter (which can be any string), and a fixed width (chunking up text by some standard number of characters).

![Delimeter selection for a csv file](../images/csvdelimeterdropdown.png)

The final dropdown allows you to select how you want to handle data type detection. It can be done based on the first 200 rows, on the entire data set, or you can choose to not do automatic data type detection and instead let all columns default to 'Text'. Warning: if you do it on the entire data set it may cause previewing the data in the editor to be slower.

![Data type inference selection for a csv file](../images/csvdatatypedropdown.png)

### Structured Text

```
Column 1	Column 2	Column 3
This is a string.	1	ABC123
This is also a string.	2	DEF456
```

![Loading data from a structured text file](../images/textcolumnnavigator.png)

## Troubleshooting


Text
Quotestyle
In text or CSV--'do you support newlines in cells or not', unclear because it's called quotestyle

### Loading Files from the Web

Due to how the connector works, in some cases a file may be requested twice when being retrieved from a web endpoint. To avoid this, wrap your Web.Contents function with a Binary.Buffer function, which will allow the engine to avoid the second call.
