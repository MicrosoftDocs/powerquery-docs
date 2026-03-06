---
title: Azure Data Lake Storage Gen2
description: Includes basic information, prerequisites, and information on how to connect to Azure Data Lake Storage Gen2, along with a list of limitations.
author: whhender
ms.topic: concept-article
ms.date: 11/11/2025
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Azure Data Lake Storage Gen2

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Organizational Account<br/>Account Key<br/>Shared Access Signature (SAS) Key<br/>Service principal |
| Function Reference Documentation | [AzureStorage.DataLake](/powerquery-m/azurestorage-datalake)<br/>[AzureStorage.DataLakeContents](/powerquery-m/azurestorage-datalakecontents) |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

[!INCLUDE [Includes_data-lake-storage_prerequisites](includes/data-lake-storage/data-lake-storage-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_data-lake-storage_capabilities-supported](includes/data-lake-storage/data-lake-storage-capabilities-supported.md)]

## Connect to Azure Data Lake Storage Gen2 from Power Query Desktop

1. Select **Azure Data Lake Storage Gen2** in the get data experience. The get data experience in Power Query Desktop varies between apps. For more information about the Power Query Desktop get data experience for your app, go to [Where to get data](../where-to-get-data.md).

2. In the **Azure Data Lake Storage Gen2** dialog box, provide the URL to your Azure Data Lake Storage Gen2 account, container, or subfolder using the container endpoint format. URLs for Data Lake Storage Gen2 have the following pattern:

   https://\<_accountname_>.dfs.core.windows.net/\<_container_>/\<_subfolder_>

   You can also select whether you want to use the file system view or the Common Data Model folder view.

    Select **OK** to continue.

   :::image type="content" source="media/azure-data-lake-storage-gen2/adls-url.png" alt-text="Screenshot of the Azure Data Lake Storage Gen2 dialog box, with the URL entered.":::

3. If you're using this URL address for the first time, you're asked to select the authentication method.

   If you select the Organizational account method, select **Sign in** to sign into your storage account. You're redirected to your organization's sign-in page. Follow the prompts to sign into the account. After you successfully sign in, select **Connect**.

   If you select the Account key method, enter your account key and then select **Connect**.

   :::image type="content" source="media/azure-data-lake-storage-gen2/sign-in.png" alt-text="Screenshot of the sign in dialog box for Azure Data Lake Storage Gen2, with organizational account selected, and ready to be signed in.":::

4. The **Navigator** dialog box shows all files under the URL you provided. Verify the information and then select either **Transform Data** to transform the data in Power Query or **Load** to load the data.

    :::image type="content" source="media/azure-data-lake-storage-gen2/file-systems.png" alt-text="Screenshot of the open Navigator dialog containing the data from the Drivers.txt file." lightbox="media/azure-data-lake-storage-gen2/file-systems.png":::

## Connect to Azure Data Lake Storage Gen2 from Power Query Online

[!INCLUDE [Includes_data-lake-storage_connect-to-power-query-online](includes/data-lake-storage/data-lake-storage-connect-to-power-query-online.md)]

## Limitations

[!INCLUDE [Includes_data-lake-storage_limitations](includes/data-lake-storage/data-lake-storage-limitations.md)]

## Related content

* [Analyze data in Azure Data Lake Storage Gen2 by using Power BI](analyze-data-in-adls-gen2.md)
* [Introduction to Azure Data Lake Storage Gen2](/azure/storage/blobs/data-lake-storage-introduction)
