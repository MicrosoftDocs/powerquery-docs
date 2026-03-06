
To connect to SAP HANA data from Power Query Online:

1. From the **Data sources** page, select **SAP HANA database**.

2. Enter the name and port of the SAP HANA server you want to connect to. The example in the following figure uses `SAPHANATestServer` on port `30015`.

3. Optionally, enter a SQL statement from **Advanced options**. For more information, go to [Connect using advanced options](#connect-using-advanced-options).

4. Select the name of the on-premises data gateway to use for accessing the database.

   > [!NOTE]
   > You must use an on-premises data gateway with this connector, whether your data is local or online.

5. Choose the authentication kind you want to use to access your data. You also need to enter a username and password.

   > [!NOTE]
   > Currently, Power Query Online only supports Basic authentication.

6. Select **Use Encrypted Connection** if you're using any encrypted connection, then choose the SSL crypto provider. If you're not using an encrypted connection, clear **Use Encrypted Connection**. More information: [Enable encryption for SAP HANA](../../sap-hana-encryption.md)

   :::image type="content" source="sap-hana-online-signin.png" alt-text="Screenshot of the SAP HANA database online sign-in.":::

7. Select **Next** to continue.

8. From the **Navigator** dialog, you can either transform the data in the Power Query editor by selecting **Transform Data**, or load the data by selecting **Load**.

