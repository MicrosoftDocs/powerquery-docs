
To connect to Databricks from Power Query Online, take the following steps:

1. Select the **Azure Databricks** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../../../where-to-get-data.md).

    Shortlist the available Databricks connectors with the search box. Use the **Azure Databricks** connector for all Databricks SQL Warehouse data unless you've been instructed otherwise by your Databricks rep.  

    :::image type="content" source="../../media/databricksazure/filtered-connectors.png" alt-text="Image of the Databricks connectors.":::

2. Enter the **Server hostname** and **HTTP Path** for your Databricks SQL Warehouse. Refer to [Configure the Databricks ODBC and JDBC drivers](/azure/databricks/integrations/bi/jdbc-odbc-bi) for instructions to look up your "Server hostname" and "HTTP Path". You can optionally supply a default catalog and/or database under **Advanced options**.

    :::image type="content" source="../../media/databricksazure/azconnect-setting-cred.png" alt-text="Connection Settings and Credentials.":::

3. Provide your credentials to authenticate with your Databricks SQL Warehouse. There are three options for credentials:

    * Username / Password (useable for AWS or GCP). This option isn't available if your organization/account uses 2FA/MFA.
    * Account Key (useable for AWS, Azure or GCP). Refer to [Personal access tokens](/azure/databricks/sql/user/security/personal-access-tokens) for instructions on generating a Personal Access Token (PAT).
    * Azure Active Directory (useable only for Azure). Sign in to your organizational account using the browser popup.

4. Once you successfully connect, the **Navigator** appears and displays the data available on the server. Select your data in the navigator. Then select **Next** to transform the data in Power Query.

    :::image type="content" source="../../media/databricksazure/pq-choose-data.png" alt-text="Image of Power Query navigator loading Databricks Cloud data to online app.":::

