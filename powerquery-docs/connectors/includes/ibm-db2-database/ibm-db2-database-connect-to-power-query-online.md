---
title: Include file for the Connect to Power Query Online section of the Power Query IBM Db2 database connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query IBM Db2 database connector documentation
ms.date: 03/06/2026
ms.topic: include
---

To make the connection, take the following steps:

1. Select the **IBM Db2 database** option in the **Power Query - Connect to data source** page.

2. Specify the IBM Db2 server to connect to in **Server**. If a port is required, specify it by using the format *ServerName:Port*, where *Port* is the port number. Also, enter the IBM Db2 database you want to access in **Database**. In this example, the server name and port are `TestIBMDb2server.contoso.com:4000` and the IBM Db2 database being accessed is `NORTHWD2`

3. Select the name of your on-premises data gateway.

   > [!NOTE]
   > You must select an on-premises data gateway for this connector, whether the IBM Db2 database is on your local network or online.

4. If you're connecting to this IBM Db2 database for the first time, select the type of credentials for the connection in **Authentication kind**. Choose **Basic** if you plan to use an account created in the IBM Db2 database instead of Windows authentication.

5. Enter your credentials.

6. Select **Use Encrypted Connection** if you want to use an encrypted connection, or clear the option if you want to use an unencrypted connection.

   :::image type="content" source="../../media/ibm-db2/sign-in-online.png" alt-text="Screenshot of the IBM Db2 database online connection settings with the required settings entered.":::

7. Select **Next** to continue.

8. In **Navigator**, select the data you require, then select **Transform data** to transform the data in the Power Query editor.

   :::image type="content" source="../../media/ibm-db2/navigator-online.png" alt-text="Screenshot of the online navigator where you select the data you want to transform." lightbox="../../media/ibm-db2/navigator-online.png":::

