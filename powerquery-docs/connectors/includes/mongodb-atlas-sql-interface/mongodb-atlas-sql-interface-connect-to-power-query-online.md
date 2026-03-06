---
title: Include file for the Connect to Power Query Online section of the MongoDB Atlas SQL interface connector documentation
description: Include file for the Connect to Power Query Online section of the MongoDB Atlas SQL interface connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

To connect using the Atlas SQL interface:

1. Select **MongoDB Atlas SQL** from the **Power Query - Choose data source** page.
2. On the **Connection settings** page, fill in the following values:
    - The **MongoDB URI**. _Required_.

      Use the MongoDB URI obtained [in the prerequisites](#obtaining-connection-information-for-your-federated-database-instance). Make sure that it doesn't contain your username and password. URIs containing username and/or passwords are rejected.

    - Your federated **Database** name. _Required_  

      Use the name of the federated database obtained [in the prerequisites](#obtaining-connection-information-for-your-federated-database-instance).

    - Enter a **Connection name**.
    - Choose a **Data gateway**.
    - Enter your Atlas MongoDB Database access username and password and select **Next**.

   :::image type="content" source="../../media/mongodb/mongodb_connect_to_data_source.png" alt-text="Screenshot of the online Connect to data source dialog where you enter the connection settings.":::

3. In the **Navigator** screen, select the data you require, and then select **Transform data**. This selection opens the Power Query editor so that you can filter and refine the set of data you want to use.  

   :::image type="content" source="../../media/mongodb/mongodb_choose_data.png" alt-text="Screenshot of the online Navigator where you choose the data you want to transform.":::

