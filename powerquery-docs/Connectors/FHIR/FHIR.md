---
title: Power Query connector for FHIR
description: Power Query connector for FHIR reference
author: hansenms
ms.topic: conceptual
ms.date: 10/5/2022
ms.author: mihansen
---

# FHIR

Fast Healthcare Interoperability Resources ([FHIR&reg;](https://hl7.org/fhir)) is a new standard for healthcare data interoperability. Healthcare data is represented as resources such as `Patient`, `Observation`, `Encounter`, and so on, and a REST API is used for querying healthcare data served by a FHIR server. The Power Query connector for FHIR can be used to import and shape data from a FHIR server.

If you don't have a FHIR server, you can provision the [Azure API for FHIR](/azure/healthcare-apis/).

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights |
| Authentication Types Supported | Anonymous<br/>Azure Active Directory |

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities Supported

* Import

## Prerequisites

You must have a FHIR Data Reader role on the FHIR server to read data from the server. More information: [Assign roles for the FHIR service](/azure/healthcare-apis/configure-azure-rbac#assign-roles-for-the-fhir-service)

## Connect to a FHIR server from Power Query Desktop

To make a connection to a FHIR server, take the following steps:

1. Select the **Get Data** button.

    ![Image with the Get Data selection highlighted in the Home tab of Power BI Desktop.](FHIR-GetData.png)

2. Select **Other** > **FHIR**, and then select **Connect**.

    ![Image of the Get Data dialog box with the Other category and the FHIR connector emphasized.](FHIR-GetData-More.png)

3. Enter the URL for your FHIR server.

    ![Image with the FHIR connection details.](FHIR-Connection-Details.png)

    You can optionally enter an initial query for the FHIR server, if you know exactly what data you're looking for.

    Select **OK** to proceed.

4. Decide on your authentication scheme.

    ![Image of authentication dialog box with the Organizational account selected and the user not yet signed in.](FHIR-Sign-In.png)

    The connector supports "Anonymous" for FHIR servers with no access controls (for example, public test servers like `http://test.fhir.org/r4`) or Azure Active Directory authentication. You must have a [FHIR Data Reader role](#prerequisites) on the FHIR server to read data from the server. Go to [FHIR connector authentication](FHIR-Authentication.md) for details.

5. Select the resources you're interested in.

    ![Image of the Navigator with the FHIR Patient resource selected, and the patient records shown in the display window.](FHIR-Navigator.png)

    Select **Transform Data** to shape the data.

6. Shape the data as needed, for example, expand the postal code.

    ![Image of the Power Query Editor with the patient data shown, the address column selected, and the postal code selected for expansion.](FHIR-ShapeData.png)

7. Save the query when shaping is complete.

    ![Image of the Power Query Editor with the postal code expanded and the Close & Apply selection in the Home tab emphasized.](FHIR-SaveQuery.png)

8. Create dashboards with data, for example, make a plot of the patient locations based on postal code.

    ![Image of the Power Query Desktop with the address.postalCode emphasized in the Location box, with a map showing each patient postal code as a dot on the map.](FHIR-PlotPatientlocations.png)

## Connect to a FHIR server from Power Query Online

To make a connection to a FHIR server, take the following steps:

1. In **Power Query - Choose data source**, select the **Other** category, and then select **FHIR**.

   ![Image of the Choose data source dialog box with the Other category and the FHIR connector emphasized.](FHIR-GetData-online.png)

2. In the **FHIR** dialog, enter the URL for your FHIR server.  

   ![Image with the FHIR URL filled in.](./FHIR-Access-online.png)

    You can optionally enter an initial query for the FHIR server, if you know exactly what data you're looking for.

3. If necessary, include the name of your on-premises data gateway.

4. Select the **Organizational account** authentication kind, and select **Sign in**. Enter your credentials when asked. You must have a [FHIR Data Reader role](#prerequisites) on the FHIR server to read data from the server.

5. Select **Next** to proceed.

6. Select the resources you're interested in.

   ![Image of the Navigator with the FHIR Patient box filled in, and the patient records shown on the right hand side.](./FHIR-Navigator-online.png)

   Select **Transform data** to shape the data.

7. Shape the data as needed, for example, expand the postal code.

   ![Image of the Power Query Editor with the address column selected, and the postal code selected for expansion.](./FHIR-ShapeData-online.png)

8. Save the query when shaping is complete.

   ![Image of the Power Query Editor with the Save & Close button emphasized.](./FHIR-SaveQuery-online.png)

   >[!Note]
   > In some cases, query folding can't be obtained purely through data shaping with the graphical user interface (GUI), as shown in the previous image. To learn more about query folding when using the FHIR connector, see [FHIR query folding](./FHIR-QueryFolding.md).

## Next Steps

In this article, you've learned how to use the Power Query connector for FHIR to access FHIR data. Next explore the authentication features of the Power Query connector for FHIR.

>[!div class="nextstepaction"]
>[FHIR connector authentication](FHIR-Authentication.md)

> FHIR&reg; and the FHIR Flame icon are the registered trademarks of HL7 and are used with the permission of HL7. Use of the FHIR trademark does not constitute endorsement of this product by HL7.
