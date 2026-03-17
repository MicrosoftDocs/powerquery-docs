---
title: Include file for the Connect to Power Query Online section of the Power Query ODBC connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query ODBC connector documentation
author: whhender
ms.author: whhender
ms.date: 03/06/2026
ms.topic: include
---

To make the connection, take the following steps:

1. From the **Data sources** page, select **ODBC**.

2. In the ODBC page, enter your ODBC connection string. In the following example, the connection string is `dsn=SQL Server Database`.

   :::image type="content" source="../../media/odbc/odbc-online-connection.png" alt-text="Screenshot of the ODBC page, with the connection string set to the SQL Server database.":::

3. If needed, select an on-premises data gateway in **Data gateway**.

4. Choose the authentication kind to sign in, and then enter your credentials. For more information, go to [Authentication in Power Query Online](../../../connection-authentication-pqo.md).

5. Select **Next**.

6. In the **Navigator**, select the database information you want, and then select **Transform data** to continue transforming the data in the Power Query editor.

   :::image type="content" source="../../media/odbc/odbc-online-navigator.png" alt-text="Screenshot of the online navigator with employee information selected." lightbox="../../media/odbc/odbc-online-navigator.png":::

