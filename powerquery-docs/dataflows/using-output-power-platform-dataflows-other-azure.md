---
title: Using the output of Power Platform dataflows from other Azure data workloads
description: Using the output of Microsoft Power Platform dataflows from other Azure data workloads.
author: Luitwieler
ms.topic: conceptual
ms.date: 1/6/2023
ms.author: jeluitwi
---

# Using the output of Microsoft Power Platform dataflows from other Azure data workloads

Depending on the storage for the output of the Microsoft Power Platform dataflows, you can use that output in other Azure services.

## The benefits of working with the output of Power Platform dataflows

Using Power Platform dataflows, you can reshape, clean, and prepare data for further analysis and consumption. There are many other Azure data services that work with data as an input and provide actions. 

- Azure Machine Learning can consume the output of dataflows and use it for machine learning scenarios (for example, predictive analysis).
- Azure Data Factory can get the output of dataflows on a much larger scale, combined with the data from big data sources, for advanced data integration solutions.
- Azure Databricks can consume the output of dataflows for applied data science algorithms and further AI with the big data scale in the Apache Spark back end.
- Other Azure data services can use the output of Power Platform dataflows to do further actions on that data.

## Dataflows with external Azure Data Lake Storage

If you've connected an external Azure Data Lake Storage storage to the Power Platform dataflows, you can connect to it using any Azure services that have Azure Data Lake Storage as a source, such as Azure Machine Learning, Azure Data Factory, Azure Databricks, and Azure Analysis Services.

In any of these services, use Azure Data Lake Storage as the source. You'll be able to enter the details of your storage and connect to the data in it. The data is stored in CSV format, and is readable through any of these tools and services. The following screenshot shows how Azure Data Lake Storage is a source option for Azure Data Factory.

![Using the output of Power Platform dataflows in external Data Lake Storage.](media/using-output-power-platform-dataflows-other-azure/adf-sourced-from-adls-gen2.png)

## Dataflows with Dataverse

If you're using standard dataflows that store the data in Dataverse, you can still connect to Dataverse from many Azure services. The following image shows that in Azure Data Factory, the output of a dataflow from Dataverse can be used as a source.

:::image type="content" source="media/using-output-power-platform-dataflows-other-azure/adf-sourced-from-cds.png" alt-text="Using the output of Power Platform dataflows from Dataverse.":::

## Dataflows with internal Azure Data Lake Storage

When you use the internal Data Lake storage that's provided by Power Platform dataflows, that storage is exclusively limited to the Power Platform tools and isn't accessible from other Azure data workloads.
