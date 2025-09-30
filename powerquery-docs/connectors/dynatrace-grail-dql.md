---
title: Connect Power BI to Dynatrace Grail
description: The connector allows users to access a Dynatrace environment on which they have the necessary permissions to run Dynatrace Query Language (DQL) queries.
author: gordon-dt
ms.date: 3/17/2025
ms.author: dougklo
---

# Dynatrace Grail (Beta)

## Summary

|Item|                                Description|
|------|----------------------------------------------------------------|
|Release State|                       Beta|
|Products|                            Power BI (Semantic Models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)|
|Authentication Types Supported|      Windows (Power BI Desktop)<br/>Organizational account|
|Function Reference Documentation|    Source|

> [!NOTE]
>The following connector article is provided by Dynatrace, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Dynatrace website and use the support channels there.

## Prerequisites

It's assumed that a Dynatrace environment is already configured for connection from Power BI Desktop.

On Microsoft Azure, that can be done through the Marketplace and searching for **Azure Native Dynatrace Service**.

Follow the instructions to set up a Dynatrace SaaS environment. Make sure the environment is set to the new version and not the previous classic version, as the latest version contains the Dynatrace Grail data lakehouse and is set up for the authentication requirements for the connector.

## Capabilities Supported

- Import mode only
- Option to enter a DQL query when connecting&mdash;limited to a maximum of 1 million rows

## Connection to Dynatrace Grail from Power BI Desktop

To connect to a Dynatrace SaaS instance from Power Query Desktop, take the following steps:

1. Select **Dynatrace Grail DQL** in the get data experience. For more information, go to [Where to get data](../where-to-get-data.md).

   :::image type="content" source="./media/dynatrace-grail-dql/connector1-white.png" alt-text="Screenshot of the Get Data dialog to connect to Dynatrace Grail.":::

2. Enter your Dynatrace environment. This environment needs to be the latest Dynatrace version with Grail enabled. The DQL query is optional at this point, but should be used for more complex queries outside of the default built in queries.

   :::image type="content" source="./media/dynatrace-grail-dql/connector3-white.png" alt-text="Screenshot of the environment entry dialog box for the Dynatrace tenant to connect to.":::

3. Sign into your environment to authenticate your permissions.

   :::image type="content" source="./media/dynatrace-grail-dql/connector4-white.png" alt-text="Screenshot of the Power Query authentication dialog when you sign in.":::

4. A browser window pops up that requires you to enter your credentials.

   :::image type="content" source="./media/dynatrace-grail-dql/connector5-white.png" alt-text="Screenshot of the Windows authenticated user account to select.":::

5. Once you successfully authenticate, the message shows that you're currently signed in. Select **Connect**.

   :::image type="content" source="./media/dynatrace-grail-dql/connector6-white.png" alt-text="Screenshot of a successfully signed in dialog box.":::

6. The Navigator screen shows the record types available to select from Dynatrace Grail.

   :::image type="content" source="./media/dynatrace-grail-dql/connector7-white.png" alt-text="Sample screenshot of record types available in Dynatrace Grail.":::

7. Selecting one of them logs in this example, and runs a fetch logs DQL query with a default 1000 row limit. You require permissions on the Dynatrace environment in order to run this query successfully.

   :::image type="content" source="./media/dynatrace-grail-dql/connector8-white.png" alt-text="Sample screenshot of a resultant DQL log query from Dynatrace Grail." lightbox="./media/dynatrace-grail-dql/connector8-white.png":::

8. The advanced editor shows the M code the connector is using.

   :::image type="content" source="./media/dynatrace-grail-dql/connector9-white.png" alt-text="Screenshot of the connector in Power Query M code.":::

9. An optional step when connecting is to type in a DQL query directly. The following example fetches logs (default last 2 hours) with a limit of 1,000 rows.

   :::image type="content" source="./media/dynatrace-grail-dql/connector10-white.png" alt-text="Screenshot of a sample DQL query that can be used in the connector.":::

10. The resulting import into Power BI looks similar to this example.

    :::image type="content" source="./media/dynatrace-grail-dql/connector11-white.png" alt-text="Screenshot of a sample set of Log rows imported into Power BI." lightbox="./media/dynatrace-grail-dql/connector11-white.png":::

### Troubleshooting

- The latest version ("New" not "Classic") of Dynatrace SaaS is required.

- The correct permissions outlined in [Dynatrace documentation](https://docs.dynatrace.com/docs/platform/grail/data-model/assign-permissions-in-grail) are required to be able to:

  - Connect to the environment
  - Run DQL queries against the Dynatrace platform
