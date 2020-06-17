# What is the CDM storage structure for Analytical Dataflows?

Analytical dataflow stores data into the Azure Data Lake storage. The structure in which the dataflow stores the data is in the standard of the common data model. In this article, you will learn the structure of this storage behind the scene.

## When the dataflow is analytical; storage needs an structure

If the [dataflow is standard](https://github.com/MicrosoftDocs/powerquery-docs-pr/blob/reza-dataflows/powerquery-docs/dataflows/understanding-differences-between-analytical-standard-dataflows.md), then the data is stored in the Common Data Services. Common Data Services is like a database system; It has the concept of tables, views, and so on. The Common Data Services is a structured data storage option for the standard dataflow.

However, when the dataflow is [analytical](https://github.com/MicrosoftDocs/powerquery-docs-pr/blob/reza-dataflows/powerquery-docs/dataflows/understanding-differences-between-analytical-standard-dataflows.md), the data is stored in Azure Data Lake storage. The structure that the data is stored is in folders and subfolders of workspaces (or environments), dataflows, and entities under the dataflow. This structure follows the standards defined for the common data model.

![Analytical dataflow stores the data in the CDM structure](media/AnalyticalDataflowStoresDatainCDMFormat.png)

## What is the CDM Storage Structure

CDM, which stands for [Common Data Model](https://docs.microsoft.com/en-us/common-data-model/), is a metadata structure defined to bring conformity and consistency of using the data across multiple platforms. CDM defines how the data is stored. CDM is not data storage. In fact, is it the way that the data is stored and defined.

Inside the Azure Data Lake Storage, the data is stored inside folders. Each folder represents a workspace or environment. Under that folder, there will be subfolders for each dataflow.

![workspace folder structure](media/foldersWorkspaceAndDataflows.png)

## What's Inside a dataflow Folder?

Inside each dataflow folder, there are sub-folders for each entity, and a metadata file named as model.json. 

![what's inside a dataflow folder](https://docs.microsoft.com/en-us/common-data-model/media/cdm-folder.png)

### The metadata file: Model.json

The "model.json" file is the metadata definition of the dataflow. This is the one file that contains all the metadata about the dataflow. It includes a list of entities, their transformations, the columns and their data types in each entity, the relationship between entities, and so on. This is the file that you can export from a dataflow easily, even if you don't have access to the CDM folder structure.

![Export model.json file from a dataflow](media/dataflowExportJson.png)

This JSON file is the file that you can use to migrate (or import) your dataflow into another workspace or environment;

![Migrate dataflow into another workspace or environment](media/dataflowMigrateToAnotherWorkSpace.png)

Read [this article](https://docs.microsoft.com/en-us/common-data-model/model-json) to learn what the model.json metadata file exactly includes.

### Data files

In addition to the metadata file, inside the dataflow folder, there are other subfolders. Dataflow stores the data of each entity inside a sub-folder with the entity's name on it, and it might split the data stored in CSV format into multiple CSV files under that folder.

## How can you see or access CDM folders?

If you are using dataflows with the internal Azure Data Lake storage provided by Power BI or Power Platform, you won't be able to see those folders. Your only way of seeing the content of the CDM folders is to use Get Data from Power BI or Power Platform dataflows in the Power BI Desktop, or from other dataflows, get data from dataflow.

![Connect to the analytical dataflow's data](media/GetdatafromAnalyticalDataflow.png)



[This article](https://docs.microsoft.com/en-us/power-bi/transform-model/service-dataflows-azure-data-lake-integration) explains how dataflows and the internal Azure Data Lake integration works.

If you were using your own Azure Data Lake Storage Gen 2 and connected it to the dataflow, you can access the folder structure even outside of Power Platform tools and services. Access to the structure of CDM folders then is possible through the Azure portal or Microsoft Azure Storage Explorer.

![Connect to external Azure Data Lake Storage Gen 2](https://docs.microsoft.com/en-us/power-bi/transform-model/media/service-dataflows-connect-azure-data-lake-storage-gen2/dataflows-connect-adlsg2_09.jpg)

[This article](https://docs.microsoft.com/en-us/power-bi/transform-model/service-dataflows-connect-azure-data-lake-storage-gen2) explains how to connect the external Azure Data Lake storage account to dataflows in your environment.

## Next Steps

- [Use the Common Data Model to optimize Azure Data Lake Storage Gen2](https://docs.microsoft.com/en-us/common-data-model/data-lake
  )
- [The metadata file (model.json) for the Common Data Model](https://docs.microsoft.com/en-us/common-data-model/model-json
  )
- [Add a CDM folder to Power BI as a dataflow (Preview)](https://docs.microsoft.com/en-us/power-bi/service-dataflows-add-cdm-folder
  )
- [Connect Azure Data Lake Storage Gen2 for dataflow storage](https://docs.microsoft.com/en-us/power-bi/service-dataflows-connect-azure-data-lake-storage-gen2
  )
- [Dataflows and Azure Data Lake Integration (Preview)](https://docs.microsoft.com/en-us/power-bi/transform-model/service-dataflows-azure-data-lake-integration)
- [Configure workspace dataflow settings (Preview)](https://docs.microsoft.com/en-us/power-bi/service-dataflows-configure-workspace-storage-settings
  )



