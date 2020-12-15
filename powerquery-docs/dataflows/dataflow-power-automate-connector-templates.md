---
title: Power Automate Templates for the Dataflows Connector
description: Introduction to Power Automate templates for the dataflows connector.
author: miquelladeboer

ms.service: powerquery
ms.reviewer: kvivek
ms.topic: conceptual
ms.date: 12/15/2020
ms.author: mideboer
---
# Power Automate Templates for the Dataflows Connector

The dataflows Power Automate Connector can:
* trigger a flow when a dataflows refresh completes.
* take action to initiate a dataflows refresh.

In this article, we discuss some use cases with provided templates to help you quickstart the use of this connector:

[Send notifications](send-notification-when-dataflow-refresh-completes.md):
* When a dataflow refresh status changes, send an email notification.
* When a dataflow succeeds or fails, send an email notification.
* When a dataflows refresh status changes, send a Teams notification.

[Open support tickets](open-support-ticket-when-dataflow-refresh-completes.md):
* When a dataflows refresh fails, send a message to Azure Service Bus queue to open a support ticket. 

[Refresh dataflows and datasets sequentially](trigger-dataflows-and-power-bi-dataset-sequentially.md):
* When you click on a button, initiate a dataflows refresh.
* When an analytical dataflow refresh succeeds, initiate a standard dataflow refresh.
* When a dataflow refresh succeeds, initiate a Power BI dataset refresh.
* When a file in SharePoint is updated, initiate a dataflow refresh.

Save dataflow refresh metadata:
* [When a dataflow refresh completes, save metadata to a Dataverse table](load-dataflow-metadata-into-dataverse-table.md)
* [When a dataflow refresh completes, save metadata to Excel online](load-dataflow-metadata-into-excel-online.md)
* [When a dataflow refresh completes, save metadata to a Power BI streaming dataset](load-dataflow-metadata-into-power-bi-dataset.md)

Tutorial: Create a Dataflow Monitoring Dashboard

![An example of folder structure](media/dashboard.PNG)

## Downloads:
[Download Power BI template for data in Excel](https://download.microsoft.com/download/1/4/E/14EDED28-6C58-4055-A65C-23B4DA81C4DE/excel-template.pbit),
[Download Power BI template for data in Dataverse](https://download.microsoft.com/download/1/4/E/14EDED28-6C58-4055-A65C-23B4DA81C4DE/dataverse-template.pbit),
[Download Excel file](https://download.microsoft.com/download/1/4/E/14EDED28-6C58-4055-A65C-23B4DA81C4DE/dataflow_monitoring.xlsx)
