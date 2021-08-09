---
title: Trigger Dataflows and Power BI Datasets sequentially
description: How to use the dataflows connector in Power Automate to trigger dataflows and Power BI datasets sequentially
author: miquelladeboer

ms.service: powerquery
ms.reviewer: kvivek
ms.topic: conceptual
ms.date: 12/15/2020
ms.author: mideboer
---
# Trigger Dataflows and Power BI Datasets Sequentially

## Introduction
There are two common scenarios for how you can use this connector to trigger multiple dataflows and Power BI datasets sequentially.

1. Trigger the refresh of a standard dataflow after the successful completion of an analytical dataflow refresh.

If a dataflow performs all actions, then it is hard to reuse its entities in other dataflows or for other purposes. The best dataflows to reuse are dataflows doing only a few actions, specializing in one specific task. If you have a set of dataflows as staging dataflows, and their only action is to extract data "as is" from the source system, these dataflows can be reused in multiple other dataflows. For more information, see the [best practices for reusing dataflows](./best-practices-reusing-dataflows.md).

2. Trigger the refresh of a Power BI dataset when a dataflow refresh completes successfully.

If you want to ensure that your dashboard is up to date after a dataflow refreshes your data, you can use the connector to trigger the refresh of a Power BI dataset after your dataflow refreshes successfully.

## Trigger Dataflows Sequentially

This tutorial covers the first scenario above.

* Navigate to [Power Automate](https://flow.microsoft.com).
* Create a new **automated cloud flow**

* Search for the connector "When a dataflow refresh completes (preview)". If you encounter difficulty, see these [instructions](/power-automate/get-started-logic-flow).
* Customize the connector. You need to enter information on your dataflow:
    * **Group Type**: Select *Environment* when connecting to Power Apps and *Workspace* when connecting to Power BI.
    * **Group**: Select the Power Apps environment or the Power BI workspace your dataflow is in.
    * **Dataflow**: Select your dataflow by name.

* Customize the flow. Actions that require input from you will automatically be expanded.

* Click on **new step** to add an action to your flow.
* Search for the connector "Condition".
* Customize the connector. You need to enter information:
   * In the first cell, add the **Refresh Status** from the dataflow connector.
   * Leave the second cell as **is equal to**.
   * Type in the third cell **Succes**.

![overview of simultaneous dataflow.](media/emailyesyno.PNG)

* In the **If Yes** section, click on **Add an action**
* Search for the connector "Refresh a dataflow".
* Customize the connector:
    * **Group Type**: Select *Environment* when connecting to Power Apps and *Workspace* when connecting to Power BI.
    * **Group**: Select the Power Apps environment or the Power BI workspace your dataflow is in.
    * **Dataflow**: Select your dataflow by name.
