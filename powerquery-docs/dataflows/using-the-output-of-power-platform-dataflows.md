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

You can use the output of Power Platform dataflows from the Power Query experience in other places. For example, using the Power BI Desktop, or even in another dataflow, you can get data from the output of a dataflow. In this article, you'll learn how to do so.

## Power BI Get Data from dataflows

If you're using Power BI as the data analysis tool, you can Get Data from Power Platform or Power BI dataflows by choosing the option as part of the get data experience.

![Get Data from Power BI Desktop](media/GetDatafromDataflow.png)

When you get data from a dataflow, the data will be imported into the Power BI dataset. The data then must be refreshed, which requires a scheduled refresh process on the Power BI dataset in the service.

### DirectQuery from dataflows

Dataflows also support a DirectQuery connection. If the size of the data is so large that you don't want to import all of it into the Power BI dataset, you can create a DirectQuery connection. DirectQuery won't copy the data into the Power BI dataset. The tables in the Power BI dataset that get their data from a DirectQuery sourced dataflow don't need a scheduled refresh, because their data will be fetched live from the dataflow.

To use DirectQuery for the dataflows, you need to enable the compute engine on your premium capacity, and then refresh the dataflow before it can be consumed in DirectQuery mode. For more information, see [Power BI Dataflows Direct Query Support](https://powerbi.microsoft.com/blog/power-bi-dataflows-direct-query-support/).

![Premium capacity settings for DirectQuery to the dataflow](https://docs.microsoft.com/power-bi/transform-model/media/service-dataflows-enhanced-compute-engine/enhanced-compute-engine-01.png)

## Dataflows Get Data from dataflows

If you're using the output of a dataflow inside another dataflow, then you can choose that when you get data from the Power Query editor online.

![Get Data from dataflow](https://docs.microsoft.com/data-integration/dataflows/media/dataflows-linked-entities/linked-entities-03.png)

The process of getting data from the output of another dataflow, creates a [linked entity](https://docs.microsoft.com/data-integration/dataflows/dataflows-linked-entities). Linked entities have refresh logic based on whether the source and the destination dataflow are in the same workspace or not. To learn more about the refresh process of linked entities, see [Link entities between dataflows](https://docs.microsoft.com/data-integration/dataflows/dataflows-linked-entities).

## Abstraction of the Data Transformation

When you use the output of a dataflow in other environments such as Power BI, this will create an abstraction between the data transformation layer and the rest of the data model. This abstraction is important because it creates a multi-developer architecture framework, in which the Power Query developer can focus on building the data transformations, and the data modeler can do the rest of the modeling.

## Next Steps

The following articles provide more details about related articles.

- [Creating and using dataflows in Power BI](https://docs.microsoft.com/power-bi/service-dataflows-create-use)
- [Link entities between dataflows in Power BI](https://docs.microsoft.com/power-bi/service-dataflows-linked-entities)
- [Connect to data created by Power BI dataflows in Power BI Desktop (Beta)](https://docs.microsoft.com/power-bi/desktop-connect-dataflows)
- [Create and use dataflows in the Power Platform](https://docs.microsoft.com/data-integration/dataflows/dataflows-integration-overview)
- [Link entities between dataflows (Power Platform)](https://docs.microsoft.com/data-integration/dataflows/dataflows-linked-entities)

