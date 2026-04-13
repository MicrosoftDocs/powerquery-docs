---
title: Include file for the Limitations and considerations section of the Power Query Common Data Service Legacy connector documentation
description: Include file for the Limitations and considerations section of the Power Query Common Data Service Legacy connector documentation
ms.date: 03/10/2026
ms.topic: include
---

### Dataverse OData API performance and throttling limits

For information about OData API performance and throttling limits for Dataverse connections, go to [Requests limits and allocations](/power-platform/admin/api-request-limits-allocations). These limitations apply to both the Common Data Source (Legacy) connector (which uses the OData API as an implementation detail) and the [OData Feed](/power-query/connectors/odata-feed) connector when accessing the same endpoint.

### Table retrieval rate

As a guideline, most default tables are retrieved at a rate of approximately 500 rows per second using the Common Data Service (Legacy) connector. Take this rate into account when deciding whether you want to connect to Dataverse or export to data lake. If you require faster retrieval rates, consider using the Export to data lake feature or the Dataverse connector. More information: [Alternative Dataverse connections](/power-query/connectors/common-data-service-legacy#alternative-dataverse-connections)

### Alternative Dataverse connections

There are several alternative ways of extracting and migrating data from Dataverse:

* Use the **Azure Synapse Link** feature in Power Apps to extract data from Dataverse into Azure Data Lake Storage Gen2, which can then be used to run analytics. For more information about the Azure Synapse Link feature, go to [What is Azure Synapse Link for Dataverse?](/powerapps/maker/data-platform/export-to-data-lake).

* Use the OData connector to move data in and out of Dataverse. For more information on how to migrate data between Dataverse environments using the dataflows OData connector, go to [Migrate data between Dataverse environments using the dataflows OData connector](/powerapps/developer/common-data-service/cds-odata-dataflows-migration).

* Use the Dataverse connector to access read-only data in Dataverse. For more information about this feature, go to [View table data in Power BI Desktop](/powerapps/maker/data-platform/view-entity-data-power-bi).

> [!NOTE]
> Both the Dataverse connector and the OData APIs are meant to serve analytical scenarios where data volumes are relatively small. The recommended approach for bulk data extraction is “Azure Synapse Link”.

### Querying display columns must include the field in the query

When using this connector, if you're including _\<field>_`display` columns, you must include _\<field>_ in the query as well, or the _\<field>_`_display` column might be null. For example:

```powerquery-m
Table.SelectColumns(#"Navigation 1", {"statuscode", "statuscode_display"})
```

If `statuscode` isn't included, `statuscode_display` might be null and error out.

### Accessing large semantic models

Power BI semantic models contained in Dataverse can be very large. If you're using the Power Query [Dataverse](/power-query/connectors/dataverse) connector, any specific query that accesses the model must return less than 80 MB of data. So you might need to query the data multiple times to access all of the data in the model. Using multiple queries can take a considerable amount of time to return all the data.

If you're using the Common Data Service (Legacy) connector, you can use a single query to access all of the data in the semantic model. This connector works differently and returns the result in “pages” of 5 K records. Although the Common Data Service (Legacy) connector is more efficient in returning large amounts of data, it can still take a significant amount of time to return the result.

Instead of using these connectors to access large semantic models, we recommend that you use [Azure Synapse Link](/powerapps/maker/data-platform/export-to-data-lake) to access large models. Using Azure Synapse Link is even more efficient that either the Power Query Dataverse or Common Data Service (Legacy) connectors, and it's specifically designed around data integration scenarios.
