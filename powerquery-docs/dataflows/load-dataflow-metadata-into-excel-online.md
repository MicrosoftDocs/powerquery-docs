---
title: Load data in Excel Online and build a dataflows monitoring report with Power BI
description: How to use an Excel file and the dataflows connector in Power Automate to create a dataflows monitoring report in Power BI
author: Luitwieler
ms.topic: concept-article
ms.date: 1/6/2023
ms.author: jeluitwi
ms.subservice: dataflows
ms.custom: sfi-image-nochange
---

# Load data in Excel Online and build a dataflows monitoring report with Power BI

This tutorial demonstrates how to use an Excel file and the dataflows connector in Power Automate to create a dataflows monitoring report in Power BI.

:::image type="content" source="media/load-dataflow-metadata-into-excel-online/dashboard.png" alt-text="Image of an example Power BI monitoring dashboard.":::

First, you'll download the Excel file and save it in OneDrive for Business or SharePoint. Next, you'll create a Power Automate connector that loads metadata from your dataflow to the Excel file in OneDrive for Business or SharePoint. Lastly, you'll connect a Power BI file to the Excel file to visualize the metadata and start monitoring the dataflows.

You can use this dashboard to monitor your dataflows' refresh duration and failure count. With this dashboard, you can track any issues with your dataflows performance and share the data with others.

:::image type="content" source="media/load-dataflow-metadata-into-excel-online/excel.png" alt-text="Image of an overview of loading data through Excel.":::

## Prerequisites

* [Microsoft Excel](https://www.microsoft.com/en/microsoft-365/excel)

* [Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

* A [Premium Power Automate License](/power-platform/admin/pricing-billing-skus)

* [OneDrive for Business](https://www.microsoft.com/en/microsoft-365/onedrive/onedrive-for-business).

* A [Power BI dataflow](/power-bi/transform-model/dataflows/dataflows-introduction-self-service) or [Power Platform dataflow](/powerapps/maker/common-data-service/create-and-use-dataflows).

## Download the .pbit file

First, download the [.pbit file](https://download.microsoft.com/download/1/4/E/14EDED28-6C58-4055-A65C-23B4DA81C4DE/excel-template.pbit).

## Download the Excel file and save to OneDrive

Next, download the [.xlsx file](https://download.microsoft.com/download/1/4/E/14EDED28-6C58-4055-A65C-23B4DA81C4DE/dataflow_monitoring.xlsx) and save the file to a location on OneDrive for Business or SharePoint

## Create a dataflow

If you don't already have one, create a dataflow. You can create a dataflow in either [Power BI dataflows](/power-bi/transform-model/dataflows/dataflows-introduction-self-service) or [Power Apps dataflows](/powerapps/maker/common-data-service/create-and-use-dataflows).

## Create a flow in Power Automate

1. Navigate to [Power Automate](https://flow.microsoft.com).
2. Select **Create** > **Automated cloud flow**.
3. Enter a flow name, and then search for the "When a dataflow refresh completes" connector. Select this connector from the list, and then select **Create**.

4. Customize the connector. Enter the following information on your dataflow:

   * **Group Type**: Select *Environment* when connecting to Power Apps and *Workspace* when connecting to Power BI.
   * **Group**: Select the Power Apps environment or the Power BI workspace your dataflow is in.
   * **Dataflow**: Select your dataflow by name.
  
5. Select **New step** to add an action to your flow.
6. Search for the "Add a row into a table" connector from Excel Online (Business), and then select it.

7. Customize the connector. Enter the *Location* of the Excel file and the specific *Table* the data loads to.
   * **Location**: Select the location of the Excel file on OneDrive for Business or SharePoint.
   * **Document Library**: Select the library of the Excel file.
   * **File**: Select the file path to the Excel file.
   * **Table**: Select "Dataflow_monitoring".

   ![Image of the Excel Add a row into a table connection, with the fields ready to be filled in.](media/load-dataflow-metadata-into-excel-online/template-excel.png)

8. Add dynamic values to the required fields.

   For every required field, you need to add a dynamic value. This value is the output of the metadata of the dataflow run.

   1. Select the field next to **dataflowname_name**.

   2. Select **Dataflow Name** from the **Dynamic content** context box.

      [![Image of the Excel Add a row into a table connector, with the dynamic contents selection dialog box.](media/load-dataflow-metadata-into-excel-online/dynamic-excel.png)](media/load-dataflow-metadata-into-excel-online/dynamic-excel.png#lightbox)

   3. Repeat this process for all required fields.

9. Save the flow.

## Create a Power BI Report

1. Open the `.pbit` file.

2. Connect to your Excel file.

In this dashboard, for every dataflow in your specified time interval, you can monitor:

* The dataflow duration
* The dataflow count
* The dataflow failure count

The uniqueID for every dataflow is generated by a merge between the dataflow name and the dataflow start time.
