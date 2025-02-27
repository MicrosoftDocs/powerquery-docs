---
title: Power Query Planview OKR (Beta) connector
description: Provides basic information and prerequisites for Planview OKR connector
author: jsilva
ms.topic: conceptual
ms.date: 1/24/2024
ms.author: dougklo
ms.subservice: connectors
---

# Planview OKR (Beta)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Preview |
| Products | Power BI (Semantic models) <br/> Power BI (Dataflows) <br/> Fabric (Dataflow Gen2) |
| Authentication Types Supported | Planview Admin account |

## Prerequisites

Before you can sign in to Planview OKR, you must have a Planview Admin account.

## Capabilities Supported

* Import

## Connect to Planview OKR data

To connect to Planview OKR data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, select **Planview OKR (Beta)**, and then select **Connect**.

   :::image type="content" source="./media/planview-okr/get-planview-okr-data.png" alt-text="Screenshot of Online Services category and the Planview OKR connector highlighted.":::

2. If you're getting data through the Planview OKR connector for the first time, a preview connector notice is displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

3. Enter the Planview OKR OData URL location that you want to access, and then select **OK**.

   :::image type="content" source="./media/planview-okr/planview-okr-url.png" alt-text="Screenshot with the Planview OKR URL location filled out and ready to select OK.":::

4. To sign in to your Planview Admin account, select **Sign in**.

   :::image type="content" source="./media/planview-okr/sign-in.png" alt-text="Screenshot of the Planview OKR account highlighted, and showing the sign in button.":::

5. In the Planview OKR window that appears, provide your credentials to sign in to your Planview OKR account.

   :::image type="content" source="./media/planview-okr/planview-okr-sign-in.png" alt-text="Screenshot of the sign in screen to Planview OKR.":::

6. Select **Sign in**.

7. Once you've successfully signed in, select **Connect**.

   :::image type="content" source="./media/planview-okr/signed-in.png" alt-text="Screenshot of the user signed in and ready to connect.":::

8. In **Navigator**, select the information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in the Power Query editor.

## Load data from Planview OKR in Power Query Online

To load data from Planview OKR in Power Query Online:

1. Select the **Planview OKR (Beta)** option in the connector selection.

2. In the dialog that appears, enter the Planview OKR URL location in the text box. Fill in the rest of the details as shown in the following screenshot.

   :::image type="content" source="./media/planview-okr/power-query-planview-okr.png" alt-text="Screenshot of the details for Power Query Online.":::

3. If you're connecting using Planview OKR for the first time, you need to sign in into your Planview Admin account.

   :::image type="content" source="./media/planview-okr/planview-okr-sign-in.png" alt-text="./media/planview-okr/planview-okr-sign-in.png.":::

4. After you sign in, select **Next**.

5. In Navigator, select the data you require, then select **Transform data** to transform the data in the Power Query editor.
