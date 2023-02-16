---
title: Microsoft Exchange Power Query Data Connector
description: Provides basic information and connection instructions for the Microsoft Exchange connector
author: bezhan-msft
ms.topic: conceptual
ms.date: 12/14/2022
ms.author: bezhan
---

# Microsoft Exchange

## Summary

| Item | Description |
| ------- | ---------- |
| Release State | General Availability |
| Products | Excel <br/> Power BI (Datasets)<br/> Analysis Services |
| Authentication Types Supported | Exchange account<br/>Microsoft account |
| Function Reference Documentation | [Exchange.Contents](/powerquery-m/exchange-contents) |

## Capabilities Supported

- Import

## Connect to Microsoft Exchange from Power Query Desktop

Power Query Desktop includes Excel, Power BI (Datasets), and Analysis Services as experiences.

To make the connection to **Microsoft Exchange**, follow these steps:

1. From **Get Data**, select the **Other** category, select **Microsoft Exchange**, and then select **Connect**. More information: [Where to get data](../where-to-get-data.md)

   :::image type="content" source="./media/microsoft-exchange/get-data.png" alt-text="Screenshot of the Get Data dialog, showing Microsoft Exchange selected.":::

1. In the **Microsoft Exchange** window that appears, enter the mailbox address for the account you would like to access.

   :::image type="content" source="./media/microsoft-exchange/enter-address.png" alt-text="Screenshot of the Microsoft Exchange dialog, showing a mailbox address added with the format user@domain.com.":::

1. Select **OK**.

1. Choose either Exchange account sign in and provide your credentials, or Microsoft account and sign in.

   :::image type="content" source="./media/microsoft-exchange/exchange-account-login.png" alt-text="Screenshot of the Microsoft Exchange dialog, showing a mailbox account and password entered.":::

   You can also use a User Principal Name (UPN). It looks similar to an email address. Typical format is user@domain_name.

   :::image type="content" source="./media/microsoft-exchange/microsoft-account-login.png" alt-text="Screenshot of the Microsoft Exchange dialog.":::

1. In **Navigator**, select the data to import and use in your application. Then select either **Load** to load the table, or **Transform Data** to open the Power Query Editor where you can filter and refine the set of data you want to use, and then load that refined set of data.

   :::image type="content" source="./media/microsoft-exchange/select-data.png" alt-text="Screenshot of the Microsoft Exchange navigator, showing calendar and mail selected.":::
