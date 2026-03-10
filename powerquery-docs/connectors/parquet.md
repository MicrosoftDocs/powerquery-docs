---
title: Power Query Parquet connector
description: Includes basic information and prerequisites, instructions on how to connect using the Parquet connector, and information about advanced connection options.
author: whhender

ms.topic: concept-article
ms.date: 2/7/2024
ms.author: whhender
ms.subservice: connectors
---

# Parquet

## Summary

| Item | Description |
| ------- | ------------|
|Release state | General Availability |
| Products supported | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights |
| Authentication types supported| Anonymous (online)<br/>Account key (online)<br/>Basic (online)<br/>Organizational account (online)<br/>Shared access signature (SAS) (online)<br/>Web API (online)<br/>Windows (online) |
| Function reference docs | &mdash; |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities supported

[!INCLUDE [Includes_parquet_capabilities-supported](includes/parquet/parquet-capabilities-supported.md)]

## Connect to the Parquet file from Power Query Desktop

To connect to a Parquet file from Power Query Desktop, take the following steps:

1. Select **Parquet** in the get data experience. The get data experience in Power Query Desktop varies between apps. For more information about the Power Query Desktop get data experience for your app, go to [Where to get data](../where-to-get-data.md).

2. In **Parquet**, provide the URL for the location of the Parquet file. Enter a path and filename if you're connecting to a local file. You can also select **Advanced** and build the URL from parts. In the example used in this article, the Parquet file is located in Azure Blob Storage.

   :::image type="content" source="./media/parquet/sign-in.png" alt-text="Screenshot with Basic selected and the location of the database in the URL text box.":::

3. Select **OK**.

4. If you're connecting to this data source for the first time, select the authentication type, input your credentials, and select the level to apply the authentication settings to. Then select **Connect**.

   :::image type="content" source="./media/parquet/enter-credentials.png" alt-text="Screenshot with the Account key authentication method selected.":::

   From Power Query Desktop, select one of the following authentication methods:

   * Anonymous
   * Account key
   * Shared access signature (SAS)

   For more information about authentication methods, go to [Authentication with a data source](../connectorauthentication.md).

5. In **Navigator**, select the database information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

   :::image type="content" source="./media/parquet/navigator-desktop.png" alt-text="Screenshot with Power Query Desktop Navigator showing the example data." lightbox="./media/parquet/navigator-desktop.png":::

## Connect to a Parquet file from Power Query Online

[!INCLUDE [Includes_parquet_connect-to-power-query-online](includes/parquet/parquet-connect-to-power-query-online.md)]

## Limitations and considerations

[!INCLUDE [Includes_parquet_limitations-and-considerations](includes/parquet/parquet-limitations-and-considerations-include.md)]
