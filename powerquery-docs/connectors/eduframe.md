---
title: Power Query Eduframe Reporting (Beta) connector
description: Provides basic information and prerequisites for the Eduframe Reporting connector, descriptions of the optional input parameters, and discusses limitations and issues you might encounter.
author: StijnKing
ms.topic: conceptual
ms.date: 9/11/2025
ms.author: dougklo
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Eduframe Reporting (Beta)

>[!Note]
>This connector is owned and provided by Drieam.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Eduframe account |


## Prerequisites

Before you can sign in to Eduframe Reporting, you must have an Eduframe Admin account (username/password) and have enabled the Eduframe Reporting integration. To enable this integration, you can send an email to: support@eduframe.nl.

## Capabilities Supported

* Import

## Connect to Eduframe Reporting data

To connect to Eduframe Reporting data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, select **Eduframe (Beta)**, and then select **Connect**.

   :::image type="content" source="./media/eduframe-reporting/get-eduframe-data.png" alt-text="Image with Online Services category and the Eduframe connector highlighted.":::

2. If this is the first time you're getting data through the Eduframe connector, a preview connector notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

3. Enter the Eduframe domain that you want to access (this domain is the URL without the .eduframe.nl), and if you want to exclude personal information. Then select **OK**.

   :::image type="content" source="./media/eduframe-reporting/eduframe-domain.png" alt-text="Image with Eduframe domain filled out and ready to select OK.":::

4. To sign in to your Eduframe account, select **Sign in**.

   ![Image with organizational account highlighted, and showing the sign in button.](./media/eduframe-reporting/eduframe-sign-in.png)

5. In the window that appears, provide your credentials to sign in to your Eduframe account and select **Sign in**.

6. Next it will show a window where you have to approve this integration with Power BI. Select **approve**.

   :::image type="content" source="./media/eduframe-reporting/eduframe-approve.png" alt-text="Image with the power BI integration approval.":::

7. Once you've successfully signed in, select **Connect**.

8. In **Navigator**, select the information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in the Power Query editor.

## Limitations and issues

You should be aware of the following limitations and issues associated with accessing Eduframe data.

* There's a throttling limit of 100 API calls per 60 seconds.

