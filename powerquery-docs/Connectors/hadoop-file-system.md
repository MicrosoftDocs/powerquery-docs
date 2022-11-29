---
title: Power Query Hadoop File (HDFS) connector
description: Provides basic information, prerequisites, and instructions on how to connect to Hadoop File (HDFS), along with native query folding instructions and troubleshooting tips.
author: bezhan-msft
ms.topic: conceptual
ms.date: 11/29/2022
ms.author: bezhan
---

# Hadoop File (HDFS)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Datasets)|
| Authentication Types Supported | Anonymous<br/>Windows<br/>Microsoft account |
| Function Reference Documentation | [HDFS.Contents](/powerquery-m/hdfs-contents)<br/>[HDFS.Files](/powerquery-m/hdfs-files) |

## Capabilities Supported

- Import

## Connect to Hadoop Files (HDFS) from Power Query Desktop

Power Query desktop includes Excel and Power BI as experiences.

To make the connection to **Hadoop File (HDFS)**, follow these steps:

1. From **Get Data**, select the **Other** category, select **Hadoop File (HDFS)**, and then select **Connect**. More information: [where to get data](../where-to-get-data.md)

   :::image type="content" source="./media/hadoop-file-system/get-data.png" alt-text="Screenshot of the Get Data dialog, showing the Hadoop File (HDFS) database selection.":::

1. In the window that appears, enter the server name of your Hadoop File (HDFS) instance.

   :::image type="content" source="./media/hadoop-file-system/enter-server-name.png" alt-text="Screenshot of the Hadoop File (HDFS) dialog, showing the name of the server added.":::

1. Select **OK**.

1. You can either select anonymous access, windows access, or Microsoft account, select the level to apply the settings to, and connect. For more information, see: [Authentication with a data source](../ConnectorAuthentication.md).

   :::image type="content" source="./media/hadoop-file-system/anonymous-access.png" alt-text="Screenshot of the Hadoop File (HDFS) anonymous access dialog.":::

1. In **Navigator**, select one or more files or folders to import and use in your application. Then select either **Load** to load the table, or **Transform Data** to open the Power Query Editor where you can filter and refine the set of data you want to use, and then load that refined set of data.


