---
title: Power Query Dataverse connector
description: Provides basic information and connection instructions, along with OData API performance information, table retrieval rate, and alternative means of connecting to Dataverse.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 2/6/2024
ms.author: dougklo
---

# Dataverse

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights |
| Authentication types | Organizational account<br/>Service principal |

> [!NOTE]
> The service principal authentication type isn't supported when using an on-premises data gateway or a virtual network (VNet) data gateway.

> [!NOTE]
>Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

You must have a Dataverse environment.

You must have read permissions to access data within tables.

To use the Dataverse connector, the **TDS endpoint** setting must be enabled in your environment. More information: [Manage feature settings](/power-platform/admin/settings-features)

To use the Dataverse connector, one of TCP ports 1433 or 5558 need to be open to connect. Port 1433 is used automatically. However, if port 1433 is blocked, you can use port 5558 instead. To enable port 5558, you must append that port number to the Dataverse environment URL, such as *yourenvironmentid.crm.dynamics.com, 5558*. More information: [SQL Server connection issue due to closed ports](#sql-server-connection-issue-due-to-closed-ports)

> [!NOTE]
> If you're using Power BI Desktop and need to use port 5558, you must create a source with the Dataverse environment URL, such as *yourenvironmentid.crm.dynamics.com,5558*, in Power Query M. More information: [Finding your Dataverse environment URL](#finding-your-dataverse-environment-url)

## Capabilities supported

* Server URL
* Import
* DirectQuery (Power BI semantic models)
* Advanced
  * Include relationship columns

## Connect to Dataverse from Power Query Desktop

> [!NOTE]
> The Power Query Dataverse connector is mostly suited towards analytics workloads, not bulk data extraction. More information: [Alternative Dataverse connections](#alternative-dataverse-connections)

To connect to Dataverse from Power Query Desktop:

1. Select the **Dataverse** option from **Get Data**. More information: [Where to get data](../where-to-get-data.md)

2. If you're connecting to this site for the first time, select **Sign in** and input your credentials. Then select **Connect**.

   :::image type="content" source="media/dataverse/sign-in.png" alt-text="Sign in to this site.":::

3. In **Navigator**, select the data you require, then either load or transform the data.

   :::image type="content" source="media/dataverse/navigator.png" alt-text="Load or transform from navigator.":::

4. If you're using Power Query from Power BI Desktop, you're asked to select either the **Import** or **DirectQuery** data connectivity mode. Then select **OK**.

   :::image type="content" source="media/dataverse/connection-settings.png" alt-text="Screenshot of Power BI Desktop connection settings with Import selected and DirectQuery not selected.":::

## Connect to Dataverse from Power Query Online

To connect to Dataverse from Power Query Online:

1. Select the **Dataverse** option in the **Choose data source** page. More information: [Where to get data](../where-to-get-data.md)

2. In the **Connect to data source** page, leave the server URL address blank. Leaving the address blank lists all of the available environments you have permission to use in the Power Query Navigator window.

   :::image type="content" source="media/dataverse/enter-url-online.png" alt-text="Enter the server URL.":::

   >[!Note]
   >If you need to use port 5558 to access your data, you'll need to load a specific environment with port 5558 appended at the end in the server URL address. In this case, go to [Finding your Dataverse environment URL](#finding-your-dataverse-environment-url) for instructions on obtaining the correct server URL address.

3. If necessary, enter an on-premises data gateway if you're going to be using on-premises data. For example, if you're going to combine data from Dataverse and an on-premises SQL Server database.

4. Sign in to your organizational account.

5. When you've successfully signed in, select **Next**.

6. In the navigation page, select the data you require, and then select **Transform Data**.

   :::image type="content" source="media/dataverse/navigator-online.png" alt-text="Navigation page open with the Application User data selected.":::

## Connect using advanced options

Power Query Online provides advanced options that you can add to your query if needed.

The following table lists the advanced options you can set in Power Query Online.

| Advanced option | Description |
| --------------- | ----------- |
| Include relationship columns | If checked, includes columns that might have relationships to other tables. If this box is cleared, you can’t see those columns. More information: [Performance issues related to relationship columns](#performance-issues-related-to-relationship-columns)|

Once you select the advanced options you require, select **Next** to connect to Dataverse.

## Finding your Dataverse environment URL

If you need to use port 5558 to connect to Dataverse, you have to find your Dataverse environment URL. Open [Power Apps](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc). In the upper right of the Power Apps page, select the environment you're going to connect to. Select the :::image type="content" source="media/common-data-service/settings-icon.png" alt-text="Settings icon."::: settings icon, and then select **Advanced settings**.

In the new browser tab that opens, copy the root of the URL. This root URL is the unique URL for your environment. The URL is in the format of https://\<*yourenvironmentid*>.crm.dynamics.com/. **Make sure you remove https:// and the trailing / from the URL before pasting it to connect to your environment.** Append port 5558 to the end of the environment URL, for example *yourenvironmentid.crm.dyamics.com,5558*.

:::image type="content" source="media/dataverse/cds-env.png" alt-text="Location of the Dataverse environment URL.":::

## When to use the Common Data Service (Legacy) connector

Dataverse is the direct replacement for the Common Data Service connector. However, there might be times when it's necessary to choose the Common Data Service (Legacy) connector instead of the [Dataverse](dataverse.md) connector:

There are certain Tabular Data Stream (TDS) data types that are supported in OData when using Common Data Service (Legacy) that aren't supported in Dataverse. The supported and unsupported data types are listed in [How Dataverse SQL differs from Transact-SQL](/powerapps/developer/data-platform/how-dataverse-sql-differs-from-transact-sql?tabs=supported).

All of these features will be added to the Dataverse connector in the future, at which time the Common Data Service (Legacy) connector will be deprecated.

More information: [Accessing large amounts of Dataverse data](#accessing-large-amounts-of-dataverse-data)

## Limitations and issues

### Excel host specific

The Power Query Dataverse connector inside Excel doesn't currently support sovereign cloud clusters (for example, China, Germany, US).

### Dataverse performance and throttling limits

For information about performance and throttling limits for Dataverse connections, go to [Requests limits and allocations](/power-platform/admin/api-request-limits-allocations). These limitations apply to both the Dataverse connector and the [OData Feed](odata-feed.md) connector when accessing the same endpoint.

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

You can connect to Dataverse using a custom SQL statement or a [native database query](../native-database-query.md). While there's no user interface for this experience, you can enter the query using the Power Query Advanced Editor. In order to use a native database query, a **Database** must be specified as the Source.

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

If you're using the [Common Data Service (Legacy)](common-data-service-legacy.md) connector, you can use a single query to access all of the data. This connector works differently and returns the result in "pages" of 5-K records. Although the Common Data Service (Legacy) connector is more efficient in returning large amounts of data, it can still take a significant amount of time to return the result.

Instead of using these connectors to access large amounts of Dataverse data, we recommend that you use [Azure Synapse Link](/powerapps/maker/data-platform/export-to-data-lake) to access large models. Using Azure Synapse Link is even more efficient than either the Power Query Dataverse or Common Data Service (Legacy) connectors, and is specifically designed around data integration scenarios.

### Performance issues related to relationship columns

Similar to the SQL Server connector, there's an option available to disable navigation properties (relationship columns) in the Dataverse connector to improve performance. This option can be set in the [advanced options](#connect-using-advanced-options) available in Power Query Online, or it can be set using the `CreateNavigationProperties=false` parameter in the Dataverse connector function.

```powerquery-m
 Source = CommonDataService.Database("{crminstance}.crm.dynamics.com",[CreateNavigationProperties=false]),
```
