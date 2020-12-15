---
title: Trigger Dataflows and Power BI Dataset sequentially
description: How to use the dataflows connector templates in Power Automate to trigger Dataflows and Power BI Dataset sequentially
author: mideboer

ms.service: powerquery
ms.reviewer: kvivek
ms.topic: conceptual
ms.date: 2/15/2020
ms.author: mideboer
---
# Trigger Dataflows and Power BI Dataset sequentially

### Use Cases
There are two very common use cases for how you can use this connector to trigger multiple dataflows and Power BI dataset sequentially.

1. Trigger the refresh of a Standard Dataflow after the successful completion of an Analytical Dataflow refresh.

If a dataflow performs all actions, then it is hard to reuse its entities in other dataflows or for other purposes. The best dataflows to reuse are those dataflows doing only a few actions. Creating dataflows that specialize in one specific task is one of the best ways of reusing them. If you have a set of dataflows as staging dataflows, their only action is to extract data "as is" from the source system. These dataflows can be reused in multiple other dataflows. For more information, take a look at the [best practices for reusing dataflows](https://docs.microsoft.com/power-query/dataflows/best-practices-reusing-dataflows)

2. Trigger the refresh of a Power BI dataset when a dataflow refresh completed successfully.

If you want to make sure that your dashboard is directly up to date after a dataflow refreshed your data, you can use the connector to trigger the refresh of a Power BI dataset after your dataflow refreshed successfully.

### Using the Templates

let’s take a look at the first template:
* Navigate to [Power Automate Portal](https://flow.microsoft.com)
* Search for the template **Trigger a dataflow refresh after my dataflow refresh completed successfully**, by following these [instructions](https://docs.microsoft.com/power-automate/get-started-logic-template)

![An example of folder structure](media/emailyesyno.PNG)

* Customize the flow.
Actions that require input from you will automatically be expanded.

   The **Dataflow Refresh** trigger is expanded because you need to enter *Dataflow*. You need to enter the following information:
    * **Group Type**: Choose *Environment* when connecting to Power Apps and *Workspace* when connecting to Power BI
    * **Group**: Select the Power Apps environment or the Power BI workspace you dataflow is in
    * **Dataflow**: Select your dataflow by name

After the condition, you can specify what happens after success or failure of the dataflow. In this template we trigger a new dataflow:

   The **refresh a dataflow** action is expanded because you need to enter *Dataflow*. You need to enter the following information:
* **Group Type**: Choose *Environment* when connecting to Power Apps and *Workspace* when connecting to Power BI
* **Group**: Select the Power Apps environment or the Power BI workspace you dataflow is in
* **Dataflow**: Select your dataflow by name