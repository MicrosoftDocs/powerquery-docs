---
title: Load Data into a Power BI streaming dataset and build a Dataflows Monitoring Report with Power BI
description: How to use the dataflows connector templates in Power Automate to create a dataflows monitoring report in Power BI
author: miquelladeboer

ms.service: powerquery
ms.reviewer: kvivek
ms.topic: conceptual
ms.date: 12/15/2020
ms.author: mideboer
---

# Load Data into a Power BI Streaming Dataset and Build a Dataflows Monitoring Report with Power BI

## Introduction

In this step-by-step tutorial, we will show you how to set up your own monitoring dashboard for all of your dataflows:

![example of monitoring dashboard](media/dashboard.PNG)

First, you will create a new streaming dataset in Power BI. This dataset will collect all the metadata from the dataflow run, and for every refresh of a dataflow, a record is added to this dataset. You can run multiple dataflows all to the same dataset. Lastly, you can build a Power BI report on the data to visualize the metadata and start monitoring the dataflows.

You can use this dashboard to monitor your dataflows' refresh duration and failure count. With this dashboard, you can track any issues with your dataflows performance and share the data with others. 

![overview of PowerBI streaming dataset](media/powerbi.PNG)

## Prerequisites

* A [Power BI Pro Licence](https://docs.microsoft.com/power-bi/admin/service-admin-purchasing-power-bi-pro).

* A [Premium Power Automate Licence](https://docs.microsoft.com/power-platform/admin/pricing-billing-skus).

* A [Power BI dataflow](https://docs.microsoft.com/power-bi/transform-model/dataflows/dataflows-introduction-self-service) or [Power Platform dataflow](https://docs.microsoft.com/powerapps/maker/common-data-service/create-and-use-dataflows).

## Create a new streaming dataset in Power BI

* Navigate to [Power BI](https://powerbi.microsoft.com).

* Follow these [instructions](https://docs.microsoft.com/power-bi/connect-data/service-real-time-streaming#set-up-your-real-time-streaming-dataset-in-power-bi) to create a new streaming dataset in Power BI. Ensure you create a streaming dataset based on the API and add the historical data opt in.

In the right pane, enter the following values, and then select `Create`.
    * **Dataset Name**: "Dataflow Monitoring".
    * **Value**: "Dataflow Name", **Data type**: Text.
    * **Value**: "Dataflow ID", **Data type**: Text.
    * **Value**: "Refresh Status", **Data type**: Text. 
    * **Value**: "Refresh Type", **Data type**: Text.
    * **Value**: "Start Time", **Data type**: Date and Time. 
    * **Value**: "End Time", **Data type**: Date and Time.

![example of add streaming dataset](media/addstreamingdatset.PNG)

## Create a dataflow

If you do not already have one, create a dataflow. This can be done in either [Power BI dataflows](https://docs.microsoft.com/power-bi/transform-model/dataflows/dataflows-introduction-self-service) or [Power Apps dataflows](https://docs.microsoft.com/powerapps/maker/common-data-service/create-and-use-dataflows).

## Create a Flow in Power Automate

* Navigate to [Power Automate](https://flow.microsoft.com),
* Search for the template "When a dataflow refresh completes, output status into Power BI Streaming Dataset". If you encounter difficulty, see these [instructions](https://docs.microsoft.com/power-automate/get-started-logic-template).

![example of streaming dataset template](media/streamingconnector.PNG)

* Customize the flow. Actions that require input from you will automatically be expanded.

   The **Dataflow Refresh** trigger is expanded because you need to enter information on your dataflow:
    * **Group Type**: Select *Environment* when connecting to Power Apps and *Workspace* when connecting to Power BI.
    * **Group**: Select the Power Apps environment or the Power BI workspace your dataflow is in.
    * **Dataflow**: Select your dataflow by name.

     The **Add Rows (Streaming Dataset)** action is expanded because you need to enter your Power BI *Workspace* and *Dataset*:
    * **Workspace ID**: Select the Power BI workspace which contains your streaming dataset.
    * **Dataset**: Select the streaming dataset "Dataflows Monitoring" you previously created.
    * **Table**: Select "RealTimeData"

* Add dynamic values to the required fields.

     For every required field, you need to add a dynamic value. This value is the output of the metadata of the dataflow run.
    * Select the field next to **Dataflow ID** and then select the lightning button.
    
    ![example of lightning button in Excel](media/dynamicexcel.png)

    * Repeat this process for all required fields.

* Save the flow.

## Create a Power BI Report

* Navigate to [Power BI](https://powerbi.microsoft.com)m
* Navigate to the streaming dataset.
* Create your own report on top of this data.

![PowerBI report data example](media/createyourownreport.PNG)
