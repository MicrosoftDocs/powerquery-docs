---
title: Include file for the Connect to Power Query Online section of the Power Query KQL database connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query KQL database connector documentation
author: whhender
ms.author: whhender
ms.date: 03/06/2026
ms.topic: include
---

To connect to a KQL database from Power Query Online:

1. In **Choose data source**, search for **KQL**, and then select **KQL Database**. More information: [Where to get data](../../../where-to-get-data.md)

2. In **Connect to data source**, fill in the cluster and any optional fields, such as **Database**.

   :::image type="content" source="../../media/kql-database/connect-to-data-source.png" alt-text="Screenshot of the connect to data source page, with connection setting ready to fill in.":::

   To get the cluster URI, navigate to your KQL database in the Fabric service and copy the Query URI.

   :::image type="content" source="../../media/kql-database/copy-uri-desktop.png" alt-text="Screenshot of the MyKQLDatabase KQL database home page with the Query copy URI option emphasized.":::

3. If necessary, enter an on-premises data gateway if you're going to be using on-premises data. For example, if you're going to combine data from dataflows and an on-premises SQL Server database.

4. Sign in to your organizational account.

5. When you've successfully signed in, select **Next**.

6. In **Choose data**, select the data you require, and then select **Transform Data**.

   :::image type="content" source="../../media/kql-database/choose-data.png" alt-text="Screenshot of the choose data page, with storm events selected.":::

