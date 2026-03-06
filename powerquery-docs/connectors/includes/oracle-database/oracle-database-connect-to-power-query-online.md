
To make the connection, take the following steps:

1. [Install and setup an on-premises data gateway](/data-integration/gateway/service-gateway-install#download-and-install-a-standard-gateway).

2. From Power Query Online, select the **Oracle database** option in the data sources selection.

3. In the **Oracle database** dialog that appears, specify the Oracle net service name/TNS alias, Easy Connect Plus connection string, or connect descriptor to connect to in **Server**.

   :::image type="content" source="../../media/oracle-database/select-database-online.png" alt-text="Screenshot of the Oracle database window where you enter your Oracle database online connection information.":::

4. Provide a **Connection name**, such as "testoracleserver".

5. Select the name of your on-premises data gateway.

   > [!NOTE]
   > You must select an on-premises data gateway for this connector, whether the Oracle database is on your local network or on a web site.

6. If you're connecting to this Oracle database for the first time, select the type of credentials for the connection in **Authentication kind**. Choose **Basic** if you plan to sign in with an Oracle username and password. Choose **Windows** when using Windows operating system authentication and with both the Oracle client and server running on Windows.

7. Enter your credentials.

8. Select **Next** to continue.

9. In **Navigator**, select the data you require, then select **Transform data** to transform the data in Power Query Editor.

