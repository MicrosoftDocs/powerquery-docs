---
title: Include file for the Limitations section of the Azure Blob Storage connector documentation
description: Include file for the Limitations section of the Azure Blob Storage connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

The following limitations apply to the Power Query Azure Blob Storage connector.

### Power Query Online and Azure Storage are in the same region

Direct access to an Azure Storage account with the firewall enabled and in the same region as Power Query Online isn't supported. This limitation arises because Power Query services, when deployed in the same region as the Azure storage account, use private Azure IP addresses for communication. For further details, refer to the [Azure documentation on storage network security](/azure/storage/common/storage-network-security?tabs=azure-portal#grant-access-from-an-internet-ip-range).

To work around this limitation and enable access to Azure Storage from Power Query Online in the same region, use one of the following methods:

* Utilize an [On-premises data gateway](/data-integration/gateway/), which serves as a bridge between Power Query Online and Azure Storage.
* Use a [Virtual Network (VNet) data gateway](/data-integration/vnet/overview).
