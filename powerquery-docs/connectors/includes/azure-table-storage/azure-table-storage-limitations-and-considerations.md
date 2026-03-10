---
title: Include file for the Limitations and considerations section of the Power Query Azure Table Storage connector documentation
description: Include file for the Limitations and considerations section of the Power Query Azure Table Storage connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

The following limitations apply to the Power Query Azure Table Storage connector.

### Power Query Online and Azure Storage are in the same region

Direct access to an Azure Storage account with the firewall enabled and in the same region as Power Query Online isn't supported. This limitation arises because Power Query services, when deployed in the same region as the Azure storage account, use private Azure IP addresses for communication. For more information, see the [Azure documentation on storage network security](/azure/storage/common/storage-network-security?tabs=azure-portal#grant-access-from-an-internet-ip-range).

To work around this limitation and enable access to Azure Storage from Power Query Online in the same region, use one of the following methods:

- Utilize an [On-premises data gateway](/data-integration/gateway/), which serves as a bridge between Power Query Online and Azure Storage.
- Use a [Virtual Network (VNet) data gateway](/data-integration/vnet/overview).

### Mixed case support for names of Azure Tables

In certain scenarios involving Microsoft Entra authentication, the connector might fail to access data in Azure Storage account tables when the table name contains mixed casing, resulting in the error: `DataFormat.Error: OData: The format isn't supported`. To work around this limitation, rename the table using all lowercase characters or switch to the account key authentication method.
