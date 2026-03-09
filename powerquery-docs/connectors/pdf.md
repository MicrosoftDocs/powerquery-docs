---
title: Power Query PDF connector
description: Provides basic information and prerequisites for the connector, along with information on how to connect to PDF files.
author: whhender
ms.topic: concept-article
ms.date: 1/24/2024
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# PDF

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights |
| Authentication Types Supported | Anonymous (online)<br/>Basic (online)<br/>Organizational account (online)</br>Windows (online) |
| Function Reference Documentation | [Pdf.Tables](/powerquery-m/pdf-tables) |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

>[!NOTE]
> PDF isn't supported in Power BI Premium.

## Prerequisites

None.

## Capabilities Supported

[!INCLUDE [Includes_pdf_capabilities-supported](includes/pdf/pdf-capabilities-supported.md)]

## Connect to a PDF file from Power Query Desktop

To make the connection from Power Query Desktop:

1. Select the **PDF** option in the connector selection.
2. Browse for and select the PDF file you want to load. Then select **Open**.

   :::image type="content" source="./media/pdf/connect-desktop.png" alt-text="Select the PDF file from File Explorer.":::

   If the PDF file is online, use the [Web connector](web/web.md) to connect to the file.

3. In **Navigator**, select the file information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

   :::image type="content" source="./media/pdf/desktop-navigator-view.png" alt-text="PDF file imported into Power Query Desktop Navigator.":::

## Connect to a PDF file from Power Query Online

[!INCLUDE [Includes_pdf_connect-to-power-query-online](includes/pdf/pdf-connect-to-power-query-online.md)]

## Limitations and considerations

### Accessing large PDF files

You can use the following strategies to improve performance and reduce timeouts when you access large PDF files. These strategies require that you edit your usage of the [Pdf.Tables](/powerquery-m/pdf-tables) function in either the formula bar or advanced editor.

* Try selecting pages one at a time or one small range at a time using the `StartPage` or `EndPage` options, iterating over the entire document as needed.
* If the PDF document is one single, huge table, the `MultiPageTables` option can be collecting very large intermediate values, so disabling it might help.

A full list of available options can be found in [Pdf.Tables](/powerquery-m/pdf-tables).

### Handling multi-line rows

In cases where multi-line rows aren't properly identified, you might be able to clean up the data using UI operations or custom M code. For example, you could copy misaligned data to adjacent rows using [Table.FillDown](/powerquery-m/table-filldown), or group and combine adjacent rows using [Table.Group](/powerquery-m/table-group).

### Power BI dataflows in a Premium capacity	

When working with the PDF connector on dataflows in a Premium capacity, the PDF connector doesn't properly make the connection. To enable the PDF connector to work on dataflows in a Premium capacity, configure that dataflow to use a gateway, and confirm the connection to that dataflow goes through the gateway.
