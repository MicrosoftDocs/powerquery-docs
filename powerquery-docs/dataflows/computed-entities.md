---
title: Creating computed entities in dataflows
description: Learn how to create computed entities in dataflows
author: bensack
ms.topic: conceptual
ms.date: 1/6/2023
ms.author: bensack
---
# Creating computed entities in dataflows

You can perform *in-storage computations* when using dataflows with a Power BI Premium subscription. This lets you do calculations on your existing dataflows, and return results that enable you to focus on report creation and analytics. 

![Computed entities in Power BI Premium.](media/computed-entities/computed-entities-premium-00.png)

To perform in-storage computations, you first must create the dataflow and bring data into that Power BI dataflow storage. After you have a dataflow that contains data, you can create *computed entities*, which are entities that do in-storage computations.

There are two ways you can connect dataflow data to Power BI:

* [Using self-service authoring of a dataflow](/power-bi/service-dataflows-create-use)
* Using an external dataflow

The following sections describe how to create computed entities on your dataflow data.

## How to create computed entities

After you have a dataflow with a list of entities, you can perform calculations on those entities.

In the dataflow authoring tool in the Power BI service, select **Edit entities**. Then right-click the entity you want to use as the basis for your computed entity and on which you want to perform calculations. On the shortcut menu, select **Reference**.

For the entity to be eligible as a computed entity, **Enable load** must be selected, as shown in the following image. Right-click the entity to display this shortcut menu.

![Select Enable load in the shortcut menu.](media/computed-entities/computed-entities-premium-01.png)

By selecting **Enable load**, you create a new entity whose source is the referenced entity. The icon changes to the **computed** icon, as shown in the following image.

![Computed entity in Power BI Premium.](media/computed-entities/computed-entities-premium-00.png)

Any transformation you do on this newly created entity will be run on the data that already resides in Power BI dataflow storage. That means that the query won't run against the external data source from which the data was imported (for example, the SQL database from which the data was pulled).

### Example use cases

What kind of transformations can be done with computed entities? Any transformation that you usually specify by using the transformation user interface in Power BI, or the M editor, are all supported when performing in-storage computation.

Consider the following example. You have an Account entity that contains the raw data for all the customers from your Dynamics 365 subscription. You also have ServiceCalls raw data from the service center, with data from the support calls that were performed from the different accounts on each day of the year.

Imagine you want to enrich the Account entity with data from ServiceCalls.

First you would need to aggregate the data from the ServiceCalls to calculate the number of support calls that were done for each account in the last year.

![Aggregating the data from the Service Calls by .](media/computed-entities/computed-entities-premium-02.png)

Next, you merge the Account entity with the ServiceCallsAggregated entity to calculate the enriched **Account** table.

![Merging the Account entity with the ServiceCallsAggregated entity.](media/computed-entities/computed-entities-premium-03.png)

Then you can see the results, shown as EnrichedAccount in the following image.

![Results of a computed entity in Power BI Premium.](media/computed-entities/computed-entities-premium-04.png)

And that's it&mdash;the transformation is done on the data in the dataflow that resides in your Power BI Premium subscription, not on the source data.

## Considerations and limitations

It's important to note that if you remove the workspace from Power BI Premium capacity, the associated dataflow will no longer be refreshed.

When working with dataflows specifically created in an organization's Azure Data Lake Storage account, linked entities and computed entities only work properly when the entities reside in the same storage account. More information: [Connect Azure Data Lake Storage Gen2 for dataflow storage](/power-bi/service-dataflows-connect-azure-data-lake-storage-gen2)

Linked entities are only available for dataflows created in Power BI and Power Apps. As a best practice, when doing computations on data joined by on-premises and cloud data, create a new entity to perform such computations. This provides a better experience than using an existing entity for computations, such as an entity that is also querying data from both sources and doing in-storage transformations.

## See also

* [Computed entity scenarios and use cases](computed-entities-scenarios.md)

This article described computed entities and dataflows. Here are some more articles that might be useful:

* [Self-service data prep in Power BI](create-use.md)
* [Using incremental refresh with dataflows](incremental-refresh.md)
* [Connect to data sources for dataflows](data-sources.md)
* [Link entities between dataflows](linked-entities.md)

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
