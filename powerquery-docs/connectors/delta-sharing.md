---
title: Delta Sharing connector
description: Provides basic information and prerequisites for the Delta Sharing connector for Power Query.
author: whhender
ms.topic: concept-article
ms.date: 9/11/2025
ms.author: whhender
ms.subservice: connectors
---

# Delta Sharing

>[!Note]
>This connector is owned and provided by Databricks.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Key (Bearer Token)<br/>OAuth ([OpenID Connect (OIDC)](https://docs.databricks.com/aws/en/delta-sharing/sharing-over-oidc-u2m)) |

## Prerequisites

[!INCLUDE [Includes_delta-sharing_prerequisites](includes/delta-sharing/delta-sharing-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_delta-sharing_capabilities-supported](includes/delta-sharing/delta-sharing-capabilities-supported.md)]

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
    * If authenticating with OIDC, select **OAuth** from the sidebar and then select **Sign in**. Sign in using your organization's identity provider credentials.

    For more details about this process, visit [Receive Delta Sharing shares using Open ID Connect](https://docs.databricks.com/aws/en/delta-sharing/sharing-over-oidc-u2m).

8. Select **Connect**.

## Limitations and considerations

[!INCLUDE [Includes_delta-sharing_limitations-and-considerations](includes/delta-sharing/delta-sharing-limitations-and-considerations-include.md)]
