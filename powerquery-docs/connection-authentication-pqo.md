---
title: Connections and authentication in Power Query Online
description: This article describes the process and specifics of the authentication process in Power Query Online.
author: ptyx507x
ms.date: 1/5/2023
ms.author: miescobar
---

# Connections and authentication in Power Query Online

In Power Query Online, a connection refers to the unique identifier and associated credentials used to establish a connection to a particular data source. One convenient feature of connections in Power Query is that you can create multiple connections against the same data source with different credentials.

![Example of setting a named connection for a Gateway data source, in this case a SQL Server.](media/named-connections/sql-server-named-connection.png)

There are two categories of connections:

|Connection category name|Icon|Description|
|-------------|-----|-----------|
|**Cloud**|![Cloud connection icon.](media/named-connections/cloud-connection.png) |Any connection for data source that's cloud-based and doesn't use a gateway.|
|**On-premises**|![On-premises connection icon.](media/named-connections/on-premises-connection.png) |Any connection that requires a gateway.|

## Creating a connection

During the [get data experience in Power Query Online](get-data-experience.md#1-connection-settings), you'll find a dialog where you enter information to create and establish a connection to your data source. The process is standard for all connectors in Power Query, but some connectors might require more information in order to create a connection.

### Creating a cloud connection

Using the Azure SQL Server database connector as an example, you can enter the connector settings to establish a connection. For the Azure SQL Server connector, the required setting is just the server name, but you can also enter the name of the database and select any other advanced options available for the connector.

![Connection settings of the Azure SQL Server Database connector where the only required setting is the server name.](media/named-connections/connection-settings-cloud-connection.png)

After entering the values for the connector settings in the *Connection settings* section, you can proceed with the **Connection credentials** section. In this section, you can create a connection specific to the connection settings you previously entered.

![Connection credentials of the Azure SQL Database connector where the user has been authenticated using the auto sign in feature.](media/named-connections/connection-credentials-cloud-connection.png)

The following table contains the fields and values used in the **Connection settings** section.

|Field|Description|Sample value|
|-----|------|--------|
| **Connection Name**| The name you can enter for your new connection.|Sample Connection|
| **Data Gateway**| An optional field that lets you bind a gateway to your connection. For cloud connections, there's no gateway binding to the connection.| none|
| **Authentication Kind**| The authentication kind you select to use that's supported by the connector.|Organizational account|
| **Credentials**| Depending on the authentication kind you select, there will be available a contextual set of fields to input your credentials, a button to launch an OAuth2 flow, or even no fields at all for an authentication kind such as **Anonymous**.|Derived from OAuth2 flow, but is shown as a **Sign in** button in the image|

>[!NOTE]
>By default, the field for the connection name tries to provide a default name when you create a connection using the information from the connection settings.

After finishing the **Connection settings** section, you select the **Next** button to move forward in the [get data](get-data-experience.md) experience.

>[!TIP]
> Some connectors provide an auto sign in experience. To learn more about this feature, go to [auto sign in](auto-signin-aad.md).

### Creating an on-premises connection

As an alternative, you can also bind a gateway to your connection, which converts your connection from a cloud connection to an on-premises connection.

>[!NOTE]
> To create a gateway you can read the article on [using an on-premises data gateway in dataflows](dataflows/using-dataflows-with-on-premises-data.md).

Using a local SQL Server database as an example, you enter the connector settings to establish a connection. For the SQL Server connector, the required setting is just the server name, but you can also enter the name of the database and select any other advanced options available for the connector. For demonstration purposes, both the server name and database have been entered.

![Connection settings of the SQL Server database connector where the server and database settings have been entered.](media/named-connections/connection-settings-on-premises-connection.png)

After entering the values for the connector in **Connection settings**, you can proceed with the **Connection credentials** section. In this section, you can create a connection specific to the connection settings you previously entered.

![Connection credentials of the SQL Server database connector where the user has entered a data gateway, a new connection name, and the credentials using the Basic authentication kind.](media/named-connections/connection-credentials-on-premises-connection.png)

The following table contains the fields and values used in the **Connection settings** section.

|Field|Description|Sample value|
|-----|------|--------|
| **Connection Name**| The name you can enter for your new connection|localhost;AdventureWorks2019|
| **Data Gateway**| An optional field that lets you bind a gateway to your connection.| Mike Test|
| **Authentication Kind**| The authentication kind you select to use that's supported by the connector.|Basic|
| **Credentials**| Depending on the authentication kind selected, there will be available a contextual set of fields to input your credentials, a button to launch an OAuth2 flow, or even no fields at all for an authentication kind such as **Anonymous**.|Username and password|

After finishing the **Connection settings** section, you select the **Next** button to move forward within the [get data](get-data-experience.md) experience.

## Components of a connection

Each connection is made up of a set of components. The following table contains more information for each component.

|Component name|Required or optional|Description|Sample|
|----------|-------|-----|-----|
|**Data Source kind**|Required|The data source for which the connection is being established.| SQL Server, File, Folder, Azure Data Lake Storage|
|**Data Source path**|Required|A string that represents the values or parameters used to establish a connection to your data source.|Server Name, Database Name|
| **Authentication**|Required|Encompasses both the authentication method and the credentials used for authentication.|Windows, OAuth2, Anonymous|
|**Gateway**| Optional| Used when a gateway is needed to establish the connection and execute any query evaluation.| Any gateway|
|**Privacy level**|Optional| Establishes the security for each connection, which is taken into consideration when queries from different connections are combined.| None, Public, Organizational, Private|

>[!IMPORTANT]
>Currently, the privacy level is set to **None** for any new connections created. When you try to combine multiple data sources, a new dialog prompts you to define the data privacy levels of the data sources that you want to combine.

## Known connections

When Power Query recognizes a set of connection settings, it tries to look up in its respective credentials storage to see if there's a connection that matches those settings and, if so, automatically selects that connection.

![Known connection picked up after entering the connection settings for the Kusto connector.](media/named-connections/known-connection.png)

To override this behavior, you can take either of the following two actions:

* Display the dropdown menu to scan a list of available connections for the given connection settings. You can then select the one that you'd like to use or create a new one.

   ![Known connections shown in the dropdown menu of the connection field.](media/named-connections/known-connections-drop-down.png)

* Select **Edit connection** to modify the existing connection or select **Create new connection** from the dropdown menu to create a new named connection.

   ![Edit connection dialog so the user can edit an existing connection.](media/named-connections/known-connection-edit.png)

## More resources

* [List of connectors in Power Query](connectors/index.md)
* [On-premises data gateways documentation](/data-integration/gateway/)
* [Change the gateway used in a dataflow](change-gateway-dataflow.md)
* [Troubleshooting dataflow issues: Connection to the data source](/power-query/dataflows/troubleshooting-dataflow-issues-connection-to-the-data-source)
