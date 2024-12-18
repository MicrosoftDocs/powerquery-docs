---
title: Power Query Impala database connector
description: Provides basic information for the Impala database connector, along with how to connect to your Impala data.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 1/24/2024
ms.author: dougklo
ms.subservice: connectors
---

# Impala database

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights |
| Authentication Types Supported | Anonymous<br/>Database<br/>Windows |
| Function Reference Documentation | &mdash; |

> [!NOTE]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities Supported

* Import
* DirectQuery (Power BI semantic models)
* Advanced options
  * Connection timeout duration
  * Command timeout duration

## Connect to an Impala database from Power Query Desktop

To connect to an **Impala** database, take the following steps:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop.

2. Select **Database** from the categories on the left, select **Impala** on the right, and then select **Connect**.

    :::image type="content" source="media/impala-database/get-data.png" alt-text="Image of the Get Data dialog with the Database category and Impala connector selected.":::

3. In the **Impala** window that appears, type or paste the name of your Impala server into the box. You can **Import** data directly into Power BI or you can use **DirectQuery**. Learn more about [using DirectQuery](/power-bi/connect-data/desktop-use-directquery). Then select **OK**.

    :::image type="content" source="media/impala-database/server-selection.png" alt-text="Image of the Impala dialog with a Server name entered and the Import data connectivity mode selected.":::

4. When prompted, enter your credentials or connect anonymously. The Impala connector supports Anonymous, Database (user name and password), and Windows authentication.

    ![Image of the authentication dialog with the Anonymous, Windows, and Database selections on the left side, with Database selected.](media/impala-database/sign-in-screen.png)

   For more information about authentication methods, go to [Authentication with a data source](../connectorauthentication.md).

   > [!NOTE]
   >  If the connection isn't encrypted, you'll be prompted with the following message. Select **OK** if you want to use an unencrypted connection.

   ![Image of the encryption support dialog, emphasizing that a connection could not be made and asking whether to use an unencrypted connection.](media/impala-database/encryption-warning.png)

5. After you connect, a **Navigator** window appears and displays the data that's available on the server. Either select **Load** to load the data or **Transform Data** to continue transforming the data in the Power Query editor.

    [![Image of the Navigator, with the default database and customers data selected on the left, with the customer data displayed on the right.](media/impala-database/navigator.png)](media/impala-database/navigator.png#lightbox)

## Connect to an Impala database from Power Query Online

To connect to an **Impala** database, take the following steps:

1. Select the **Impala** option in the connector selection.

2. In **Connect to data source**, provide the name of the server and a port number if required.

   :::image type="content" source="./media/impala-database/service-signin.png" alt-text="Enter the impala database online connection.":::

3. If required, select the name of your on-premises data gateway.

4. If this is the first time you're connecting to this Impala database, select the type of credentials for the connection in **Authentication kind**.

5. Enter your credentials.

6. Select **Use Encrypted Connection** if you want to use an encrypted connection, or clear the option if you want to use an unencrypted connection.

7. Select **Next** to continue.

8. In **Navigator**, select the data you require, then select **Transform data** to transform the data in the Power Query editor.

## Connect using advanced options

Power Query provides a set of advanced options that you can add to your query if needed. The following table lists all of the advanced options you can set in Power Query.

| Advanced option | Description |
| --------------- | ----------- |
| Connection timeout duration | Specifies the maximum time Power Query will wait for a connection to complete. You can enter another value to keep the connection open longer.|
| Command timeout duration | Specifies the maximum time a command is allowed to run before Power Query abandons the call. |

## Considerations and limitations

Here are a few considerations and limitations to keep in mind with the **Impala** connector:

* The Impala connector is supported on the on-premises data gateway, using any of the three supported authentication mechanisms.
* The Impala connector uses the Impala driver, which limits the size of string types to 32K by default.
* The Impala connector doesn't support overridding the **Realm** option for Kerberos authentication.
