---
title: Troubleshooting dataflow issue - get data from dataflow
description: Troubleshooting dataflow issue - get data from dataflow.
author: Luitwieler
ms.topic: conceptual
ms.date: 1/6/2023
ms.author: jeluitwi
---

# Troubleshooting dataflow issues: Get data from a dataflow

You might have created a dataflow but then had difficulty getting data from it (either by using Power Query in Power BI Desktop or from other dataflows). This article explains some of the most common problems with getting data from a dataflow.

## Error: This table is empty

Let's assume that you're getting data from a dataflow (either in Power BI Desktop or in another dataflow), and you have access to that dataflow. Sometimes, however, when you get data from a dataflow in the above situation, you get a message in the **Navigator** window saying "This table is empty."

**Reason:**

The data wasn't loaded into the table.

**Resolution:**

In the desktop tools, such as Power Query in Excel and Power Query in Power BI Desktop, the loading of data into tables happens automatically (unless you disable it). This behavior is a bit different in Power Query in dataflows. In dataflow tables, the data won't be loaded unless you refresh the data.

You have to set up a scheduled refresh for a dataflow, or&mdash;if you want to just have a single refresh&mdash;use the manual refresh option.

![Refresh a dataflow.](/power-bi/transform-model/media/service-dataflows-create-use/dataflows-create-use_13.png)

![Schedule refresh for dataflows.](/power-bi/transform-model/media/service-dataflows-create-use/dataflows-create-use_14.png)

After a dataflow is refreshed, the data in tables is visible in the **Navigator** window of other tools and services.

More information: [Refreshing a dataflow in Power BI](/power-bi/transform-model/dataflows/dataflows-configure-consume#refreshing-a-dataflow) and [Set the refresh frequency in Power Apps](/powerapps/maker/common-data-service/create-and-use-dataflows#set-the-refresh-frequency)

## My Microsoft Power Platform dataflow isn't listed

Sometimes, you have a Microsoft Power Platform dataflow you created and also refreshed, but you still can't access it through the **Get data** command. This might be because the account that's trying to access the dataflow doesn't have access. However, if the account does have access to the dataflow, another reason might be the type of dataflow you're accessing.

You might receive the error message "We reached the end of the buffer" or "DataFormat.Error: We reached the end of the buffer".

:::image type="content" source="media/troubleshoot-dataflow-issue-get-data-from-dataflow/standard-dataflow-get-data.png" alt-text="Get data from a standard dataflow.":::

**Reason:**

Only analytical dataflows can be used in a **Get data** operation from a dataflow.

**Resolution:**

If you've created a dataflow that stores data in Dataverse&mdash;that is, a standard dataflow&mdash;you can't see it by using the **Get data** operation from a dataflow. However, you can use [**Get data** from Dataverse](../connectors/dataverse.md#finding-your-dataverse-environment-url) to access it. Or you can create an [analytical dataflow](understanding-differences-between-analytical-standard-dataflows.md) instead, and then access it by using **Get data** from a dataflow.

:::image type="content" source="media/troubleshoot-dataflow-issue-get-data-from-dataflow/get-data-standard-analytical-dataflow.png" alt-text="Get data from standard dataflow versus analytical dataflows.":::

## I can't make a DirectQuery connection to the dataflow

If you intend to use the dataflow as a DirectQuery source, you might need to enable it first.

**Reason:**

The enhanced compute engine settings are disabled.

**Resolution:**

[Enable the enhanced compute engine](/power-bi/transform-model/service-dataflows-directquery), and then you'll have the option to connect to the dataflow by using DirectQuery.

![Enable the enhanced compute engine.](/power-bi/transform-model/media/service-dataflows-directquery/dataflows-directquery-01.png)
