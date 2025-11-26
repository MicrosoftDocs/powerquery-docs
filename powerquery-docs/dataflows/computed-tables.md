---
title: Creating computed tables in dataflows
description: Learn how to create computed tables in dataflows
author: Luitwieler
ms.topic: concept-article
ms.date: 6/13/2023
ms.author: jeluitwi
ms.subservice: dataflows
---
# Creating computed tables in dataflows

You can perform *in-storage computations* when using dataflows with a Power BI Premium subscription. This lets you do calculations on your existing dataflows, and return results that enable you to focus on report creation and analytics.

:::image type="content" source="media/computed-tables/computed-table.png" alt-text="Screenshot emphasizing the computed tables in Power BI Premium.":::

To perform in-storage computations, you first must create the dataflow and bring data into that Power BI dataflow storage. After you have a dataflow that contains data, you can create *computed tables*, which are tables that do in-storage computations.

There are two ways you can connect dataflow data to Power BI:

* [Using self-service authoring of a dataflow](/power-bi/service-dataflows-create-use)
* Using an external dataflow

The following sections describe how to create computed tables on your dataflow data.

## How to create computed tables

After you have a dataflow with a list of tables, you can perform calculations on those tables.

In the dataflow authoring tool in the Power BI service, select **Edit tables**. Then right-click the table you want to use as the basis for your computed table and on which you want to perform calculations. On the shortcut menu, select **Reference**.

For the table to be eligible as a computed table, **Enable load** must be selected, as shown in the following image. Right-click the table to display this shortcut menu.

:::image type="content" source="media/computed-tables/computed-table-enable-load.png" alt-text="Screenshot of the query's shortcut menu with enable load selected.":::

By selecting **Enable load**, you create a new table whose source is the referenced table. The icon changes to the **computed** icon, as shown in the following image.

:::image type="content" source="media/computed-tables/computed-icon.png" alt-text="Screenshot of the computed table with the computed icon emphasized.":::

Any transformation you do on this newly created table will be run on the data that already resides in Power BI dataflow storage. That means that the query won't run against the external data source from which the data was imported (for example, the SQL database from which the data was pulled).

### Example use cases

What kind of transformations can be done with computed tables? Any transformation that you usually specify by using the transformation user interface in Power BI, or the M editor, are all supported when performing in-storage computation.

Consider the following example. You have an Account table that contains the raw data for all the customers from your Dynamics 365 subscription. You also have ServiceCalls raw data from the service center, with data from the support calls that were performed from the different accounts on each day of the year.

Imagine you want to enrich the Account table with data from ServiceCalls.

First you would need to aggregate the data from the ServiceCalls to calculate the number of support calls that were done for each account in the last year.

:::image type="content" source="media/computed-tables/computed-tables-premium-02.png" alt-text="Screenshot of the Group by dialog aggregating the data from the service calls by account ID." lightbox="media/computed-tables/computed-tables-premium-02.png":::

Next, you merge the Account table with the ServiceCallsAggregated table to calculate the enriched **Account** table.

:::image type="content" source="media/computed-tables/computed-tables-premium-03.png" alt-text="Screenshot of the Merge dialog merging the account table with the ServiceCallsAggregated table." lightbox="media/computed-tables/computed-tables-premium-03.png":::

Then you can see the results, shown as EnrichedAccount in the following image.

:::image type="content" source="media/computed-tables/computed-tables-premium-04.png" alt-text="Screenshot showing the results of a computed table in Power BI Premium." lightbox="media/computed-tables/computed-tables-premium-04.png":::

And that's it&mdash;the transformation is done on the data in the dataflow that resides in your Power BI Premium subscription, not on the source data.

## Considerations and limitations

It's important to note that if you remove the workspace from Power BI Premium capacity, the associated dataflow will no longer be refreshed.

When working with dataflows specifically created in an organization's Azure Data Lake Storage account, linked tables and computed tables only work properly when the tables reside in the same storage account. More information: [Connect Azure Data Lake Storage Gen2 for dataflow storage](/power-bi/service-dataflows-connect-azure-data-lake-storage-gen2)

Linked tables are only available for dataflows created in Power BI and Power Apps. As a best practice, when doing computations on data joined by on-premises and cloud data, create a new table to perform such computations. This provides a better experience than using an existing table for computations, such as an table that is also querying data from both sources and doing in-storage transformations.

## See also

* [Computed table scenarios and use cases](computed-tables-scenarios.md)

This article described computed tables and dataflows. Here are some more articles that might be useful:

* [Self-service data prep in Power BI](create-use.md)
* [Using incremental refresh with dataflows](incremental-refresh.md)
* [Connect to data sources for dataflows](data-sources.md)
* [Link tables between dataflows](linked-tables.md)

The following links provide additional information about dataflows in Power BI and other resources:

* [Create and use dataflows in Power BI](/power-bi/service-dataflows-create-use)
* [Using dataflows with on-premises data sources](/power-bi/service-dataflows-on-premises-gateways)
* [Developer resources for Power BI dataflows](/power-bi/service-dataflows-developer-resources)
* [Configure workspace dataflow settings (Preview)](/power-bi/service-dataflows-configure-workspace-storage-settings)
* [Add a CDM folder to Power BI as a dataflow (Preview)](/power-bi/service-dataflows-add-cdm-folder)
* [Connect Azure Data Lake Storage Gen2 for dataflow storage (Preview)](/power-bi/service-dataflows-connect-azure-data-lake-storage-gen2)

For more information about Power Query and scheduled refresh, you can read these articles:

* [Query overview in Power BI Desktop](/power-bi/desktop-query-overview)
* [Configuring scheduled refresh](/power-bi/refresh-scheduled-refresh)

For more information about Common Data Model, you can read its overview article:

* [Common Data Model](/powerapps/common-data-model/overview)
