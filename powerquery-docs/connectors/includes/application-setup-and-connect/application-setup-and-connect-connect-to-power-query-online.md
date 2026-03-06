---
title: Include file for the Connect to Power Query Online section of the Power Query SAP Business Warehouse Application Server connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query SAP Business Warehouse Application Server connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

To connect to an SAP BW Application Server from Power Query Online:

1. From the **Data sources** page, select **SAP BW Application Server**.

2. Enter the server name, system number, and client ID of the SAP BW Application Server you want to connect to. This example uses `SAPBWTestServer` as the server name, a system number of `00`, and a client ID of `837`.

3. Select the [on-premises data gateway](/data-integration/gateway/service-gateway-onprem) you want to use to connect to the data.

4. Set **Authentication Kind** to **Basic**. Enter your user name and password.

   :::image type="content" source="get-data-online-power-apps-app.png" alt-text="SAP BW Application Server online sign-in.":::

5. You can also select from a set of [advanced options](../../sap-bw/use-advanced-options.md) to fine-tune your query.

6. Select **Next** to connect.

7. From the **Navigator** dialog box, select the items you want to use. When you select one or more items from the server, the **Navigator** dialog box creates a preview of the output table. For more information about navigating the SAP BW Application Server query objects in Power Query, go to [Navigate the query objects](../../sap-bw/navigate-query-objects.md).

8. From the **Navigator** dialog box, you can transform the data in the Power Query Editor by selecting **Transform Data**.

   :::image type="content" source="navigator-online.png" lightbox="navigator-online.png" alt-text="Navigator view from Power Query Online.":::
