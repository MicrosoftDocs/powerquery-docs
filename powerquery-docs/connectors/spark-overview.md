title: Spark Connector Overview
description: This article explains the overview of using the Spark Connector.
author: misaacs
ms.author: misaacs
ms.topic: how-to
ms.date: 10/16/2025
ms.custom:
  - template-how-to
  - connectors
---

# Spark Connector in Microsoft Fabric

The **Spark connector** in Microsoft Fabric enables you to access data from **Fabric Data Warehouse** and the **SQL analytics endpoint of a Lakehouse** directly from Spark. It supports reading tables, views, and executing custom T-SQL queries for advanced analytics and transformations.

---

## Prerequisites

Before you use the Spark connector, make sure you have:

- Access to a **Fabric workspace** with a Data Warehouse or Lakehouse.
- **Read permissions** on the warehouse or SQL analytics endpoint (similar to `CONNECT` in SQL Server).
- For SQL databases, permissions such as `db_datareader` and `db_datawriter`; optionally `db_owner` for full control.

---

## Supported Capabilities

- **Read from tables and views** in Fabric Data Warehouse or Lakehouse.
- **Run custom T-SQL queries** from Spark.
- **Integrated security** with Microsoft Entra ID.
- **Object-level, row-level, and column-level security** enforced automatically.

---

## Authentication

- Uses **Microsoft Entra ID** for authentication and authorization.
- When signed into a Fabric workspace, credentials are automatically passed to the SQL engine.
- No additional configuration is required if Entra ID is enabled.

---

## Configuration Steps

### 1. Use Preinstalled Connector
- The Spark connector is included in the Fabric runtime; no manual installation is needed.

### 2. Connect to Data Warehouse or Lakehouse
Example for reading a table:
```scala
synapsesql(tableName: String = "<Warehouse.Schema.Table>")

Example for running a custom query:
spark.read.option(Constants.DatabaseName, "<warehouse>").synapsesql("<T-SQL Query>")


## Security
- Enforces OLS, RLS, and CLS as defined at the SQL engine level. 

## Version Note
If you are using Spark connector v1.0, upgrate to v2.0 for improved native Spark support. 

## Next Steps
Feel free to refernce:
- [Spark's SQL programming guide](https://spark.apache.org/docs/latest/sql-programming-guide.html)
- [Fabrics Data Factor Connector Overview](https://learn.microsoft.com/en-us/fabric/data-factory/connector-overview)