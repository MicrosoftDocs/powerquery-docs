---
title: Azure Device Registry connector
description: Includes basic information, prerequisites, and information on how to connect to Azure Device Registry from Power Query Desktop and Power Query Online.
author: whhender
ms.topic: concept-article
ms.date: 9/9/2025
ms.author: whhender
ms.subservice: connectors
---

# Azure Device Registry (Beta)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Preview|
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Organizational Account |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

[!INCLUDE [Includes_azure-device-registry_prerequisites](includes/azure-device-registry/azure-device-registry-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_azure-device-registry_capabilities-supported](includes/azure-device-registry/azure-device-registry-capabilities-supported.md)]

## Connect to Azure Device Registry from Power Query Desktop

To connect to Azure Device Registry from Power Query Desktop: 

1. In **Home** > **Get Data**, search for **Azure Device Registry** or **ADR**, and then select **Azure Device Registry**. For more information, see [Where to get data in Power Query](../where-to-get-data.md).

   :::image type="content" source="./media/azure-device-registry/get-data-here-desktop.png" alt-text="Screenshot of the Get Data dialog with the Azure Device Registry connector emphasized in Power Query Desktop.":::

1. In the **Azure Device Registry** dialog, select a scope, either **Tenant** or **Subscription(s)**, and fill in any optional or advanced fields.

   :::image type="content" source="./media/azure-device-registry/enter-information-desktop.png" alt-text="Screenshot of Azure Device Registry dialog in Power Query Desktop.":::

    | Field | Description |
    | --- | --- |
    | Scope | Choose whether to retrieve data from all Azure subscriptions in your tenant or from specific subscriptions. |
    | Subscription ID(s) | Applies **only** when scope is set to Subscription. By default, all subscriptions are included. Enter one or more Subscription IDs, separated by commas, to narrow the scope to specific subscriptions. If you select tenant for scope, you don't need to add a Subscription ID.|
    | ADR Namespace(s) | Applies **only** when scope is set to Subscription. By default, the namespace filter applies across all subscriptions if no Subscription IDs are provided. Enter one or more ADR namespaces, separated by commas, to filter results. If you select tenant for scope, then you don't need to add an ADR Namespace.|
    | Custom Attributes | Enter a comma-separated list of up to 100 custom attribute names to include as separate columns. A column named "attributes" is always included and contains all custom attributes in JSON format, even if they aren't listed in this field. |

    > [!NOTE]
    > Results are limited to 100 records by default. To change this setting, set the **Limit Results** advanced option to FALSE.

1. Select **Next**.
1. If you're connecting to this site for the first time, select **Sign in** and input your credentials. Then select **Connect**.
1. In **Navigator** pane, select the tables with the resource types you require. You can select either namespace assets (preview), devices (preview), or both.

   :::image type="content" source="./media/azure-device-registry/navigator-desktop.png" alt-text="Screenshot of the Navigator Dialog Box in Power Query Desktop.":::

1. Select **Load** or **Transform Data** to proceed.

## Connect to Azure Device Registry from Power Query Online

[!INCLUDE [Includes_azure-device-registry_connect-to-power-query-online](includes/azure-device-registry/azure-device-registry-connect-to-power-query-online.md)]

## Connect using advanced options

Power Query provides advanced options that you can add to your connector if needed. 

| Advanced option | Description |
| --- | --- |
| Maximum Rows per Page | Set the maximum number of rows per API call. The default is 500. You can increase this to improve performance, but larger values might increase response size. |
| Limit Results | By default, all available records are returned. Set to true to limit the results to the first 100 records. |


## Additional resources

- [Use Azure Device Registry with Azure IoT Operations](/azure/iot-operations/deploy-iot-ops/howto-manage-update-uninstall#view-azure-device-registry)
- [Reliability in Azure Device Registry](/azure/reliability/reliability-device-registry)

