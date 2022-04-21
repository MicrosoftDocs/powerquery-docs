---
title: Automatically retry a dataflow on failure
description: How to use the dataflows connector in Power Automate to automatically retry a dataflow on failure
author: Luitwieler

ms.reviewer: dougklo
ms.topic: conceptual
ms.date: 04/21/2022
ms.author: jeluitwi
---

# Automatically retry a dataflow on failure

In the scenario you want to automatically retry a dataflow when the refresh fails, the Power Automate Connector is probably the way to go. In this tutorial we will guide you step by step for setting up your Power Automate Flow.

To automatically retry dataflow on failure:

1. Navigate to [Power Automate](https://flow.microsoft.com).
2. Select **Create** > **Automated cloud flow**.
3. Enter a flow name, and then search for the "When a dataflow refresh completes" connector. Select this connector from the list, and then select **Create**.
4. Customize the connector. Enter the following information on your dataflow:

   * **Group Type**: Select *Environment* when connecting to Power Apps and *Workspace* when connecting to Power BI.
   * **Group**: Select the Power Apps environment or the Power BI workspace your dataflow is in.
   * **Dataflow**: Select your dataflow by name.

5. Select **New step** to add an action to your flow.
6. Search for the **Condition** connector, and then select it.
7. Customize the **Condition** connector. Enter the following information:

   1. In the first cell, add **Refresh Status** from the dataflow connector.
   2. Leave the second cell as **is equal to**.
   3. In the third cell, enter **Failed**.

   [![Image with the conditions set to occur when the Refresh status equals success.](media/autoretrydataflowpowerautomate.png)](media/autoretrydataflowpowerautomate.png#lightbox)

8. In the **If Yes** section, select **Add an action**.
9. Search for the "Refresh a dataflow" connector, and then select it.
10. Customize the connector:

    * **Group Type**: Select *Environment* when connecting to Power Apps and *Workspace* when connecting to Power BI.
    * **Group**: Select the Power Apps environment or the Power BI workspace your dataflow is in.
    * **Dataflow**: Select the same dataflow as chosen in step 4.

    ![Image with the refresh a dataflow connector in the If yes dialog box.](media/refresh-a-dataflow.png)
