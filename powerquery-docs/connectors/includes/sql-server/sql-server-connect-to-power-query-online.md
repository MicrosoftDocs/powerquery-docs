
To make the connection, take the following steps:

1. Select the **SQL Server database** option in the connector selection. For more information, go to [Where to get data](../../where-to-get-data.md).

2. In the **SQL Server database** dialog that appears, provide the name of the server and database (optional).

   :::image type="content" source="../../media/sql-server-database/select-database-online.png" alt-text="Screenshot of the SQL Server database connection builder in Power Query Online.":::

3. If the SQL server isn't online, select an on-premises data gateway. Additionally, if using the port with servername, use the value `servername*` as the server name in the connection settings.

4. If you're connecting to this database for the first time, select the authentication kind and input your credentials.

5. If the connection isn't encrypted, and the connection dialog contains a **Use Encrypted Connection** check box, clear the check box.

6. Select **Next** to continue.

7. In **Navigator**, select the data you require, and then select **Transform data**.

   :::image type="content" source="../../media/sql-server-database/navigator-online.png" alt-text="Screenshot of the Power Query Online Navigator showing the Human Resources employee data." lightbox="../../media/sql-server-database/navigator-online.png":::

