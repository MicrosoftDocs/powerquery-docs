---
title: MongoDB Atlas SQL interface connector
description: Provides basic information, prerequisites, and instructions for using the MongoDB Atlas SQL interface connector.  
author: bucaojit  
ms.author: whhender
ms.topic: concept-article  
ms.date: 11/12/2025  
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# MongoDB Atlas SQL interface

> [!NOTE]
>This connector is owned and provided by MongoDB.

## Summary

| Item                           | Description                                                                                                 |
|--------------------------------|-------------------------------------------------------------------------------------------------------------|
| Release State                  | General Availability                                                                                        |
| Products                       | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)                              |
| Authentication Types Supported | Database (Username/Password)<br/>X.509 Certificates<br/>OAuth (OIDC)<br/>AWS Identity and Access Management |

> [!NOTE]
> When using authentication mechanisms other than Username/Password (such as X.509 Certificates, OAuth (OIDC), or AWS IAM), you can leave the username and password fields blank in the connection dialogue. The appropriate credentials are handled through the chosen authentication method.

## Prerequisites

[!INCLUDE [Includes_mongodb-atlas-sql-interface_prerequisites](includes/mongodb-atlas-sql-interface/mongodb-atlas-sql-interface-prerequisites.md)]

## Capabilities Supported

[!INCLUDE [Includes_mongodb-atlas-sql-interface_capabilities-supported](includes/mongodb-atlas-sql-interface/mongodb-atlas-sql-interface-capabilities-supported.md)]

## Connect to MongoDB Atlas federated database using Atlas SQL interface from Power Query Desktop

To connect using the Atlas SQL interface:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop.

2. Select **Database** from the categories on the left, select **MongoDB Atlas SQL**, and then select **Connect**.  

   :::image type="content" source="./media/mongodb/mongodb_get_data.png" alt-text="Screenshot of the Get data dialog with the MongoDB Atlas SQL connector selected.":::

3. If you're connecting to the MongoDB Atlas SQL connector for the first time, a third-party notice is displayed.
   Select **"Don't warn me again with this connector"** if you don't want this message to be displayed again.

   Select **Continue**.

4. In the MongoDB Atlas SQL window that appears, fill in the following values:

   - The **MongoDB URI**. _Required_

     Use the MongoDB URI obtained [in the prerequisites](#obtaining-connection-information-for-your-federated-database-instance). Make sure that it doesn't contain your username and password. URIs containing username and/or passwords are rejected.

   - Your federated **Database** name. _Required_  

     Use the name of the federated database obtained [in the prerequisites](#obtaining-connection-information-for-your-federated-database-instance).
   - A SQL query. _Optional_

     To execute immediately, enter a native Atlas SQL query. If the **Database** is the same as previously used, you can omit it from the query.

     ```sql
     SELECT * FROM orders
     ```

   - Select either Import or DirectQuery for your desired Data Connectivity mode.

   Select **OK**.  

   :::image type="content" source="./media/mongodb/mongodb_connection_dialogue.png" alt-text="Screenshot of the MongoDB Atlas SQL connection dialog where you enter the connection information.":::

5. Enter your Atlas MongoDB Database access username and password and select **Connect**.  

   :::image type="content" source="./media/mongodb/mongodb_authentication.png" alt-text="Screenshot of the MongoDB Atlas SQL authentication dialog where you enter your credentials.":::

   > [!NOTE]
   > Once you enter your username and password for a particular Atlas federated database, Power BI Desktop uses those same credentials in subsequent connection attempts. You can modify those credentials by going to **File** > **Options and settings** > **Data source settings**.  

6. In **Navigator**, select one or multiple elements to import and use in Power BI Desktop. 
   Then select either **Load** to load the table in Power BI Desktop, or **Transform Data** to open the Power Query 
   editor where you can filter and refine the set of data you want to use, and then load that refined set of data into 
   Power BI Desktop.

## Connect to MongoDB Atlas federated database using Atlas SQL interface from Power Query Online

[!INCLUDE [Includes_mongodb-atlas-sql-interface_connect-to-power-query-online](includes/mongodb-atlas-sql-interface/mongodb-atlas-sql-interface-connect-to-power-query-online.md)]

## Troubleshooting

When the connection can't be established successfully, the generic error message `The driver returned invalid (or failed to return) SQL_DRIVER_ODBC_VER: 03.80` is displayed. Start by checking your credentials and that you have no network issues accessing your federated database.

## Related content

You might also find the following information useful:

- [Query with Atlas SQL](https://www.mongodb.com/docs/atlas/data-federation/query/query-with-sql/)
- [Set Up and Query Data Federation](https://www.mongodb.com/docs/atlas/data-federation/)
- [Schema Management](https://www.mongodb.com/docs/atlas/data-federation/query/sql/schema-management/)
- [SQL Reference](https://www.mongodb.com/docs/atlas/data-federation/query/sql/powerbi/connect/)
