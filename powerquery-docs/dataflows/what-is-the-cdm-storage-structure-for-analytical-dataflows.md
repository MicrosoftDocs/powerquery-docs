# What is the storage structure for Analytical Dataflows? 

 

Analytical dataflows store both data and metadata in Azure Data Lake Gen2 storage. The standard dataflows leverage to store and describe data created in the lake by them is called Common Data Model folders. In this article, you will learn more about the storage standard dataflows leverage behind the scenes. 

 

## When the dataflow is analytical; storage needs an structure 

 

If the [dataflow is standard](https://github.com/MicrosoftDocs/powerquery-docs-pr/blob/reza-dataflows/powerquery-docs/dataflows/understanding-differences-between-analytical-standard-dataflows.md), then the data is stored in the Common Data Service. Common Data Service is like a database system; It has the concept of tables, views, and so on. The Common Data Service is a structured data storage option used by standard dataflows. 

 

However, when the dataflow is [analytical](https://github.com/MicrosoftDocs/powerquery-docs-pr/blob/reza-dataflows/powerquery-docs/dataflows/understanding-differences-between-analytical-standard-dataflows.md), the data is stored in Azure Data Lake Gen2 storage. A dataflow’s data and metadata is stored in a Common Data Model folder. Since a storage account might have multiple dataflows stored in it, a hierarchy of folders and subfolders has been introduced to help organize the data. Depending on the product the dataflow was created in, the folders and subfolders may represent workspaces (or environments), and then the dataflow’s common data model folder. Inside the common data model folder, both schema and data of the dataflow entities are stored. This structure follows the standards defined for the common data model. 

 

![Analytical dataflow stores the data in the CDM structure](media/AnalyticalDataflowStoresDatainCDMFormat.png) 

 

## What is the CDM Storage Structure 

 

CDM, which stands for [Common Data Model](https://docs.microsoft.com/en-us/common-data-model/), is a metadata structure defined to bring conformity and consistency of using the data across multiple platforms. CDM is not data storage. In fact, is it the way that the data is stored and defined. 

 

CDM Folders define how an entity’s schema and its data should be stored. Inside the Azure Data Lake Storage Gen2, data is organized in folders. Folders may represents a workspace or environment and under those folders, subfolders for each dataflow will be created. 

 

![workspace folder structure](media/foldersWorkspaceAndDataflows.png) 

 

## What's Inside a dataflow Folder? 

 

Inside each dataflow folder, there are sub-folders for each entity, and a metadata file named as model.json.  

 

![what's inside a dataflow folder](https://docs.microsoft.com/en-us/common-data-model/media/cdm-folder.png) 

 

### The metadata file: Model.json 

 

The "model.json" file is the metadata definition of the dataflow. This is the one file that contains all the dataflow’s metadata. It includes a list of entities, the columns and their data types in each entity, the relationship between entities, and so on. This is the file that you can export from a dataflow easily, even if you don't have access to the CDM folder structure. 

 

![Export model.json file from a dataflow](media/dataflowExportJson.png) 

 

This JSON file is the file that you can use to migrate (or import) your dataflow into another workspace or environment; 

 

![Migrate dataflow into another workspace or environment](media/dataflowMigrateToAnotherWorkSpace.png) 

 

Read [this article](https://docs.microsoft.com/en-us/common-data-model/model-json) to learn what the model.json metadata file exactly includes. 

 

### Data files 

 

In addition to the metadata file, inside the dataflow folder, there are other subfolders. Dataflow stores the data of each entity inside a sub-folder with the entity's name on it. An entity’s data might be split into multiple data partitions stored in CSV format. 

 

## How can you see or access CDM folders? 

 

If you are using dataflows with storage provided by the product it was created in you won't have access to those folders directly. In such cases, getting data from the dataflows requires using the Power Platform Dataflow connector available in the Get Data experience in Power BI, Power Apps and Dynamics 35 Customer Insights products or in the Power BI Desktop. 

 

![Connect to the analytical dataflow's data](media/GetdatafromAnalyticalDataflow.png) 

 

 

 

[This article](https://docs.microsoft.com/en-us/power-bi/transform-model/service-dataflows-azure-data-lake-integration) explains how dataflows and the internal Azure Data Lake integration works. 

 

If your organization enabled dataflows to leverage its Azure Data Lake Storage Gen 2 account and was selected as a dataflows load target, you can still get data from the dataflow via the Power Platform Dataflow connector as mentioned above but also access the dataflows CDM folder directly via the lake, even outside of Power Platform tools and services. Access to the lake is possible through the Azure portal, Microsoft Azure Storage Explorer or any other service or experience that supports Azure Data Lake gen2 storage. 

 

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
