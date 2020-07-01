# Using the output of Power Platform Dataflows from other Azure Data workloads

Depends on the storage for the output of the Power Platform dataflows, you can use that output in other Azure services. This article explains how it works.

## The benefits of working with the output of Power Platform dataflows

Using the Power Platform dataflows, you can re-shape the data, clean it and prepare it for further analysis and consumption. There are many other Azure data services that work with a data as an input and provide actions. 

- Azure Machine Learning can consume the output of dataflows and use it for machine learning scenarios (for example; predictive analysis)
- Azure data factory can get the output of dataflows in a much larger scale combined with the data from big data sources for advanced data integration solutions.
- Azure Databricks can consume the output of dataflows for applied data science algorithms and further AI with the big data scale with Apache Spark backend.
- other Azure data services may use the output of the Power Platform dataflows to do further actions on that data.

## Dataflows with external Azure Data Lake Storage Gen 2 

If you have connected an external ADLS gen 2 storage to the Power Platform dataflows, then you can connect to it using any Azure services that have Azure Data Lake Storage Gen 2 as a source. This means many services, such as Azure Machine Learning, Azure Data Factory, Azure Databricks, Azure Analysis Services, and so on.

In any of these services, use the Azure Data Lake Storage Gen 2 as the source, and you would be able to enter the details of your storage and connect to the data in it. The data is stored in CSV format, and is readable through any of these tools and services. The screenshot below shows how the Azure Data Lake Storage Gen2 is a source option for Azure Data Factory.

![Using the output of power platform dataflows in external ADLS gen 2](media/ADFSourcedFromADLSGen2.png)

## Dataflows with Common Data Services

If you are using standard dataflows that stores the data into the Common Data Services, still you can connect to the Common Data Services from many Azure services. screenshot below shows that in Azure Data Factory the output of a dataflow from Common Data Services can be used as a source.

![Using the output of Power Platform dataflows from Common Data Services](media/ADFSourcedFromCDS.png)

## Dataflows with internal Azure Data Lake Storage Gen 2

If you are using the internal Azure Data Lake storage that is provided by the Power Platform dataflows, then that storage is exclusively limited to the Power Platform tools, and is not accessible from other Azure data workloads.



