---
title: Power Query KQL database connector
description: Includes basic information, prerequisites, and information on how to connect to a KQL database, along with a list of limitations.
author: whhender
ms.topic: concept-article
ms.date: 1/24/2024
ms.author: whhender
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

[!INCLUDE [Includes_kql-database_prerequisites](includes/kql-database/kql-database-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_kql-database_capabilities-supported](includes/kql-database/kql-database-capabilities-supported.md)]

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

[!INCLUDE [Includes_kql-database_connect-to-power-query-online](includes/kql-database/kql-database-connect-to-power-query-online.md)]

## Connect using advanced options

Both Power Query Desktop and Power Query Online provide a set of advanced options that you can add to your query if needed.

The following table lists all of the advanced options you can set in Power Query Desktop and Power Query Online.

| Advanced option | Description |
| --------------- | ----------- |
| Limit query result record number | The maximum number of records to return in the result. |
| Limit query result data size in Bytes | The maximum data size in bytes to return in the result. |
| Disable result-set truncation | Enable or disable result truncation by using the `notruncation` request option. |
| Additional Set Statements | Sets query options for the duration of the query. Query options control how a query executes and returns results. Multiple Set statements can be separated by semicolons. |
