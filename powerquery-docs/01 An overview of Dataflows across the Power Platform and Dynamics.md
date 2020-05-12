# An overview of Dataflows across the Power Platform and Dynamics

Dataflow is a data integration component, which is not only serving the Power BI solutions, but also helps in Power Platform solutions and Dynamics implementation. In this article, you will learn what is a dataflow, and how it can help in other platform. This article is not about creating dataflow, it is more about introducing it, and use-cases of it in real-world scenarios.

## What is a Dataflow?

Dataflow is a data integration service, it populates data from one or multiple sources, applies some data transformations on it, and stores the result into a destination. In the traditional Data Warehousing terminologies, tools such as Dataflow are often called ETL tools (stands for Extract, Transform, Load). Dataflow uses the transformation engine of Power Query. Depend on which version of the dataflow you use, the destination can be different.

### How Dataflow function?

![](C:\Users\reza_\OneDrive - Microsoft\Dataflow Docs\Images\01\Dataflow Function.png)

The diagram above shows an overall view of how the Dataflow functions. Dataflow gets data from different data sources (there more than 80 data sources supported already). Dataflow transforms the data using the Power Query engine. And finally it stores the output in a destination, which can be Azure Data Lake gen 2, or Common Data Services.

### Dataflows runs on the cloud

Dataflow is a cloud-based service, it runs fully on cloud. However, to access some of the data sources which might be located on-premises, it can use the on-premises gateway application.

![](C:\Users\reza_\OneDrive - Microsoft\Dataflow Docs\Images\01\Dataflow Cloud.png)

The data transformation compute of dataflow runs on the cloud, and the destination is always cloud: Azure Data Lake gen 2, or CDS both are cloud-based data storage systems. The source, however, can be on-premises or cloud-based. If it is on-premises, Dataflow uses an on-premises data gateway connection to get data from that source.

### Dataflow uses the Powerful Transformation Engine, but yet, Simple to work with

Power Query is the data transformation engine used in the dataflow. This engine not only is strong enough to support many advanced transformation, it is also leveraging a very simple, yet powerful graphical user interface called Power Query Editor. Using the dataflow enables developers to use this editor simply to develop their data integration solutions.

![](C:\Users\reza_\OneDrive - Microsoft\Dataflow Docs\Images\01\Power Query Editor.png)

### Dataflow Integration with Power Platform and Dynamics

Because dataflow stores the result into Azure Data Lake gen 2, or CDS, other Power Platform services can interact with the data produced by dataflow.

![](C:\Users\reza_\OneDrive - Microsoft\Dataflow Docs\Images\01\Dataflow Power Platform.png)

Power BI, Power Apps, Power Automate, Power Virtual Agent, and Dynamics can interact with the CDS or Azure Data Lake gen 2 to get the data produced by the dataflow.



## Benefits of Dataflow

The scenarios you have read above, are good examples of how the dataflow can be beneficial in a real-world use-cases. However, for a better understanding of benefits. here listed some of those;

- Dataflow is decoupling the data transformation layer.
- The data transformation code can be only in one place; Dataflow. rather than spread in multiple files.
- Dataflow developer would need only Power Query skills, which can then create a multi-developer environment.
- Dataflow is product-agnostic. It is not a component of Power BI only, it can be used in other tools and services.
- It provides a powerful data transformation graphical interface using Power Query.
- It is running fully on the cloud. No extra infrastructure is needed.
- There are multiple ways of working with it, using different licenses for Power BI and Power Platform.
- Dataflow, although, capable of advanced transformation, it is a simple service to use for data analysts, even without having developer or IT background.
- 

## Use-Case Scenarios for Dataflow

Dataflow can be used in many purposes. In below, you'll read a few examples of some of the common use-cases of it.

### Data Migration from Legacy Systems

Consider this scenario: In an organization, the decision has been made to use Power Apps for the new user interface experience rather than the old on-premises system. The Power Apps is using Common Data Services as the main data storage system, because it can also uses AI functionalities that AI builder provides for the object detection, and etc. The current data in the existing on-premises system, can be migrated into the CDS using Dataflow.

### Using it to Build a Data Warehouse

Dataflow can be used as the replacement of other ETL tools to build a data warehouse. In an organization, for example, the Data engineers of a company decide to use Dataflow to build the star-schema designed data warehouse including fact and dimension tables in Azure data lake gen 2, and then Power BI is used to generate reports and dashboards by getting data from the dataflows.

![](https://i2.wp.com/radacad.com/wp-content/uploads/2019/01/2019-01-21_06h49_16.png)

### Re-Use of Tables Across Multiple Solutions

If there are multiple Power BI solutions that are using a same transformed version of a table, then that table can be produced using a dataflow, and then Power BI files can use the result of the transformation. This is a powerful Power BI implementation architecture that avoids duplicates of the Power Query code, and reduces the maintenance costs of the data integration layer.

![](https://i1.wp.com/radacad.com/wp-content/uploads/2019/01/2019-01-21_06h36_16.png)



## Read More

Links below provide further study materials for dataflows;

- [Create and use dataflows in the Power Platform](https://docs.microsoft.com/en-us/data-integration/dataflows/dataflows-integration-overview)
- [Creating and using dataflows in Power BI](https://docs.microsoft.com/en-us/power-bi/service-dataflows-create-use)