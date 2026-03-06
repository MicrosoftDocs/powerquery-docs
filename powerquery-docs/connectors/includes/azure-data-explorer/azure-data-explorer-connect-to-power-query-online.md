
To connect to Azure Data Explorer from Power Query Online:

1. Select the **Azure Data Explorer (Kusto)** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../../where-to-get-data.md).

   :::image type="content" source="../../media/azure-data-explorer/get-data-online.png" alt-text="Screenshot of the get data window with Azure Data Explorer emphasized.":::

2. In **Connect to data source**, provide the name of your Azure Data Explorer cluster. For this example, use `https://help.kusto.windows.net` to access the sample help cluster. For other clusters, the URL is in the form https://_\<ClusterName>_._\<Region>_.kusto.windows.net.

    You can also select a database hosted on the cluster you're connecting to, and one of the tables in the database, or a query like `StormEvents | take 1000`.

   :::image type="content" source="../../media/azure-data-explorer/sign-in-online.png" alt-text="Screenshot of the Choose data source page for Azure Data Explorer (Kusto), with the URL for the cluster entered.":::

3. If you want to use any advance options, select the option and enter the data to use with that option. More information: [Connect using advanced options](#connect-using-advanced-options)

4. If needed, select the on-premises data gateway in **Data gateway**.

5. If you don't already have a connection to the cluster, select **Sign in**. Sign in with an organizational account.

6. After you successfully sign in, select **Next**.

7. In the **Choose data** page, select the database information you want, then either select **Transform Data** or **Next** to continue transforming the data in the Power Query editor. In this example, StormEvents was selected in the Samples database.

   :::image type="content" source="../../media/azure-data-explorer/navigator-online.png" alt-text="Screenshot of the Choose data page, containing the data from StormEvents in the Samples database." lightbox="../../media/azure-data-explorer/navigator-online.png":::

