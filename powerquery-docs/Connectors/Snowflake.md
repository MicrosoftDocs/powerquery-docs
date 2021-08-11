---
title: Power Query Snowflake connector
description: Provides basic information, prerequisites, and instructions on how to connect to Snowflake database, along with native query folding instructions and troubleshooting tips.
author: cpopell
ms.service: powerquery
ms.topic: conceptual
ms.date: 6/16/2021
ms.author: gepopell
LocalizationGroup: reference
---

# Snowflake

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Power Apps (Dataflows) |
| Authentication Types Supported | Database (Username/Password), AAD |
| Function Reference Documentation | - |
| | |

> [!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities Supported

- Import
- DirectQuery (Power BI only)
- Advanced options
  - Specify a text value to use as Role name
  - Native SQL statement
  - Relationship columns
  - Connection timeout in seconds
  - Command timeout in seconds

## Connect to Snowflake data warehouse from Power Query Desktop

To make the connection to a **Snowflake** computing warehouse, take the following steps:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop, select **Database** from the categories on the left, select **Snowflake**, and then select **Connect**.

   ![Screenshot of the Get Data dialog, showing the Snowflake database selection.](./media/Snowflake/snowflake-get-data.png)

2. In the **Snowflake** window that appears, enter the name of your Snowflake server in **Server** and the name of your Snowflake computing warehouse in **Warehouse**.

   ![Screenshot of the Snowflake dialog, showing the Import radio button selected.](./media/Snowflake/snowflake-connection-screen.png)

3. Optionally, enter values in any advanced options that you want to use to modify the connection query, such as a text value to use as a Role name or a command timeout. More information: [Connect using advanced options](#connect-using-advanced-options)

4. Select **Import** to import data directly into Power BI, or select **DirectQuery**. More information: [Use DirectQuery in Power BI Desktop](/power-bi/connect-data/desktop-use-directquery)

   >[!Note]
   >Azure Active Directory (Azure AD) Single Sign-On (SSO) only supports DirectQuery.

5. Select **OK**.

6. To sign in to your Snowflake computing warehouse, enter your username and password, and then select **Connect**.

   ![Screenshot of the Snowflake credential prompt, showing the Username and Password fields.](./media/Snowflake/snowflake-authentication.png)

   > [!NOTE]
   > Once you enter your username and password for a particular **Snowflake** server, Power BI Desktop uses those same credentials in subsequent connection attempts. You can modify those credentials by going to **File > Options and settings > Data source settings**. More information: [Change the authentication method](../ConnectorAuthentication.md#change-the-authentication-method)

   If you want to use the Microsoft account option, the Snowflake AAD integration must be configured on the Snowflake side. For more information: [Power BI SSO to Snowflake - Getting Started](https://docs.snowflake.com/en/user-guide/oauth-powerbi.html#getting-started)

7. In **Navigator** select one or multiple elements to import and use in Power BI Desktop. Then select either **Load** to load the table in Power BI Desktop, or **Edit** to open the Power Query Editor where you can filter and refine the set of data you want to use, and then load that refined set of data into Power BI Desktop.

## Connect to a Snowflake database from Power Query Online

To make the connection, take the following steps:

1. Select the **Snowflake** option in the connector selection.

2. In the **Snowflake** dialog that appears, enter the name of the server and warehouse.

   ![Snowflake connection builder in Power Query Online.](./media/Snowflake/snowflake-pqo-advanced.png)

3. Enter any values in the advanced options you want to use. If there are any advanced options not represented in the UI, you can edit them in the **Advanced Editor** in Power Query later.

4. Enter your connection credentials, including selecting or creating a new connection, which gateway you would like to use, and a username and password (only the Basic authentication kind is supported in Power Query Online).

5. Select **Next** to connect to the database.

6. In **Navigator**, select the data you require, then select **Transform data** to transform the data in Power Query Editor.

## Connect using advanced options

Power Query provides a set of advanced options that you can add to your query if needed.

The following table lists all of the advanced options you can set in Power Query.

| Advanced option | Description |
| --------------- | ----------- |
| Role name | Specifies the role that the report uses via the driver. This role must be available to the user, otherwise no role will be set. |
| Include relationship columns | If checked, includes columns that might have relationships to other tables. If this box is cleared, you won’t see those columns. |
| Connection timeout in seconds | Specifies how long to wait for a response when interacting with the Snowflake service before returning an error. Default is 0 (no timeout).|
| Command timeout in seconds | Specifies how long to wait for a query to complete before returning an error. Default is 0 (no timeout). |
| SQL Statement | For information, go to [Import data from a database using native database query](../native-database-query.md). In this version of native database query functionality, you need to use fully qualified table names in the format **Database.Schema.Table**, for example **SELECT * FROM DEMO_DB.PUBLIC.DEMO_TABLE**.  |
| | |

Once you've selected the advanced options you require, select **OK** in Power Query Desktop or **Next** in Power Query Online to connect to your Snowflake database.

## Power BI and Snowflake Webinar

Power BI and Snowflake are partnering to host a hands-on webinar on August 25th, 2021 to deep-dive into [Attaining Consumer Insights with Snowflake and Microsoft Power BI](https://www.snowflake.com/webinar/virtual-hands-on-labs/attaining-consumer-insights-with-snowflake-and-microsoft-power-bi/). 

In this hands on lab, learn how to access all relevant data from a single source and turn data into insights through this connector.

* Access first party data seamlessly in Snowflake
* Leverage the Data Marketplace to query live data from 3rd party providers
* Set up self-serve analytics in Power BI

Sign up for the webinar using the above link!

## Additional information

- [Connect to Snowflake in Power BI Service](/power-bi/connect-data/service-connect-snowflake)
