---
title: Power Query Smartsheet connector
description: Provides basic information, prerequisites, and connection instructions, along with troubleshooting information for the Smartsheet connector.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 7/10/2024
ms.author: dougklo
ms.subservice: connectors
---

# Smartsheet (Beta)

> [!NOTE]
>The following connector article is provided by Smartsheet, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Smartsheet website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Smartsheet account |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

Before you can sign in to Smartsheet, you must have a Smartsheet account.

## Capabilities Supported

* Import

### Supported Smartsheet Regions

The Smartsheet connector supports the Smartsheet US region (https://app.smartsheet.com) and Smartsheet EU region (https://app.smartsheet.eu).

## Connect to Smartsheet

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop.

2. In the search box, enter **Smartsheet**, select **Smartsheet (Beta)**, and then select **Connect**.

   :::image type="content" source="./media/smartsheet/get-data.png" alt-text="Screenshot of the Get Data dialog for Smartsheet.":::

3. Select the region to connect to.

   :::image type="content" source="./media/smartsheet/select-region.png" alt-text="Screenshot of the select region dialog where you select either US or EU.":::

4. If you're getting data through the Smartsheet connector for the first time, a third-party notice is displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

5. To sign in to your Smartsheet account, select **Sign in**.

   :::image type="content" source="./media/smartsheet/sign-in.png" alt-text="Screenshot of the authentication dialog where you select the sign in button.":::

6. In the Smartsheet window that appears, select your sign in method and provide your credentials to sign in to your Smartsheet account.

   :::image type="content" source="./media/smartsheet/smartsheet-sign-in.png" alt-text="Screenshot of the Smartsheet window where you sign in to Smartsheet.":::

7. Upon first sign in, you're prompted to allow the connector access to Smartsheet. Select **Allow**.

   :::image type="content" source="./media/smartsheet/allow-power-bi-to-access-smartsheet.png" alt-text="Screenshot of the Allow access windows where you allow the connector to access Smartsheet.":::

8. Once successfully signed in, select **Connect**.

   :::image type="content" source="./media/smartsheet/signed-in-ready-to-connect.png" alt-text="Screenshot of the authentication dialog indicating you signed in and are ready to connect.":::

Once the connection is established, you see the folders and workspaces you have access to within the **Navigator** dialog. Select the data you want to import and then select **Load**.

   :::image type="content" source="./media/smartsheet/navigator-view.png" alt-text="Screenshot of the navigator where you select the data you want to use." lightbox="./media/smartsheet/navigator-view.png":::

## Getting Help

If you run into problems when connecting to your data, [Contact Support](https://help.smartsheet.com/contact).
