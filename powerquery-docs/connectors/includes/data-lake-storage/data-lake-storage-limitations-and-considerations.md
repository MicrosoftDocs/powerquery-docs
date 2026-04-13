---
title: Include file for the Limitations and considerations section of the Power Query Data Lake Storage connector documentation
description: Include file for the Limitations and considerations section of the Power Query Data Lake Storage connector documentation
ms.date: 03/06/2026
ms.topic: include
---

### Subfolder or file not supported in Power Query Online and Power BI Desktop

Currently, in Power Query Online and in Power BI Desktop, the Azure Data Lake Storage Gen2 connector only supports paths with container, and not subfolder or file. For example, https://\<_accountname_>.dfs.core.windows.net/\<_container_> works, while https://\<_accountname_>.dfs.core.windows.net/\<_container_>/\<_filename_> or https://\<_accountname_>.dfs.core.windows.net/\<_container_>/\<_subfolder_> might fail.

### Refresh authentication

Microsoft doesn't support dataflow or semantic model refresh using OAuth2 authentication when the Azure Data Lake Storage Gen2 (ADLS) account is in a different tenant. This limitation only applies to ADLS when the authentication method is OAuth2, that is, when you attempt to connect to a cross-tenant ADLS using a Microsoft Entra ID account. In this case, we recommend that you use a different authentication method that isn't OAuth2/Microsoft Entra ID, such as the Key authentication method.

### Proxy and firewall requirements

When you create a dataflow using a gateway, you might need to change some of your proxy settings or firewall ports to successfully connect to your Azure data lake. If a dataflow fails with a gateway-bound refresh, it might be due to a firewall or proxy issue on the gateway to the Azure storage endpoints.

If you're using a proxy with your gateway, you might need to configure the Microsoft.Mashup.Container.NetFX45.exe.config file in the on-premises data gateway. More information: [Configure proxy settings for the on-premises data gateway](/data-integration/gateway/service-gateway-proxy).

To enable connectivity from your network to the Azure data lake, you might need to enable list specific IP addresses on the gateway machine. For example, if your network has any firewall rules in place that might block these attempts, you need to unblock the outbound network connections for your Azure data lake. To enable list the required outbound addresses, use the **AzureDataLake** service tag. More information: [Virtual network service tags](/azure/virtual-network/service-tags-overview)

Dataflows also support the "Bring Your Own" data lake option, which means you create your own data lake, manage your permissions, and you explicitly connect it to your dataflow. In this case, when you're connecting to your development or production environment using an Organizational account, you must enable one of the following roles for the storage account: Blob Data Reader, Blob Data Contributor, or Blob Data Owner.

### Power Query Online and Azure Storage are in the same region

Direct access to an Azure Storage account with the firewall enabled and in the same region as Power Query Online isn't supported. This limitation arises because Power Query services, when deployed in the same region as the Azure storage account, use private Azure IP addresses for communication. For more information, see the [Azure documentation on storage network security](/azure/storage/common/storage-network-security?tabs=azure-portal#grant-access-from-an-internet-ip-range).

To work around this limitation and enable access to Azure Storage from Power Query Online in the same region, use one of the following methods:

* Utilize an [On-premises data gateway](/data-integration/gateway/), which serves as a bridge between Power Query Online and Azure Storage.
* Use a [Virtual Network (VNet) data gateway](/data-integration/vnet/overview).

### Role-based access control (RBAC) required

Role-based access control (RBAC) is required for Power BI to work correctly. Access Control List (ACL) isn't supported for Power BI access.
