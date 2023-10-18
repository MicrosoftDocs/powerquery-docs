---
title: Power Query Planview OKR (Beta) connector
description: Provides basic information and prerequisites for Planview OKR connector
author: jsilva
ms.topic: conceptual
ms.date: 10/10/2023
ms.author: bezhan
---

# Planview OKR (Beta)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Preview |
| Products | Power BI (Datasets) <br/> Power BI (Dataflows) <br/> Fabric (Dataflow Gen2) |
| Authentication Types Supported | Planview Admin account |

## Prerequisites

Before you can sign in to Planview OKR, you must have a Planview Admin account.

## Capabilities Supported

* Import

## Connect to Planview OKR data

To connect to Planview OKR data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, select **Planview OKR (Beta)**, and then select **Connect**.

   ![Screenshot of Online Services category and the Planview OKR connector highlighted.](./media/planview-okr/get-planview-okr-data.png)

2. If you're getting data through the Planview OKR connector for the first time, a preview connector notice is displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

3. Enter the Planview OKR OData URL location that you want to access, and then select **OK**.

   ![Screenshot with the Planview OKR URL location filled out and ready to select OK.](./media/planview-okr/planview-okr-url.png)

4. To sign in to your Planview Admin account, select **Sign in**.

   ![Screenshot of the Planview OKR account highlighted, and showing the sign in button.](./media/planview-okr/sign-in.png)

5. In the Planview OKR window that appears, provide your credentials to sign in to your Planview OKR account.

   ![Screenshot of the sign in screen to Planview OKR.](./media/planview-okr/planview-okr-sign-in.png)

6. Select **Sign in**.

7. Once you've successfully signed in, select **Connect**.

   ![Screenshot of the user signed in and ready to connect.](./media/planview-okr/signed-in.png)

8. In **Navigator**, select the information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in the Power Query editor.

## Load data from Planview OKR in Power Query Online

To load data from Planview OKR in Power Query Online:

1. Select the **Planview OKR (Beta)** option in the connector selection.

2. In the dialog that appears, enter the Planview OKR URL location in the text box. Fill in the rest of the details as shown in the following screenshot.

   ![Screenshot of the details for Power Query Online.](media/planview-okr/power-query-planview-okr.png)

3. If you're connecting using Planview OKR for the first time, you need to sign in into your Planview Admin account.

    ![Screenshot of the Planview OKR sign in screen.](./media/planview-okr/planview-okr-sign-in.png)
   
5. After you sign in, select **Next.

6. In Navigator, select the data you require, then select **Transform data** to transform the data in the Power Query editor.