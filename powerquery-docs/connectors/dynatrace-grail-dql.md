---
title: Connect Power BI to Dynatrace Grail
description: The connector allows Power BI users to access a Dynatrace environment on which they have the necessary permissions to run DQL queries.
author: gordon-dt
ms.date: 
ms.author: 
---

# Dynatrace Grail (Beta)

The following connector article is provided by Dynatrace, the owner of
this connector and a member of the Microsoft Power Query Connector
Certification Program. If you have questions regarding the content of
this article or have changes you would like to see made to this article,
visit the Dynatrace website and use the support channels there.

|Item|                                Description|
------|----------------------------------------------------------------
|Release State|                       Pre-Release|
|Products|                            Power BI (Semantic Models)|
|Authentication Types Supported|      Windows (Power BI Desktop)|
|Function Reference Documentation|    Source|

## Prerequisites

### Dynatrace environment

It is assumed that a Dynatrace environment is already configured for
connection from Power BI Desktop.

On Microsoft Azure that can be done through the Marketplace and
searching for: **Azure Native Dynatrace Service**

Follow the instruction to set up a Dynatrace SaaS environment and make
sure the environment is set to the new version and not previous classic
as the latest version contains the Dynatrace Grail data lakehouse and is set up for
the authentication requirements for the connector.

## Capabilities Supported

| Capability                                  |
| ------------------------------------------- |
| Import mode only                            |
| Option to enter a DQL query when connecting - limited to a maximum of 1 million rows |


## Connection to Dynatrace Grail from Power BI Desktop

To connect to a Dynatrace SaaS instance from Power Query Desktop, take
the following steps:

1) Select **Dynatrace Grail DQL** in the get data experience.
   
![Screenshot of the Get Data dialog to connect to Dynatrace Grail.](./media/dynatrace-grail-dql/connector1-white.png)

2) Enter your Dynatrace environment. Note that this needs to be the latest Dynatrace version with Grail enabled. The DQL query is optional at this point, but should be used for more complex queries outside of the default queries built in.

![Screenshot of the environment entry dialog box for the Dynatrace tenant to connect to.](./media/dynatrace-grail-dql/connector3-white.png)

3) Sign into your environment to authenticate your permissions.

![Screenshot of the Power Query authentication dialog when you sign in.](./media/dynatrace-grail-dql/connector4-white.png)

4) A browser window will pop up requiring your credentials.

![Screenshot of the Windows authenticated user account to select.](./media/dynatrace-grail-dql/connector5-white.png)

5) Once you have successfully authenticated, the message will show that you are currently signed in. Click Connect.

![Screenshot of a successfully signed in dialog box.](./media/dynatrace-grail-dql/connector6-white.png)

6) The Navigator screen shows the record types available to select from Dynatrace Grail.

![Sample screenshot of record types available in Dynatrace Grail.](./media/dynatrace-grail-dql/connector7-white.png)

7) Selecting one of them, Logs in this example, runs a fetch logs DQL query with a default 1000 row limit. Note that you require permissions on the Dynatrace environment in order to be able to run this query successfully.

![Sample screenshot of a resultant DQL log query from Dynatrace Grail.](./media/dynatrace-grail-dql/connector8-white.png)

8) The Advanced Editor shows the M code the connector is using.

![Screenshot of the connector in M code.](./media/dynatrace-grail-dql/connector9-white.png)

9)  An optional step when connecting is to type in a DQL query directly. In this example fetch logs (default last 2 hours) with a limit of 1000 rows.

![Screenshot of a sample DQL query that can be used in the connector.](./media/dynatrace-grail-dql/connector10-white.png)

10) The resulting import into Power BI looks similar to this.

![Screenshot of a sample set of Log rows imported into Power BI](./media/dynatrace-grail-dql/connector11-white.png)

### Troubleshooting

-   The latest version ("New" not "Classic") of Dynatrace SaaS is
    required.

-   The correct permissions outlined in [Dynatrace
    documentation](https://docs.dynatrace.com/docs/platform/grail/data-model/assign-permissions-in-grail)
    are required to be able to:

    -   Connect to the environment

    -   Run DQL queries against the Dynatrace platform
