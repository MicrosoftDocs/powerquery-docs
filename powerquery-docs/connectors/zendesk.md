---
title: Power Query Zendesk (Beta) connector
description: Provides basic information and prerequisites for the connector, describes the connection process, and discusses limitations and issues you might encounter.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 1/24/2024
ms.author: dougklo
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

   ![Image with Online Services category and the Zendesk connector highlighted.](./media/zendesk/get-zendesk-data.png)

2. If this is the first time you're getting data through the Zendesk connector, a preview connector notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

3. Enter the Zendesk URL location that you want to access, and the select **OK**.

   ![Image with Zendesk URL location filled out and ready to select OK](./media/zendesk/zendesk-url.png)

4. To sign in to your Zendesk account, select **Sign in**.

   ![Image with Zendesk account highlighted, and showing the sign in button.](./media/zendesk/sign-in.png)

5. In the Zendesk window that appears, provide your credentials to sign in to your Zendesk account.

   ![Image with the sign in screen to Zendesk.](./media/zendesk/zendesk-sign-in.png)

6. Select **Sign in**.

7. Once you've successfully signed in, select **Connect**.

   ![Image with the user signed in and ready to connect](./media/zendesk/signed-in.png)

8. In **Navigator**, select the information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

## Limitations and issues

You should be aware of the following limitations and issues associated with accessing Zendesk data.

* Zendesk returns a 422 error status if the instance returns more than 1000 rows.
