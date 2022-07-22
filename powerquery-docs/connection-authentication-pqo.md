---
title: Connections and authentication in Power Query Online
description: This article describes the process and specifics of the authentication process in Power Query Online.
author: ptyx507x
ms.reviewer: 
ms.date: 7/25/2022
ms.author: miescobar
---

# Connections and authentication in Power Query Online

In Power Query Online, named connections provide you with a more flexible approach to create and manage connections. A named connection is the definition of a set of components to establish a connection to a particular data source. You can create multiple connections against the same data source with the only differentiation being the name you choose to assign.

![Example of setting a named connection for a Gateway data source, in this case a SQL Server](media/named-connections/sql-server-named-connection.png)

There are two categories of connections:

|Connection Category Name|Icon|Description|
|-------------|-----|-----------|
|**Cloud**|![Cloud connection icon](media/named-connections/cloud-connection.png) |Any connection for data source that is cloud-based and does not use a gateway|
|**On-Premise**|![On-Premise connection icon](media/named-connections/on-premise-connection.png) |Any connection that requires a gateway|

## Creating a named connection

During the [Get Data experience in Power Query Online](/powerquery-docs/get-data-experience.md#1-connection-settings-and-authentication), you will find a dialog where you can enter a set of information in order to create and establish a connection to your data source. The process is standard for all connectors in Power Query, but some connectors might require more information in order to create such connection.

### Creating a cloud connection

***ME: This is a "how to" section on how to create a cloud connection against an Azure SQL db**

Using the SQL Database connector as an example, you can....

>[!TIP]
> Some connectors provide an auto-login experience. You can learn more about this feature from the article on [auto-login](/powerquery-docs/auto-login-aad.md).

### Creating an On-Premise connection 

***ME: This is a "how to" section on how to create an On-Premises connection against a local SQL Server db using a gateway**

As an alternative, you can also bind a gateway to your connection and therefore converting your connection from a cloud connection to an On-Premise connection.

>[!NOTE]
> To create a gateway you can read the article on [using an on-premises data gateway in dataflows](/powerquery-docs/dataflows/using-dataflows-with-on-premises-data.md).

The process is simple and straightforward where you can simply....

## Components of a connection

Each connection is made up of a set of components. Below you will find a table with more information for each component.

|Component name|Required or optional|Description|Sample|
|----------|-------|-----|-----|
|**Data Source kind**|Required|The data source for which the connection is being established to| SQL Server, File, Folder, Azure Data Lake Storage|
|**Data Source path**|Required|This is a string that represents the values or parameters used to establish a connection to your data source.|Server Name, Database Name|
| **Authentication**|Required|This encompasses both the authentication method and the credentials used for it|Windows, OAuth2, Anonymous|
|**Gateway**| Optional| Used when a gateway is needed to establish the connection and execute any query evaluation| Any gateway|
|**Privacy level**|Optional| By default it is set to none and it establishes the security for each connection which is taken into consideration when queries from different connections are combined| None, Public, Organizational, Private|

>[!IMPORTANT]
>At the moment, the privacy level will be set to *None* for any new connections created. When you try to combine multiple data sources, a new dialog will prompt you to define the data privacy levels of the data sources that you want to combine.

## More resources

* [List of connectors in Power Query](/powerquery-docs/Connectors/index.md)
* [On-premises data gateways documentation](https://docs.microsoft.com/data-integration/gateway/)
* [Change the gateway used in a dataflow](/powerquery-docs/change-gateway-dataflow.md)
* [Troubleshooting dataflow issues: Connection to the data source](/powerquery-docs/dataflows/troubleshooting-dataflow-issues-connection-to-the-data-source.md)