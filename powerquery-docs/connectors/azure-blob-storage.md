---
title: Azure Blob Storage
description: Includes basic information, prerequisites, and information on how to connect to Azure Blob Storage.

author: DougKlopfenstein
ms.topic: concept-article
ms.date: 10/4/2024
ms.author: dougklo
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

* An Azure subscription. Go to [Get Azure free trial](https://azure.microsoft.com/pricing/free-trial/).

* An Azure Blob Storage account. Follow the instructions at [Create a storage account](/azure/storage/common/storage-account-create?tabs=azure-portal). This article assumes that you already created an Azure Blob Storage account, and uploaded data files to it.

## Capabilities supported

* Import

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

To connect to Azure Blob Storage:

1. Select the **Azure Blobs** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../where-to-get-data.md).

   :::image type="content" source="./media/azure-blob-storage/choose-data-source.png" alt-text="Screenshot of the Choose data source page, with the Azure category selected, and Azure Blobs emphasized." lightbox="./media/azure-blob-storage/choose-data-source.png":::

2. In **Connection settings**, enter the account name or URL of your Azure Blob Storage account.

3. Optionally, enter the name of the on-premises data gateway you require.

4. Select the **Authentication kind** used to access your blob storage.

   :::image type="content" source="./media/azure-blob-storage/settings-and-credentials.png" alt-text="Screenshot of the Connect to data source page, with the example account name filled in, no gateway selected, and the Account key authentication filled in." lightbox="./media/azure-blob-storage/settings-and-credentials.png":::

   * **Anonymous**: Your blob storage is set up for anonymous access. Select **Next** to continue.
   * **Account key**: Your blob storage is set up to require an account key. Enter the account key in the provided text box and select **Next** to continue. More information: [Copy your account key from Azure Blob Storage](#copy-your-account-key-from-azure-blob-storage)
   * **Organizational account**: Select **Sign in** to sign into your storage account. You're redirected to your organization's sign-in page. Follow the prompts to sign into the account. Once you're signed in, select **Next** to continue.
   * **Shared Access Signature (SAS)**: To retrieve your SAS token, go to [portal.azure.com](https://portal.azure.com), navigate to your resource, and, under **Security + networking**, select **Shared access signature** and scroll down to view the SAS token. Paste the value into the **SAS token** box and select **Next**.
   * **Service principal**: Enter the tenant ID, service principal client ID, and service principal key, and then select **Next**.

   For more information about using and managing authentication, go to [Connections and authentication in Power Query Online](../connection-authentication-pqo.md).

5. Select **Next**.

6. The **Navigator** screen shows the files that you uploaded to your Azure Blob Storage account. Select the containers you want to use, and then select **Transform data**.

   :::image type="content" source="./media/azure-blob-storage/navigator-online.png" alt-text="Screenshot of the Choose data page, with the data container selected, and the files from that container displayed on the right side." lightbox="./media/azure-blob-storage/navigator-online.png":::

## Copy your account key from Azure Blob Storage

To retrieve your Azure Blob Storage account key to use while authenticating your account in Power Query:

1. Sign in to the [Azure portal](https://portal.azure.com/).

2. Locate your Azure Blob Storage account.

3. In the storage account menu pane, under **Security + networking**, select **Access keys**.

   :::image type="content" source="./media/azure-blob-storage/access-key-location.png" alt-text="Screenshot of the example storage account in Azure, with Security + networking and Access keys emphasized." lightbox="./media/azure-blob-storage/access-key-location.png":::

4. In the **key1** section, locate the **Key** value. Select **Show** next to the key value.

5. Select the **Copy to clipboard** icon to copy the **Key** value.

   :::image type="content" source="./media/azure-blob-storage/account-key-location.png" alt-text="Screenshot of the Access keys page, with the Key under key1 shown, and the Copy to clipboard icon emphasized.":::

## Limitations

The following limitations apply to the Power Query Azure Blob Storage connector.

### Power Query Online and Azure Storage are in the same region

Direct access to an Azure Storage account with the firewall enabled and in the same region as Power Query Online isn't supported. This limitation arises because Power Query services, when deployed in the same region as the Azure storage account, use private Azure IP addresses for communication. For further details, refer to the [Azure documentation on storage network security](/azure/storage/common/storage-network-security?tabs=azure-portal#grant-access-from-an-internet-ip-range).

To work around this limitation and enable access to Azure Storage from Power Query Online in the same region, use one of the following methods:

* Utilize an [On-premises data gateway](/data-integration/gateway/), which serves as a bridge between Power Query Online and Azure Storage.
* Use a [Virtual Network (VNet) data gateway](/data-integration/vnet/overview).
