---
title: Power Query XML connector
description: Provides basic information and how to connect to your data, along with troubleshooting tips on data shaping and issues with documents containing both text and nodes.
author: cpopell
ms.service: powerquery
ms.topic: conceptual
ms.date: 1/9/2020
ms.author: gepopell
LocalizationGroup: reference
---

# XML

## Summary

Release State: General Availability

Products: Power BI Desktop, Power BI Service (Enterprise Gateway), Dataflows in PowerBI.com (Enterprise Gateway), Dataflows in PowerApps.com (Enterprise Gateway), Excel

Function Reference Documentation: [Xml.Tables](https://docs.microsoft.com/powerquery-m/xml-tables), [Xml.Document](https://docs.microsoft.com/powerquery-m/xml-document)

## Capabilities supported

* Import

## Load from XML

### Load from file

To load a local XML file, all you need to do is select the **XML** option in the connector selection. This action will launch a local file browser and allow you to select your XML file. 

![XML file selection](../images/xmlbrowse.png)

You'll be presented with the table that the connector loads, which you can then Load or Transform.

![Loading data from a XML file in the Navigator](../images/xmlnavigator.png)

### Load from web

If you want to load an XML file from the web, instead of selecting the XML connector you can select the Web connector. Paste in the address of the desired file and you'll be prompted with an authentication selection, since you're accessing a website instead of a static file. If there's no authentication, you can just select **Anonymous**. As in the local case, you'll then be presented with the table that the connector loads by default, which you can Load or Transform.

## Troubleshooting

### Data Structure

Due to the fact that many XML documents have ragged or nested data, you may have to do extra data shaping to get it in the sort of form that will make it convenient to do analytics. This holds true whether you use the UI accessible `Xml.Tables` function, or the `Xml.Document` function. Depending on your needs, you may find you have to do more or less data shaping.

### Text versus nodes
If your document contains a mixture of text and non-text sibling nodes, you may encounter issues.

For example if you have a node like this:
```xml
<abc>
    Hello <i>world</i>
</abc>
```
`Xml.Tables` will return the "world" portion but ignore "Hello". Only the element(s) are returned, not the text. However, `Xml.Document` will return "Hello \<i>world\</i>". The entire inner node is turned to text, and structure isn't preserved.
