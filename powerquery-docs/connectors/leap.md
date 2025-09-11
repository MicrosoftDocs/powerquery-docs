---
title: Power Query LEAP (Beta) connector
description: Includes basic information, prerequisites and instructions on how to connect to your LEAP data.
author: appintbot-leapdev
ms.topic: conceptual
ms.date: 9/11/2025
ms.author: jburchel
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# LEAP (Beta) Power Query custom connector

>[!Note]
>This connector is owned and provided by LEAP.

## Summary

| Item | Description |
| ------- | ------------|
|Release state | Preview |
| Products supported | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication types supported | Organizational account (LEAP Admin user account) |

## Prerequisites

Before you can sign in to LEAP, you must have a LEAP Admin user account.

## Capabilities supported

* Import

## Connect to LEAP data from Power Query Desktop

To connect to LEAP data from Power Query Desktop, take the following steps:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, select **LEAP (Beta)**, and then select **Connect**.

   :::image type="content" source="media/leap/desktop-leap-get-data.png" alt-text="Screenshot of Online Services category and the LEAP connector highlighted.":::

1. If you're getting data through the LEAP connector for the first time, a preview connector notice is displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

1. To sign in to your LEAP Admin user account, select **Sign in**.

   :::image type="content" source="media/leap/desktop-leap-sign-in.png" alt-text="Screenshot of the LEAP account highlighted, and showing the sign in button.":::

1. In the LEAP window that appears, provide your credentials to sign in to your LEAP Admin user account.

   :::image type="content" source="media/leap/desktop-leap-sign-in-auth.png" alt-text="Screenshot of the sign in screen for LEAP.":::

1. Select **Sign in**.

1. Once you've successfully signed in, select **Connect**.

   :::image type="content" source="media/leap/desktop-leap-signed-in.png" alt-text="Screenshot of the user signed in and ready to connect.":::

1. In **Navigator**, select the information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in the Power Query editor.

   :::image type="content" source="media/leap/desktop-leap-navigator.png" alt-text="Power Query Navigator showing LEAP data.":::

## Load data from LEAP in Power Query Online

To connect to LEAP from Power Query Online, take the following steps:

1. Select the **LEAP (Beta)** option in the connector selection.

1. In the dialog that appears:
   1. Connection: Create new connection.
   1. Data Gateway: (none).
   1. Authentication kind: (Organizational account).

1. If you're connecting using LEAP for the first time or have recently changed your password, you must sign in to your LEAP Admin user account.

1. Once you've signed in, the **Navigator** appears.

1. In Navigator, select the information you want, then select **Transform Data** to transform the data in the Power Query editor.
