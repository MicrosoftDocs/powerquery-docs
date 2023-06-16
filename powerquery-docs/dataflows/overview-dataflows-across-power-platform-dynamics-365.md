---
title: An overview of dataflows across Microsoft Power Platform and Dynamics 365 products
description: An overview of dataflows across Microsoft Power Platform and Dynamics 365 products
author: bensack

ms.topic: overview
ms.date: 6/16/2023 
ms.author: bensack

---

# What are dataflows?

Dataflows are a self-service, cloud-based, data preparation technology. Dataflows enable customers to ingest, transform, and load data into Microsoft Dataverse environments, Power BI workspaces, or your organization's Azure Data Lake Storage account. Dataflows are authored by using Power Query, a unified data connectivity and preparation experience already featured in many Microsoft products, including Excel and Power BI. Customers can trigger dataflows to run either on demand or automatically on a schedule; data is always kept up to date.

## Dataflows can be created in multiple Microsoft products

Dataflows are featured in multiple Microsoft products and don't require a dataflow-specific license to be created or run. Dataflows are available in Power Apps, Power BI, and Dynamics 365 Customer Insights. The ability to create and run dataflows is bundled with those products' licenses. Dataflow features are mostly common across all products they're featured in, but some product-specific features might exist in dataflows created in one product versus another.

### How does the dataflow function?

:::image type="content" source="media/overview-dataflows/dataflow-function.png" alt-text="Image of how dataflows function, from the source data, to the transformation process, and then to storage.":::

The previous image shows an overall view of how a dataflow is defined. A dataflow gets data from different data sources (more than 80 data sources are supported already). Then, based on the transformations configured with the Power Query authoring experience, the dataflow transforms the data by using the dataflow engine. Finally, the data is loaded to the output destination, which can be a Microsoft Power Platform environment, a Power BI workspace, or the organization's Azure Data Lake Storage account.  

### Dataflows run in the cloud

Dataflows are cloud-based. When a dataflow is authored and saved, its definition is stored in the cloud. A dataflow also runs in the cloud. However, if a data source is on-premises, an on-premises data gateway can be used to extract the data to the cloud. When a dataflow run is triggered, the data transformation and computation happens in the cloud, and the destination is always in the cloud.

:::image type="content" source="media/overview-dataflows/dataflow-cloud.png" alt-text="Image of how dataflows run in the cloud, from the data source, to the dataflow running in the cloud, and then to storage.":::

### Dataflows use a powerful transformation engine

Power Query is the data transformation engine used in the dataflow. This engine is capable enough to support many advanced transformations. It also uses a straightforward, yet powerful, graphical user interface called Power Query Editor. You can use dataflows with this editor to develop your data integration solutions faster and more easily.

:::image type="content" source="media/overview-dataflows/power-query-editor.png" alt-text="Screenshot showing an example of Power Query transformations." lightbox="media/overview-dataflows/power-query-editor.png":::

### Dataflow integration with Microsoft Power Platform and Dynamics 365

Because a dataflow stores the resulting tables in cloud-based storage, other services can interact with the data produced by dataflows.

:::image type="content" source="media/overview-dataflows/dataflow-power-platform.png" alt-text="Image of how a dataflow integrates with Microsoft Power Platform and Dynamics 365.":::

For example, Power BI, Power Apps, Power Automate, Power Virtual Agents, and Dynamics 365 applications can get the data produced by the dataflow by connecting to Dataverse, a Power Platform dataflow connector, or directly through the lake, depending on the destination configured at dataflow creation time.

## Benefits of dataflows

The following list highlights some of the benefits of using dataflows:

- A dataflow decouples the data transformation layer from the modeling and visualization layer in a Power BI solution.

- The data transformation code can reside in a central location, a dataflow, rather than be spread out among multiple artifacts.

- A dataflow creator only needs Power Query skills. In an environment with multiple creators, the dataflow creator can be part of a team that together builds the entire BI solution or operational application.

- A dataflow is product-agnostic. It's not a component of Power BI only; you can get its data in other tools and services.

- Dataflows take advantage of Power Query, a powerful, graphical, self-service data transformation experience.

- Dataflows run entirely in the cloud. No additional infrastructure is required.

- You have multiple options for starting to work with dataflows, using licenses for Power Apps, Power BI, and Customer Insights.

- Although dataflows are capable of advanced transformations, they're designed for self-service scenarios and require no IT or developer background.

## Use-case scenarios for dataflows

You can use dataflows for many purposes. The following scenarios provide a few examples of common use cases for dataflows.

### Data migration from legacy systems

In this scenario, the decision has been made by an organization to use Power Apps for the new user interface experience rather than the legacy on-premises system. Power Apps, Power Automate, and AI Builder all use Dataverse as the primary data storage system. The current data in the existing on-premises system can be migrated into Dataverse by using a dataflow, and then these products can use that data.

### Using dataflows to build a data warehouse

You can use dataflows as a replacement for other extract, transform, load (ETL) tools to build a data warehouse. In this scenario, the data engineers of a company decide to use dataflows to build their star schema&ndash;designed data warehouse, including fact and dimension tables in Data Lake Storage. Then Power BI is used to generate reports and dashboards by getting data from the dataflows.

:::image type="content" source="media/overview-dataflows/dataflows-build-data-warehouse.png" alt-text="Image of how to build a data warehouse using dataflows.":::

### Using dataflows to build a dimensional model

You can use dataflows as a replacement for other ETL tools to build a dimensional model. For example, the data engineers of a company decide to use dataflows to build the star-schema designed dimensional model, including fact and dimension tables in Azure Data Lake Storage Gen2. Then Power BI is used to generate reports and dashboards by getting data from the dataflows.

:::image type="content" source="media/overview-dataflows/dataflow-dimensional-model.png" alt-text="Image of how to build a dimensional model using dataflows.":::

### Centralize data preparation and reuse of datasets across multiple Power BI solutions

If multiple Power BI solutions are using the same transformed version of a table, the process to create the table will be repeated multiple times. This increases the load on the source system, consumes more resources, and creates duplicate data with multiple points of failure. Instead, a single dataflow can be created to compute the data for all solutions. Power BI can then reuse the result of the transformation in all solutions. The dataflow, if used in such a way, can be part of a robust Power BI implementation architecture that avoids the Power Query code duplicates and reduces the maintenance costs of the data integration layer.

:::image type="content" source="media/overview-dataflows/reuse-tables-in-solutions.png" alt-text="Image of how tables can be reused across multiple solutions.":::

## Next steps

The following articles provide further study materials for dataflows.

- [Create and use dataflows in Microsoft Power Platform](/data-integration/dataflows/dataflows-integration-overview)
- [Creating and using dataflows in Power BI](/power-bi/service-dataflows-create-use)
