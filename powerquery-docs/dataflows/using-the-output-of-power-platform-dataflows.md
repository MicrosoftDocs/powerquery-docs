---
title: Using the output of Power Platform dataflows from other Power Query experiences
description: Using the output of Power Platform dataflows from other Power Query experiences
author: radacad

ms.service: powerquery
ms.topic: conceptual
ms.date: 05/25/2020
ms.author: v-rerad

LocalizationGroup: Data from files
---

# Using the output of Power Platform dataflows from other Power Query experiences

You can use the output of Power Platform dataflows from the Power Query experience in other products. For example, using the Power BI Desktop, or even in another dataflow, you can get data from the output of a dataflow. In this article, you'll learn how to do so.

## Power BI Get Data from dataflows

If you're using Power BI as the data analysis tool, you can Get Data from Power Platform or Power BI dataflows by choosing the option as part of the get data experience.

![Get Data from Power BI Desktop](media/GetDatafromDataflow.png)

When you get data from a dataflow, the data will be imported into the Power BI dataset. The dataset then needs to be refreshed, and options are available to either perform a one time refresh or an automatic refresh on a schedule specified by you. Scheduled refresh for the dataset can be configured in the Power BI portal.

### DirectQuery from dataflows

Power BI Dataflows also support a DirectQuery connection. If the size of the data is so large that you don't want to import all of it into the Power BI dataset, you can create a DirectQuery connection. DirectQuery won't copy the data into the Power BI dataset. The tables in the Power BI dataset that get their data from a DirectQuery sourced dataflow don't need a scheduled refresh, because their data will be fetched live from the dataflow.

To use DirectQuery for the dataflows, you need to enable the compute engine on your premium capacity, and then refresh the dataflow before it can be consumed in DirectQuery mode. For more information, see [Power BI Dataflows Direct Query Support](https://powerbi.microsoft.com/blog/power-bi-dataflows-direct-query-support/).

![Premium capacity settings for DirectQuery to the dataflow](https://docs.microsoft.com/power-bi/transform-model/media/service-dataflows-enhanced-compute-engine/enhanced-compute-engine-01.png)

## Dataflows can get data from other dataflows

If you'd like to reuse data created by one dataflow in another dataflow, you can do so by using the dataflow connector in the Power Query editor experience when creating a new dataflow.

![Get Data from dataflow](https://docs.microsoft.com/data-integration/dataflows/media/dataflows-linked-entities/linked-entities-03.png)

When getting data from the output of another dataflow, a [linked entity](https://docs.microsoft.com/data-integration/dataflows/dataflows-linked-entities) will be created. Linked entities provide a way to make data created in an upstream dataflow available in a downstram dataflow, without copying the data to the downstream dataflow. Because linked entities are just pointers to entities created in other dataflows, they're kept up to date by the refresh logic of the upstream dataflow. If both dataflows reside in the same workspace or environment, those dataflows will refresh together, to keep data in both dataflows always up to date. To learn more about the refresh process of linked entities, see [Link entities between dataflows](https://docs.microsoft.com/data-integration/dataflows/dataflows-linked-entities).

## Separating data transformation from data consumption

When you use the output of a dataflow in other dataflows or datasets, you can create an abstraction between the data transformation layer and the rest of the data model. This abstraction is important because it creates a multi-role architecture, in which the Power Query customer can focus on building the data transformations, and the data modelers can focus on data modeling.

## Next Steps

The following articles provide more details about related articles.

- [Creating and using dataflows in Power BI](https://docs.microsoft.com/power-bi/service-dataflows-create-use)
- [Link entities between dataflows in Power BI](https://docs.microsoft.com/power-bi/service-dataflows-linked-entities)
- [Connect to data created by Power BI dataflows in Power BI Desktop (Beta)](https://docs.microsoft.com/power-bi/desktop-connect-dataflows)
- [Create and use dataflows in the Power Platform](https://docs.microsoft.com/data-integration/dataflows/dataflows-integration-overview)
- [Link entities between dataflows (Power Platform)](https://docs.microsoft.com/data-integration/dataflows/dataflows-linked-entities)

