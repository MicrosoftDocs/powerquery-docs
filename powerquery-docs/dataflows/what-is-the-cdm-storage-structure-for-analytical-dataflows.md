---
title: What is the storage structure for analytical dataflows
description: What is the storage structure for analytical dataflows
author: radacad
ms.service: powerquery
ms.topic: conceptual
ms.date: 05/25/2020
ms.author: v-rerad
---

# What is the storage structure for analytical dataflows? 

Analytical dataflows store both data and metadata in Azure Data Lake Storage. Dataflows leverage a standard structure to store and describe data created in the lake, which is called Common Data Model folders. In this article, you'll learn more about the storage standard that dataflows use behind the scenes. 

## Storage needs a structure for an analytical dataflow 

If a [dataflow is standard](understanding-differences-between-analytical-standard-dataflows.md#standard-dataflows), the data is stored in Common Data Service. Common Data Service is like a database system: it has the concept of tables, views, and so on. Common Data Service is the structured data storage option used by standard dataflows.

However, when a dataflow is [analytical](understanding-differences-between-analytical-standard-dataflows.md#analytical-dataflows), the data is stored in Data Lake Storage. The data and metadata for a dataflow is stored in a Common Data Model folder. Because a storage account might have multiple dataflows stored in it, a hierarchy of folders and subfolders has been introduced to help organize the data. Depending on the product used to create the dataflow, the folders and subfolders might represent workspaces (or environments), and then the Common Data Model folder for the dataflow. In the Common Data model folder, both the schema and data for the dataflow entities are stored. This structure follows the standards defined for Common Data Model.
<!--In the image, "CDS" should be spelled out.-->
![Analytical dataflow stores the data in the Common Data Model structure](media/AnalyticalDataflowStoresDatainCDMFormat.png) 

## What is the Common Data Model storage structure?

[Common Data Model](https://docs.microsoft.com/common-data-model/) is a metadata structure defined to bring conformity and consistency for using data across multiple platforms. Common Data Model isn't data storage, it's the way that data is stored and defined. 

Common Data Model folders define how an entity's schema and its data should be stored. In Data Lake Storage, data is organized in folders. Folders can represent a workspace or environment. Under those folders, subfolders for each dataflow are created. 

![Workspace folder structure](media/foldersWorkspaceAndDataflows.png) 

## What's in a dataflow folder? 

Each dataflow folder contains a subfolder for each entity and a metadata file named `model.json`.  

![What's in a dataflow folder?](https://docs.microsoft.com/common-data-model/media/cdm-folder.png) 

### The metadata file: model.json 

The `model.json` file is the metadata definition of the dataflow. This is the one file that contains all the dataflow metadata. It includes a list of entities, the columns, and their data types in each entity, the relationship between entities, and so on. You can export this file from a dataflow easily, even if you don't have access to the Common Data Model folder structure.

![Export the model.json file from a dataflow](media/dataflowExportJson.png) 

You can use this JSON file to migrate (or import) your dataflow into another workspace or environment.

![Migrate a dataflow into another workspace or environment](media/dataflowMigrateToAnotherWorkSpace.png) 

To learn exactly what the model.json metadata file includes, see [The metadata file (model.json) for Common Data Model](https://docs.microsoft.com/common-data-model/model-json).

### Data files

In addition to the metadata file, the dataflow folder includes other subfolders. A dataflow stores the data for each entity in a subfolder with the entity's name. Data for an entity might be split into multiple data partitions, stored in CSV format. 

## How to see or access Common Data Model folders

If you're using dataflows that use storage provided by the product they were created in,<!--Edits okay?--> you won't have access to those folders directly. In such cases, getting data from the dataflows requires using the Power Platform dataflow connector available in the **Get data** experience in Power BI, Power Apps, and Dynamics 35 Customer Insights products, or in Power BI Desktop.<!--Should the first reference read "the Power BI service"? Not sure why "Power BI Desktop" is tacked on so awkwardly here.-->

![Connect to data for an analytical dataflow](media/GetdatafromAnalyticalDataflow.png) 

To see how dataflows and the internal Data Lake Storage integration work, see [Dataflows and Azure Data Lake integration (Preview)](https://docs.microsoft.com/power-bi/transform-model/service-dataflows-azure-data-lake-integration). 

If your organization enabled dataflows to take advantage its Data Lake Storage account and was selected as a load target for dataflows, you can still get data from the dataflow by using the Power Platform dataflow connector as described above. But you can also access the Common Data Model folder for the dataflow directly through the lake, even outside of Power Platform tools and services. Access to the lake is possible by using the Azure portal, Azure Storage Explorer, or any other service or experience that supports Data Lake Storage. More information: [Connect Azure Data Lake Storage Gen2 for dataflow storage](https://docs.microsoft.com/power-bi/transform-model/service-dataflows-connect-azure-data-lake-storage-gen2)

![Connect to external Data Lake Storage](https://docs.microsoft.com/power-bi/transform-model/media/service-dataflows-connect-azure-data-lake-storage-gen2/dataflows-connect-adlsg2_09.jpg) 

## Next steps 

- [Use the Common Data Model to optimize Azure Data Lake Storage Gen2](https://docs.microsoft.com/common-data-model/data-lake) 

- [The metadata file (model.json) for the Common Data Model](https://docs.microsoft.com/common-data-model/model-json) 

- [Add a CDM folder to Power BI as a dataflow (Preview)](https://docs.microsoft.com/power-bi/service-dataflows-add-cdm-folder) 

- [Connect Azure Data Lake Storage Gen2 for dataflow storage](https://docs.microsoft.com/power-bi/service-dataflows-connect-azure-data-lake-storage-gen2) 

- [Dataflows and Azure Data Lake Integration (Preview)](https://docs.microsoft.com/power-bi/transform-model/service-dataflows-azure-data-lake-integration) 

- [Configure workspace dataflow settings (Preview)](https://docs.microsoft.com/power-bi/service-dataflows-configure-workspace-storage-settings) 
