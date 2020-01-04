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

Depending on the exact file selected, you may be presented with a few different options: if your text file has some structure to it that Power Query can detect, or if it's a csv file, it will load a table that tries to preserve this structure. If your text file doesn't have structure, clear or otherwise (for example a document that has similar comma usage across paragraphs might be interpreted to be a CSV), you will get a single column with a new row per line encoded in the source text.

### Unstructured Text

You will be presented with the table that the connector loads, which you can then Load or Transform.

```
Hello world.
This is sample data.
```

![Loading data from a simple unstructured text file](../images/textrawnavigator.png)

![File culture selection for Text/CSV](../images/textfileorigindropdown.png)

### CSV

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
