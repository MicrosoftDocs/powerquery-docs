---
title: Power Query Planview OKR (Beta) connector
description: Provides basic information and prerequisites for the connector, describes the connection process, and discusses limitations and issues you might encounter.
author: jsilva
ms.topic: conceptual
ms.date: 8/7/2023
ms.author: jsilva
---

# Planview OKR (Beta)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Datasets) |
| Authentication Types Supported | Planview Admin account |
| | |

## Prerequisites

Before you can sign in to Planview OKR, you must have a Planview Admin account.

## Capabilities Supported

* Import

## Connect to Planview OKR data

To connect to Planview OKR data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, select **Planview OKR (Beta)**, and then select **Connect**.

   ![Image with Online Services category and the Planview OKR connector highlighted.](./media/PlanviewOKR/get-PlanviewOKR-data.png)

2. If this is the first time you're getting data through the Planview OKR connector, a preview connector notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

3. Enter the Planview OKR OData URL location that you want to access, and the select **OK**.

   ![Image with Planview OKR URL location filled out and ready to select OK](./media/PlanviewOKR/PlanviewOKR-url.png)

4. To sign in to your Planview Admin account, select **Sign in**.

   ![Image with Planview OKR account highlighted, and showing the sign in button.](./media/PlanviewOKR/sign-in.png)

5. In the Planview OKR window that appears, provide your credentials to sign in to your Planview OKR account.

   ![Image with the sign in screen to Planview OKR.](./media/Planview OKR/PlanviewOKR-sign-in.png)

6. Select **Sign in**.

7. Once you've successfully signed in, select **Connect**.

   ![Image with the user signed in and ready to connect](./media/PlanviewOKR/signed-in.png)

8. In **Navigator**, select the information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.
