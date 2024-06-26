---
title: "Manage connections (Preview)"
description: Overview of the manage connections feature in Power Query Online that allows you to unlink and edit connections from your project.
author: ptyx507
ms.date: 6/26/2024
ms.author: miescobar
---

# Manage connections (Preview)

> [!NOTE]
>This feature is currently available only in Power Query Online and is in public preview.

With Power Query, you can [connect to a multitude of data sources](connectors/index.md). When you connect to a data source, you fundamentally create a connection to it. This connection consists of your data source, credentials, and more information, such as privacy levels and optional parameters for each data source. The **Manage connections** dialog is one centralized way in your Power Query project to manage the connections that are being referenced by your project.

The entry to the **Manage connections** dialog is available in the Power Query **Home tab** in the ribbon's **Data sources** group.

:::image type="content" source="media/manage-connections/entry-point.png" alt-text="Screenshot of the Manage connections button in the Data sources group of the Power Query ribbon Home tab.":::

The dialog displays two views:

* **Current project**: displays the connections within the context of the current Dataflow.
* **Global permissions**: showcases all connections available to the authenticated user from the credential storage.

## Current project

The current project view displays a list of all connections being referenced in your Power Query project. It also notes the ability to add, unlink, and edit from any of the connections in your project.

:::image type="content" source="media/manage-connections/manage-connections-dialog.png" alt-text="Screenshot of the Manage connections dialog showcasing multiple connections on its page." lightbox="media/manage-connections/manage-connections-dialog.png":::

### Add a connection in current project

If your data source currently doesn't have a connection, you can add a connection by selecting the plus icon next to the unlinked connector.

:::image type="content" source="media/manage-connections/add-connection-icon.png" alt-text="Screenshot of the Manage connections dialog emphasizing the icon to add a connection." lightbox="media/manage-connections/add-connection-icon.png":::

Selecting the plus icon scans your whole dataflow to find the appropriate data sources that it has. It then brings up a connection dialog that you can use to link to the data source.

:::image type="content" source="media/manage-connections/link-data-source.png" alt-text="Screenshot of the Connect to data source dialog where you add the necessary information to make the connection.":::

### Unlink a connection in current project

Right next to the name of connection, and before the **Source type** column, there's an icon to unlink the connection.

When you unlink a connection, you're simply removing the reference of the connection from your project. Unlinking means that the definition of the connection isn't removed from the back-end, but it can't be used in your project.

:::image type="content" source="media/manage-connections/disconnect-icon.png" alt-text="Screenshot emphasizing the unlink icon next to a connection in the Manage Connections dialog." lightbox="media/manage-connections/disconnect-icon.png":::

A new prompt then asks you to confirm that you want to unlink the connection.

:::image type="content" source="media/manage-connections/confirmation-prompt.png" alt-text="Screenshot of the prompt asking you to confirm the unlink action.":::

> [!NOTE]
>If you want to delete a connection from within a specific product integration, such as Microsoft Power BI or Microsoft Fabric, be sure to check out the documentation for each product on how a centralized connections portal can be used or try using the [Global permissions](#global-permissions) view.

### Edit a connection in current project

Right next to the name of connection, and before the disconnect icon, there's an icon to edit the connection.

:::image type="content" source="media/manage-connections/edit-connection-button.png" alt-text="Screenshot of the Manage Connections dialog with the icons for editing the connection emphasized." lightbox="media/manage-connections/edit-connection-button.png":::

The edit functionality allows you to change the following values:

* **Data gateway**: If your data source uses a data gateway, you can modify the gateway using the dropdown list from this field.
* **Authentication kind & credentials**: Depending on the connector, you're presented with multiple authentication kind options that are available to establish a connection, and fields where you enter your credentials.
* **Privacy level**: Specifies isolation levels that determine the degree to which one data source is isolated from other data sources.

:::image type="content" source="media/manage-connections/edit-connection-dialog.png" alt-text="Screenshot of the edit connections dialog for the selected OData connection.":::

## Global permissions

The global permissions view displays a list of every single connection that's available to you. This list is similar to the list of connections available in Power BI service and Fabric under the **Manage connections and gateways** in the **Settings** menu. Global permissions also note the ability to edit and delete from any of the connections available to you.

:::image type="content" source="media/manage-connections/global-permissions-view.png" alt-text="Screenshot of the Manage Connections dialog with the global permissions view selected." lightbox="media/manage-connections/global-permissions-view.png":::

### Edit a connection in global permissions

> [!CAUTION]
> Editing global permissions are made in much the same way as editing the current project. However, be aware that making changes to the global permissions affect all of the connections of the particular type you are editing instead of just the connection in the current project.

Right next to the name of the connection, and before the delete icon, there's an icon to edit the connection.

:::image type="content" source="media/manage-connections/global-edit-connection-button.png" alt-text="Screenshot of the Manage Connections dialog with the global permissions edit connection icons emphasized." lightbox="media/manage-connections/global-edit-connection-button.png":::

The edit functionality allows you to change the following values:

* **Data gateway**: If your data source uses a data gateway, you can modify the gateway using the dropdown list from this field.
* **Authentication kind & credentials**: Depending on the connector, you're presented with multiple authentication kind options that are available to establish a connection, and fields where you enter your credentials.
* **Privacy level**: Specifies isolation levels that determine the degree to which one data source is isolated from other data sources.

:::image type="content" source="media/manage-connections/global-edit-connection-dialog.png" alt-text="Screenshot of the global edit connections dialog for the selected OData connection.":::

### Delete a connection in global permissions

> [!WARNING]
> Be aware that deleting a connection in global permissions deletes all of the connections associated with the individual connection you are deleting instead of just the connection in the current project. Once the connection is deleted, you can't undo the deletion. Be sure to determine the impact in other projects that rely on this connection before deleting a connection in global permissions.

Next to the name of the connection, after the edit icon, there's an icon to delete the connection.

:::image type="content" source="media/manage-connections/delete-connection-button.png" alt-text="Screenshot of the Manage Connections dialog with the global permissions delete connection icons emphasized." lightbox="media/manage-connections/delete-connection-button.png":::

When you select the delete icon next to the connection name, you're asked to verify whether you want the connection deleted. If you do, select **Delete**. Once the connection is deleted, it can't be undone.

:::image type="content" source="media/manage-connections/delete-connection-dialog.png" alt-text="Screenshot of the dialog for deleting a connection for the selected OData connection.":::

## More Resources

* [Get Data experience in Power Query](get-data-experience.md)
* [Connectors available in Power Query](connectors/index.md)
