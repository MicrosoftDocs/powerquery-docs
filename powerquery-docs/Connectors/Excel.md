---
title: Excel
description: Power Query Excel connector reference
author: cpopell

ms.service: powerquery
ms.topic: conceptual
ms.date: 12/10/2019
ms.author: gepopell

LocalizationGroup: reference
---

# Excel
 
## Summary
 
Release State: General Availability

Products: Power BI Desktop, Power BI Service (Gateway for on-premise or .xls files), Dataflows in PowerBI.com (Gateway for on-premise or .xls files), Dataflows in PowerApps.com (Gateway for on-premise or .xls files), Excel

Authentication Types Supported: No authentication

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.
 
## Prerequisites
In order to connect to a legacy workbook (such as .xls or .xlsb), the Access Database Engine 2010 OLEDB provider is required. To install this, go to the [download page](https://go.microsoft.com/fwlink/?LinkID=285987) and install the relevant (32 or 64 bit) version. If you don't have it installed, when connecting to legacy workbooks you'll see the following error:

```The 32-bit (or 64-bit) version of the Access Database Engine 2010 OLEDB provider may be required to read this type of file. To download the client software, visit the following site: https://go.microsoft.com/fwlink/?LinkID=285987.```
 
## Capabilities Supported
* Import

## Connect to an Excel workbook
To connect to an Excel workbook, select 'Excel' from the product specific data connector list.
 
## Troubleshooting

### Connecting to an online Excel workbook

If you want to connect to an Excel document hosted in Sharepoint:

* Open the document in Excel Desktop
* Open the File menu, click the Info tab, and select Copy Path
* Copy the address into the "File Path or URL" field, and remove the "?web=1" from the end of the address.

### Legacy ACE Connector
**Error resolution**

Workbooks built in a legacy format (such as .xls and .xlsb) are accessed through the Access Database Engine OLEDB provider, and Power Query will display values as returned by this provider. This may cause a lack of fidelity in certain cases compared to what you would see in an equivalent xlsx (OpenXML based) file.

**Incorrect column typing returning nulls**

When Ace loads a sheet, it looks at the first 8 rows to try to guess the data types to use. If the first 8 rows of data are not inclusive of the following data (for example, numeric only in the first 8 rows versus text in the following rows), ACE will apply an incorrect type to that column and return nulls for any data that does not match the type.


## Excel Data Completeness
Under certain circumstances, users will run up against issues where Power Query fails to extract all the data from an Excel Worksheet, or performance is severely degraded against a reasonably sized table.
Both of these failures generally resolve to the same cause: improper cell range specification.

### Incomplete Data Loading from Excel
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

### Sluggish Data Loading from Excel
One common cause of slow data loading in Excel is caused by a similar issue. Instead of not using all the data, the ending point indicates significantly more data than is actually there.

To fix this, you can refer to [Locate and reset the last cell on a worksheet](https://support.office.com/en-us/article/locate-and-reset-the-last-cell-on-a-worksheet-c9e468a8-0fc3-4f69-8038-b3c1d86e99e9) for detailed instructions.
