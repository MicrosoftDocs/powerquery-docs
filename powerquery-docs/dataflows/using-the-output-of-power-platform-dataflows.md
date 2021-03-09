---
title: Using the output of Power Platform dataflows from other Power Query experiences
description: Using the output of Microsoft Power Platform dataflows from other Power Query experiences.
author: radacad

ms.service: powerquery
ms.topic: conceptual
ms.date: 05/25/2020
ms.author: bezhan

LocalizationGroup: Data from files
---

# Using the output of Microsoft Power Platform dataflows from other Power Query experiences

You can use the output of Microsoft Power Platform dataflows from the Power Query experience in other products. For example, in Power BI Desktop&mdash;or even in another dataflow&mdash;you can get data from the output of a dataflow. In this article, you'll learn how to do so.

## Get data from dataflows in Power BI

If you're using Power BI for data analysis, you can get data from Power Platform dataflows or Power BI dataflows by choosing those data sources.

![Get data from Power BI Desktop](media/GetDatafromDataflow.png)

When you get data from a dataflow, the data is imported into the Power BI dataset. The dataset then needs to be refreshed. You can choose whether to perform a one-time refresh or an automatic refresh on a schedule you specify. Scheduled refreshes for the dataset can be configured in Power BI.

### DirectQuery from dataflows

Power BI dataflows also support a DirectQuery connection. If the size of the data is so large that you don't want to import all of it into the Power BI dataset, you can create a DirectQuery connection. DirectQuery won't copy the data into the Power BI dataset. The tables in the Power BI dataset that get their data from a DirectQuery-sourced dataflow don't need a scheduled refresh, because their data will be fetched live from the dataflow.

To use DirectQuery for the dataflows, you need to enable the compute engine on your Power BI Premium capacity, and then refresh the dataflow before it can be consumed in DirectQuery mode. For more information, go to [Power BI Dataflows DirectQuery Support](https://powerbi.microsoft.com/blog/power-bi-dataflows-direct-query-support/).

![Premium capacity settings for DirectQuery to the dataflow](/power-bi/transform-model/media/service-dataflows-enhanced-compute-engine/enhanced-compute-engine-01.png)

## Dataflows can get data from other dataflows

If you'd like to reuse data created by one dataflow in another dataflow, you can do so by using the dataflow connector in the Power Query editor experience when you create the new dataflow.

![Get data from a dataflow](/data-integration/dataflows/media/dataflows-linked-entities/linked-entities-03.png)

When getting data from the output of another dataflow, a [linked entity](/data-integration/dataflows/dataflows-linked-entities) will be created. Linked entities provide a way to make data created in an upstream dataflow available in a downstream dataflow, without copying the data to the downstream dataflow. Because linked entities are just pointers to entities created in other dataflows, they're kept up to date by the refresh logic of the upstream dataflow. If both dataflows reside in the same workspace or environment, those dataflows will be refreshed together, to keep data in both dataflows always up to date. More information: [Link entities between dataflows](/data-integration/dataflows/dataflows-linked-entities)

## Separating data transformation from data consumption

When you use the output of a dataflow in other dataflows or datasets, you can create an abstraction between the data transformation layer and the rest of the data model. This abstraction is important because it creates a multi-role architecture, in which the Power Query customer can focus on building the data transformations, and data modelers can focus on data modeling.

## Next Steps

The following articles provide more details about related articles.

- [Creating and using dataflows in Power BI](/power-bi/service-dataflows-create-use)
- [Link entities between dataflows in Power BI](/power-bi/service-dataflows-linked-entities)
- [Connect to data created by Power BI dataflows in Power BI Desktop (Beta)](/power-bi/desktop-connect-dataflows)
- [Create and use dataflows in Power Platform](/data-integration/dataflows/dataflows-integration-overview)
- [Link entities between dataflows (Power Platform)](/data-integration/dataflows/dataflows-linked-entities)