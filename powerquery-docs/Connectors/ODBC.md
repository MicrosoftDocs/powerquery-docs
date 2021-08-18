---
title: Power Query ODBC connector
description: Provides basic information and prerequisites for the connector, and includes instructions on how to connect to your database using the connector.
author: cpopell
ms.service: powerquery
ms.topic: conceptual
ms.date: 1/9/2020
ms.author: gepopell
LocalizationGroup: reference
---

# ODBC

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products |  Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Power Apps (Dataflows)<br/>Excel<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Database (Username/Password)<br/>Windows<br/>Default or Custom |
| Function Reference Documentation | [Odbc.DataSource](/powerquery-m/odbc-datasource)<br/>[Odbc.Query](/powerquery-m/odbc-query) |
| | |

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

Before you get started, make sure you've properly configured the connection in the [Windows ODBC Data Source Administrator](/sql/odbc/admin/odbc-data-source-administrator). The exact process here will depend on the driver.

## Capabilities Supported

* Import
* Advanced options
  * Connection string (non-credential properties)
  * SQL statement
  * Supported row reduction clauses

## Connect to an ODBC data source

To make the connection, take the following steps:

1. From the Power Query **Get Data** dialog (or **Data** tab in the Excel ribbon), select **Database > ODBC**.

   ![ODBC connection builder in Power BI.](../images/ODBCbuilder.png)

2. In the **From ODBC** dialog that appears, provide the connection string (optional).

   You may also choose to provide a SQL statement, depending on the capabilities of the driver. Ask your vendor for more information.

3. To enable folding support for [Table.FirstN](/powerquery-m/table-firstn), select **Detect** to find supported row reduction clauses, or select from one of the drop down options.

   ![Drop down options: Top, Limit, Limit and Offset, ANSI SQL compatible.](../images/ODBCrowreduction.png)

   This option is not applicable when using a native SQL statement.

4. Once you're done, select **Connect**. Select the authentication type and input those credentials in the dialogue when prompted.
