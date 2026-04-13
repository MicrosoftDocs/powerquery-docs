---
title: Microsoft Exchange Online Power Query Data Connector
description: Provides basic information and connection instructions for the Microsoft Exchange Online connector
author: whhender
ms.topic: concept-article
ms.date: 2/6/2024
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Microsoft Exchange Online

## Summary

| Item | Description |
| ------- | ---------- |
| Release State | General Availability |
| Products | Excel <br/> Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights<br/> Analysis Services |
| Authentication Types Supported | Exchange account<br/>Microsoft account |
| Function Reference Documentation | [Exchange.Contents](/powerquery-m/exchange-contents) |

## Capabilities Supported

[!INCLUDE [Includes_microsoft-exchange-online_capabilities-supported](includes/microsoft-exchange-online/microsoft-exchange-online-capabilities-supported.md)]

## Connect to Microsoft Exchange Online from Power Query Desktop

Power Query Desktop includes Excel, Power BI (semantic models), and Analysis Services as experiences.

To make the connection to **Microsoft Exchange Online**, follow these steps:

1. Select **Microsoft Exchange Online** in the get data experience. The get data experience in Power Query Desktop varies between apps. For more information about the Power Query Desktop get data experience for your app, go to [Where to get data](../where-to-get-data.md).

1. In the **Microsoft Exchange Online** window that appears, enter the mailbox address for the account you would like to access.

   :::image type="content" source="./media/microsoft-exchange-online/enter-address.png" alt-text="Screenshot of the Microsoft Exchange Online dialog, showing a mailbox address added with the format user@domain.com.":::

1. Select **OK**.

1. Choose either Exchange account sign in and provide your credentials, or Microsoft account and sign in.

   :::image type="content" source="./media/microsoft-exchange-online/exchange-account-login.png" alt-text="Screenshot of the Microsoft Exchange Online dialog, showing a mailbox account and password entered.":::

   You can also use a User Principal Name (UPN). It looks similar to an email address. Typical format is user@domain_name.

   :::image type="content" source="./media/microsoft-exchange-online/microsoft-account-login.png" alt-text="Screenshot of the Microsoft Exchange Online dialog.":::

1. In **Navigator**, select the data to import and use in your application. Then select either **Load** to load the table, or **Transform Data** to open the Power Query Editor where you can filter and refine the set of data you want to use, and then load that refined set of data.

   :::image type="content" source="./media/microsoft-exchange-online/select-data.png" alt-text="Screenshot of the Microsoft Exchange Online navigator, showing calendar and mail selected.":::

## Connect to Microsoft Exchange Online from Power Query Online

[!INCLUDE [Includes_microsoft-exchange-online_connect-to-power-query-online](includes/microsoft-exchange-online/microsoft-exchange-online-connect-to-power-query-online.md)]

