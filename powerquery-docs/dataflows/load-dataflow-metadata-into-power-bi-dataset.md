---
title: Load data in a Power BI streaming dataset and build a dataflows monitoring report with Power BI
description: How to use the dataflows connector in Power Automate to create a dataflows monitoring report in Power BI
author: miquelladeboer
ms.topic: conceptual
ms.date: 1/6/2023
ms.author: mideboer
---

# Load data in a Power BI streaming dataset and build a dataflows monitoring report with Power BI

This tutorial demonstrates how to load data in a Power BI streaming dataset to create a dataflows monitoring report in Power BI.

:::image type="content" source="media/load-dataflow-metadata-into-power-bi-dataset/dashboard.png" alt-text="Image with an example of a monitoring dashboard.":::

First, you'll create a new streaming dataset in Power BI. This dataset collects all the metadata from the dataflow run, and for every refresh of a dataflow, a record is added to this dataset. You can run multiple dataflows all to the same dataset. Lastly, you can build a Power BI report on the data to visualize the metadata and start monitoring the dataflows.

You can use this dashboard to monitor your dataflows' refresh duration and failure count. With this dashboard, you can track any issues with your dataflows performance and share the data with others.

:::image type="content" source="media/load-dataflow-metadata-into-power-bi-dataset/power-bi.png" alt-text="Image with an overview of the Power BI streaming dataset.":::

## Prerequisites

* A [Power BI Pro License](/power-bi/admin/service-admin-purchasing-power-bi-pro).

* A [Premium Power Automate License](/power-platform/admin/pricing-billing-skus)

* A [Power BI dataflow](/power-bi/transform-model/dataflows/dataflows-introduction-self-service) or [Power Platform dataflow](/powerapps/maker/common-data-service/create-and-use-dataflows).

## Create a new streaming dataset in Power BI

1. Navigate to [Power BI](https://powerbi.microsoft.com).

2. Open a workspace.

3. From the workspace, select **New** > **Streaming dataset**.

   :::image type="content" source="media/load-dataflow-metadata-into-power-bi-dataset/select-streaming-dataset.png" alt-text="Image emphasizing the streaming dataset selection from the New menu.":::

4. From **New streaming dataset**, select the **API** tile, and then select **Next**.

   :::image type="content" source="media/load-dataflow-metadata-into-power-bi-dataset/new-api-tile.png" alt-text="Image of the new streaming dataset dialog box with the API tile.":::

5. In the new pane, turn **Historic data analysis** on.

6. Enter the following values, and then select **Create**.

   * **Dataset Name**: "Dataflow Monitoring".
   * **Value**: "Dataflow Name", **Data type**: Text.
   * **Value**: "Dataflow ID", **Data type**: Text.
   * **Value**: "Refresh Status", **Data type**: Text.
   * **Value**: "Refresh Type", **Data type**: Text.
   * **Value**: "Start Time", **Data type**: Date and Time.
   * **Value**: "End Time", **Data type**: Date and Time.

:::image type="content" source="media/load-dataflow-metadata-into-power-bi-dataset/add-streaming-datset.png" alt-text="example of add streaming dataset.":::

## Create a dataflow

If you do not already have one, create a dataflow. You can create a dataflow in either [Power BI dataflows](/power-bi/transform-model/dataflows/dataflows-introduction-self-service) or [Power Apps dataflows](/powerapps/maker/common-data-service/create-and-use-dataflows).

## Create a flow in Power Automate

1. Navigate to [Power Automate](https://flow.microsoft.com).

2. Select **Create** > **Automated cloud flow**.

3. Enter a flow name, and then search for the "When a dataflow refresh completes" connector. Select this connector from the list, and then select **Create**.

4. Customize the connector. Enter the following information on your dataflow:

    * **Group Type**: Select *Environment* when connecting to Power Apps and *Workspace* when connecting to Power BI.
    * **Group**: Select the Power Apps environment or the Power BI workspace your dataflow is in.
    * **Dataflow**: Select your dataflow by name.

5. Select **new step** to add an action to your flow.

6. Search for the connector "Add rows to a dataset" from Power BI, and then select it.

7. Customize the connector. Enter the following information:

   * **Workspace ID**: Select the Power BI workspace that contains your streaming dataset.
   * **Dataset**: Select the streaming dataset **Dataflow Monitoring** that you previously created in [Create a new streaming dataset in Power BI](#create-a-new-streaming-dataset-in-power-bi).
   * **Table**: Select **RealTimeData**.

   :::image type="content" source="media/load-dataflow-metadata-into-power-bi-dataset/template-power-bi.png" alt-text="Example of Power BI template.":::
  
8. Add dynamic values to the required fields.

   For every required field, you need to add a dynamic value. This value is the output of the metadata of the dataflow run.

   1. Select the field next to **Dataflow Name** and then select the lightning button.

   2. Select **Dataflow Name** from the **Dynamic content** context box.

      :::image type="content" source="media/load-dataflow-metadata-into-power-bi-dataset/dynamic-streaming.png" lightbox="media/load-dataflow-metadata-into-power-bi-dataset/dynamic-streaming.png" alt-text="Image of the Add rows to a dataset connector with the dynamic content ready to be selected.":::
   3. Repeat this process for all required fields.

9. Save the flow.

## Create a Power BI Report

1. Navigate to [Power BI](https://powerbi.microsoft.com).

2. Navigate to the streaming dataset (in this example, in the **DocTestWorkspace** workspace, from the **Dataflow Monitoring** dataset, select **Create Report**).

3. Create your own report on top of this data.
