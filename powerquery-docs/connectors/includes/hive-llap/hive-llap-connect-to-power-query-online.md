---
title: Include file for the Connect to Power Query Online section of the Power Query Hive LLAP connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query Hive LLAP connector documentation
ms.date: 03/06/2026
ms.topic: include
---

To connect to the Apache Hive LLAP server:

1. Select the **Hive LLAP** option in the **Power Query - Choose data source** page.

   :::image type="content" source="../../media/hive-llap/connect-online.png" alt-text="Screenshot of the connect to data source page with all of the selections not yet filled in.":::

2. Enter the **URL** to the Adobe Hive LLAP server. You can also enter an optional port number. Typically, the URL looks like `http://[hostname]:[port number]`. The components of the URL are:

   - The `hostname` (for example, `hivellaphttp.southcentralus.contoso.com`) is the hostname or IP address of the Apache Hive server.
   - The `port number` (for example, 10500) is the port number for the Apache Hive server. If the `port number` isn't specified, the default value is 10501 for the HTTP transport protocol and 10500 for the standard transport protocol.

3. In **Thrift Transport Protocol**, select either **Standard** for TCP mode, or **HTTP** for HTTP mode.

4. If necessary, select the name of your on-premises data gateway.

5. If you're connecting to this Hive LLAP data for the first time, select the type of credentials for the connection in **Authentication kind**.

6. Enter your credentials.

7. Select **Use Encrypted Connection** if you want to use an encrypted connection, or clear the option if you want to use an unencrypted connection.

8. Select **Next** to continue.

9. In **Navigator**, select the data you require, then select **Transform data** to transform the data in the Power Query editor.

