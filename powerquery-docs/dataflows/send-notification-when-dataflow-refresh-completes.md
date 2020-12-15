---
title: Send notification when dataflow refresh complete
description: How to use the Dataflows Connector Templates to send a notification when a dataflow refresh completes
author: mideboer

ms.service: powerquery
ms.reviewer: kvivek
ms.topic: conceptual
ms.date: 2/15/2020
ms.author: mideboer
---
# Send notification when dataflow refresh complete

### Use Case
When your dataflow refresh completes, you, or other people who manage or depend on the dataflow, want to get an email, teams, or other type of notification to alert you that the dataflow refresh completed and/or of its status. This way, you know your data is up to date and you can start getting new insights. Another common scenario is not get notified when a dataflow refresh failed. This way you can idediately start ivestigating the problem and alert people that depend on the data being refreshed.

### Using the templates
For sending notifications, we published three templates:
* Send an email notification when a dataflow refresh status changes
* Send email notification on success or failure of a dataflow
* When a dataflow refresh status changes, sends a Teams notification

Let's take a look at the second template:
* Navigate to [Power Automate Portal](https://flow.microsoft.com)
* Search for the template **Send email notification on succes or failure of a data flow refresh**, by following these [instructions](https://docs.microsoft.com/power-automate/get-started-logic-template)

![An example of folder structure](media/emailyesyno.PNG)

* Customize the flow
    Actions that require your input will automatically be expanded.

   The **Dataflow Refresh** trigger is expanded because you need to enter *Dataflow*. You need to enter the following information:
    * **Group Type**: Choose *Environment* when connection to Power Apps and *Workspace* when connecting to Power BI
    * **Group**: Select the Power Apps environment or the Power BI workspace your dataflow is in
    * **Dataflow**: Select your dataflow by name

After the condition, you can specify what happens after succes or failure of the dataflow. In this template in both cases, an email will be sent with the status of the dataflow refresh.

![An example of folder structure](media/isyes.PNG)

Note: you can modify the email content or flow.