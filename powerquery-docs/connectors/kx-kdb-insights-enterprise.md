---
title: KX kdb Insights Enterprise Power Query Connector (Beta)
description: Provides basic information, prerequisites, and instructions on how to connect to kdb Insights Enterprise
author: liznorris
ms.date: 11/15/2024
ms.author: dougklo
---

# KX kdb Insights Enterprise Power Query Connector (Beta)

> [!NOTE]
> The following connector article is provided by KX Systems Inc., the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the [KX](https://www.kx.com) website and use the support channels there.


## Summary

| Item	                        | Description                 |
| ------------------------------ | --------------------------- |
| Release State                  | Preview        |
| Products                       | Power BI (Semantic models)<br>Power BI (Dataflows)<br>Fabric (Dataflow Gen2)                   |
| Authentication Types Supported | Username/Password<br/>OAuth |

The connector enables Microsoft Power BI users to remotely connect, explore, query data, preview tables, and harness the power and performance of kdb Insights Enterprise analytics before importing datasets into Power BI for visualization.


## Prerequisites

Ensure the following prerequisities are met before proceeding:

* kdb Insights Enterprise 1.11.0 or above is [installed](https://code.kx.com/insights/enterprise/getting-started/index.html) and running at least one database.

* Permissions to query data on the running databases.


## Capabilities supported

* Import
    * Filtering
    * Aggregation
    * Group By


## Connect to kdb Insights Enterprise 

To make the connection, follow these steps:

1. Open Microsoft Power BI Desktop or Power BI Online.

1.  Select **Get Data**:
    * For Power BI Desktop, select **Get Data** > **More** from the **Home** tab in the upper ribbon.
    * For Power BI Online, in the Get Data experience, select the **Dataflow** category.

1. Search for **KX kdb**.

1. Select **KX kdb Insights Enterprise**.

1. Select **Connect**.

1. Enter the URL for your kdb Insights Enterprise deployment.

1. Select **OK**.

1. You're prompted to sign in if you haven't signed in recently or have never signed in:

    * If you haven't signed in recently or have never signed in, select **Sign in**. The button is named **Sign in as a different user** if your login credentials have expired or are no longer valid.

      :::image type="content" source="./media/kx-kdb-insights-enterprise/powerbi-signin.png" alt-text="Screenshot showing the KX Insights Enterprise instance information.":::

1. If your credentials are valid, the Connector popup displays that yo'are currently signed in and you can select the **Connect** button.

   :::image type="content" source="./media/kx-kdb-insights-enterprise/powerbi-signedin.png" alt-text="Screenshot showing the KX Insights Enterprise signin popup.":::

1. The **Navigator** dialog box displays all the running databases and tables for your chosen host on the left. Selecting a table returns a preview of the selected data using the _kdb Insights Enterprise_ [getData REST API](https://code.kx.com/insights/api/database/query/get-data.html).

   :::image type="content" source="./media/kx-kdb-insights-enterprise/powerbi-preview.png" alt-text="Screenshot showing the KX Insights Enterprise preview page.":::

## Navigator options

The [parameters](https://code.kx.com/insights/enterprise/integrations/powerbi/powerbi-import.html#parameters) available on the Navigator allow you to leverage the power of kdb Insights Enterprise analytics to filter, group, and aggregate data by restricting the data being loaded and bringing you the performance of the _kdb Insights database_.


| **Parameter** | **Details**                                                                      |
| ------------- | -------------------------------------------------------------------------------- |
| Start Time    | Applies to the partitioned column and is ignored for non-partitioned tables |
| End Time      | Applies to the partitioned column and is ignored for non-partitioned tables |
| Filter        | Filters out certain rows                                                         |
| Aggregation   | Filters the columns and/or aggregates the rows being returned                    |
| Group By      | Group the results of an aggregation based on specific columns                    |


## More resources

For more information, visit the following resources:

* [kdb Insights Enterprise official documentation](https://code.kx.com/insights/enterprise/index.html).

* [KX kdb Insights Enterprise Power Query Connector documentation](https://code.kx.com/insights/enterprise/integrations/powerbi/powerbi-import.html).
