---
title: Power Query SIS-CC SDMX connector
description: Provides basic information and prerequisites for the SIS-CC SDMX connector, descriptions of the optional input parameters, and discusses limitations and issues you might come across.
author: whhender
ms.topic: concept-article
ms.date: 9/11/2025
ms.author: whhender
ms.subservice: connectors
---

# SIS-CC SDMX (Beta)

>[!Note]
>This connector is owned and provided by the Statistical Information System Collaboration Community (SIS-CC).

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Anonymous |
| Function Reference Documentation | &mdash; |

## Prerequisites

[!INCLUDE [Includes_sis-cc-sdmx_prerequisites](includes/sis-cc-sdmx/sis-cc-sdmx-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_sis-cc-sdmx_capabilities-supported](includes/sis-cc-sdmx/sis-cc-sdmx-capabilities-supported.md)]

## Connection instructions

To connect to SDMX Web Service data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **All** from the categories on the left, and then select **SIS-CC SDMX**. Then select **Connect**.

   :::image type="content" source="media/sis-cc-sdmx/sis-cc-sdmx-get-data.jpg" alt-text="SIS-CC SDMX Get Data.":::

2. Fill in the parameters:
   1. In the **Data query URL**, enter an SDMX REST data query URL (the web service must support the SDMX-CSV format).
   2. In **Display format**, select one of the options:
      - Show codes and labels; example: FREQ: Frequency
      - Show codes; example: FREQ
      - Show labels; example: Frequency
      - Optionally, enter a language preference in **Label language preference** using an IETF BCP 47 tag

   :::image type="content" source="media/sis-cc-sdmx/sis-cc-sdmx-connector.jpg" alt-text="SIS-CC SDMX Connect to Data.":::

3. If this is the first time you’re connecting to the REST web service in the previous step **Data query URL**, this authentication step is displayed. As the connection is Anonymous, select **Connect**

   :::image type="content" source="media/sis-cc-sdmx/sis-cc-sdmx-auth.jpg" alt-text="SIS-CC SDMX Auth.":::

4. Select **Load** to import the data into Power BI, or **Transform Data** to edit the query in Power Query Editor where you can refine the query before loading into Power BI.

## Limitations and considerations

[!INCLUDE [Includes_sis-cc-sdmx_limitations-and-considerations](includes/sis-cc-sdmx/sis-cc-sdmx-limitations-and-considerations-include.md)]

## Next steps

If you want to submit a feature request or contribute to the open-source project, then go to the [Gitlab project site](https://gitlab.com/sis-cc/sdmx-tools/sdmx-power-bi).
