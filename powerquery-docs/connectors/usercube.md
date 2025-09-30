---
title: Power Query Usercube connector
description: Provides basic information and prerequisites for the Usercube connector. Also includes descriptions of the optional input parameters, and discusses limitations and issues you might run into.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 1/24/2024
ms.author: dougklo
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Usercube (Beta)

> [!NOTE]
>The following connector article is provided by Usercube, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Usercube website and use the support channels there.

## Summary

| Item                             | Description                                                                  |
| -------------------------------- | ---------------------------------------------------------------------------- |
| Release State                    | Beta                                                                         |
| Products                         | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)      |
| Authentication Types Supported   | Client Credentials                                                           |
| Function Reference Documentation | &mdash;                                                                      |

## Prerequisites

You must have a Usercube instance with the *PowerBI* option.

## Capabilities supported

- Import

## Connect to Usercube from Power Query Desktop

To connect to a Usercube server:

1. Launch Power BI Desktop and enter the **Get Data** experience.

2. From the **Other** category, select **Usercube**, and then select **Connect**.

   :::image type="content" source="media/usercube/usercube-get-data.png" alt-text="Get Data.":::

3. You'll be prompted to specify your Usercube server's URL.

   :::image type="content" source="media/usercube/usercube-server.png" alt-text="Usercube Server.":::

4. Enter the client credentials. The *Client Id* must be built from the *Identifier* of an *OpenIdClient* element. This element is defined in the configuration of your Usercube instance. To this identifier, you must concatenate the `@` character and the domain name of the Usercube instance.

   :::image type="content" source="media/usercube/usercube-client-credentials.png" alt-text="Client credentials.":::

5. In **Navigator**, select the data you require. Then, either select **Transform data** to transform the data in the  Power Query Editor, or choose **Load** to load the data in Power BI.

   :::image type="content" source="./media/usercube/usercube-import-data-navigator.png" alt-text="Usercube import data navigator.":::
