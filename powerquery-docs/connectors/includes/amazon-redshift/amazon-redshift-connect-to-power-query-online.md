---
title: Include file for the Connect to Power Query Online section of the Power Query Amazon Redshift connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query Amazon Redshift connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

To connect to Amazon Redshift data:

1. Select the **Amazon Redshift** option in the **Power Query - Choose data source** page.

2. In **Server**, enter the server name where your data is located. As part of the Server field, you can also specify a port in the following format: *ServerURL:Port*. In **Database**, enter the name of the Amazon Redshift database you want to access. In this example, `contoso.redshift.amazonaws.com:5439` is the server name and port number, and `dev` is the database name.

   :::image type="content" source="../../media/amazon-redshift/sign-in-online.png" alt-text="Screenshot of the connection page, with the example server name, port, and database name entered.":::

    You can also choose some optional advanced options for your connection. For more information, go to [Connect using advanced options](#connect-using-advanced-options).

3. If needed, select the on-premises data gateway in **Data gateway**.

4. Select the type of authentication you want to use in **Authentication kind**, and then enter your credentials.

5. Select or clear **Use Encrypted Connection** depending on whether you want to use an encrypted connection or not.

6. Select **Next** to continue.

7. In **Navigator**, select the data you require, and then select **Transform data**. This selection opens the Power Query editor so you can filter and refine the set of data you want to use.

   :::image type="content" source="../../media/amazon-redshift/navigator-online.png" alt-text="Screenshot of the online Navigator with the customers element selected, and the data from that element displayed on the right side.":::

