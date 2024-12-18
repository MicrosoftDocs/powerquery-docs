---
title: Privacy levels in Power Query
description: Describes what privacy levels and privacy level options are and how they're used in Power Query Online and Power Query Desktop.
author: ptyx507x
ms.author: miescobar
ms.topic: conceptual
ms.date: 6/26/2024
ms.subservice: transform-data
---

# Privacy levels

Privacy levels specify isolation levels that determine the degree to which one data source is isolated from other data sources. Although a restrictive isolation level blocks information from being exchanged between data sources, it can reduce functionality and performance.

Privacy levels are critical to configure correctly so that only authorized users can view the sensitive data. Furthermore, data sources must also be isolated from other data sources so that combining data has no undesirable data transfer impact. Incorrectly setting privacy levels might lead to sensitive data being leaked outside of a trusted environment. Make sure you understand and set privacy to the appropriate level for your needs.

The following table showcases the available privacy levels.

| Setting | Description | Example data sources |
| --- | --- | --- |
| **None** |There are no privacy settings. Be careful setting this option. Make sure that privacy regulations are otherwise maintained. | Use this privacy setting for data sources in a controlled development environment for testing and performance reasons.|
| **Private** |Data sources set to **Private** contain sensitive or confidential information. Visibility can be restricted to authorized users. Data from a private data source can't fold in to other data sources, including other private data sources. |Facebook data, a text file containing stock awards, or a workbook containing employee review information. |
| **Organizational** |Data sources set to **Organizational** can fold in to private and other organizational data sources. They can't fold in to public data sources. Visibility is set to a trusted group.  |A Microsoft Word document on an intranet SharePoint site with permissions enabled for a trusted group. |
| **Public** |Files, internet data sources, and workbook data can be set to **Public**. Data can fold in to other data sources. Visibility is available to everyone. |Free data from the Azure Marketplace, data from a Wikipedia page, or a local file containing data copied from a public web page. |

> [!IMPORTANT]
> Configure a data source containing highly sensitive or confidential data as **Private**.

## Preventing accidental data transfer

Privacy Levels might prevent you from inadvertently combining data from multiple data sources, which are set to different levels of privacy, such as private and organizational. Depending on the query, you could accidentally send data from the private data source to another data source that might be outside of a trusted scope. Power Query analyzes each data source and classifies it by the defined level of privacy: **Public**, **Organizational**, and **Private**. This analysis ensures data isn't combined if there's undesirable data transfer.

This process of data protection can also occur when a query uses query folding. It’s often better to run a database query on a server to take advantage of greater performance and capacity. However, Power Query blocks a query if there's a potential for data to be compromised. For example, a merge is defined between a workbook table and a SQL Server table. The workbook data privacy is set to **Privacy**, but the SQL Server data is set to **Organizational**. Because **Privacy** is more restrictive than **Organizational**, Power Query blocks the information exchange between the data sources. Query folding occurs behind the scenes, so it might surprise you when a blocking error occurs.

## Privacy levels dialog

When you combine data from multiple sources, if the privacy level isn't set for one of them or the privacy levels are different, a warning is raised informing you that data privacy information is required. You can select the button to launch the **Privacy levels** dialog. In this dialog, you can set the privacy levels for the sources that don't have a privacy level yet.

:::image type="content" source="media/privacy-levels/sample-privacy-levels-dialog.png" alt-text="Screenshot of the privacy levels dialog showing a single data source without a properly set privacy level." lightbox="media/privacy-levels/sample-privacy-levels-dialog.png":::

## Setting privacy levels in Power Query Online

Power Query Online provides several ways to set privacy levels, in both the Power Query get data experience, Power Query manage connections option, and in Power BI service cloud data sources.

### Edit privacy levels in Power Query Online

To configure the privacy level in the Power Query Online get data experience:

1. Select the connector that you want to use to access your data in the Power Query get data experience. For example, select the **OData** or **OData Feed** option. Different apps have different ways of getting to the Power Query Online get data experience. For more information, go to [Where to get data](where-to-get-data.md).
1. In the **Get data** dialog for your connector, fill in the connection settings and connection credentials for your connector. These settings and credentials vary depending on the connector you're using. At the bottom of the connection credentials, select the privacy level you require for your connection.

   :::image type="content" source="media/privacy-levels/online-get-data-privacy-level.png" alt-text="Screenshot of the sample OData connect to data source dialog with the privacy levels emphasized.":::

For Power BI service cloud data sources, you can also configure the privacy level for either new connections or existing connections. To set the privacy level for a new connection:

1. Select the Power BI service settings icon, and then select **Manage connections and gateways**.
1. In the **Data (Preview)** page, select the **Connections** tab, and then select **New**.
1. In the **New connection** pane, select **Cloud**.
1. Fill in the **Connection name** and select a **Connection type**.
1. After filling in or selecting the rest of the connection settings, select the privacy level in the **General** section.
1. Select **Create** to create the new connection.

To set the privacy level for an existing connection:

1. Select the Power BI service settings icon, and then select **Manage connections and gateways**.
1. In the **Data (Preview)** page, select the **Connections** tab.
1. Select a connection from the list of existing connections.
1. Select the ellipsis next to the connection name, then select **Settings**.
1. In the **Settings** pane, under **General**, select the privacy level.

   > [!NOTE]
   >Once you change the privacy level, you're required to reenter your credentials before the change in privacy level can be saved. The **Save** button is grayed out until you've finished reentering your credentials.

1. Select **Save** to save the new privacy level

For more information, go to [Create and share cloud data sources in the Power BI service](/power-bi/connect-data/service-create-share-cloud-data-sources).

You can also set a connection's privacy level using the **Manage connections** option under the **Home** tab in Power Query Online. The **Manage connections** dialog is one centralized way in your Power Query project to manage the connections that are being referenced by your project.

To set the privacy level using the **Manage connections** option:

1. Select **Manage connections** in the **Home** tab of the online Power Query editor.
1. Select either **Current project** or **Global permissions**. For more information about the differences between the current project and global permissions, go to [Manage connections](manage-connections.md).
1. Select a connection.
1. Select the **Edit** icon next to the name of the connection.
1. Select the privacy level you want to use.
1. Select **Update**.

   :::image type="content" source="media/privacy-levels/manage-connections-update.png" alt-text="Screenshot of the edit icon and the privacy level selection emphasized.":::

For more information about Power Query manage connections, go to [Manage connections](manage-connections.md).

## Setting privacy levels in Power Query Desktop

Power Query Desktop also provides several ways to set the privacy levels, either globally or for individual files or Excel workbooks.

> [!NOTE]
> Excel on the Mac doesn't currently support privacy levels.

### Edit global privacy levels

Global privacy levels refers to the connections that you have already made to data sources. Editing these privacy level settings is accomplished from the app that created the connection, such a Power BI Desktop or Excel.

To configure global privacy levels in the data source settings:

1. In your desktop app, select **Data source settings**. For example, in Excel, select the **Data** tab, then select **Get Data** > **Data Source Settings**. In Power BI Desktop, select the **File** tab, then select **Options and settings** > **Data source settings**.
1. Select a data source from the list, and then select **Edit Permissions**.
1. Under **Privacy Levels**, select a privacy level.
1. Select **OK**, and then select **Close**.

:::image type="content" source="media/privacy-levels/desktop-privacy-levels.png" alt-text="Screenshot of data source settings with the edit permissions dialog open and the privacy levels displayed.":::

### Edit file level privacy levels

File level privacy levels refers to the current connection that you have to a data source. For example, if you have an SQL database currently loaded in Power Query Desktop, changes to the privacy level occur on this file. Editing these privacy level settings is accomplished from the Power Query editor.

To configure privacy options for a file in Power Query Desktop:

1. In the **Home** tab, select **Data source settings**.
1. Select **Edit Permissions**.
1. Under **Privacy Levels**, select a privacy level.
1. Select **OK**.

:::image type="content" source="media/privacy-levels/desktop-file-privacy-levels.png" alt-text="Screenshot of the options dialog showing the file level privacy level settings.":::

## Setting the privacy level options

In addition to the privacy level settings, you can also set the privacy level options in your apps to ignore the privacy levels when combining data. This option is sometimes referred to as *Fast Combine*. This option isn't enabled by default. The privacy level options can be set for global permissions, or for individual files or workbooks.

> [!CAUTION]
> Enabling Fast Combine by selecting **Ignore the Privacy levels and potentially improve performance** could expose sensitive or confidential data to an unauthorized person. Don't enable Fast Combine unless you are confident that the data source doesn't contain sensitive or confidential data.

The following table describes privacy level options for global permissions:

| Setting | Description |
| --- | --- |
| **Always combine data according to your Privacy Level settings for each source** | When selected, data is combined according to your privacy levels setting. Merging data across Privacy isolation zones results in some data buffering. |
| **Combine data according to each file's Privacy Level settings** (Default) | When selected, privacy level settings are used to determine the level of isolation between data sources when combining data. This setting might decrease performance and functionality. Merging data across privacy isolation zones results in some data buffering. |
| **Always ignore Privacy Level settings** | When selected, data is combined by ignoring your privacy levels setting. This setting can improve performance and functionality, but Power Query can't ensure the privacy of data merged into the file or workbook. |

The following table describes privacy level options for a file or workbook:

| Setting | Description |
| --- | --- |
| **Combine data according to your Privacy Level settings for each source** (Default) | When selected, data is combined according to your privacy levels setting. Merging data across Privacy isolation zones results in some data buffering.|
| **Ignore the Privacy Levels and potentially improve performance** | When selected, data is combined ignoring your privacy level setting. Ignoring the privacy setting can reveal sensitive or confidential data to an unauthorized user. This setting might improve performance and functionality.  |

> [!CAUTION]
>
> - **Ignore the Privacy Levels and potentially improve performance** doesn't work for semantic models. Reports created in Power BI Desktop with this setting and published to the Power BI service don't adhere to the setting. However, the privacy levels are available on the personal gateway.
> - Power Query can't ensure the privacy of data merged into another Power BI Desktop file.

### Set the privacy level options in Power BI Desktop

To set either the global or file level privacy level options in Power BI Desktop:

1. From the **File** tab, select **Options and settings**.
1. Select **Options**.
1. In the **Options** dialog, select **Privacy** under the **Global** section to set the global privacy level option or select **Privacy** under the **Current file** section to set the current file's privacy level option.
1. Select **OK**.

### Set the privacy level options in Excel

To set either the global or workbook level privacy level options in Excel:

1. From the **Data** tab, select **Get Data** > **Query Options**.
1. In the **Query Options** dialog, select **Privacy** under the **Global** section to set the global privacy level option or select **Privacy** under the **Current workbook** section to set the current workbook's privacy level option.
1. Select **OK**.

### Set the privacy level options in Power Query Desktop

In addition to setting the global or file/workbook level privacy level options from the app's options selection, you can also set the privacy level options from inside Power Query Desktop.

If you opened Power Query Desktop from Power BI Desktop:

1. From the **File** tab, select **Options and settings**.
1. Select **Options**.
1. In the **Options** dialog, select **Privacy** under the **Global** section to set the global privacy level option or select **Privacy** under the **Current file** section to set the current file's privacy level option.
1. Select **OK**.

If you opened Power Query Desktop from Excel:

1. From the **File** tab, select **Options and settings**.
1. Select **Query Options**.
1. In the **Query Options** dialog, select **Privacy** under the **Global** section to set the global privacy level option or select **Privacy** under the **Current workbook** section to set the current workbook's privacy level option.
1. Select **OK**.

### Set the privacy level options in Power Query Online

In Power Query Online, the privacy level option for the project is, by default, set to combine data according to your privacy level settings for each source. However, you can override this setting in the Power Query Online options.

To allow combining data from multiple sources in Power Query Online:

1. From the **Home** tab, select **Options**.
1. In the **Options** dialog, under **Project**, select **Privacy**.
1. Select **Allow combining data from multiple sources. This could expose sensitive or confidential data to an unauthorized person**.
1. Select **OK**.

## Related content

* [Behind the scenes of the Data Privacy Firewall](data-privacy-firewall.md)
* [Manage connections](manage-connections.md)
