---
title: Power Query Azure HDInsight (HDFS) connector
description: Provides basic information, prerequisites, and instructions on how to connect to Azure HDInsight, along with native query folding instructions and troubleshooting tips.
author: DougKlopfenstein
ms.topic: concept-article
ms.date: 2/1/2024
ms.author: dougklo
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Azure HDInsight (HDFS)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Customer Insights <br/>Analysis Services |
| Authentication Types Supported | Anonymous<br/>Account Key |
| Function Reference Documentation | [Hdfs.Contents](/powerquery-m/hdfs-contents)<br/>[Hdfs.Files](/powerquery-m/hdfs-files) |

## Capabilities Supported

- Import

## Connect to Azure HDInsight from Power Query Desktop

Power Query desktop includes Excel, Power BI, and Analysis Services as experiences.

To make the connection to an **Azure HDInsight** account, follow these steps:

1. Select **Azure HDInsight (HDFS)** in the get data experience. The get data experience in Power Query Desktop varies between apps. For more information about the Power Query Desktop get data experience for your app, go to [Where to get data](../where-to-get-data.md).

1. In the window that appears, enter the name of the **storage account** associated with your HDInsight account. If you don't know the name of your storage account, you can find it using the steps in the [section below](#copy-your-account-key-for-azure-hdinsight).

   :::image type="content" source="./media/azure-hdinsight/enter-account-name.png" alt-text="Screenshot of the Azure HDInsight dialog, showing the name of the storage account added.":::

1. Select **OK**.

1. You can either select anonymous access, if your [storage account is configured for anonymous access](/azure/storage/blobs/anonymous-read-access-configure), or you can select account key.

1. If you select anonymous access, there's nothing to enter, so select **Connect**.

   :::image type="content" source="./media/azure-hdinsight/anonymous-access.png" alt-text="Screenshot of the Azure HDInsight anonymous access page, showing the connect button highlighted.":::

1. If you select account key, add the [storage account key](#copy-your-account-key-for-azure-hdinsight) for the Azure Storage account associated with your HDInsight account and select **Connect**.

   :::image type="content" source="./media/azure-hdinsight/enter-account-key.png" alt-text="Screenshot of the Azure HDInsight dialog, showing an account key entered in the space.":::

1. In **Navigator**, select one or more files or folders to import and use in your application. Then select either **Load** to load the table, or **Transform Data** to open the Power Query Editor where you can filter and refine the set of data you want to use, and then load that refined set of data.

   :::image type="content" source="./media/azure-hdinsight/select-data.png" alt-text="Screenshot of the Azure HDInsight navigator, showing a folder selected.":::

## Connect to Azure HDInsight from Power Query Online

Power Query Online includes Power BI (Dataflows) and Customer Insights (Dataflows) as experiences.

To make the connection, take the following steps:

1. Select the **Azure HDInsight (HDFS)** option in the get data experience.  Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../where-to-get-data.md).

   :::image type="content" source="./media/azure-hdinsight/online-select-azure-hdinsight.png" alt-text="Screenshot of the Azure HDInsight icon in Power Query online.":::

1. In the **Azure HDInsight** dialog that appears, enter the name of the **storage account** associated with your HDInsight account. If you don't know the name of your storage account, you can find it using the steps in the [section below](#copy-your-account-key-for-azure-hdinsight).

1. You can select an existing a connection or a gateway. You can also either select anonymous access, if your [storage account is configured for anonymous access](/azure/storage/blobs/anonymous-read-access-configure), or you can select account key.

1. If you select anonymous access, there's nothing to enter, so select **Next**.

1. If you select account key, add the [storage account key](#copy-your-account-key-for-azure-hdinsight) for the Azure Storage account associated with your HDInsight account and select **Next**.

   :::image type="content" source="./media/azure-hdinsight/connect-account-key.png" alt-text="Screenshot of the Azure HDInsight page in Power Query online with account key selected and values provided.":::

1. Select one or multiple tables to import and use, then select **Transform Data** to transform data in the Power Query editor.

## Copy your account key for Azure HDInsight

Your Azure HDInsight account key is just the Azure Storage account key for the blob storage associated with your Azure HDInsight account. To retrieve your account key, follow these steps:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Locate your Azure HDInsight account and select **Storage accounts** in the left menu. Then select your storage account.

   :::image type="content" source="./media/azure-hdinsight/find-hdi-storage-account.png" alt-text="Screenshot of the HDInsight account in the Azure portal, with the Storage accounts menu highlighted and a storage account selected.":::

1. In the storage account menu pane, under **Security + networking**, select **Access keys**.

   :::image type="content" source="./media/azure-hdinsight/get-access-key.png" alt-text="Screenshot of the example storage account in Azure, with Security + networking and Access keys emphasized." lightbox="./media/azure-hdinsight/get-access-key.png":::

1. In the **key1** section, locate the **Key** value. Select **Show** next to the key value.

1. Select the **Copy to clipboard** icon to copy the **Key** value.
