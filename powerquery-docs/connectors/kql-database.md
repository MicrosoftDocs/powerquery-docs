---
title: Power Query KQL database connector
description: Includes basic information, prerequisites, and information on how to connect to a KQL database, along with a list of limitations.
author: DougKlopfenstein
ms.topic: concept-article
ms.date: 1/24/2024
ms.author: dougklo
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# KQL Database (Preview)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Preview |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows) |
| Authentication Types Supported | Organizational Account |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

You must have read permissions on the KQL database.

## Capabilities supported

* Import
* DirectQuery (Power BI semantic models)

## Connect to a KQL database from Power Query Desktop

To connect to a KQL database from Power Query Desktop:

1. In **Get Data**, select **Microsoft Fabric (preview)** or search for **KQL**, select **KQL Database**, and then select **Connect**. More information: [Where to get data](../where-to-get-data.md)

   :::image type="content" source="media/kql-database/get-data-desktop.png" alt-text="Screenshot of the get data page, with the Microsoft Fabric (preview) category selected, and KQL Desktop (preview) emphasized.":::

2. In **KQL Database**, fill on the cluster and any optional fields, such as **Database**.

   :::image type="content" source="media/kql-database/enter-data-desktop.png" alt-text="Screenshot of the Kusto page, showing the cluster and optional fields ready to be filled in.":::

   To get the cluster URI, navigate to your KQL database in the Fabric service and copy the Query URI.

   :::image type="content" source="media/kql-database/copy-uri-desktop.png" alt-text="Screenshot of the KQL database home page with the Query URI copy option emphasized.":::

   Then select **OK**.

3. If this attempt is the first time you're connecting to this site, select **Sign in** and input your credentials. Then select **Connect**.

   :::image type="content" source="media/kql-database/sign-in-desktop.png" alt-text="Screenshot of the sign in dialog box for KQL database, with the organizational account ready to be signed in.":::

4. In **Navigator**, select the tables you require, then either load or transform the data.

   :::image type="content" source="media/kql-database/navigator-desktop.png" alt-text="Screenshot of the Power Query navigator, with the storm events table selected.":::

## Connect to a KQL database from Power Query Online

To connect to a KQL database from Power Query Online:

1. In **Choose data source**, search for **KQL**, and then select **KQL Database**. More information: [Where to get data](../where-to-get-data.md)

2. In **Connect to data source**, fill in the cluster and any optional fields, such as **Database**.

   :::image type="content" source="media/kql-database/connect-to-data-source.png" alt-text="Screenshot of the connect to data source page, with connection setting ready to fill in.":::

   To get the cluster URI, navigate to your KQL database in the Fabric service and copy the Query URI.

   :::image type="content" source="media/kql-database/copy-uri-desktop.png" alt-text="Screenshot of the MyKQLDatabase KQL database home page with the Query copy URI option emphasized.":::

3. If necessary, enter an on-premises data gateway if you're going to be using on-premises data. For example, if you're going to combine data from dataflows and an on-premises SQL Server database.

4. Sign in to your organizational account.

5. When you've successfully signed in, select **Next**.

6. In **Choose data**, select the data you require, and then select **Transform Data**.

   :::image type="content" source="media/kql-database/choose-data.png" alt-text="Screenshot of the choose data page, with storm events selected.":::

## Connect using advanced options

Both Power Query Desktop and Power Query Online provide a set of advanced options that you can add to your query if needed.

The following table lists all of the advanced options you can set in Power Query Desktop and Power Query Online.

| Advanced option | Description |
| --------------- | ----------- |
| Limit query result record number | The maximum number of records to return in the result. |
| Limit query result data size in Bytes | The maximum data size in bytes to return in the result. |
| Disable result-set truncation | Enable or disable result truncation by using the `notruncation` request option. |
| Additional Set Statements | Sets query options for the duration of the query. Query options control how a query executes and returns results. Multiple Set statements can be separated by semicolons. |
