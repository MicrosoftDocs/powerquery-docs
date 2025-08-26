---
title: "Create and use dataflows in Microsoft Power Platform"
description: Learn how to use dataflows in Microsoft Power Platform.
author: Luitwieler
ms.topic: conceptual
ms.date: 8/26/2025
ms.author: jeluitwi
ms.subservice: dataflows
---

# Create and use dataflows in Microsoft Power Platform

Using dataflows with Microsoft Power Platform makes data preparation easier, and lets you reuse your data preparation work in subsequent reports, apps, and models.

In the world of ever-expanding data, data preparation can be difficult and expensive. It can consume as much as 60 to 80 percent of the time and cost for a typical analytics project. Such projects can require wrangling fragmented and incomplete data, complex system integration, data with structural inconsistency, and a high skill set barrier.

To make data preparation easier and to help you get more value out of your data, Power Query and Power Platform dataflows were created.

:::image type="content" source="media/linked-tables/linked-tables-03.png" alt-text="Screenshot showing how to select the Power Platform Dataflows connector." lightbox="media/linked-tables/linked-tables-03.png":::

With dataflows, Microsoft brings the self-service data preparation capabilities of Power Query into the Power BI and Power Apps online services, and expands existing capabilities in the following ways:

* **Self-service data prep for big data with dataflows**: Dataflows can be used to easily ingest, cleanse, transform, integrate, enrich, and schematize data from a large and ever-growing array of transactional and observational sources, encompassing all data preparation logic. Previously, extract, transform, load (ETL) logic could only be included within semantic models in Power BI, copied over and over between semantic models, and bound to semantic model management settings.

  With dataflows, ETL logic is elevated to a first-class artifact within Microsoft Power Platform services, and includes dedicated authoring and management experiences. Business analysts, BI professionals, and data scientists can use dataflows to handle the most complex data preparation challenges and build on each other's work, thanks to a revolutionary model-driven calculation engine. This engine takes care of all the transformation and dependency logic-cutting time, cost, and expertise to a fraction of what's traditionally been required for those tasks. You can create dataflows by using the well-known, self-service data preparation experience of Power Query. Dataflows are created and easily managed in app workspaces or environments, in Power BI or Power Apps, respectively, enjoying all the capabilities these services have to offer, such as permission management and scheduled refreshes.

* **Load data to Dataverse or Azure Data Lake Storage**: Depending on your use case, you can store data prepared by Power Platform dataflows in the Dataverse or your organization's Azure Data Lake Storage account:

  * **Dataverse** lets you securely store and manage data that's used by business applications. Data within Dataverse is stored in a set of tables. A *table* is a set of rows (formerly referred to as records) and columns (formerly referred to as fields/attributes). Each column in the table is designed to store a certain type of data, for example, name, age, salary, and so on. Dataverse includes a base set of standard tables that cover typical scenarios, but you can also create custom tables specific to your organization and populate them with data by using dataflows. App makers can then use Power Apps and Power Automate to build rich applications that use this data.

  * **Azure Data Lake Storage** lets you collaborate with people in your organization using Power BI, Azure Data, and AI services, or using custom-built Line of Business Applications that read data from the lake. Dataflows that load data to an Azure Data Lake Storage account store data in Common Data Model folders. Common Data Model folders contain schematized data and metadata in a standardized format, to facilitate data exchange and to enable full interoperability across services that produce or consume data stored in an organization’s Azure Data Lake Storage account as the shared storage layer.

* **Advanced Analytics and AI with Azure**: Power Platform dataflows store data in Dataverse or Azure Data Lake Storage&mdash;which means that data ingested through dataflows is now available to data engineers and data scientists to apply the full power of Azure Data Services, such as Azure Machine Learning, Azure Databricks, and Azure Synapse Analytics for advanced analytics and AI. This availability enables business analysts, data engineers, and data scientists to collaborate on the same data within their organization.

* **Support for Common Data Model**: Common Data Model is a set of a standardized data schemas and a metadata system to allow consistency of data and its meaning across applications and business processes. Dataflows support Common Data Model by offering easy mapping from any data in any shape into the standard Common Data Model tables, such as Account and Contact. Dataflows also land the data, both standard and custom tables, in schematized Common Data Model form. Business analysts can take advantage of the standard schema and its semantic consistency, or customize their tables based on their unique needs. Common Data Model continues to evolve as part of the [Open Data Initiative](https://dynamics.microsoft.com/open-data-initiative/).

## Dataflow capabilities in Microsoft Power Platform services

Most dataflow capabilities are available in both Power Apps and Power BI. Dataflows are available as part of these services' plans. Some dataflow features are either product-specific or available in different product plans. The following table describes dataflow features and their availability.

|Dataflow capability  |Power Apps  |Power BI  |
|---------|---------|---------|
|Scheduled refresh     |Up to 48 per day         |Up to 48 per day         |
|Maximum per table refresh time     |Up to 2 hours         |Up to 2 hours         |
|Dataflow authoring with Power Query Online     |Yes         |Yes         |
|Dataflow management     |In Power Apps admin portal        |In Power BI admin portal         |
|New connectors     |Yes         |Yes         |
|Standardized schema / built-in support for the Common Data Model     |Yes         |Yes         |
|Dataflows Data Connector in Power BI Desktop     |For dataflows with Azure Data Lake Storage as the destination         |Yes         |
|Integration with the organization's Azure Data Lake Storage     |Yes         |Yes         |
|Integration with Dataverse     |Yes         |No         |
|Dataflow linked tables     |For dataflows with Azure Data Lake Storage as the destination         |Yes         |
|Computed tables (in-storage transformations using M)     |For dataflows with Azure Data Lake Storage as the destination         |Power BI Premium only         |
|Dataflow incremental refresh     |For dataflows with Azure Data Lake Storage as the destination, requires Power Apps Plan2         |Power BI Premium only         |
|Running on Power BI Premium capacity / parallel execution of transforms     |No         |Yes         |

## Known limitations

* Copying dataflows as part of a [Back up and restore environments](/power-platform/admin/backup-restore-environments) operation isn't supported.
* Copying dataflows as part of a [Power Platform environments copy](/power-platform/admin/copy-environment) operation don't preserve their email notification setting.
* Change owner for a Dataflow with a connection and a query parameter would also change the parameter value to a previous value (if such value was set).

## Next steps

More information about dataflows in Power Apps:

* [Self-service data prep in Power Apps](/powerapps/maker/data-platform/self-service-data-prep-with-dataflows)
* [Creating and using dataflows in Power Apps](/powerapps/maker/data-platform/create-and-use-dataflows)
* [Connect Azure Data Lake Storage Gen2 for dataflow storage](/powerapps/maker/data-platform/connect-azure-data-lake-storage-for-dataflow)
* [Add data to a table in Dataverse by using Power Query](/powerapps/maker/data-platform/add-data-power-query)
* Visit the Power Apps [dataflow community](https://go.microsoft.com/fwlink/?linkid=2099971) and share what you’re doing, ask questions, or [submit new ideas](https://go.microsoft.com/fwlink/?linkid=2100074)
* Visit the Power Apps dataflow community forum and share what you’re doing, ask questions, or [submit new ideas](https://go.microsoft.com/fwlink/?linkid=2100074)

More information about dataflows in Power BI:

* [Self-service data prep in Power BI](/power-bi/service-dataflows-overview)
* [Create and use dataflows in Power BI](/power-bi/service-dataflows-create-use)
* [Dataflows whitepaper](https://go.microsoft.com/fwlink/?linkid=2011419&clcid=0x409)
* Detailed [video](https://aka.ms/DataflowIntroVideo) of a dataflows walkthrough
* Visit the Power BI [dataflows community](https://community.powerbi.com/t5/Service/bd-p/power-bi-web-app) and share what you're doing, ask questions, or [submit new ideas](https://ideas.powerbi.com/ideas)

The following articles go into more detail about common usage scenarios for dataflows.

* [Using incremental refresh with dataflows](incremental-refresh.md)
* [Creating computed tables in dataflows](computed-tables.md)
* [Connect to data sources for dataflows](data-sources.md)
* [Link tables between dataflows](linked-tables.md)

For more information about Common Data Model and the Common Data Model folder standard, read the following articles:

* [Common Data Model - overview](/powerapps/common-data-model/overview)
* [Common Data Model folders](/common-data-model/data-lake)
* [Common Data Model folder model file definition](/common-data-model/model-json)
