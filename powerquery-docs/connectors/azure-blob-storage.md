---
title: Azure Blob Storage
description: Includes basic information, prerequisites, and information on how to connect to Azure Blob Storage.

author: whhender
ms.topic: concept-article
ms.date: 10/4/2024
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Azure Blob Storage

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Anonymous<br/>Account key<br/>Organizational account<br/>Shared access signature (SAS)<br/>Service principal |
| Function Reference Documentation | [AzureStorage.BlobContents](/powerquery-m/azurestorage-blobcontents)<br/>[AzureStorage.Blobs](/powerquery-m/azurestorage-blobs) |

> [!NOTE]
>The service principal authentication type isn't supported when using an on-premises data gateway or a virtual network (VNet) data gateway.

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

[!INCLUDE [Includes_azure-blob-storage_prerequisites](includes/azure-blob-storage/azure-blob-storage-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_azure-blob-storage_capabilities-supported](includes/azure-blob-storage/azure-blob-storage-capabilities-supported.md)]

## Connect to Azure Blob Storage from Power Query Desktop

To connect to Azure Blob Storage:

1. Select **Azure Blob Storage** in the get data experience. The get data experience in Power Query Desktop varies between apps. For more information about the Power Query Desktop get data experience for your app, go to [Where to get data](../where-to-get-data.md).

2. In **Azure Blob Storage**, enter the account name or URL of your Azure Blob Storage account. Then select **OK**.

    :::image type="content" source="./media/azure-blob-storage/enter-account-name.png" alt-text="Screenshot of the Azure Blob Storage dialog box where you enter the account name or the URL.":::

3. If you're connecting to this account for the first time, select either the **Anonymous**, **Organizational account**, **Account key**, or **Shared access signature (SAS)** authentication method to sign into the Azure Blob Storage account. More information: [Copy your account key from Azure Blob Storage](#copy-your-account-key-from-azure-blob-storage)

   :::image type="content" source="./media/azure-blob-storage/sign-in-desktop.png" alt-text="Screenshot of the sign in dialog box for Azure Blob Storage, with the account key authentication method selected.":::

   For more information about using and managing authentication, go to [Authentication in desktop apps](../connectorauthentication.md).

4. Select **Connect**.

5. The **Navigator** dialog box shows the files that you uploaded to your Azure Blob Storage account. Select the containers you want to use, and then select either **Transform Data** to transform the data in Power Query or **Load** to load the data.

   :::image type="content" source="./media/azure-blob-storage/navigator-desktop.png" lightbox="./media/azure-blob-storage/navigator-desktop.png" alt-text="Screenshot of the Navigator open and containing the data from the Azure Blob Storage container.":::

## Connect to Azure Blob Storage from Power Query Online

[!INCLUDE [Includes_azure-blob-storage_connect-to-power-query-online](includes/azure-blob-storage/azure-blob-storage-connect-to-power-query-online.md)]

## Copy your account key from Azure Blob Storage

To retrieve your Azure Blob Storage account key to use while authenticating your account in Power Query:

1. Sign in to the [Azure portal](https://portal.azure.com/).

2. Locate your Azure Blob Storage account.

3. In the storage account menu pane, under **Security + networking**, select **Access keys**.

   :::image type="content" source="./media/azure-blob-storage/access-key-location.png" alt-text="Screenshot of the example storage account in Azure, with Security + networking and Access keys emphasized." lightbox="./media/azure-blob-storage/access-key-location.png":::

4. In the **key1** section, locate the **Key** value. Select **Show** next to the key value.

5. Select the **Copy to clipboard** icon to copy the **Key** value.

   :::image type="content" source="./media/azure-blob-storage/account-key-location.png" alt-text="Screenshot of the Access keys page, with the Key under key1 shown, and the Copy to clipboard icon emphasized.":::

## Limitations and considerations

[!INCLUDE [Includes_azure-blob-storage_limitations-and-considerations](includes/azure-blob-storage/azure-blob-storage-limitations-and-considerations.md)]
