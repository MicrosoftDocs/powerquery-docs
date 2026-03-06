
To use the MongoDB Atlas SQL connector, you must have an [Atlas federated database](https://www.mongodb.com/docs/atlas/data-federation/) setup.

### Obtaining connection information for your federated database instance

1. Navigate to your federated database instance. In Atlas, select **Data Federation** from the left navigation panel.
2. Select **Connect** to open the federated database instance connection modal.
3. Select **Connect using the Atlas SQL Interface**.
4. Select **Power BI Connector**.
5. Copy your federated database name and MongoDB URI. You need them in a later step.

> [!NOTE]
> If some or all of your data comes from an Atlas cluster, you must use MongoDB version 5.0 or greater for that cluster to take advantage of Atlas SQL.

The [MongoDB Atlas SQL ODBC Driver](https://www.mongodb.com/try/download/odbc-driver) is required to use the MongoDB Atlas SQL Connector.

