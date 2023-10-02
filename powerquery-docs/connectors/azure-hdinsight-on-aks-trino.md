---
title: Power Query Azure HDInsight on AKS Trino connector
description: Provides instructions for using the Azure HDInsight on AKS Trino connector, including descriptions of the optional input parameters, and connector limitations.
author: georgewfisher
ms.topic: conceptual
ms.date: 9/21/2023
ms.author: gefisher
---

# Azure HDInsight on AKS Trino (Beta)

## Summary

|Item|Description|
|-|-|
|Release State|Preview|
|Products|Power BI (Datasets)<br />Power BI (Dataflows)<br />Fabric (Dataflow Gen2)|
|Authentication Types Supported|Organizational account|

## Prerequisites

* An Azure HDInsight on AKS Trino cluster.

## Capabilities supported

* Import
* DirectQuery (Power BI Datasets)
* Advanced options
  * Native SQL statement
  * Session properties
  * Set default catalog/schema

## Connect to Azure HDInsight on AKS Trino from Power Query Desktop

To establish a connection, take the following steps:

1. In the Get Data experience, select Azure from the categories on the left, then select **Azure HDInsight on AKS Trino**. More information: [Where to get data](../where-to-get-data.md)

   :::image type="content" source="media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-get-data.png" alt-text="Screenshot of the Get data dialog with the Azure category and the Azure HDInsight on AKS Trino connector emphasized.":::

3. In the **Azure HDInsight on AKS Trino** dialog that appears, provide the **Azure Trino URL** (Trino cluster URL).

   :::image type="content" source="media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-connect.png" alt-text="Screenshot of the Azure HDInsight on AKS Trino connection page.":::

5. Select the connectivity mode: **Direct Query** (recommended for Trino big data) or **Import**.

   :::image type="content" source="media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-querymode.png" alt-text="Screenshot of the data connection type section of the connection page with DirectQuery selected.":::

6. Select OK.

7. If you're connecting to this Trino cluster for the first time, select **Sign in** to authenticate. Then select **Connect**.

   :::image type="content" source="media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-authentication.png" alt-text="Screenshot of the authentication dialog where you sign in to your organizational account.":::

9. In **Navigator**, expand the catalog and schema to reveal the table you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

   :::image type="content" source="media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-navigator.png" alt-text="Screenshot of the Navigator dialog with the catalog and schema selected, and the data being displayed." lightbox="media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-navigator.png":::

## Connect to Azure HDInsight on AKS Trino from Power Query Online

To connect to an Azure HDInsight on AKS Trino cluster from Power Query Online, take the following steps:

1. In the Get Data experience, search for and select **Azure HDInsight on AKS Trino**. More information: [Where to get data](../where-to-get-data.md)

   :::image type="content" source="media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-online-get-data.png" alt-text="Screenshot of the Choose data source dialog with a search for Trino, and the Azure HDInsight on AKS Trino connector displayed.":::

3. In the options that appear, provide the **Azure Trino URL**.

:::image type="content" source="media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-online-connect.png" alt-text="Screenshot of the connection dialog for Azure HDInsight on AKS Trino.":::

5. If necessary, select the name of your on-premises data gateway.

6. To configure the connection options, select **Advanced options**. More information: [Connect using advanced options](#connect-using-advanced-options)

7. If you're connecting to this Trino cluster for the first time select **Sign in**.

8. Select **Next** to continue.

9. In **Navigator**, select the table you require, and then select **Transform data**.

   :::image type="content" source="media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-online-navigator.png" alt-text="Screenshot of the online navigator with the catlog and schema selected, and the data being displayed." lightbox="media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-online-navigator.png":::

## Connect using advanced options

Both Power Query Desktop and Power Query Online provide a set of advanced options that you can add to the query if needed. The following table lists all of the advanced options you can set in Power Query Desktop and Power Query Online.

|Advanced option|Description|
|-|-|
|SQL statement|For information, go to [Import data from a database using native database query](../native-database-query.md).|
|Session properties|Allows Trino session properties to be passed with the connection to the Trino cluster. Session property should specify key value pairs separated by a colon, and each pair separated by a comma. Example: `distributed_sort:true,colocated_join:false`|
|Default catalog/schema|Providing a catalog and schema sets the context of the connection to a specific Trino catalog and schema.|

Once you've selected the advanced options you require, select **OK** in Power Query Desktop or **Next** in Power Query Online to connect to the Trino cluster.

## Known issues and limitations

The following sections describe any known issues or limitations currently associated with this connector. 

### Types Support

The Azure HDInsight on AKS Trino supports the following types. Other types, such as **uuid**, **P4HyperLogLog** need to be transformed or cast to be usable with the connector.

* **bigint**
* **integer**
* **smallint**
* **tinyint**
* **real**
* **double**
* **decimal**
* **boolean**
* **char**
* **varchar**
* **date**
* **timestamp**
* **array**
* **map**
* **varbinary**
