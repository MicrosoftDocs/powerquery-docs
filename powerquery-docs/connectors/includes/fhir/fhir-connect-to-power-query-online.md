---
title: Include file for the Connect to Power Query Online section of the Power Query connector for FHIR connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query connector for FHIR connector documentation
ms.reviewer: mihansen
ms.date: 03/06/2026
ms.topic: include
---

To make a connection to a FHIR server, take the following steps:

1. In **Choose data source**, search for **FHIR**, and then select the **FHIR** connector. More information: [Where to get data](../../../where-to-get-data.md)

2. In the **FHIR** dialog, enter the URL for your FHIR server.  

   :::image type="content" source="./fhir-access-online.png" alt-text="Screenshot of the FHIR dialog with the FHIR URL filled in.":::

   You can optionally enter an initial query for the FHIR server, if you know exactly what data you're looking for.

3. If necessary, include the name of your on-premises data gateway.

4. Select the **Organizational account** authentication kind, and select **Sign in**. Enter your credentials when asked. You must have a [FHIR Data Reader role](#prerequisites) on the FHIR server to read data from the server.

5. Select **Next** to proceed.

6. Select the resources you're interested in.

   :::image type="content" source="./fhir-navigator-online.png" alt-text="Screenshot of the Navigator with the FHIR Patient box filled in, and the patient records shown on the right hand side." lightbox="./fhir-navigator-online.png":::

   Select **Transform data** to shape the data.

7. Shape the data as needed, for example, expand the postal code.

   :::image type="content" source="./fhir-shapedata-online.png" alt-text="Screenshot of the Power Query editor with the address column selected, and the postal code selected for expansion." lightbox="./fhir-shapedata-online.png":::

8. Save the query when shaping is complete.

   :::image type="content" source="./fhir-savequery-online.png" alt-text="Screenshot of the Power Query editor with the Save & Close button emphasized." lightbox="./fhir-savequery-online.png":::

   > [!NOTE]
   > In some cases, query folding can't be obtained purely through data shaping with the graphical user interface (GUI), as shown in the previous image. To learn more about query folding when using the FHIR connector, see [FHIR query folding](../../fhir/fhir-query-folding.md).

