---
title: Delta Sharing connector
description: Provides basic information and prerequisites for the Delta Sharing connector for Power Query.
author: bezhan-msft
ms.topic: conceptual
ms.date: 1/8/2024
ms.author: dougklo
---

# Delta Sharing

> [!NOTE]
>The following connector article is provided by Databricks, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Databricks website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Key (Bearer Token) |

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

7. In the **Authentication** dialog box, enter the token retrieved from the credentials file in the **Bearer Token** field.

8. Select **Connect**.

## Limitations and considerations

This section describes any limitations or considerations of the Delta Sharing connector.

You need to make sure that the data loaded with the Delta Sharing connector fits in the memory of your machine. To ensure this, the connector limits the number of imported rows to the Row Limit set by the user.
