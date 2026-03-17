---
title: Include file for the Limitations and considerations section of the Power Query Dataverse connector documentation
description: Include file for the Limitations and considerations section of the Power Query Dataverse connector documentation
ms.date: 03/10/2026
ms.topic: include
---

### Excel host specific

The Power Query Dataverse connector inside Excel doesn't currently support sovereign cloud clusters (for example, China, Germany, US).

### Dataverse performance and throttling limits

For information about performance and throttling limits for Dataverse connections, go to [Requests limits and allocations](/power-platform/admin/api-request-limits-allocations). These limitations apply to both the Dataverse connector and the [OData Feed](../../odata-feed.md) connector when accessing the same endpoint.

### Table retrieval rate

As a guideline, most default tables are retrieved at a rate of approximately 500 rows per second using the Dataverse connector. Take this rate into account when deciding whether you want to connect to Dataverse or export to data lake. If you require faster retrieval rates, consider using the Export to data lake feature or Tabular Data Stream (TDS) endpoint. For more information, go to [Alternative Dataverse connections](#alternative-dataverse-connections).

### Alternative Dataverse connections

There are several alternative ways of extracting and migrating data from Dataverse:

* Use the **Azure Synapse Link** feature in Power Apps to extract data from Dataverse into Azure Data Lake Storage Gen2, which can then be used to run analytics. For more information about the Azure Synapse Link feature, go to [What is Azure Synapse Link for Dataverse?](/powerapps/maker/data-platform/export-to-data-lake).

* Use the OData connector to move data in and out of Dataverse. For more information on how to migrate data between Dataverse environments using the dataflows OData connector, go to [Migrate data between Dataverse environments using the dataflows OData connector](/powerapps/developer/common-data-service/cds-odata-dataflows-migration).

> [!NOTE]
> Both the Dataverse connector and the OData APIs are meant to serve analytical scenarios where data volumes are relatively small. The recommended approach for bulk data extraction is “Azure Synapse Link”.

### SQL Server connection issue due to closed ports

When connecting with the Dataverse connector, you might encounter an **Unable to connect** error indicating that a network or instance-specific error occurred while establishing a connection to SQL Server. This error is likely caused by the TCP ports 1433 or 5558 being blocked during connection. To troubleshoot the blocked port error, go to [Blocked ports](/powerapps/developer/data-platform/dataverse-sql-query#blocked-ports).

### Using native database queries with Dataverse

You can connect to Dataverse using a custom SQL statement or a [native database query](../../../native-database-query.md). While there's no user interface for this experience, you can enter the query using the Power Query Advanced Editor. In order to use a native database query, a **Database** must be specified as the Source.

```powerquery-m
Source = CommonDataService.Database([DATABASE URL])
```

Once a database source is defined, you can specify a native query using the [Value.NativeQuery](/powerquery-m/value-nativequery) function.

```powerquery-m
myQuery = Value.NativeQuery(Source, [QUERY], null, [EnableFolding=true])
```

Altogether, the query looks like this.

```powerquery-m
let
    Source = CommonDataService.Database("[DATABASE]"),
    myQuery = Value.NativeQuery(Source, "[QUERY]", null, [EnableFolding=true])
in
    myQuery
```

Misspelling a column name might result in an error message about query folding instead of missing column.

### Accessing large amounts of Dataverse data

Queries on Dataverse tables can return large amounts of data. If you're using the Power Query Dataverse connector, any specific query that accesses the model has a fixed five (5) minute timeout irrespective of the size of the data. For more information, go to [limitations](/power-apps/developer/data-platform/dataverse-sql-query#limitations). So you might need to query the data multiple times to access all of the data in the model. Using multiple queries can take a considerable amount of time to return all the data.

If you're using the [Common Data Service (Legacy)](../../common-data-service-legacy.md) connector, you can use a single query to access all of the data. This connector works differently and returns the result in "pages" of 5-K records. Although the Common Data Service (Legacy) connector is more efficient in returning large amounts of data, it can still take a significant amount of time to return the result.

Instead of using these connectors to access large amounts of Dataverse data, we recommend that you use [Azure Synapse Link](/powerapps/maker/data-platform/export-to-data-lake) to access large models. Using Azure Synapse Link is even more efficient than either the Power Query Dataverse or Common Data Service (Legacy) connectors, and is specifically designed around data integration scenarios.

### Performance issues related to relationship columns

Preview errors can occur due to a known limitation when the **Navigation Properties** feature is enabled in Dataverse.

You could see a message like this one, for example:
`Preview.Error: The type of the current preview value is too complex to display.`

To resolve this issue, similar to the SQL Server connector, there's an option available to disable navigation properties (relationship columns) in the Dataverse connector to improve performance. This option can be set in the [advanced options](#connect-using-advanced-options) available in Power Query Online, or it can be set using the `CreateNavigationProperties=false` parameter in the Dataverse connector function.

```powerquery-m
 Source = CommonDataService.Database("{crminstance}.crm.dynamics.com",[CreateNavigationProperties=false]),
```
