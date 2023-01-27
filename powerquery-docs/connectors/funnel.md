---
title: Power Query Funnel connector
description: Provides basic information, prerequisites, and information on how to connect to your Funnel data, along with a list of known issues and limitations.
author: bezhan-msft
ms.topic: conceptual
ms.date: 6/24/2022
ms.author: bezhan
---

# Funnel (Beta)

>[!Note]
>The following connector article is provided by Funnel, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Funnel website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows) |
| Authentication Types Supported | Funnel Account |

## Prerequisites

To use the Funnel connector, you need a Funnel subscription. Funnel helps you collect data from all your marketing platforms, transform it, and send it to the destinations you want, like Power BI (https://funnel.io/).

In the Funnel App, go to your account, navigate to the Microsoft Power BI page in the left navigation (if you can't see it, contact us). Follow the instructions on the page. You need to create a "View" that contains the fields you want to expose in Power BI.

## Capabilities Supported

* Import

## Connect to Funnel from Power Query Desktop

To connect to Funnel:

1. Select Online Services, find **Funnel** from the product-specific data connector list, and then select **Connect**.

   [![Select Funnel Connector.](./media/funnel/funnel_connector.png)](./media/funnel/funnel_connector.png#lightbox)

1. Select **Sign in** to sign in to your Funnel account.

   ![Sign in to your Funnel account.](media/funnel/funnel_sign_in_1.png)

1. Sign in with your Google user connected to Funnel or use your Funnel credentials.

   ![Sign in to your Funnel account step 2.](media/funnel/funnel_sign_in_2.png)

1. Once you've successfully signed in, select **Connect** to continue.

   ![Successfully signed in to your Funnel account.](media/funnel/funnel_sign_in_3.png)

1. In the **Navigator** dialog box, choose one or more **views** from your **accounts** to import your data.

   [![Choose "views" from accounts.](media/funnel/funnel_navigation_table.png)](media/funnel/funnel_navigation_table.png#lightbox)

   For each view, you can enter number of rolling months of data you want.

   > [!NOTE]
   > The default number of months is 12. If today is 22.03.2022, then you'll get data for the period 01.04.2021 through 22.03.2022.

   You can then either select **Load** to load the data or select **Transform Data** to transform the data.

## Known issues and limitations

* If a view contains too much data for one month, the connector will get a TOO_MANY_ROWS error.

For more information, read our [Power BI knowledge base articles](https://help.funnel.io/en/?q=powerbi).
