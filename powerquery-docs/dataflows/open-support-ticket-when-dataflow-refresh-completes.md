---
title: Open a ticket when a dataflow refresh fails
description: How to use the dataflows connector in Power Automate to open a ticket when a dataflow refresh fails.
author: miquelladeboer
ms.topic: conceptual
ms.date: 2/13/2024
ms.author: mideboer
---

# Open a ticket when a dataflow refresh fails

When your dataflow refresh completes or has been taking longer than expected, you might want your support team to investigate. With this tutorial, you can automatically open a support ticket, create a message in a queue or Service Bus, or add an item to Azure DevOps to notify your support team.

In this tutorial, we make use of Azure Service Bus. For instructions on how to set up an Azure Service Bus and create a queue, go to [Use Azure portal to create a Service Bus namespace and a queue](/azure/service-bus-messaging/service-bus-quickstart-portal).

To automatically create a queue in Azure Service Bus:

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

8. In the **If Yes** section, select **Add an action**.
9. Search for the "Send message" connector from Service Bus, and then select it.

   :::image type="content" source="media/open-support-ticket/service-bus-condition.png" alt-text="Screenshot of the full flow diagram with the Service Bus send message connector opened." lightbox="media/open-support-ticket/service-bus-condition.png":::

10. Enter a **Connection name** for this message. In **Connection string**, enter the connection string that was generated when you created the Service Bus namespace. Then select **Create**.
11. Add dataflow information to the content of your message by selecting the field next to **Content**, and then select the dynamic content you want to use from **Dynamic content**.

    :::image type="content" source="media/open-support-ticket/if-yes-service.png" alt-text="Screenshot of the Send message connector with the Content field filled in with content from the dynamic content dialog box." lightbox="media/open-support-ticket/if-yes-service.png":::
