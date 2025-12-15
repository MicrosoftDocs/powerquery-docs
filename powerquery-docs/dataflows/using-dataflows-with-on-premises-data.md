---
title: "Using an on-premises data gateway in Power Platform dataflows | MicrosoftDocs"
description: "Learn how to use an on-premises data gateway in Power Platform dataflows"
ms.date: 1/17/2024
ms.reviewer: whhender

ms.topic: article
author: Luitwieler
ms.author: jeluitwi
ms.subservice: dataflows
---

# Using an on-premises data gateway in Power Platform dataflows

Install an on-premises data gateway to transfer data quickly and securely between a Power Platform dataflow and a data source that isn't in the cloud, such as an on-premises SQL Server database or an on-premises SharePoint site. You can view all gateways for which you have administrative permissions and manage permissions and connections for those gateways.

## Prerequisites
### Power BI service
- You must have a [currently supported gateway installed](/data-integration/gateway/service-gateway-monthly-updates) to use with Dataflows.

- A Power BI Pro license or a PPU license.  Don't have one? [Sign up for 60 days free](/power-bi/fundamentals/service-get-started#sign-up-for-the-power-bi-service).

- In order to create a dataflow that queries an on premise data source, you need one of the following:
  - Administrator permissions on a gateway.
  - Connection creator permissions on the gateway.
  - A gateway connection for the data source(s) you intend to use already created on the gateway for which you are a user.

### Power Apps
- You must have a [currently supported gateway installed](/data-integration/gateway/service-gateway-monthly-updates) to use with Dataflows.

- A Power Apps account. Don't have one? [Sign up for 30 days free](/powerapps/maker/signup-for-powerapps).

- Administrative permissions on a gateway. These permissions are provided by default for gateways you install. Administrators can grant other people permissions for gateways.

> [!NOTE]
>
> For Power Apps dataflows, only users who have been directly granted Admin access to a gateway are able to create connections using that gateway. Users who inherit Admin access through a group aren't able to create connections.

- A license that supports accessing on-premises data using an on-premises gateway. More information: "Connect to your data" row of the "Explore Power Apps plans" table in the [Power Apps pricing](https://powerapps.microsoft.com/pricing/) page.

## Install a gateway

You can install an on-premises data gateway directly from the online service.

> [!NOTE]
>
>- It's a good general practice to make sure you're using a supported version of the on-premises data gateway. We release a new update of the on-premises data gateway every month. Currently, Microsoft actively supports only the last six releases of the on-premises data gateway.
>- Starting April 2022, the minimum required gateway version will be Feburary 2021. Dataflows that refresh using an earlier version of the gateway might stop refreshing.

### Install a gateway from Power BI service

To install a gateway from Power BI service:

1. Select the downloads button in the upper right corner of Power BI service, and choose **Data Gateway**.

   :::image type="content" source="media/using-dataflows-with-on-premiese-data/install-gateway-power-bi.png" alt-text="Image showing the data gateway selection in Power Bi service.":::

2. Install the gateway using the instructions provided in [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install).

### Install a gateway from Power Apps

To install a gateway from Power Apps:

1. In the left navigation pane of [powerapps.com](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc), select **Data** > **Gateways**.

   :::image type="content" source="media/using-dataflows-with-on-premiese-data/nav-pane-gateways.png" alt-text="Gateways in left navigation bar.":::

2. Select [New gateway](https://go.microsoft.com/fwlink/?LinkID=820931).

   :::image type="content" source="media/using-dataflows-with-on-premiese-data/install-gateway-power-apps.png" alt-text="Image showing the new gateway button in Power Apps.":::

3. In the **On-Premises Data Gateway** section, select **Download**.

4. Install the gateway using the instructions provided in [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install).

## Use an on-premises data source in a dataflow

1. For instructions on how to create a new dataflow, go to [Create a dataflow from a data source](./data-sources.md).

2. Select an on-premises data source from the data sources list.

   :::image type="content" source="media/using-dataflows-with-on-premiese-data/on-premises-data-sources.png" alt-text="Choose an on-premises data source.":::

3. Provide the connection details for the enterprise gateway that will be used to access the on-premises data. You must select the gateway itself, and provide credentials for the selected gateway. Only gateways for which you're an administrator appear in the list.

    :::image type="content" source="media/using-dataflows-with-on-premiese-data/connection-creds.png" alt-text="Provide connection details.":::

You can change the enterprise gateway used for a given dataflow and change the gateway assigned to all of your queries using the dataflow authoring tool.

> [!NOTE]
> The dataflow will try to find or create the required data sources using the new gateway. If it can't do so, you won't be able to change the gateway until all needed dataflows are available from the selected gateway.

## View and manage gateway permissions

### Power BI service gateway permissions

1. Select the setup button in the upper right corner of Power BI service, choose **Manage gateways**, and then select the gateway you want.

   :::image type="content" source="media/using-dataflows-with-on-premiese-data/manage-gateways-power-bi.png" alt-text="Image showing the manage gateways selection in Power BI service.":::

2. To add a user to the gateway, select the **Administrators** table and enter the email address of the user you would like to add as an administrator. Creating or modifying data sources in dataflows requires Admin permissions to the gateway. Admins have full control of the gateway, including adding users, setting permissions, creating connections to all available data sources, and deleting the gateway.

The following conditions apply when adding a user to the gateway:

1. If we detect that an existing data source is available for the selected gateway, the **Username** and **Password** fields will be pre-populated.

   1. If you select **Next** at this point, you're considered to be using that existing data source, and so you only need to have permissions to that data source.

   1. If you edit any of the credential fields and select **Next**, then you're considered to be editing that existing data source, at which point you need to be an admin of the gateway.

2. If we don't detect that an existing data source is available for the selected gateway, the **Username** and **Password** fields will be blank, and if you edit the credential fields and select **Next**, then you're considered to be creating a new data source on the gateway, at which point you need to be an admin of the gateway. 

If you only have data source user permission on the gateway, then 1.b and 2 can't be achieved and the dataflow can't be created. 

### Power Apps gateway permissions

1. In the left navigation pane of [powerapps.com](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc), select **Gateways** and then select the gateway you want.

2. To add a user to a gateway, select **Users**, specify a user or group, and then specify a permission level. Creating new data sources with a gateway in dataflows requires Admin permission on the gateway. Admins have full control of the gateway, including adding users, setting permissions, creating connections to all available data sources, and deleting the gateway.

## View and manage gateway connections

### Power BI service gateway connections

1. Select the setup button in the upper right corner of Power BI service, choose **Manage gateways**, and then select the gateway you want.

2. Perform the action that you want:
   - To view details and edit the settings, select **Gateway Cluster Settings**.
   - To add users as administrators of the gateway, select **Administrators**.
   - To add a data source to the gateway, select **Add Data Source**, enter a data source name and choose the data source type under **Data Source Settings**, and then enter the email address of the person who will use the data source.
   - To delete a gateway, select the ellipsis to the right of the gateway name and then select **Remove**.

### Power Apps gateway connections

1. In the left navigation bar of *powerapps.com*, select **Gateways**, and then choose the gateway you want.

2. Perform the action that you want:
    - To view details, edit the settings, or delete a gateway, select **Connections**, and then select a connection.
    - To share a connection, select **Share** and then add or remove users.

      > [!NOTE]
      > You can only share some types of connections, such as a SQL Server connection. For more information, see [Share canvas-app resources in Power Apps](/powerapps/maker/canvas-apps/share-app-resources).
      >
      > For more information about how to manage a connection, see [Manage canvas-app connections in Power Apps](/powerapps/maker/canvas-apps/add-manage-connections).

## Limitations

There are a few known limitations when using enterprise gateways and dataflows.

- Dataflow refresh might fail if an out-of-date data gateway is used. Starting April 2022, the minimum required data gateway version is February 2021.

- Each dataflow can use only one gateway. As such, all queries should be configured using the same gateway.

- Changing the gateway impacts the entire dataflow.

- If several gateways are needed, the best practice is to build several dataflows (one for each gateway). Then use the compute or table reference capabilities to unify the data.

- Dataflows are only supported using enterprise gateways. Personal gateways won't be available for selection in the drop-down lists and settings
    screens.

- Creating new data sources with a gateway in dataflows is only supported for people with *Admins* permissions. For Power Apps dataflows, only users who have been directly granted Admin access to a gateway are able to create connections using that gateway. Users who inherit Admin access through a group aren't able to create connections.

- Users with *Can Use* or *Can Use + Share* permissions can use existing connections when creating dataflows.

- The following connectors are supported:
  - [DB2](/connectors/db2/)
  - [File System](/connectors/filesystem/)
  - [Apache Impala](/connectors/impala/)
  - [Informix](/connectors/informix/)
  - [MySQL](/connectors/mysql/)
  - [Oracle Database](/connectors/oracle/)
  - [PostgreSQL](/connectors/postgresql/)
  - [SAP ERP](/connectors/saperp/)
  - [SharePoint](/connectors/sharepointonline/)
  - [SQL Server](/connectors/sql/)
  - [Teradata](/connectors/teradata/)
  - [Desktop flows](/connectors/uiflow/)
  - [HTTP with Microsoft Entra ID](/connectors/webcontents/)

## Troubleshooting

When you attempt to use an on-premises data source to publish a dataflow, you might come across the following MashupException error:

```M
AzureDataLakeStorage failed to get the response:
'The underlying connection was closed: An unexpected error occurred on a send.'
```

This error usually occurs because you're attempting to connect to an Azure Data Lake Storage endpoint through a proxy, but you haven't properly configured the proxy settings for the on-premises data gateway. To learn more about how to configure these proxy settings, go to [Configure proxy settings for the on-premises data gateway](/data-integration/gateway/service-gateway-proxy).

For more information about troubleshooting issues with gateways, or configuring the gateway service for your network, go to the [On-premises data gateway documentation](/data-integration/gateway).

If you're experiencing issues with the gateway version you're using, try updating to the latest version as your issue might have been resolved in the latest version. For more information about updating your gateway, go to [Update an on-premises data gateway](/data-integration/gateway/service-gateway-update).

## Next steps

- [Create and use dataflows in Power Apps](/powerapps/maker/data-platform/create-and-use-dataflows)

- [Add data to a table in Microsoft Dataverse by using Power Query](add-data-power-query.md)

- [Connect Azure Data Lake Storage Gen2 for dataflow storage](/power-bi/service-dataflows-connect-azure-data-lake-storage-gen2)
