---
title: Power Automate templates for the dataflows connector
description: Introduction to Power Automate templates for the dataflows connector.
author: Luitwieler
ms.topic: overview
ms.date: 1/26/2024
ms.author: jeluitwi
ms.subservice: dataflows
---

# Power Automate templates for the dataflows connector

The dataflows Power Automate connector can:

* Trigger a flow when a dataflow refresh completes.
* Take action to start a dataflow refresh.

This section discusses some use cases with provided tutorials to help you quickstart the use of this connector:

[Send notifications](send-notification-when-dataflow-refresh-completes.md):

* When a dataflow refresh status changes, send an email notification.
* When a dataflow succeeds or fails, send an email notification.
* When a dataflow refresh status changes, send a Teams notification.

[Open support tickets](open-support-ticket-when-dataflow-refresh-completes.md):

* When a dataflow refresh fails, send a message to Azure Service Bus queue to open a support ticket.

[Refresh dataflows and semantic models sequentially](trigger-dataflows-and-power-bi-dataset-sequentially.md):

* When you select a button, start a dataflow refresh.
* When an analytical dataflow refresh succeeds, start a standard dataflow refresh.
* When a dataflow refresh succeeds, start a Power BI semantic model refresh.
* When a file in SharePoint is updated, start a dataflow refresh.

Save dataflow refresh metadata and build a dataflows monitoring dashboard:

* [When a dataflow refresh completes, save metadata to a Dataverse table](load-dataflow-metadata-into-dataverse-table.md)
* [When a dataflow refresh completes, save metadata to Excel online](load-dataflow-metadata-into-excel-online.md)
* [When a dataflow refresh completes, save metadata to a Power BI streaming dataset](load-dataflow-metadata-into-power-bi-dataset.md)
