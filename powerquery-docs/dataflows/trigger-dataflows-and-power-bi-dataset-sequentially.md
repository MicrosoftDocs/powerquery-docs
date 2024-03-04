---
title: Trigger dataflows and Power BI semantic models sequentially
description: How to use the dataflows connector in Power Automate to trigger dataflows and Power BI semantic models sequentially
author: miquelladeboer
ms.topic: conceptual
ms.date: 3/4/2024
ms.author: mideboer
---

# Trigger dataflows and Power BI semantic models sequentially

There are two common scenarios for how you can use this connector to trigger multiple dataflows and Power BI semantic models sequentially.

* Trigger the refresh of a standard dataflow after the successful completion of an analytical dataflow refresh.

  If a single dataflow does every action, then it's hard to reuse its tables in other dataflows or for other purposes. The best dataflows to reuse are dataflows doing only a few actions, specializing in one specific task. If you have a set of dataflows as staging dataflows, and their only action is to extract data "as is" from the source system, these dataflows can be reused in multiple other dataflows. More information: [Best practices for reusing dataflows across environments and workspaces](./best-practices-reusing-dataflows.md)

* Trigger the refresh of a Power BI semantic model when a dataflow refresh completes successfully.

  If you want to ensure that your dashboard is up to date after a dataflow refreshes your data, you can use the connector to trigger the refresh of a Power BI semantic model after your dataflow refreshes successfully.

This tutorial covers the first scenario.

To trigger dataflows sequentially:

1. Navigate to [Power Automate](https://flow.microsoft.com).
2. Select **Create** > **Automated cloud flow**.
3. Enter a flow name, and then search for the "When a dataflow refresh completes" connector. Select this connector from the list, and then select **Create**.
4. Customize the connector. Enter the following information on your dataflow:

   * **Group Type**: Select *Environment* when connecting to Power Apps and *Workspace* when connecting to Power BI.
   * **Group**: Select the Power Apps environment or the Power BI workspace your dataflow is in.
   * **Dataflow**: Select your dataflow by name. This dataflow is the initial analytical dataflow.

5. Select **New step** to add an action to your flow.
6. Search for the **Condition** connector, and then select it.
7. Customize the **Condition** connector. Enter the following information:

   1. In the first cell, add **Refresh Status** from the dataflow connector.
   2. Leave the second cell as **is equal to**.
   3. In the third cell, enter **Success**.

   [![Image with the conditions set to occur when the Refresh status equals success.](media/trigger-dataflows-and-power-bi-dataset-sequentially/email-yes-no-success.png)](media/trigger-dataflows-and-power-bi-dataset-sequentially/email-yes-no-success.png#lightbox)

8. In the **If Yes** section, select **Add an action**.
9. Search for the "Refresh a dataflow" connector, and then select it.
10. Customize the connector:

    * **Group Type**: Select *Environment* when connecting to Power Apps and *Workspace* when connecting to Power BI.
    * **Group**: Select the Power Apps environment or the Power BI workspace your dataflow is in.
    * **Dataflow**: Select your dataflow by name. This dataflow is the standard dataflow you want to refresh after the initial analytical dataflow is refreshed.

    ![Image with the refresh a dataflow connector in the If yes dialog box.](media/trigger-dataflows-and-power-bi-dataset-sequentially/refresh-a-dataflow.png)
