---
title: Transition from ODBC to ADBC drivers in Power BI and Microsoft Fabric
description: Learn how Power BI and Microsoft Fabric are transitioning supported data source connections from legacy embedded ODBC drivers to Apache Arrow Database Connectivity (ADBC) drivers, and how to migrate.
ms.topic: concept-article
ms.date: 05/14/2026
---

# Transition from ODBC to ADBC drivers in Power BI and Fabric

Power BI and Microsoft Fabric are transitioning supported data source connections from legacy embedded ODBC drivers to [Apache Arrow Database Connectivity (ADBC)](https://arrow.apache.org/docs/format/ADBC.html) drivers. ADBC provides a set of standard interfaces for interacting with Arrow data, which is especially efficient at fetching large datasets with minimal overhead and no serialization or copying. The ADBC drivers also incorporate security enhancements, such as memory safety and garbage collection.

> [!NOTE]
> The tenant and workspace controls described in this article are being enabled in phases and might not yet be available in all tenants.

You can adopt ADBC today per-connection, and administrators can control the default behavior at scale using a tenant setting that workspace admins can override for testing and validation.

## Connectors and driver changes

The following table lists the connectors that are transitioning from embedded ODBC drivers to replacement drivers. In most cases, the replacement driver is an ADBC driver.

| Connector | Current driver | Replacement driver |
| --- | --- | --- |
| [Databricks](/power-query/connectors/databricks) | Simba Spark ODBC | Databricks ADBC |
| [Azure Databricks](/power-query/connectors/databricks-azure) | Simba Spark ODBC | Databricks ADBC |
| Dremio | Simba Drill ODBC | FlightSQL ADBC |
| [Google BigQuery](/power-query/connectors/google-bigquery) and [Google BigQuery (Microsoft Entra ID)](/power-query/connectors/google-bigquery-aad) | Simba Google BigQuery ODBC | BigQuery ADBC |
| [Hive](/power-query/connectors/hive-llap) | Simba Hive ODBC | *Deprecated* |
| [Impala](/power-query/connectors/impala-database) | Simba Impala ODBC | HiveServer2 ADBC |
| [Snowflake](/power-query/connectors/snowflake) | Simba Snowflake ODBC | Snowflake ADBC |
| Spark | Simba Spark ODBC | HiveServer2 ADBC |

## Who is affected

You're affected if you use any of the [connectors transitioning to ADBC](#connectors-and-driver-changes) (such as Databricks, Snowflake, or Google BigQuery) and:

- You haven't explicitly chosen an implementation in the connection (the `Implementation` parameter isn't specified), or
- Your organization wants centralized control over whether ADBC or ODBC is the default for supported connectors.

This default applies wherever you create a connection, including semantic models, Dataflows Gen2, and paginated reports.

## How to migrate

You can migrate in three ways, ordered by how much control you want:

- [Per-connection opt-in](#per-connection-opt-in): Add `Implementation="2.0"` to individual connections to validate ADBC at your own pace.
- [Tenant setting](#tenant-setting): Set the organization-wide default through the Admin portal.
- [Workspace override](#workspace-override): Override the tenant default at the workspace level for side-by-side validation.

### Per-connection opt-in

You can opt in to ADBC by adding `Implementation="2.0"` to supported connections. This approach lets you validate ADBC at your own pace for individual connections.

For detailed instructions on opting in per-connection for a specific connector, see the connector-specific documentation linked in the [Connectors and driver changes](#connectors-and-driver-changes) table.

### Tenant setting

Tenant admins can set the organization's default using the Admin portal setting:

**Users can connect to data sources by using Apache Arrow database connectivity (ADBC)**

- **Disabled** (default): Selects the legacy ODBC drivers as the default option.
- **Enabled**: Selects the new ADBC drivers as the default option.

This setting also controls the **Test Connection** behavior for each connection type inside the tenant.

### Workspace override

The tenant setting delegates to workspaces, so workspace admins can override the default and compare behaviors without modifying each individual connection. This approach allows side-by-side validation. For example, you can use one workspace to test ADBC defaults while keeping another workspace on ODBC defaults.

## How the implementation is chosen

If you explicitly specify the `Implementation` parameter in the connection, that value always takes precedence over the tenant or workspace defaults.

The following table shows how the driver is selected:

| Condition | Driver used |
| --- | --- |
| `Implementation="2.0"` | ADBC |
| `Implementation` not specified and workspace setting is **On** | ADBC |
| `Implementation="1.0"` | ODBC |
| `Implementation` not specified and workspace setting is **Off** | ODBC |

## Recommended migration checklist

1. Pick a pilot workspace and enable ADBC there first using the workspace override to validate key datasets and refresh scenarios.
1. For any critical connections you want to validate immediately, opt in per-connection with `Implementation="2.0"`.
1. Once validation is complete, decide whether to enable ADBC by default at the tenant level.

## Key dates

- **July 2026 (planned)**: Broad rollout of the tenant setting begins. Workspace behavior inherits this setting and can be overridden by workspace admins where supported.
- **August 2026 (planned)**: Microsoft plans to begin enabling the tenant setting by default in phases, subject to rollout readiness.
- **Late Q3 to early Q4 2026 (planned)**: Microsoft plans to begin removing ODBC drivers from the service, subject to rollout readiness. If you need to stay on ODBC (`Implementation="1.0"` or workspace setting **Off**), you must use a gateway to continue running queries with ODBC.
- **Spring 2027 (planned)**: The ODBC drivers referenced in this article are planned to no longer ship with Power BI Desktop or the gateway.

Before enforcement milestones, Microsoft plans to provide advance notice so customers can complete migration and validation activities.

## Related content

- [Databricks connector](/power-query/connectors/databricks)
- [Azure Databricks connector](/power-query/connectors/databricks-azure)
- [Google BigQuery connector](/power-query/connectors/google-bigquery)
- [Google BigQuery (Microsoft Entra ID) connector](/power-query/connectors/google-bigquery-aad)
- [Impala connector](/power-query/connectors/impala-database)
- [Snowflake connector](/power-query/connectors/snowflake)
