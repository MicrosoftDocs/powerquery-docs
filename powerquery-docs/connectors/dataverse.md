---
title: Power Query Dataverse connector
description: Provides basic information and connection instructions, along with OData API performance information, table retrieval rate, and alternative means of connecting to Dataverse.
author: whhender
ms.topic: concept-article
ms.date: 2/6/2024
ms.author: whhender
ms.subservice: connectors
---

# Dataverse

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights |
| Authentication types | Organizational account<br/>Service principal |

> [!NOTE]
> The service principal authentication type isn't supported when using an on-premises data gateway or a virtual network (VNet) data gateway.

> [!NOTE]
>Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

[!INCLUDE [Includes_dataverse_prerequisites](includes/dataverse/dataverse-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_dataverse_capabilities-supported](includes/dataverse/dataverse-capabilities-supported.md)]

## Connect to Dataverse from Power Query Desktop

> [!NOTE]
> The Power Query Dataverse connector is mostly suited towards analytics workloads, not bulk data extraction. More information: [Alternative Dataverse connections](#alternative-dataverse-connections)

To connect to Dataverse from Power Query Desktop:

1. Select the **Dataverse** option from **Get Data**. More information: [Where to get data](../where-to-get-data.md)

2. If you're connecting to this site for the first time, select **Sign in** and input your credentials. Then select **Connect**.

   :::image type="content" source="media/dataverse/sign-in.png" alt-text="Sign in to this site.":::

3. In **Navigator**, select the data you require, then either load or transform the data.

   :::image type="content" source="media/dataverse/navigator.png" alt-text="Load or transform from navigator.":::

4. If you're using Power Query from Power BI Desktop, you're asked to select either the **Import** or **DirectQuery** data connectivity mode. Then select **OK**.

   :::image type="content" source="media/dataverse/connection-settings.png" alt-text="Screenshot of Power BI Desktop connection settings with Import selected and DirectQuery not selected.":::

## Connect to Dataverse from Power Query Online

[!INCLUDE [Includes_dataverse_connect-to-power-query-online](includes/dataverse/dataverse-connect-to-power-query-online.md)]

## Connect using advanced options

Power Query Online provides advanced options that you can add to your query if needed.

The following table lists the advanced options you can set in Power Query Online.

| Advanced option | Description |
| --------------- | ----------- |
| Include relationship columns | If checked, includes columns that might have relationships to other tables. If this box is cleared, you can’t see those columns. More information: [Performance issues related to relationship columns](#performance-issues-related-to-relationship-columns)|

Once you select the advanced options you require, select **Next** to connect to Dataverse.

## Finding your Dataverse environment URL

[!INCLUDE [Includes_dataverse_find-environment-url](includes/dataverse/dataverse-find-environment-url.md)]

## When to use the Common Data Service (Legacy) connector

Dataverse is the direct replacement for the Common Data Service connector. However, there might be times when it's necessary to choose the Common Data Service (Legacy) connector instead of the [Dataverse](dataverse.md) connector:

There are certain Tabular Data Stream (TDS) data types that are supported in OData when using Common Data Service (Legacy) that aren't supported in Dataverse. The supported and unsupported data types are listed in [How Dataverse SQL differs from Transact-SQL](/powerapps/developer/data-platform/how-dataverse-sql-differs-from-transact-sql?tabs=supported).

All of these features will be added to the Dataverse connector in the future, at which time the Common Data Service (Legacy) connector will be deprecated.

More information: [Accessing large amounts of Dataverse data](#accessing-large-amounts-of-dataverse-data)

## Limitations and considerations

[!INCLUDE [Includes_dataverse_limitations-and-considerations](includes/dataverse/dataverse-limitations-and-considerations-include.md)]
