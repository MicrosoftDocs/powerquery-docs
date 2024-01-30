---
title: Microsoft Exchange Online Power Query Data Connector
description: Provides basic information and connection instructions for the Microsoft Exchange Online connector
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 1/24/2024
ms.author: dougklo
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

- Import

## Connect to Microsoft Exchange Online from Power Query Desktop

Power Query Desktop includes Excel, Power BI (semantic models), and Analysis Services as experiences.

To make the connection to **Microsoft Exchange Online**, follow these steps:

1. From **Get Data**, select the **Online Services** category, select **Microsoft Exchange Online**, and then select **Connect**. More information: [Where to get data](../where-to-get-data.md)

   :::image type="content" source="./media/microsoft-exchange-online/get-data.png" alt-text="Screenshot of the Get Data dialog, showing Microsoft Exchange Online selected.":::

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

Power Query Online includes Power BI (Dataflows) and Customer Insights (Dataflows) as experiences.

To make the connection, take the following steps:

1. Select the **Microsoft Exchange Online** option in the connector selection. More information: [Where to get data](../where-to-get-data.md)

   :::image type="content" source="./media/microsoft-exchange-online/get-data-online.png" alt-text="Screenshot of the choose data source window, with the Online services tab opened and Microsoft Exchange Online selected.":::

1. Enter the mailbox address for the account you would like to access, and any other connection details if necessary. Select **Next**.

   :::image type="content" source="./media/microsoft-exchange-online/connect-to-data-source.png" alt-text="Screenshot of the connect to data source page with the mailbox address user@domain added.":::

1. Select the tables to import, then select **Transform Data**.

   :::image type="content" source="./media/microsoft-exchange-online/choose-data.png" alt-text="Screenshot of the choose data page with the calendar, mail, and tasks tables selected.":::

1. If you'd like, you can filter and refine your data set in this window before loading. When you're ready, select **Save & close**.

   :::image type="content" source="./media/microsoft-exchange-online/transform-data.png" alt-text="Screenshot of the transform data page, with some data loaded.":::
