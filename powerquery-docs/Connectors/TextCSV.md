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

There is only one thing you can fongire on this page, which is the File Origin dropdown select. This lets you 

![File culture selection for Text/CSV](../images/textfileorigindropdown.png)


You will be presented with the table that the connector loads, which you can then Load or Transform.





### CSV
(To read the Power BI Desktop specific file on CSV files, please see [here](https://docs.microsoft.com/en-us/power-bi/desktop-connect-csv).

If your text file has some structure to it that Power Query can detect, or if it's a csv file, it will load a table that tries to preserve this structure.

Source: https://docs.microsoft.com/power-bi/service-comma-separated-value-files

![Loading data from a csv file](../images/csvload.png)

![Delimeter selection for a csv file](../images/csvdelimeterdropdown.png)

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

CSV
Engine function documentation

CRI - promote headers can request the file twice due to how the connector handles the stream when requesting from a web endpoint, the solution is to wrap web.contents with binary.buffer
