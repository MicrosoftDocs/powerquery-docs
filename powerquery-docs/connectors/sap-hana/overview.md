---
title: Power Query SAP HANA database connector
description: Provides basic information, prerequisites, and instructions on connecting to your data using the SAP HANA database connector.
author: bezhan-msft
ms.topic: conceptual
ms.date: 7/14/2023
ms.author: bezhan
---

# SAP HANA database

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Analysis Services |
| Authentication Types Supported | Basic<br/>Database<br/>Windows |
| Function Reference Documentation | [SapHana.Database](/powerquery-m/saphana-database) |

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

You'll need an SAP account to sign in to the website and download the drivers. If you're unsure, contact the SAP administrator in your organization.

To use SAP HANA in Power BI Desktop or Excel, you must have the SAP HANA ODBC driver installed on the local client computer for the SAP HANA data connection to work properly. You can download the SAP HANA Client tools from [SAP Development Tools](https://tools.hana.ondemand.com/#hanatools), which contains the necessary ODBC driver. Or you can get it from the [SAP Software Download Center](https://support.sap.com/en/my-support/software-downloads.html). In the Software portal, search for the SAP HANA CLIENT for Windows computers. Since the SAP Software Download Center changes its structure frequently, more specific guidance for navigating that site isn't available. For instructions about installing the SAP HANA ODBC driver, go to [Installing SAP HANA ODBC Driver on Windows 64 Bits](https://help.sap.com/viewer/e9146b36040844d0b1f309bc8c1ba6ab/3.2/en-US/734759c0c1c9440c857da0d366e47dda.html).

To use SAP HANA in Excel, you must have either the 32-bit or 64-bit SAP HANA ODBC driver (depending on whether you're using the 32-bit or 64-bit version of Excel) installed on the local client computer.

This feature is only available in Excel for Windows if you have Office 2019 or a [Microsoft 365 subscription](https://products.office.com/buy/compare-microsoft-office-products). If you're a Microsoft 365 subscriber, [make sure you have the latest version of Office](https://support.office.com/article/how-do-i-upgrade-office-ee68f6cf-422f-464a-82ec-385f65391350).

HANA 1.0 SPS 12rev122.09, 2.0 SPS 3rev30 and BW/4HANA 2.0 is supported.

## Capabilities Supported

* Import
* Direct Query (Power BI Datasets)
* Advanced
  * SQL Statement

## Connect to an SAP HANA database from Power Query Desktop

To connect to an SAP HANA database from Power Query Desktop:

1. Select **Get Data > SAP HANA database** in Power BI Desktop or **From Database > From SAP HANA Database** in the **Data** ribbon in Excel.

2. Enter the name and port of the SAP HANA server you want to connect to. The example in the following figure uses `SAPHANATestServer` on port `30015`.

   ![Enter the SAP HANA server information.](sap-hana-server.png)

   By default, the port number is set to support a single container database. If your SAP HANA database can contain more than one multitenant database container, select **Multi-container system database (30013)**. If you want to connect to a tenant database or a database with a non-default instance number, select **Custom** from the **Port** drop-down menu.

   If you're connecting to an SAP HANA database from Power BI Desktop, you're also given the option of selecting either **Import** or **DirectQuery**. The example in this article uses **Import**, which is the default (and the only mode for Excel). For more information about connecting to the database using DirectQuery in Power BI Desktop, go to [Connect to SAP HANA data sources by using DirectQuery in Power BI](/power-bi/connect-data/desktop-directquery-sap-hana).

   You can also enter an SQL statement or enable column binding from **Advanced options**. More information, [Connect using advanced options](#connect-using-advanced-options)

   Once you've entered all of your options, select **OK**.

3. If you're accessing a database for the first time, you'll be asked to enter your credentials for authentication. In this example, the SAP HANA server requires database user credentials, so select **Database** and enter your user name and password. If necessary, enter your server certificate information.

   ![Enter the server credentials.](sap-hana-signin.png)

   Also, you may need to validate the server certificate. For more information about using validate server certificate selections, see [Using SAP HANA encryption](sap-hana-encryption.md). In Power BI Desktop and Excel, the validate server certificate selection is enabled by default. If you've already set up these selections in ODBC Data Source Administrator, clear the **Validate server certificate** check box. To learn more about using ODBC Data Source Administrator to set up these selections, go to [Configure SSL for ODBC client access to SAP HANA](configure-odbc-sap-hana.md).

   For more information about authentication, go to [Authentication with a data source](../../connectorauthentication.md).

   Once you've filled in all required information, select **Connect**.

4. From the **Navigator** dialog box, you can either transform the data in the Power Query editor by selecting **Transform Data**, or load the data by selecting **Load**.

## Connect to an SAP HANA database from Power Query Online

To connect to SAP HANA data from Power Query Online:

1. From the **Data sources** page, select **SAP HANA database**.

2. Enter the name and port of the SAP HANA server you want to connect to. The example in the following figure uses `SAPHANATestServer` on port `30015`.

3. Optionally, enter an SQL statement from **Advanced options**. More information, [Connect using advanced options](#connect-using-advanced-options)

4. Select the name of the on-premises data gateway to use for accessing the database.

   >[!NOTE]
   > You must use an on-premises data gateway with this connector, whether your data is local or online.

5. Choose the authentication kind you want to use to access your data. You'll also need to enter a username and password.

   >[!NOTE]
   > Currently, Power Query Online only supports Basic authentication.

6. Select **Use Encrypted Connection** if you're using any encrypted connection, then choose the SSL crypto provider. If you're not using an encrypted connection, clear **Use Encrypted Connection**. More information: [Enable encryption for SAP HANA](sap-hana-encryption.md)

   ![SAP HANA database online sign-in.](sap-hana-online-signin.png)

7. Select **Next** to continue.

8. From the **Navigator** dialog box, you can either transform the data in the Power Query editor by selecting **Transform Data**, or load the data by selecting **Load**.

## Connect using advanced options

Power Query provides a set of advanced options that you can add to your query if needed.

The following table describes all of the advanced options you can set in Power Query.

| Advanced option | Description |
| --------------- | ----------- |
| SQL Statement | More information, [Import data from a database using native database query](../../native-database-query.md) |
| Enable column binding | Binds variables to the columns of a SAP HANA result set when fetching data. May potentially improve performance at the cost of slightly higher memory utilization. This option is only available in Power Query Desktop. More information: [Enable column binding](#enable-column-binding) |
| ConnectionTimeout| A duration that controls how long to wait before abandoning an attempt to make a connection to the server. The default value is 15 seconds. |
| CommandTimeout | A duration that controls how long the server-side query is allowed to run before it is canceled. The default value is ten minutes. |

## Supported features for SAP HANA

The following list shows the supported features for SAP HANA. Not all features listed here are supported in all implementations of the SAP HANA database connector.

* Both the Power BI Desktop and Excel connector for an SAP HANA database use the SAP ODBC driver to provide the best user experience.

* In Power BI Desktop, SAP HANA supports both DirectQuery and Import options.

* Power BI Desktop supports HANA information models, such as Analytic and Calculation Views, and has optimized navigation.

* With SAP HANA, you can also use SQL commands in the native database query SQL statement to connect to Row and Column Tables in HANA Catalog tables, which aren't included in the Analytic/Calculation Views provided by the Navigator experience. You can also use the [ODBC connector](../odbc.md) to query these tables.

* Power BI Desktop includes Optimized Navigation for HANA Models.

* Power BI Desktop supports SAP HANA Variables and Input parameters.

* Power BI Desktop supports HDI-container-based Calculation Views.

* The [SapHana.Database](/powerquery-m/saphana-database) function now supports connection and command timeouts. More information: [Connect using advanced options](#connect-using-advanced-options)

  * To access your HDI-container-based Calculation Views in Power BI, ensure that the HANA database users you use with Power BI have permission to access the HDI runtime container that stores the views you want to access. To grant this access, create a Role that allows access to your HDI container. Then assign the role to the HANA database user you'll use with Power BI. (This user must also have permission to read from the system tables in the _SYS_BI schema, as usual.) Consult the official SAP documentation for detailed instructions on how to create and assign database roles. This [SAP blog post](https://blogs.sap.com/2018/01/24/the-easy-way-to-make-your-hdi-container-accessible-to-a-classic-database-user/) may be a good place to start.

  * There are currently some limitations for HANA variables attached to HDI-based Calculation Views. These limitations are because of errors on the HANA side. First, it isn't possible to apply a HANA variable to a shared column of an HDI-container-based Calculation View. To fix this limitation, upgrade to HANA 2 version 37.02 and onwards or to HANA 2 version 42 and onwards. Second, multi-entry default values for variables and parameters currently don't show up in the Power BI UI. An error in SAP HANA causes this limitation, but SAP hasn't announced a fix yet.

## Enable column binding

Data fetched from the data source is returned to the application in variables that the application has allocated for this purpose. Before this can be done, the application must associate, or _bind_, these variables to the columns of the result set; conceptually, this process is the same as binding application variables to statement parameters. When the application binds a variable to a result set column, it describes that variable - address, data type, and so on - to the driver. The driver stores this information in the structure it maintains for that statement and uses the information to return the value from the column when the row is fetched.

Currently, when you use Power Query Desktop to connect to an SAP HANA database, you can select the **Enable column binding** advanced option to enable column binding.

You can also enable column binding in existing queries or in queries used in Power Query Online by manually adding the `EnableColumnBinding` option to the connection in the Power Query formula bar or advanced editor. For example:

```powerquery-m
SapHana.Database("myserver:30015", [Implementation = "2.0", EnableColumnBinding = true]),
```

There are limitations associated with manually adding the `EnableColumnBinding` option:

* Enable column binding works in both Import and DirectQuery mode. However, retrofitting an existing DirectQuery query to use this advanced option isn't possible. Instead, a new query must be created for this feature to work correctly.
* In SAP HANA Server version 2.0 or later, column binding is all or nothing. If some columns can’t be bound, none will be bound, and the user will receive an exception, for example, `DataSource.Error: Column MEASURE_UNIQUE_NAME of type VARCHAR cannot be bound (20002 > 16384)`.
* SAP HANA version 1.0 servers don't always report correct column lengths. In this context, `EnableColumnBinding` allows for partial column binding. For some queries, this could mean that no columns are bound. When no columns are bound, no performance benefits are gained.

## Native query support in the SAP HANA database connector

The Power Query SAP HANA database connector supports native queries. For information about how to use native queries in Power Query, go to [Import data from a database using native database query](../../native-database-query.md).

### Query folding on native queries

The Power Query SAP HANA database connector now supports query folding on native queries. More information: [Query folding on native queries](../../native-query-folding.md)

>[!NOTE]
>In the Power Query SAP HANA database connector, native queries don't support duplicate column names when `EnableFolding` is set to true.

### Parameters in native queries

The Power Query SAP HANA database connector now supports parameters in native queries. You can specify parameters in native queries by using the [Value.NativeQuery](/powerquery-m/value-nativequery) syntax.

Unlike other connectors, the SAP HANA database connector supports `EnableFolding = True` and specifying parameters at the same time.

To use parameters in a query, you place question marks (?) in your code as placeholders. To specify the parameter, you use the `SqlType` text value and a value for that `SqlType` in `Value`. `Value` can be any M value, but must be assigned to the value of the specified `SqlType`.

There are multiple ways of specifying parameters:

* Providing just the values as a list:

   ```powerquery-m
   { “Seattle”, 1, #datetime(2022, 5, 27, 17, 43, 7) }
   ```

* Providing the values and the type as a list:

   ```powerquery-m
   { [ SqlType = "CHAR", Value = "M" ], 
     [ SqlType = "BINARY", Value = Binary.FromText("AKvN", BinaryEncoding.Base64) ], 
     [ SqlType = "DATE", Value = #date(2022, 5, 27) ] }
   ```

* Mix and match the two:

   ```powerquery-m
   { “Seattle”, 1, [ SqlType = "SECONDDATE", Value = #datetime(2022, 5, 27, 17, 43, 7) ] }
   ```

`SqlType` follows the standard type names defined by SAP HANA. For example, the following list contains the most common types used:

* BIGINT
* BINARY
* BOOLEAN
* CHAR
* DATE
* DECIMAL
* DOUBLE
* INTEGER
* NVARCHAR
* SECONDDATE
* SHORTTEXT
* SMALLDECIMAL
* SMALLINT
* TIME
* TIMESTAMP
* VARBINARY
* VARCHAR

The following example demonstrates how to provide a list of parameter values.

[!code-powerquery-m[Main](list-of-values.m?highlight=9,12,13)]

The following example demonstrates how to provide a list of records (or mix values and records):

[!code-powerquery-m[Main](list-of-records.m?highlight=10-14,22-26,28)]

## Support for dynamic attributes

The way in which the SAP HANA database connector treats calculated columns has been improved. The SAP HANA database connector is a "cube" connector, and there are some sets of operations (add items, collapse columns, and so on) that happen in "cube" space. This cube space is exhibited in the Power Query Desktop and Power Query Online user interface by the "cube" icon that replaces the more common "table" icon.

![Screenshot of the left side of the current view in Power Query, emphasizing the cube icon at the top of the row number column.](cube-space.png)

Before, when you added a table column (or another transformation that internally adds a column), the query would "drop out of cube space", and all operations would be done at a table level. At some point, this drop out could cause the query to stop folding. Performing cube operations after adding a column was no longer possible.

With this change, the added columns are treated as _dynamic attributes_ within the cube. Having the query remain in cube space for this operation has the advantage of letting you continue using cube operations even after adding columns.

>[!NOTE]
>This new functionality is only available when you connect to Calculation Views in SAP HANA Server version 2.0 or higher.

The following sample query takes advantage of this new capability. In the past, you would get a "the value is not a cube" exception when applying [Cube.CollapseAndRemoveColumns](/powerquery-m/cube-collapseandremovecolumns).

:::code language="powerquery-m" source="dynamic-attributes.m":::

## Next steps

* [Enable encryption for SAP HANA](sap-hana-encryption.md)

The following articles contain more information that you may find useful when connecting to an SAP HANA debase.

* [Manage your data source - SAP HANA](/power-bi/connect-data/service-gateway-enterprise-manage-sap)
* [Use Kerberos for single sign-on (SSO) to SAP HANA](/power-bi/connect-data/service-gateway-sso-kerberos-sap-hana)
