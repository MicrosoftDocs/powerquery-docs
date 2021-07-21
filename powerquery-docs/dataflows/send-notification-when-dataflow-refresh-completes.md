---
title: Send a Notification when a Dataflow Refresh Completes
description: How to use the dataflows connector in Power Automate to send a notification when a dataflow refresh completes
author: miquelladeboer

ms.service: powerquery
ms.reviewer: kvivek
ms.topic: conceptual
ms.date: 12/15/2020
ms.author: mideboer
---

# Send a Notification when a Dataflow Refresh Completes

## Introduction

When your dataflow refresh completes, you or others who manage or depend on the dataflow may want to receive a notification to alert you of the dataflow refresh status. This way, you know your data is up to date and you can start getting new insights. Another common scenario addressed by this tutorial is notification after a dataflow fails. A notification allows you to start investigating the problem and alert people that depend on the data being successfully refreshed.

## Sending a Notification Using Power Automate when a dataflow fails
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

![notification example in Power Automate.](media/emailyesyno.PNG)

* In the **If Yes** section, click on **Add an action**
* Search for the connector "Send an email notification (V3)".
* Customize the connector:
   * Add dataflow information to the content of your email by using the **add dynamic content**.

![example of complete notification flow.](media/isyes.PNG)
