---
title: Power Query Azure HDInsight on AKS Trino connector
description: Provides instructions for using the Azure HDInsight on AKS Trino connector, including descriptions of the optional input parameters, and connector limitations.
author: gefisher-msft
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

For general steps describing to access Power Query connections see: [Where to get data](../where-to-get-data.md).

To establish a connection, take the following steps:

1. In the Get Data experience, select Azure from the categories on the left, then select **Azure HDInsight on AKS Trino**.

   ![Choose the Azure HDInsight on AKS Trino.](media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-get-data.png)

2. In the **Azure HDInsight on AKS Trino** dialog that appears, provide the **Azure Trino URL** (Trino cluster URL).

   ![Connect to Azure HDInsight on AKS Trino](media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-connect.png)

3. Select the connectivity mode: **Direct Query** (recommended for Trino big data) or **Import**.

   ![Select Query Mode to Azure HDInsight on AKS Trino](media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-querymode.png)

4. Select OK.

5. If it's the first time you're connecting to this Trino cluster, select **Sign in** to authenticate. Then select **Connect**.

   ![Authentication to Azure HDInsight on AKS Trino](media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-authentication.png)

6. In **Navigator**, expand the catalog and schema to reveal the table you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

   ![Navigate to the catalog and schema](media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-navigator.png)

## Connect to Azure HDInsight on AKS Trino from Power Query Online

For general steps describing to access Power Query connections see: [Where to get data](../where-to-get-data.md).

To connect to an Azure HDInsight on AKS Trino cluster from Power Query Online, take the following steps:

1. In the Get Data experience, search for and select **Azure HDInsight on AKS Trino**.

   ![Select the **Azure HDInsight on AKS Trino** option in the connector selection.](media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-online-get-data.png)

2. In the options that appear, provide the **Azure Trino URL**.

   ![Enter the Azure HDInsight on AKS TRino online connection.](media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-online-connect.png)

3. If necessary, select the name of your on-premises data gateway.

4. To configure the connection options, select **Advanced options**. More information: [Connect using advanced options](#connect-using-advanced-options)

5. If you're connecting to this Trino cluster for the first time select **Sign in**.

6. Select **Next** to continue.

7. In **Navigator**, select the table you require, and then select **Transform data**.

   ![Power Query Online Navigator showing the Human Resources employee data.](./media/azure-hdinsight-on-aks-trino/azure-hdinsight-on-aks-trino-online-navigator.png)


## Connect using advanced options

Both Power Query Desktop and Power Query Online provide a set of advanced options that you can add to the query if needed. The following table lists all of the advanced options you can set in Power Query Desktop and Power Query Online.

|Advanced option|Description|
|-|-|
|SQL statement|For information, go to [Import data from a database using native database query](../native-database-query.md).|
|Session properties|Allows Trino session properties to be passed with the connection to the Trino cluster. Session property should specify key value pairs separated by a colon, and each pair separated by a comma. Example: `distributed_sort:true,colocated_join:false`|
|Default catalog/schema|Providing a catalog and schema sets the context of the connection to a specific Trino catalog and schema.|

Once you've selected the advanced options you require, select OK in Power Query Desktop or Next in Power Query Online to connect to the Trino cluster.

## Known issues and limitations

### Types Support

The Azure HDInsight on AKS Trino supports the following types. Other types, such as **uuid**, **P4HyperLogLog** needs to be transformed or cast to be usable with the connector.

* bigint
* integer
* smallint
* tinyint
* real
* double
* decimal
* boolean
* char
* varchar
* date
* timestamp
* array
* map
* varbinary
