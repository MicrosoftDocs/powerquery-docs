---
title: Power Automate Templates for Dataflows Connector
description: How to use the dataflows connector templates in Power Automate
author: mideboer

ms.service: powerquery
ms.reviewer: kvivek
ms.topic: conceptual
ms.date: 15/2/2020
ms.author: mideboer
---

# Power Automate Templates for Dataflows Connector

The Dataflow Power Automate Connector can:
* Trigger a flow when a dataflow refresh completes
* Take action to initiate a dataflow refresh

In this blog, we are going to discuss some use cases with corresponding templates, to quickstart the use of this connector. We are going to discuss the following templates:

[Notifications](trigger-dataflows-and-power-bi-dataset-sequentially.md):
* Send an email notification when a dataflow refresh status changes
* Send email notification on success or failure of a dataflow
* When a dataflow refresh status changes, sends a Teams notification

[Support tickets](open-support-ticket-when-dataflow-refresh-completes.md):
* When a dataflow refresh fails, send a message to service bus queue to open a support ticket

[Refresh Dataflows/Datasets sequentially](trigger-dataflows-and-power-bi-dataset-sequentially.md):
* When you click on button, initiate a dataflow refresh
* When an analytical dataflow refresh succeeds, initiate a standard dataflow refresh
* When a dataflow refresh succeeds, initiate a Power BI dataset refresh
* When a file in SharePoint gets updated, initiate a dataflow refresh

Save dataflow refresh meta-data:
* [When a dataflow refresh completes, save meta-data to Dataverse Table](load-dataflow-metadata-into-dataverse-table.md)
* [When a dataflow refresh completes, save meta-data to Exel online](load-dataflow-metadata-into-excel-online.md)
* [When a dataflow refresh completes, save meta-data to Power BI Streaming dataset](load-dataflow-metadata-into-power-bi-dataset.md)

Tutorial: Create a Dataflow Monitoring Dashboard

![An example of folder structure](media/dashboard.PNG)


## Downloads:
[Download Power BI template for data in Excel](https://download.microsoft.com/download/1/4/E/14EDED28-6C58-4055-A65C-23B4DA81C4DE/excel-template.pbit),
[Download Power BI template for data in Dataverse](https://download.microsoft.com/download/1/4/E/14EDED28-6C58-4055-A65C-23B4DA81C4DE/dataverse-template.pbit),
[Dowload Excel file](https://download.microsoft.com/download/1/4/E/14EDED28-6C58-4055-A65C-23B4DA81C4DE/dataflow_monitoring.xlsx)