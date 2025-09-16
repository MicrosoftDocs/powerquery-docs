---
title: Power Query Snowflake connector
description: Provides basic information, prerequisites, and instructions on how to connect to Snowflake database, along with native query folding instructions and troubleshooting tips.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 07/22/2025
ms.author: dougklo
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Snowflake

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows) |
| Authentication Types Supported | Snowflake (Username/Password), Microsoft account (Microsoft Entra ID) |
| Function Reference Documentation | &mdash; |

> [!NOTE]
> The Snowflake connector implementation 2.0 has been generally available since July 2025. Learn more about [this feature](#snowflake-connector-implementation-20).

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

> [!NOTE]
> Username/password authentication mode will be deprecated by Snowflake (read [more here](https://www.snowflake.com/en/blog/blocking-single-factor-password-authentification/)). More information can be found under Connectivity on our [Fabric roadmap](https://roadmap.fabric.microsoft.com/?product=datafactory).

## Capabilities Supported

- Import
- DirectQuery (Power BI semantic models)
- Advanced options
  - Specify a text value to use as Role name
  - Relationship columns
  - Connection timeout in seconds
  - Command timeout in seconds
  - Database
  - Native SQL statement

## Connect to Snowflake data warehouse from Power Query Desktop

> [!NOTE]
>
> Since March 2025 version of Power BI Desktop, the [**Snowflake connector implementation 2.0**](#snowflake-connector-implementation-20) option is enabled by default.

To make the connection to a **Snowflake** computing warehouse, take the following steps:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop, select **Database** from the categories on the left, select **Snowflake**, and then select **Connect**.

   ![Screenshot of the Get Data dialog, showing the Snowflake database selection.](./media/snowflake/snowflake-get-data.png)

2. In the **Snowflake** window that appears, enter the name of your Snowflake server in **Server** and the name of your Snowflake computing warehouse in **Warehouse**.

   ![Screenshot of the Snowflake dialog, showing the Import radio button selected.](./media/snowflake/snowflake-connection-screen.png)

3. Optionally, enter values in any advanced options that you want to use to modify the connection query, such as a text value to use as a Role name or a command timeout. More information: [Connect using advanced options](#connect-using-advanced-options)

4. Select **OK**.

5. To sign in to your Snowflake computing warehouse, enter your username and password, and then select **Connect**.

   ![Screenshot of the Snowflake credential prompt, showing the Username and Password fields.](./media/snowflake/snowflake-authentication.png)

   > [!NOTE]
   > Once you enter your username and password for a particular **Snowflake** server, Power BI Desktop uses those same credentials in subsequent connection attempts. You can modify those credentials by going to **File > Options and settings > Data source settings**. More information: [Change the authentication method](../connector-authentication.md#change-the-authentication-method)

   If you want to use the Microsoft account option, the Snowflake Microsoft Entra ID integration must be configured on the Snowflake side. More information: [Power BI SSO to Snowflake - Getting Started](https://docs.snowflake.com/en/user-guide/oauth-powerbi#getting-started)

6. In **Navigator**, select one or multiple elements to import and use in Power BI Desktop. Then select either **Load** to load the table in Power BI Desktop, or **Transform Data** to open the Power Query Editor where you can filter and refine the set of data you want to use, and then load that refined set of data into Power BI Desktop.

   :::image type="content" source="./media/snowflake/navigator-desktop.png" alt-text="Screenshot of the Navigator with the test schema database open and the DimProduct table selected.":::

7. Select **Import** to import data directly into Power BI, or select **DirectQuery**, then select **OK**. More information: [Use DirectQuery in Power BI Desktop](/power-bi/connect-data/desktop-use-directquery)

   > [!NOTE]
   >Microsoft Entra ID single sign-on (SSO) only supports DirectQuery.

   ![Screenshot of Connection settings, which contains the Import and DirectQuery selections.](./media/snowflake/connection-settings-desktop.png)

## Connect to a Snowflake database from Power Query Online

To make the connection, take the following steps:

1. Select the **Snowflake** option in the connector selection.

2. In the **Snowflake** dialog that appears, enter the name of the server and warehouse.

   :::image type="content" source="./media/snowflake/snowflake-pqo-advanced.png" alt-text="Snowflake connection builder in Power Query Online.":::

3. Enter any values in the advanced options you want to use. If there are any advanced options not represented in the UI, you can edit them in the **Advanced Editor** in Power Query later.

4. Enter your connection credentials, including selecting or creating a new connection, which gateway you would like to use, and a username and password.

5. Select **Next** to connect to the database.

6. In **Navigator**, select the data you require, then select **Transform data** to transform the data in Power Query Editor.

   :::image type="content" source="./media/snowflake/navigator-online.png" alt-text="Screenshot of the online Navigator with the test schema database open and the DimProduct table selected.":::

## Connect using advanced options

Power Query provides a set of advanced options that you can add to your query if needed.

The following table lists all of the advanced options you can set in Power Query.

| Advanced option | Description |
| --------------- | ----------- |
| Role name | Specifies the role that the report uses via the driver. This role must be available to the user, otherwise no role is set. |
| Include relationship columns | If checked, includes columns that might have relationships to other tables. If this box is cleared, you don’t see those columns. |
| Connection timeout in seconds | Specifies how long to wait for a response when interacting with the Snowflake service before returning an error. Default is 0 (no time-out).|
| Command timeout in seconds | Specifies how long to wait for a query to complete before returning an error. Default is 0 (no time-out). |
| Database | Specifies a specific database in the warehouse. This option is only available in Power Query Desktop. |
| SQL Statement | For information, go to [Import data from a database using native database query](../native-database-query.md). This option is only available in Power Query Desktop. |

Once you select the advanced options you require, select **OK** in Power Query Desktop or **Next** in Power Query Online to connect to your Snowflake database.

## Snowflake connector implementation 2.0

In January 2025, we introduced a new implementation for the Snowflake connector to enhance the integration with Snowflake. This connector has been generally available since July 2025. You're recommended to upgrade the Power BI Desktop and on-premises data gateway to the latest version to benefit from the most current capabilities. [Provide us feedback](https://aka.ms/snowflake-connector-feedback) to help us continue improving the connector.

The Snowflake connector implementation 2.0 is built using the open-source [Arrow Database Connectivity](https://arrow.apache.org/docs/format/ADBC.html) (ADBC) driver. ADBC provides a set of standard interfaces for interacting with Arrow data, which is especially efficient at fetching large datasets with minimal overhead and no serialization or copying. The ADBC driver also incorporates security enhancements such as memory safety and garbage collection. Additionally, collaboration with the open-source community enables more rapid updates, utilizing modern tools and secure development lifecycle (SDL) processes.

To enable you to take advantage of these performance and security enhancements, starting July 2025, all the newly created connections automatically uses the 2.0 implementation. In addition, we'll gradually transition existing customers to the 2.0 implementation in phases. We will share more details in late 2025/early 2026. During this period, you can test the 2.0 implementation by updating your existing queries and adding the `Implementation="2.0"` flag in `Snowflake.Databases` as follows. After the transition, connections that do not specify an implementation will be automatically updated to the 2.0 implementation.

```powerquery-m
Source = Snowflake.Databases("contoso.snowflakecomputing.com", "CONTOSO_WH", [Implementation="2.0"])
```

To aid with diagnosing any potential issue, you can find the `Implementation` and `DriverType` details in your Mashup logs like the following example. If you encounter any issue during the transition, contact support. Meanwhile, to self-mitigate, you can remove `Implementation="2.0"` to keep using the ODBC connector to avoid business interruption before the issue is resolved.

```json
{"Start":"2024-11-02T00:14:02.7968686Z","Action":"Engine/Module/Snowflake/IO/Snowflake/Implementation","ResourceKind":"Snowflake","ResourcePath":"powerbi.snowflakecomputing.com ;DEMO_WH","HostProcessId":"29200","Implementation":"2.0","DriverType":"ADBC","ProductVersion":"2.139.0.0 (Main)+eda56ecd858054173a4d11db9c63a6da5cf92a99","ActivityId":"106f16b6-cfbb-4853-9f20-ed45486486d2","Process":"Microsoft.Mashup.Container.NetFX45","Pid":38560,"Tid":1,"Duration":"00:00:00.0000291"}
```

The following options are available since July 2025 release:

- `UseHighPrecision`: Controls the precision of how Snowflake NUMBER(38,0) fields should be handled. If no value is specified, the connector queries Snowflake using the `SHOW PARAMETERS LIKE 'ODBC_TREAT_DECIMAL_AS_INT'` query. If the no value is set, then the connector uses the scale specified by the column. A `true` value treats NUMBER(38,0) as a Decimal type. The value `false` treats NUMBER(38,0) as an Int64 type. If the scale is higher than 0, then the column is considered as a Double type. 
- `DateTimePrecision`: Controls the precision of how Snowflake Timestamp values are treated. Snowflake typically stores Timestamp values with nanosecond precision. In ADBC, this can cause an overflow exception for dates before 1677 or after 2262, [according to Snowflake](https://pkg.go.dev/github.com/snowflakedb/gosnowflake#hdr-Arrow_batches). Valid values for this option are *null*, `nanoseconds` or `microseconds`. A *null* value uses `nanoseconds` by default. Users who need dates before 1677 or after 2262 are recommended to use the `microseconds` setting. If users need to retain precision to the ten millionth place before 1677 or after 2262, it's recommended to stay with the ODBC driver.

If you need to use proxy to connect to Snowflake, refer to the [proxy setting instruction](https://pkg.go.dev/github.com/snowflakedb/gosnowflake#hdr-Proxy). The driver uses environment variables for the proxy settings.

Below is a summary of the connector enhancement released in the past versions:

| Release       | Connector improvement                                        |
| ------------- | ------------------------------------------------------------ |
| July 2025     | \- Boolean columns return Boolean types, fixing the issue where Boolean columns were treated as String types in an empty record set schema (including metadata).<br/>- New setting to set the maximum timestamp precision to microseconds.<br/>- Improved Duration support.<br/>- Added support for navigation properties to ADBC.<br/>- Improved tracing in the ADBC driver, where the “ActivityId" can now be traced through the driver layer. |
| April 2025    | - Added support for Snowflake query tag. As an example: `{"PowerQuery":true,"Host":"PBI_SemanticModel_MWC","HostContext":"PowerBIPremium-DirectQuery"}` |
| March 2025    | - Enhanced performance when retrieving data from Snowflake.<br/>- Enabled by default in Power BI Desktop so that the newly created connections automatically use the new connector implementation.<br/>- Fixed the [views not visible issue](#views-not-visible-with-implementation20) since the latest March release. |
| February 2025 | - Enhanced performance by reducing the number of metadata calls.<br/>- Resolved duplicate values issue for large result sets. |

> [!NOTE]
> When you use the on-premises data gateway, note the minimal supported version is January 2025. You're recommended to use the latest version with the most current capabilities.

> [!NOTE]
> This feature is supported in the 64-bit version of Power BI Desktop and doesn't work in the 32-bit version.

## Troubleshooting

### Error: SQL compilation error: Object does not exist, or operation cannot be performed

The error occurs when the system can't find the specified object. Often, this error is due to the user having an invalid database name set as their default database.

Ensure that a valid default database name is used for the property DEFAULT_NAMESPACE:
 `DESC USER`*`username`*

To update the default database name: `alter user`*`username`*` set DEFAULT_NAMESPACE=<database name>.<schema name>`. For more information, see the Snowflake documentation - https://docs.snowflake.com/en/sql-reference/sql/alter-user

## Limitations and known issues

### Known issues in Snowflake connector implementation 2.0

Currently, the [Snowflake connector implementation 2.0](#snowflake-connector-implementation-20) has the following known issues. There's ongoing work towards a fix and the documentation will be updated when a fix is released.

- Snowflake query with `count distinct` logic returns incorrect result. 
- When creating relationships, encounter error `Object reference not set to an instance of an object`. The relationship can still be defined once you cancel the pop-up window.
- Increased memory use. The overall load time is typically faster using `Implementation="2.0"`, but the memory consumption can also be higher, in some cases causing issues such as `Resource Governing: This operation was canceled because there wasn't enough memory to finish running it. Either reduce the memory footprint of your dataset by doing things such as limiting the amount of imported data, or if using Power BI Premium, increase the memory of the Premium capacity where this dataset is hosted.`. A fix is planned for late 2025/early 2026.  

### Resolved issues

#### Hyphens in database names

If a database name has a hyphen in it, you can encounter an ```ODBC: ERROR[42000] SQL compilation error```. This issue is addressed in the September 2024 release.

#### Slicer visual for Boolean datatype

The slicer visual for the Boolean data type isn't functioning as expected in the June 2024 release. This nonfunctionality is a known issue. As a temporary solution, users can convert the Boolean data type in their reports to text by navigating to: Transfer -> Data Type -> Text. A fix is provided in October 2024 release.

#### Views not visible with Implementation="2.0"

In some version of March 2025 release of Power BI Desktop, you may encounter issue that views are not visible when using the [Snowflake connector implementation 2.0](#snowflake-connector-implementation-20) (`Implementation="2.0"`). This issue has been fixed since the latest March 2025 release of Power BI Desktop. Upgrade your installation to try again.

#### TIMESTAMP_NTZ values are UTC with Implementation="2.0"

TIMESTAMP_LTZ types are not being converted to the local time zone but are returning the UTC value when using the [Snowflake connector implementation 2.0](#snowflake-connector-implementation-20) (`Implementation="2.0"`). For example, doing `SELECT CURRENT_TIMESTAMP` from Snowflake is returning the UTC time, not the user's local time zone. This issue is addressed in the July 2025 release.

#### Index was outside the bounds of the array when using Implementation="2.0"

In some scenarios, an error is thrown indicating the `Index was outside the bounds of the array` when using the [Snowflake connector implementation 2.0](#snowflake-connector-implementation-20) (`Implementation="2.0"`). This issue is addressed in the June 2025 release.

## Additional information

- [Connect to Snowflake in Power BI Service](/power-bi/connect-data/service-connect-snowflake)
