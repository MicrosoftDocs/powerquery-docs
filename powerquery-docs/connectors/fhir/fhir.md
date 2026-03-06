---
title: Power Query connector for FHIR
description: Power Query connector for FHIR reference
author: hansenms
ms.topic: concept-article
ms.date: 1/24/2024
ms.author: mihansen
ms.subservice: connectors
---

# FHIR

Fast Healthcare Interoperability Resources ([FHIR&reg;](https://hl7.org/fhir)) is a new standard for healthcare data interoperability. Healthcare data is represented as resources such as `Patient`, `Observation`, `Encounter`, and so on, and a REST API is used for querying healthcare data served by a FHIR server. The Power Query connector for FHIR can be used to import and shape data from a FHIR server.

If you don't have a FHIR server, you can provision the [Azure API for FHIR](/azure/healthcare-apis/).

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights |
| Authentication Types Supported | Anonymous<br/>Organizational account |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities Supported

[!INCLUDE [Includes_fhir_capabilities-supported](../includes/fhir/fhir-capabilities-supported.md)]

## Prerequisites

[!INCLUDE [Includes_fhir_prerequisites](../includes/fhir/fhir-prerequisites.md)]

## Connect to a FHIR server from Power Query Desktop

To make a connection to a FHIR server, take the following steps:

1. Select the **Get Data** button.

   :::image type="content" source="fhir-getdata.png" alt-text="Screenshot with the Get Data selection highlighted in the Home tab of Power BI Desktop." lightbox="fhir-getdata.png":::

2. Select **Other** > **FHIR**, and then select **Connect**.

   :::image type="content" source="fhir-getdata-more.png" alt-text="Screenshot of the Get Data dialog with the Other category and the FHIR connector emphasized.":::

3. Enter the URL for your FHIR server.

   :::image type="content" source="fhir-connection-details.png" alt-text="Screenshot of the FHIR connection details.":::

   You can optionally enter an initial query for the FHIR server, if you know exactly what data you're looking for.

   Select **OK** to proceed.

4. Decide on your authentication scheme.

   :::image type="content" source="fhir-sign-in.png" alt-text="Screenshot of the authentication dialog with the Organizational account selected and the user not yet signed in.":::

    The connector supports "Anonymous" for FHIR servers with no access controls (for example, public test servers like `http://test.fhir.org/r4`) or Microsoft Entra ID (organizational) authentication. You must have a [FHIR Data Reader role](#prerequisites) on the FHIR server to read data from the server. Go to [FHIR connector authentication](fhir-authentication.md) for details.

5. Select the resources you're interested in.

   :::image type="content" source="fhir-navigator.png" alt-text="Screenshot of the Navigator with the FHIR Patient resource selected, and the patient records shown in the display window." lightbox="fhir-navigator.png":::

   Select **Transform Data** to shape the data.

6. Shape the data as needed, for example, expand the postal code.

   :::image type="content" source="fhir-shapedata.png" alt-text="Screenshot of the Power Query editor with the patient data shown, the address column selected, and the postal code selected for expansion.":::

7. Save the query when shaping is complete.

   :::image type="content" source="fhir-savequery.png" alt-text="Screenshot of the Power Query editor with the postal code expanded and the Close & Apply selection in the Home tab emphasized." lightbox="fhir-savequery.png":::

8. Create dashboards with data, for example, make a plot of the patient locations based on postal code.

   :::image type="content" source="fhir-plotpatientlocations.png" alt-text="Screenshot of the Power Query Desktop with the address.postalCode emphasized in the Location box, with a map showing each patient postal code as a dot on the map." lightbox="fhir-plotpatientlocations.png":::

## Connect to a FHIR server from Power Query Online

[!INCLUDE [Includes_fhir_connect-to-power-query-online](../includes/fhir/fhir-connect-to-power-query-online.md)]

## Next Steps

In this article, you've learned how to use the Power Query connector for FHIR to access FHIR data. Next explore the authentication features of the Power Query connector for FHIR.

>[!div class="nextstepaction"]
>[FHIR connector authentication](fhir-authentication.md)

> FHIR&reg; and the FHIR Flame icon are the registered trademarks of HL7 and are used with the permission of HL7. Use of the FHIR trademark does not constitute endorsement of this product by HL7.
