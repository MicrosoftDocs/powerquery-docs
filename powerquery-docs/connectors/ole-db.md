---
title: OLE DB Power Query Data Connector
description: Provides basic information and connection instructions for the OLE DB connector.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 1/24/2024
ms.author: dougklo
---

# OLE DB

## Summary

| Item | Description |
| ------- | ---------- |
| Release State | General Availability |
| Products | Excel <br/> Power BI (Semantic modelss)<br/> Analysis Services |
| Authentication Types Supported | Exchange account<br/>Microsoft account |
| Function Reference Documentation | [Exchange.Contents](/powerquery-m/exchange-contents) |

> [!NOTE]
>Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities Supported

- Import

## Connect to OLE DB from Power Query Desktop

Power Query Desktop includes Excel, Power BI (semantic models), and Analysis Services as experiences.

To make the connection to **OLE DB**, follow these steps:

1. From **Get Data**, select the **Other** category, select **OLE DB**, and then select **Connect**. More information: [Where to get data](../where-to-get-data.md)

   :::image type="content" source="./media/ole-db/get-data.png" alt-text="Screenshot of the Get Data dialog, showing OLE DB selected.":::

1. In the **OLE DB** window that appears, enter your connection string. Optionally, you can provide other SQL query information in the **Advanced options** tab.

   > [!TIP]
   > Avoid using credential or security properties in this connection string, as you'll enter them in the next menu.

   :::image type="content" source="./media/ole-db/enter-address.png" alt-text="Screenshot of the OLE DB dialog, showing connection string entered as Provider=SQLOLEDB;Data Source=(local);InitialCatalog=Adventureworks.":::

1. Select **OK**.

1. Choose the kind of authentication you'd like to use: **Default or Custom**, **Windows**, or **Database**.

   - **Default or Custom**: Enter custom or security related connection string properties, things like security strings or passwords that shouldn't be added to a query. For example 'UID=MyUserId; RefreshToken=MySecretRefreshToken; Encryption=true'
   - **Windows**: Sign in with your current windows credentials, or provide a different Windows username and password. You can also provide any other connection string properties, if needed.
   - **Database**: Provide your database username and password. You can also provide any other connection string properties, if needed.

   :::image type="content" source="./media/ole-db/database-credentials.png" alt-text="Screenshot of the OLE DB dialog, showing username, password, and optional connection string properties entered.":::

1. In **Navigator**, review and select data from your database. Then select either **Load** to load the table, or **Transform Data** to open the Power Query Editor where you can filter and refine the set of data you want to use, and then load that refined set of data.
