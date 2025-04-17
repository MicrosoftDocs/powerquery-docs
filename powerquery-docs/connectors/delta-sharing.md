---
title: Delta Sharing connector
description: Provides basic information and prerequisites for the Delta Sharing connector for Power Query.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 1/24/2024
ms.author: dougklo
ms.subservice: connectors
---

# Delta Sharing

> [!NOTE]
>The following connector article is provided by Databricks, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Databricks website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Key (Bearer Token)<br/>OAuth ([OpenID Connect (OIDC)](https://docs.databricks.com/aws/en/delta-sharing/sharing-over-oidc-u2m)) |

## Prerequisites

If you use Power BI Desktop you need to install the November release of Power BI Desktop or later. [Download the latest version](https://www.microsoft.com/download/details.aspx?id=58494).

The data provider sends an activation URL from which you can download a credentials file that grants you access to the shared data.

After downloading the credentials file, open it with a text editor to retrieve the endpoint URL and the token.

For detailed information about Delta Sharing, visit [Access data shared with you using Delta Sharing](https://docs.databricks.com/delta-sharing/recipient.html).

## Capabilities supported

* Import

## Connect to Databricks Delta Sharing in Power BI Desktop

To connect to Databricks using the Delta Sharing connector, use the following steps:

1. Open Power BI Desktop.

2. Navigate to the **Get Data** menu and search for **Delta Sharing**.

3. Select the connector and then select **Connect**.

4. Enter the endpoint URL retrieved from the credentials file in the Delta Sharing Server URL field.

5. Optionally, in the **Advanced Options** tab you can set a **Row Limit** for the maximum number of rows you can download. This is set to 1 million rows by default.

6. Select **OK**.

7. In the **Delta sharing** authentication dialog box, provide your authentication type:

    * If authenticating with bearer tokens, select **Authentication** from the sidebar and enter the token retrieved from the credentials file in the **Bearer Token** field.
    * If authenticating with OIDC, select **OAuth** from the sidebar and click **Sign in**. Log in using your organization's identity provider credentials.

        * For more details about this process, visit [Receive Delta Sharing shares using Open ID Connect](https://docs.databricks.com/aws/en/delta-sharing/sharing-over-oidc-u2m).

8. Select **Connect**.

## Limitations and considerations

This section describes any limitations or considerations of the Delta Sharing connector.

You need to make sure that the data loaded with the Delta Sharing connector fits in the memory of your machine. To ensure this, the connector limits the number of imported rows to the Row Limit set by the user.
