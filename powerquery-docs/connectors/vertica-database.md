---
title: Power Query Vertica database connector
description: Provides basic information for the Vertica database connector, along with how to connect to your Vertica data.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 1/22/2025
ms.author: dougklo
ms.subservice: connectors
---

# Vertica database

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Database |
| Function Reference Documentation | &mdash; |

> [!NOTE]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities Supported

* Import
* DirectQuery (Power BI semantic models)

## Connect to an Vertica database from Power Query Desktop

To connect to an **Vertica** database, take the following steps:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop.

2. Select **Database** from the categories on the left, select **Vertica** on the right, and then select **Connect**.

    :::image type="content" source="media/Vertica-database/get-data.png" alt-text="Image of the Get Data dialog with the Database category and Vertica connector selected.":::

3. In the **Vertica** window that appears, type or paste the name of your Vertica server into the box. You can **Import** data directly into Power BI or you can use **DirectQuery**. Learn more about [using DirectQuery](/power-bi/connect-data/desktop-use-directquery). Then select **OK**.

    :::image type="content" source="media/Vertica-database/server-selection.png" alt-text="Image of the Vertica dialog with a Server name entered and the Import data connectivity mode selected.":::

4. When prompted, enter your credentials. The Vertica connector supports Database (user name and password) authentication.

   :::image type="content" source="media/Vertica-database/sign-in-screen.png" alt-text="Image of the authentication dialog with Database authentication configuration.":::

   For more information about authentication methods, go to [Authentication with a data source](../connectorauthentication.md).

5. After you connect, a **Navigator** window appears and displays the data that's available on the server. Either select **Load** to load the data or **Transform Data** to continue transforming the data in the Power Query editor.


## Connect to an Vertica database from Power Query Online

To connect to an **Vertica** database, take the following steps:

1. Select the **Vertica** option in the connector selection.

2. In **Connect to data source**, provide the name of the server.

   :::image type="content" source="./media/Vertica-database/service-signin.png" alt-text="Enter the Vertica database online connection.":::

3. Select the name of your on-premises data gateway.

4. If this is the first time you're connecting to this Vertica database, configure the user name and password for the Basic authentication.

5. Select **Next** to continue.

6. In **Navigator**, select the data you require, then select **Transform data** to transform the data in the Power Query editor.

