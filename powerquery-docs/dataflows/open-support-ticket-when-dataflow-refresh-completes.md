---
title: Open a Ticket when a Dataflow Refresh Fails
description: How to use the dataflows connector in Power Automate to open a ticket when a dataflow refresh fails
author: miquelladeboer

ms.service: powerquery
ms.reviewer: kvivek
ms.topic: conceptual
ms.date: 12/15/2020
ms.author: mideboer
---
# Open a Ticket when a Dataflow Refresh Fails

## Introduction

When your dataflow refresh completes or has been taking longer than expected, you may want your support team to investigate. With this tutorial, you can automatically open a support ticket, create a message in a queue or Service Bus or add an item to Azure DevOps to notify your support team.

## Automatically Create a Queue in Azure Service Bus

In this tutorial, we make use of Azure Service Bus. To set up an Azure Service Bus and create a queue, see these [instructions](/azure/service-bus-messaging/service-bus-quickstart-portal#create-a-namespace-in-the-azure-portal).

* Navigate to [Power Automate](https://flow.microsoft.com).
* Create a new **automated cloud flow**

* Search for the connector "When a dataflow refresh completes (preview)". If you encounter difficulty, see these [instructions](/power-automate/get-started-logic-flow).
* Customize the connector. You need to enter information on your dataflow:
    * **Group Type**: Select *Environment* when connecting to Power Apps and *Workspace* when connecting to Power BI.
    * **Group**: Select the Power Apps environment or the Power BI workspace your dataflow is in.
    * **Dataflow**: Select your dataflow by name.


* Click on **new step** to add an action to your flow.
* Search for the connector "Condition".
* Customize the connector. You need to enter information:
   * In the first cell, add the **Refresh Status** from the dataflow connector.
   * Leave the second cell as **is equal to**.
   * Type in the third cell **False**.

![example of service bus.](media/servicebuscondition.PNG)

* In the **If Yes** section, click on **Add an action**
* Search for the connector "Send message" from Service Bus.
* Customize the connector:
   * Add dataflow information to the content of your message by using the **add dynamic content**.


![example of complete flow in service bus.](media/ifyesservice.PNG)
