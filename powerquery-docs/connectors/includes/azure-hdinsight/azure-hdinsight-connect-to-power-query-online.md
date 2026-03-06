
Power Query Online includes Power BI (Dataflows) and Customer Insights (Dataflows) as experiences.

To make the connection, take the following steps:

1. Select the **Azure HDInsight (HDFS)** option in the get data experience.  Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../../../../where-to-get-data.md).

   :::image type="content" source="../../media/azure-hdinsight/online-select-azure-hdinsight.png" alt-text="Screenshot of the Azure HDInsight icon in Power Query online.":::

1. In the **Azure HDInsight** dialog that appears, enter the name of the **storage account** associated with your HDInsight account. If you don't know the name of your storage account, you can find it using the steps in the [section below](#copy-your-account-key-for-azure-hdinsight).

1. You can select an existing a connection or a gateway. You can also either select anonymous access, if your [storage account is configured for anonymous access](/azure/storage/blobs/anonymous-read-access-configure), or you can select account key.

1. If you select anonymous access, there's nothing to enter, so select **Next**.

1. If you select account key, add the [storage account key](#copy-your-account-key-for-azure-hdinsight) for the Azure Storage account associated with your HDInsight account and select **Next**.

   :::image type="content" source="../../media/azure-hdinsight/connect-account-key.png" alt-text="Screenshot of the Azure HDInsight page in Power Query online with account key selected and values provided.":::

1. Select one or multiple tables to import and use, then select **Transform Data** to transform data in the Power Query editor.

