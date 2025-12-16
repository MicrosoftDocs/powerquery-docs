---
title: Power Query Zendesk (Beta) connector
description: Provides basic information and prerequisites for the connector, describes the connection process, and discusses limitations and issues you might encounter.
author: whhender
ms.topic: concept-article
ms.date: 11/24/2025
ms.author: whhender
ms.subservice: connectors
---

# Zendesk (Beta)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Semantic models) |
| Authentication Types Supported | Zendesk account |

## Prerequisites

Before you can sign in to Zendesk, you must have a Zendesk account (username/password).

## Capabilities Supported

* Import

## Connect to Zendesk data

To connect to Zendesk data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, select **Zendesk (Beta)**, and then select **Connect**.

   :::image type="content" source="./media/zendesk/get-zendesk-data.png" alt-text="Screenshot of the Get data dialog with the Online Services category and the Zendesk connector highlighted.":::

2. If you're getting data through the Zendesk connector for the first time, a preview connector notice is displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

3. Enter the Zendesk URL location you want to access, and then select **OK**.

   :::image type="content" source="./media/zendesk/zendesk-url.png" alt-text="Screenshot of the Zendesk connection dialog with the Zendesk URL location filled out and ready to select OK.":::

4. To sign in to your Zendesk account, select **Sign in**.

   :::image type="content" source="./media/zendesk/sign-in.png" alt-text="Screenshot of the authentication dialog with the Zendesk account highlighted, and showing the sign in button.":::

5. In the Zendesk window that appears, provide your credentials to sign in to your Zendesk account.

   :::image type="content" source="./media/zendesk/zendesk-sign-in.png" alt-text="Screenshot of the Zendesk sign in screen where you enter your credentials.":::

6. Select **Sign in**.

7. Once you successfully sign in, select **Connect**.

   :::image type="content" source="./media/zendesk/signed-in.png" alt-text="Screenshot of the authentication dialog with the user signed in and ready to connect.":::

8. In **Navigator**, select the information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

## Limitations and issues

You should be aware of the following limitations and issues associated with accessing Zendesk data.

* Zendesk returns a 422 error status if the instance returns more than 1,000 rows.
