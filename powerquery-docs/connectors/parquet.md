---
title: Power Query Parquet connector
description: Includes basic information and prerequisites, instructions on how to connect using the Parquet connector, and information about advanced connection options.
author: DougKlopfenstein

ms.topic: conceptual
ms.date: 3/8/2023
ms.author: bezhan
LocalizationGroup: reference
---

# Parquet

## Summary

| Item | Description |
| ------- | ------------|
|Release state | General Availability |
| Products supported | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights |
| Authentication types supported| Anonymous<br/>Account key<br/>Shared access signature (SAS)<br/>Windows |
| Function reference docs | &mdash; |

> [!NOTE]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

An online account with a Parquet database file.

## Capabilities supported

* Import
  * Basic
  * Advanced

## Connect to the Parquet file from Power Query Desktop

To connect to a Parquet file from Power Query Desktop, take the following steps:

1. Select the **Parquet** option in the connector selection. More information: [Where to get data](../where-to-get-data.md)

2. In **Parquet**, provide the URL for the location of the Parquet file. Enter a path and filename if you are connecting to a local file. You can also select **Advanced** and build the URL from parts. In the example used in this article, the Parquet file is located in Azure Blob Storage.

   :::image type="content" source="./media/parquet/sign-in.png" alt-text="Screenshot with Basic selected and the location of the database in the URL text box.":::

3. Select **OK**.

4. If this is the first time you're connecting to this database, select the authentication type, input your credentials, and select the level to apply the authentication settings to. Then select **Connect**.

   :::image type="content" source="./media/parquet/enter-credentials.png" alt-text="Screenshot with the Account key authentication method selected.":::

   From Power Query Desktop, select one of the following authentication methods:

   * Anonymous
   * Account key
   * Shared access signature (SAS)

   For more information about authentication methods, go to [Authentication with a data source](../connectorauthentication.md).

5. In **Navigator**, select the database information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

   :::image type="content" source="./media/parquet/navigator-desktop.png" alt-text="Screenshot with Power Query Desktop Navigator showing the example data.":::

## Connect to a Parquet file from Power Query Online

To connect to a Parquet file from Power Query Online, take the following steps:

1. Select the **Parquet** option in the connector selection.

2. In **Parquet**, provide the name of the server and database. Or enter a path and filename if you are connecting to a local file.

   :::image type="content" source="./media/parquet/service-sign-in.png" alt-text="Screenshot of the Connect to data source window for the Parquet file connection.":::

3. If you are connecting to a local file, select the name of your on-premises data gateway. If the data is online, you don't need to provide an on-premises data gateway.

4. If this is the first time you're connecting to this database, select the authentication kind and input your credentials. From Power Query Online, select one of the following authentication kinds:

   * Anonymous (online)
   * Account key (online)
   * Windows (local file)

5. Select **Next** to continue to the Power Query editor where you can then begin to transform your data.

## Known issues and limitations

The Power Query Parquet connector only supports reading files from the local filesystem and Azure Data Lake Storage Gen2.

It might be possible to read small files from other sources. However, you are likely to get the following error if the file is too large:

`Error: Parquet.Document cannot be used with streamed binary values.`

In this case, you are basically copying the file into your computer’s RAM, so the limits are whatever limits you have on that particular resource. Most real-world uses of Parquet exceed such limits.

A workaround for this limitation would be to buffer the Parquet file in memory using the [Binary.Buffer](/powerquery-m/binary-buffer) function to buffer the file in memory. However, performance may suffer from using this workaround.
