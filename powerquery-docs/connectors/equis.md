---
title: EarthSoft's EQuIS Power Query Data Connector
description: Provides basic information and connection instructions for the EQuIS connector.
author: mathew-weaver
ms.topic: conceptual
ms.date: 11/11/2025
ms.author: dougklo
ms.subservice: connectors
---

# EQuIS

> [!NOTE]
>This connector is owned and provided by EarthSoft.

## Summary

| Item | Description |
| ------- | ---------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Basic<br/>Web API (API Token)<br/>Organizational Account |
| Function Reference Documentation | &mdash; |

## Prerequisites

To use the EQuIS connector, you must have a valid user account in an EQuIS Enterprise site (version 7.0.0.19300 or later) that includes a REST API license. Your user account must be a member of the REST API role. To verify user account configuration, go to the **Roles** tab in your [user profile](https://help.earthsoft.com/index.htm?ent-user_profile_editor.htm) and verify that you're a member of the REST API role.

## Capabilities supported

* Import

## Connect to EQuIS from Power BI Desktop

To connect to an EQuIS Enterprise site from Power BI Desktop, take the following steps:

1. Select the EQuIS connector in the connector list, then select **Connect**.
2. Enter the URL of the EQuIS Enterprise site you're connecting to, then select **OK**.

   :::image type="content" source="./media/equis/enterprise_connection-ok.png" alt-text="Screenshot of the From EQuiS dialog where you enter the URL of the EQuIS Enterprise site.":::

3. Select the appropriate type of authentication:
   * **Basic**: Enter your EQuIS username and password for the given EQuIS Enterprise site.
   * **API Token**: Enter an API Token that you generated in EQuIS Enterprise (visit [User Profile](https://help.earthsoft.com/index.htm?ent-user_profile_editor.htm)).
   * **Organizational Account**: If your EQuIS Enterprise site is appropriately configured, you can authenticate with Microsoft Entra ID.
4. In **Navigator**, browse to the data set or report you want to load, then select **Load** or **Transform Data**. Visit [Using EQuIS Data](https://help.earthsoft.com/index.htm?pbi-power-bi-adding-datasets.htm) for more information about available data sets.

:::image type="content" source="./media/equis/navigator_cropped.png" alt-text="Screenshot of the Navigator dialog where you select the data set.":::

## Additional Information

* For best functionality and performance, EarthSoft recommends that you use the EQuIS connector with the latest build of EQuIS Enterprise.
* When you use reports in a facility group, nonadministrator users must have permission to all facilities contained in the facility group.
* Only "grid" reports are available in the **Navigator**.
* All data sets consumed by the EQuIS connector use camelCase for column names.
* The current version of the EQuIS connector retrieves a data set in a single API request (this logic might be optimized in a future version of the connector).
