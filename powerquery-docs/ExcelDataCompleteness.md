# Excel Data Completeness
Under certain circumstances, users will run up against issues where Power Query fails to extract all the data from an Excel Worksheet, or performance is severely degraded against a reasonably sized table.
Both of these failures generally resolve to the same cause: improper cell range specification.

## Incomplete Data Loading from Excel
Incomplete data loading from Excel is generally caused by a tool exporting an Excel document with an improper 'final cell' value. This will generally be fixed by opening and re-saving the document, but that doesn't explain the cause.

To see the source of the issue, you have to look at the underlying XML of the Worksheet.
1.  Rename the xlsx file with a .zip extension
2.  Navigate into xl\worksheets
3.  Copy the xml file for the problematic sheet (for example, Sheet1.xml) out of the zip file to another location
4.  Inspect the first few lines of the file
    a. If the file is small enough, simply open it in a text editor
    b. If the file is too large to be opened in a text editor, run the following from the DOS command-line: more Sheet1.xml
6.  Look for a <dimension .../> tag

If your file has a dimension attribute that resembles \<dimension ref="A1" />, we use it to find the starting row and column of the data on Sheet1, because it's only pointing at a single cell.

However, if your file has a dimension attribute that resembles \<dimension ref="A1:AJ45000"/>, we use it to find the starting row and column **as well as the ending row and column**. If this range does not contain all relevant rows or columns, those won't be loaded.

As mentioned, this can be resolved by re-saving the file in Excel or changing the tool to generate either a proper ending point or just the starting cell.

## Sluggish Data Loading from Excel
One common cause of slow data loading in Excel is caused by a similar issue. Instead of not using all the data, the ending point indicates significantly more data than is actually there.

To fix this, you can refer to "[Locate and reset the last cell on a worksheet](https://support.office.com/en-us/article/locate-and-reset-the-last-cell-on-a-worksheet-c9e468a8-0fc3-4f69-8038-b3c1d86e99e9)" for detailed instructions.

