---
title: Power Query Common Data Service (Legacy) connector
description: Provides basic information and instructions on connecting to data using the Common Data Service (Legacy) connector.
author: whhender
ms.topic: concept-article
ms.date: 2/1/2024
ms.author: whhender
ms.subservice: connectors
---

# Common Data Service (Legacy)

> [!NOTE]
>The Common Data Service (Legacy) connector has been superseded by the Power Query [Dataverse](dataverse.md) connector. In most cases, we recommend that you use the Dataverse connector instead of the Common Data Service (Legacy) connector. However, there could be limited cases where it's necessary to choose the Common Data Service (Legacy) connector. These cases are described in [When to use the Common Data Service (Legacy) connector](#when-to-use-the-common-data-service-legacy-connector).

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Dynamics 365 Customer Insights |
| Authentication types | Organizational account |

> [!NOTE]
>Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

[!INCLUDE [Includes_common-data-service-legacy_prerequisites](includes/common-data-service-legacy/common-data-service-legacy-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_common-data-service-legacy_capabilities-supported](includes/common-data-service-legacy/common-data-service-legacy-capabilities-supported.md)]

## Connect to Common Data Service (Legacy) from Power Query Desktop

To connect to Common Data Service (Legacy) from Power Query Desktop:

1. Select **Common Data Service (Legacy)** in the get data experience. The get data experience in Power Query Desktop varies between apps. For more information about the Power Query Desktop get data experience for your app, go to [Where to get data](../where-to-get-data.md).

2. Enter the Common Data Service (Legacy) environment URL of the data you want to load. Use the format https://\<_yourenvironmentid_>.crm.dynamics.com/. More information: [Finding your Dataverse environment URL](#finding-your-common-data-service-legacy-environment-url)

   :::image type="content" source="media/common-data-service/enter-url.png" alt-text="Server URL selection.":::

   When the table is loaded in the Navigator dialog box, by default the columns in the table are reordered in alphabetical order by the column names. If you don't want the columns reordered, in the advanced settings enter **false** in **Reorder columns**.

   Also when the table is loaded, by default if the table contains any picklist fields, a new column with the name of the picklist field with **_display** appended at the end of the name is added to the table. If you don't want the picklist field display column added, in the advanced settings enter **false** in **Add display column**.

   When you've finished filling in the information, select **OK**.

3. If this attempt is the first time you're connecting to this site, select **Sign in** and input your credentials. Then select **Connect**.

   :::image type="content" source="media/common-data-service/sign-in.png" alt-text="Sign in to this site.":::

4. In **Navigator**, select the data you require, then either load or transform the data.

   :::image type="content" source="media/common-data-service/navigator.png" alt-text="Load or transform from navigator.":::

## Connect to Common Data Service (Legacy) from Power Query Online

[!INCLUDE [Includes_common-data-service-legacy_connect-to-power-query-online](includes/common-data-service-legacy/common-data-service-legacy-connect-to-power-query-online.md)]

## Finding your Common Data Service (Legacy) environment URL

[!INCLUDE [Includes_common-data-service-legacy_find-environment-url](includes/common-data-service-legacy/common-data-service-legacy-find-environment-url.md)]

### When to use the Common Data Service (Legacy) connector

Dataverse is the direct replacement for the Common Data Service connector. However, there could be times when it's necessary to choose the Common Data Service (Legacy) connector instead of the [Dataverse](dataverse.md) connector:

There are certain Tabular Data Stream (TDS) data types that are supported in OData when using Common Data Service (Legacy) that aren't supported in Dataverse. The supported and unsupported data types are listed in [How Dataverse SQL differs from Transact-SQL](/powerapps/developer/data-platform/how-dataverse-sql-differs-from-transact-sql?tabs=supported).

All of these features will be added to the Dataverse connector in the future, at which time the Common Data Service (Legacy) connector will be deprecated.

More information: [Accessing large semantic models](#accessing-large-semantic-models)

## Limitations and considerations

[!INCLUDE [Includes_common-data-service-legacy_limitations-and-considerations](includes/common-data-service-legacy/common-data-service-legacy-limitations-and-considerations-include.md)]
