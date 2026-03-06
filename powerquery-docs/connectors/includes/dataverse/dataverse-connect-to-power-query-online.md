
To connect to Dataverse from Power Query Online:

1. Select the **Dataverse** option in the **Choose data source** page. More information: [Where to get data](../../../../where-to-get-data.md)

2. In the **Connect to data source** page, leave the server URL address blank. Leaving the address blank lists all of the available environments you have permission to use in the Power Query Navigator window.

   :::image type="content" source="../../media/dataverse/enter-url-online.png" alt-text="Enter the server URL.":::

   >[!Note]
   >If you need to use port 5558 to access your data, you'll need to load a specific environment with port 5558 appended at the end in the server URL address. In this case, go to [Finding your Dataverse environment URL](#finding-your-dataverse-environment-url) for instructions on obtaining the correct server URL address.

3. If necessary, enter an on-premises data gateway if you're going to be using on-premises data. For example, if you're going to combine data from Dataverse and an on-premises SQL Server database.

4. Sign in to your organizational account.

5. When you've successfully signed in, select **Next**.

6. In the navigation page, select the data you require, and then select **Transform Data**.

   :::image type="content" source="../../media/dataverse/navigator-online.png" alt-text="Navigation page open with the Application User data selected.":::

