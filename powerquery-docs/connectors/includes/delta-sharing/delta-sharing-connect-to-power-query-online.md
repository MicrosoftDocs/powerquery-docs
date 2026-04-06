---
title: Include file for the Connect to Power Query Online section of the Power Query Delta Sharing connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query Delta Sharing connector documentation
ms.date: 04/06/2026
ms.topic: include
---

To connect to Delta Sharing data:

1. Select **Delta Sharing** from the **Power Query Connect to data source** page.

1. In the **Delta Sharing** dialog, enter the **Server URL**. You can find this endpoint URL in the credentials file provided by the data provider.

1. Select the authentication kind:

   - **Authentication**: Enter the bearer token from your credentials file.
   - **OAuth (OIDC)**: Sign in with your organizational identity provider to use OpenID Connect authentication.

1. Select **Next** to proceed.

1. In the **Choose data** page, select the tables you want to load, and then select **Transform data** to transform the data in Power Query Editor.
