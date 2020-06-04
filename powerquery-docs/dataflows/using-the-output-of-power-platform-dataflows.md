# Using the output of Power Platform Dataflows from other Power Query experiences

You can use the output of Power Platform dataflows from Power Query experience in other places. For example, Using the Power BI Desktop, or even in another dataflow, you can get data from the output of a dataflow. In this article, you will learn about it.

## Power BI Get Data from dataflows

If you are using Power BI as the data analysis tool, you can Get Data from Power Platform or Power BI dataflows by choosing the option as part of the get data experience.

![Get Data from Power BI Desktop](C:\Users\reza_\OneDrive - Microsoft\Dataflow Docs\03\GetDatafromDataflow.png)

when you get data from a dataflow, the data will be imported into the Power BI dataset, and the refresh of that requires a scheduled refresh process on the Power BI dataset in the service.

### DirectQuery from dataflows

Dataflows are also supporting the DirectQuery connection. If the size of the data is too big, that you don't want to import it into the Power BI dataset, you can create a DirectQuery connection, which won't copy the data into the Power BI dataset. The tables in the Power BI dataset that gets their data from a DirectQuery sourced dataflow, don't need scheduled refresh, because their data will be fetched live from the dataflow.

In order to use the DirectQuery for the dataflows, you need to enable the compute engine on your premium capacity, and then refresh the dataflow before it can be consumed in DirectQuery mode. You can read more about this news [here](https://powerbi.microsoft.com/blog/power-bi-dataflows-direct-query-support/).

![Premium capacity settings for DirectQuery to the dataflow](https://docs.microsoft.com/en-us/power-bi/transform-model/media/service-dataflows-enhanced-compute-engine/enhanced-compute-engine-01.png)

## Dataflows Get Data from dataflows

If you are using the output of a dataflow inside another dataflow, then you can choose that when you get data from the Power Query editor online;

![Get Data from dataflow](https://docs.microsoft.com/en-us/data-integration/dataflows/media/dataflows-linked-entities/linked-entities-03.png)

The process of getting data from the output of another dataflow, creates a [linked entity](https://docs.microsoft.com/data-integration/dataflows/dataflows-linked-entities). Linked Entities have a refresh logic based on weather the source and the destination dataflow are in the same workspace or not, read more about the refresh process of linked entities [here](https://docs.microsoft.com/data-integration/dataflows/dataflows-linked-entities).

## Abstraction of the Data Transformation

When you use the output of a dataflow in other environments such as Power BI, this will create an abstraction between the data transformation layer and the rest of the data model. This abstraction is important, because it creates a multi-developer architecture framework, in which the Power Query developer can focus on building the data transformations, and the data modeler can do the rest of the modeling.

## Next Steps

Below articles are providing more details about related topics;

- [Creating and using dataflows in Power BI](https://docs.microsoft.com/en-us/power-bi/service-dataflows-create-use
  )
- [Link entities between dataflows in Power BI](https://docs.microsoft.com/en-us/power-bi/service-dataflows-linked-entities
  )
- [Connect to data created by Power BI dataflows in Power BI Desktop (Beta)](https://docs.microsoft.com/en-us/power-bi/desktop-connect-dataflows
  )
- [Create and use dataflows in the Power Platform](https://docs.microsoft.com/en-us/data-integration/dataflows/dataflows-integration-overview
  )
- [Link entities between dataflows (Power Platform)](https://docs.microsoft.com/en-us/data-integration/dataflows/dataflows-linked-entities
  )

