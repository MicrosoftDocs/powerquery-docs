---
title: Include file for the Connect to Power Query Online section of the Power Query Denodo connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query Denodo connector documentation
ms.date: 04/06/2026
ms.topic: include
---

To connect to Denodo data:

1. Select **Denodo** from the **Power Query Connect to data source** page.

1. In the **Denodo** dialog, enter the **DSN or Connection String** for your Denodo instance. For a connection string, you must specify the SERVER, PORT, and DATABASE parameters.

1. Choose whether or not to engage debug mode.

1. Include the name of your on-premises data gateway.

   > [!NOTE]
   > An on-premises data gateway is required because the Denodo connector uses an ODBC driver that must be installed on the gateway machine.

1. Select the authentication kind, and provide your credentials:

   - **Basic**: Enter your Denodo username and password.
   - **Organizational account**: Sign in with your organizational account.

1. Select **Next** to proceed.

1. In the **Choose data** page, select the views or tables you want to load, and then select **Transform data** to transform the data in Power Query Editor.
