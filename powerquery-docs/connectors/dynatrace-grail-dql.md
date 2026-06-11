---
title: Connect Power BI to Dynatrace Grail
description: The connector allows users to access a Dynatrace environment on which they have the necessary permissions to run Dynatrace Query Language (DQL) queries.
author: gordon-dt
ms.date: 10/16/2025
ms.author: whhender
---

# Dynatrace Grail

## Summary

|Item|                                Description|
|------|----------------------------------------------------------------|
|Release State|                       General Availability|
|Products|                            Power BI (Semantic Models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)|
|Authentication Types Supported|      Windows (Power BI Desktop)<br/>Organizational account|
|Function Reference Documentation|    Source|

> [!NOTE]
>This connector is owned and provided by Dynatrace.

## Prerequisites

[!INCLUDE [Includes_dynatrace-grail-dql_prerequisites](includes/dynatrace-grail-dql/dynatrace-grail-dql-prerequisites.md)]

## Capabilities Supported

[!INCLUDE [Includes_dynatrace-grail-dql_capabilities-supported](includes/dynatrace-grail-dql/dynatrace-grail-dql-capabilities-supported.md)]

## Connection to Dynatrace Grail from Power BI Desktop

To connect to a Dynatrace SaaS instance from Power Query Desktop, take the following steps:

1. Select **Dynatrace Grail DQL** in the get data experience. For more information, go to [Where to get data](../where-to-get-data.md).

   :::image type="content" source="./media/dynatrace-grail-dql/connector1-white.png" alt-text="Screenshot of the Get Data dialog to connect to Dynatrace Grail.":::

2. Enter your Dynatrace environment. This environment needs to be the latest Dynatrace version with Grail enabled. The DQL query is optional at this point, but should be used for more complex queries outside of the default built in queries.

   :::image type="content" source="./media/dynatrace-grail-dql/connector3-white.png" alt-text="Screenshot of the environment entry dialog box for the Dynatrace tenant to connect to.":::

3. If you want to use any **advanced options**, select the option and enter the data to use with that option. More information: [Connect using advanced options](#connect-using-advanced-options)

4. Sign into your environment to authenticate your permissions.

   :::image type="content" source="./media/dynatrace-grail-dql/connector4-white.png" alt-text="Screenshot of the Power Query authentication dialog when you sign in.":::

5. A browser window pops up that requires you to enter your credentials.

   :::image type="content" source="./media/dynatrace-grail-dql/connector5-white.png" alt-text="Screenshot of the Windows authenticated user account to select.":::

6. Once you successfully authenticate, the message shows that you're currently signed in. Select **Connect**.

   :::image type="content" source="./media/dynatrace-grail-dql/connector6-white.png" alt-text="Screenshot of a successfully signed in dialog box.":::

7. The Navigator screen shows the record types available to select from Dynatrace Grail.

   :::image type="content" source="./media/dynatrace-grail-dql/connector7-white.png" alt-text="Sample screenshot of record types available in Dynatrace Grail." lightbox="./media/dynatrace-grail-dql/connector7-white.png":::

8. Selecting one of the logs in this example runs a fetch logs DQL query with a default 1000 row limit. You require permissions on the Dynatrace environment in order to run this query successfully.

   :::image type="content" source="./media/dynatrace-grail-dql/connector8-white.png" alt-text="Sample screenshot of a resultant DQL log query from Dynatrace Grail." lightbox="./media/dynatrace-grail-dql/connector8-white.png":::

9. The advanced editor shows the M code the connector is using.

   :::image type="content" source="./media/dynatrace-grail-dql/connector9-white.png" alt-text="Screenshot of the connector in Power Query M code.":::

10. An optional step when connecting is to type in a DQL query directly. The following example fetches logs (default last 2 hours) with a limit of 1,000 rows.

    :::image type="content" source="./media/dynatrace-grail-dql/connector10-white.png" alt-text="Screenshot of a sample DQL query that can be used in the connector." lightbox="./media/dynatrace-grail-dql/connector10-white.png":::

11. The resulting import into Power BI looks similar to this example.

    :::image type="content" source="./media/dynatrace-grail-dql/connector11-white.png" alt-text="Screenshot of a sample set of Log rows imported into Power BI." lightbox="./media/dynatrace-grail-dql/connector11-white.png":::

## Connect to Dynatrace Grail from Power Query Online

[!INCLUDE [Includes_dynatrace-grail-dql_connect-to-power-query-online](includes/dynatrace-grail-dql/dynatrace-grail-dql-connect-to-power-query-online.md)]

