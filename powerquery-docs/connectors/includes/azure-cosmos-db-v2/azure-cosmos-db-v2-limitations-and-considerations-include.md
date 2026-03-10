---
title: Include file for the Limitations and considerations section of the Power Query Azure Cosmos Db V2 connector documentation
description: Include file for the Limitations and considerations section of the Power Query Azure Cosmos Db V2 connector documentation
ms.reviewer: whhender
ms.date: 03/10/2026
ms.topic: include
---

* For partitioned Cosmos DB containers, a SQL query with an aggregate function is passed down to Cosmos DB if the query also contains a filter (WHERE clause) on the Partition Key. If the aggregate query doesn't contain a filter on the Partition Key, the connector performs the aggregation.

* The connector doesn't pass down an aggregate function if it's called upon after TOP or LIMIT is applied. Cosmos DB processes the TOP operation at the end
when processing a query. For example, in the following query, TOP is applied in the subquery, while the aggregate function is applied on top of that result set:

   `SELECT COUNT(1) FROM (SELECT TOP 4 * FROM EMP) E`

* If DISTINCT is provided in an aggregate function, the connector doesn't pass the aggregate function down to Cosmos DB if a DISTINCT clause is provided in an aggregate function. When present in an aggregate function, the Cosmos DB SQL API doesn't support DISTINCT.

* For the SUM aggregate function, Cosmos DB returns undefined as the result set if any of the arguments in SUM are string, boolean, or null. However, if there are null values, the connector passes the query to Cosmos DB in such a way that it asks the data source to replace a null value with zero as part of the SUM calculation.

* For the AVG aggregate function, Cosmos DB returns undefined as result set if any of the arguments in SUM are string, boolean, or null. The connector exposes a connection property to disable passing down the AVG aggregate function to Cosmos DB in case this default Cosmos DB behavior needs to be overridden. When AVG passdown is disabled, it isn't passed down to Cosmos DB, and the connector handles performing the AVG aggregation operation itself. For more information, go to "Enable AVERAGE function Passdown" in [Advanced options](#advanced-options).

* Azure Cosmos DB Containers with large partition key aren't currently supported in the Connector.

* Aggregation passdown is disabled for the following syntax due to server limitations:

  * When the query isn't filtering on a partition key or when the partition key filter uses the OR operator with another predicate at the top level in the WHERE clause.

  * When the query has one or more partition keys appear in an IS NOT NULL clause in the WHERE clause.

* The V2 connector doesn't support complex data types such as arrays, objects, and hierarchical structures. We recommend the [Fabric Mirroring for Azure Cosmos DB](/fabric/database/mirrored-database/azure-cosmos-db) feature for those scenarios.
  
* The V2 connector uses sampling of the first 1,000 documents to come up with the inferred schema. It's not recommended for schema evolution scenarios when only part of the documents are updated. As an example, a newly added property to one document in a container with thousands of documents might not be included in the inferred schema. We recommend the [Fabric Mirroring for Azure Cosmos DB](/fabric/database/mirrored-database/azure-cosmos-db) feature for those scenarios.
  
* Currently the V2 connector doesn't support non-string values in object properties.
  
* Filter passdown is disabled for the following syntax due to server limitations:

  * When the query containing one or more aggregate columns is referenced in the WHERE clause.
