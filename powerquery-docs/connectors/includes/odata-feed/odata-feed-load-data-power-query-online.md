---
title: Include file for the Load data from an OData Feed in Power Query Online section of the Power Query OData Feed connector documentation
description: Include file for the Load data from an OData Feed in Power Query Online section of the Power Query OData Feed connector documentation
ms.reviewer: whhender
ms.date: 03/17/2026
ms.topic: include
---

To load data from an OData Feed in Power Query Online:

1. Select the **OData** or **OData Feed** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../../../where-to-get-data.md).

   :::image type="content" source="../../media/odata-feed/get-data-online.png" alt-text="Screenshot of the get data window with OData emphasized.":::

2. In the OData dialog that appears, enter a URL in the text box.

   :::image type="content" source="../../media/odata-feed/odata-online-sign-in.png" alt-text="Screenshot of the OData online sign in page.":::

3. If you're connecting using the OData Feed for the first time, select the authentication kind and enter your credentials (if necessary). Then select **Next**.

4. From the **Navigator** dialog, you can select a table, then transform the data in the Power Query editor by selecting **Transform Data**.

   :::image type="content" source="../../media/odata-feed/odata-navigator.png" alt-text="Screenshot of the online navigator with the alphabetical list of products selected and displayed." lightbox="../../media/odata-feed/odata-navigator.png":::

   If you have multiple tables that have a direct relationship to one or more of the already selected tables, you can select the **Select Related Tables** button. When you do, all tables that have a direct relationship to one or more of the already selected tables are imported as well.
