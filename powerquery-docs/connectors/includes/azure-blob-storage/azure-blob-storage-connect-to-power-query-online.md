---
title: Include file for the Connect to Power Query Online section of the Azure Blob Storage connector documentation
description: Include file for the Connect to Power Query Online section of the Azure Blob Storage connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

To connect to Azure Blob Storage:

1. Select the **Azure Blobs** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../../../where-to-get-data.md).

   :::image type="content" source="../../media/azure-blob-storage/choose-data-source.png" alt-text="Screenshot of the Choose data source page, with the Azure category selected, and Azure Blobs emphasized." lightbox="../../media/azure-blob-storage/choose-data-source.png":::

2. In **Connection settings**, enter the account name or URL of your Azure Blob Storage account.

3. Optionally, enter the name of the on-premises data gateway you require.

4. Select the **Authentication kind** used to access your blob storage.

   :::image type="content" source="../../media/azure-blob-storage/settings-and-credentials.png" alt-text="Screenshot of the Connect to data source page, with the example account name filled in, no gateway selected, and the Account key authentication filled in." lightbox="../../media/azure-blob-storage/settings-and-credentials.png":::

   * **Anonymous**: Your blob storage is set up for anonymous access. Select **Next** to continue.
   * **Account key**: Your blob storage is set up to require an account key. Enter the account key in the provided text box and select **Next** to continue. More information: [Copy your account key from Azure Blob Storage](#copy-your-account-key-from-azure-blob-storage)
   * **Organizational account**: Select **Sign in** to sign into your storage account. You're redirected to your organization's sign-in page. Follow the prompts to sign into the account. Once you're signed in, select **Next** to continue.
   * **Shared Access Signature (SAS)**: To retrieve your SAS token, go to [portal.azure.com](https://portal.azure.com), navigate to your resource, and, under **Security + networking**, select **Shared access signature** and scroll down to view the SAS token. Paste the value into the **SAS token** box and select **Next**.
   * **Service principal**: Enter the tenant ID, service principal client ID, and service principal key, and then select **Next**.

   For more information about using and managing authentication, go to [Connections and authentication in Power Query Online](../../../connection-authentication-pqo.md).

5. Select **Next**.

6. The **Navigator** screen shows the files that you uploaded to your Azure Blob Storage account. Select the containers you want to use, and then select **Transform data**.

   :::image type="content" source="../../media/azure-blob-storage/navigator-online.png" alt-text="Screenshot of the Choose data page, with the data container selected, and the files from that container displayed on the right side." lightbox="../../media/azure-blob-storage/navigator-online.png":::

