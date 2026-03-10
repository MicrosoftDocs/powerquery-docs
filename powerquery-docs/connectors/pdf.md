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

[!INCLUDE [Includes_pdf_limitations-and-considerations](includes/pdf/pdf-limitations-and-considerations-include.md)]
