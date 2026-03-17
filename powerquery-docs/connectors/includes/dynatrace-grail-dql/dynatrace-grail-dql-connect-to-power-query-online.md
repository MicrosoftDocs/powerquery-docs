---
title: Include file for the Connect to Power Query Online section of the Connect Power BI to Dynatrace Grail connector documentation
description: Include file for the Connect to Power Query Online section of the Connect Power BI to Dynatrace Grail connector documentation
ms.date: 03/06/2026
ms.topic: include
---

To connect to Dynatrace Grail DQL from Power Query Online:

1. Select the **Dynatrace Grail DQL** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information, go to [Where to get data](../../../where-to-get-data.md).

   :::image type="content" source="../../media/dynatrace-grail-dql/connector12-white.png" alt-text="Screenshot of the Get Data dialog in Power Query Online to connect to Dynatrace Grail.":::

2. Enter your Dynatrace environment. This environment needs to be the latest Dynatrace version with Grail enabled. The DQL query is optional at this point, but should be used for more complex queries outside of the default built in queries.

   :::image type="content" source="../../media/dynatrace-grail-dql/connector13-white.png" alt-text="Screenshot of the environment entry dialog box in Power Query Online for the Dynatrace tenant to connect to.":::

3. If you want to use any **advanced options**, select the option and enter the data to use with that option. More information: [Connect using advanced options](#connect-using-advanced-options)

4. Sign into your environment to authenticate your permissions. **Sign in** with an organizational account.

5. After you've successfully signed in, select **Next**.

6. The Navigator screen shows the record types available to select from Dynatrace Grail.

   :::image type="content" source="../../media/dynatrace-grail-dql/connector14-white.png" alt-text="Sample screenshot of record types available in Power Query Online in Dynatrace Grail." lightbox="../../media/dynatrace-grail-dql/connector14-white.png":::

7. Selecting one of the logs in this example runs a fetch logs DQL query with a default 1000 row limit. You require permissions on the Dynatrace environment in order to run this query successfully.

   :::image type="content" source="../../media/dynatrace-grail-dql/connector15-white.png" alt-text="Sample screenshot of a resultant DQL log query from Dynatrace Grail in Power Query Online." lightbox="../../media/dynatrace-grail-dql/connector15-white.png":::

8. An optional step when connecting is to type in a DQL query directly. The following example fetches logs (default last 2 hours) with a limit of 50 rows.

   :::image type="content" source="../../media/dynatrace-grail-dql/connector16-white.png" alt-text="Screenshot of a sample DQL query that can be used in the connector in Power Query Online." lightbox="../../media/dynatrace-grail-dql/connector16-white.png":::

9. The resulting import into Power BI looks similar to this example.

   :::image type="content" source="../../media/dynatrace-grail-dql/connector17-white.png" alt-text="Screenshot of a sample set of Log rows imported into Power Query Online." lightbox="../../media/dynatrace-grail-dql/connector17-white.png":::

### Connect using advanced options

Both Power Query Desktop and Power Query Online provide a set of advanced options that you can add to your query if needed.

The following table lists all of the advanced options you can set in Power Query Desktop and Power Query Online.

| Advanced option       | Description                                                                    |
|-----------------------|--------------------------------------------------------------------------------|
| Read data limit       | Limit in gigabytes for the amount of data that will be scanned during read. Note: Increasing this limit can increase associated costs.                                                                           |
| Record limit          | The maximum number of result records that this query will return. Note: Increasing the maximum can result in longer run times. |
| Result size limit     | The maximum number of result bytes that this query will return. Note: Increasing the maximum can affect performance.                        |
| Sampling              | Results in the selection of a subset of Log or Span records.                                                                         |

### Troubleshooting

- The latest version ("New" not "Classic") of Dynatrace SaaS is required.

- The correct permissions outlined in [Dynatrace documentation](https://docs.dynatrace.com/docs/platform/grail/data-model/assign-permissions-in-grail) are required to be able to:

  - Connect to the environment
  - Run DQL queries against the Dynatrace platform
  