---
title: Palantir Foundry Power Query connector
description: Provides basic information and prerequisites for using the Palantir Foundry Power Query connector.
author: mshafer
ms.date: 9/11/2025
ms.author: whhender
ms.subservice: connectors
---

# Palantir Foundry

>[!Note]
>This connector is owned and provided by Palantir.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Organizational Account (Power BI Desktop)<br/>Personal Access Token |

## Prerequisites

[!INCLUDE [Includes_palantir-foundry-datasets_prerequisites](includes/palantir-foundry-datasets/palantir-foundry-datasets-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_palantir-foundry-datasets_capabilities-supported](includes/palantir-foundry-datasets/palantir-foundry-datasets-capabilities-supported.md)]

## Connect to Palantir Foundry from Power Query Desktop

To connect to Palantir Foundry from Power Query Desktop, take the following steps:

1. In the **Get Data** experience, select the **Palantir Foundry** option in the connector selection.
2. In **Connection Settings**, provide the **Base URL** of your Foundry environment. For example, `https://<subdomain>.palantirfoundry.com/`. Optionally, provide a **Dataset RID** and **Branch**.

   :::image type="content" source="./media/palantir-foundry-datasets/connection-settings.png" alt-text="Screenshot of the Palantir Foundry connection settings in Power Query Desktop.":::

3. Select either the **Import** or **DirectQuery** data connectivity mode.
4. Select **OK**.
5. If you're connecting to Foundry for the first time, select either the **Foundry OAuth** (recommended) or **Foundry Token** authentication type. After signing in (Foundry OAuth) or entering a token (Foundry Token), select **Connect**.

   :::image type="content" source="./media/palantir-foundry-datasets/oauth.png" alt-text="Screenshot of the Palantir Foundry authentication.":::

   For more details on these authentication options, go to Foundry's [Power BI: Authenticate with Foundry](https://www.palantir.com/docs/foundry/analytics-connectivity/power-bi-getting-started/#authenticate-with-foundry) documentation.

6. In **Navigator**, select the data set(s) you want, then select either **Load** to load the data or **Transform Data** to continue transforming the data in the Power Query editor.

   :::image type="content" source="./media/palantir-foundry-datasets/select-data.png" alt-text="Screenshot of the Power Query Desktop Navigator showing the selected data set.":::

## Connect to Palantir Foundry from Power Query Online

[!INCLUDE [Includes_palantir-foundry-datasets_connect-to-power-query-online](includes/palantir-foundry-datasets/palantir-foundry-datasets-connect-to-power-query-online.md)]

