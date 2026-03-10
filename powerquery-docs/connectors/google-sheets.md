---
title: Power Query Google Sheets connector
description: Provides basic information and prerequisites for the Google Sheets connector, descriptions of the optional input parameters, and discusses limitations and issues you might come across.
author: whhender
ms.topic: concept-article
ms.date: 1/24/2024
ms.author: whhender
ms.subservice: connectors
---

# Google Sheets

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Organizational account |
| Function Reference Documentation | &mdash; |

## Prerequisites

[!INCLUDE [Includes_google-sheets_prerequisites](includes/google-sheets/google-sheets-prerequisites.md)]

## Capabilities Supported

[!INCLUDE [Includes_google-sheets_capabilities-supported](includes/google-sheets/google-sheets-capabilities-supported.md)]

## Connect to Google Sheets data from Power Query Desktop

To connect to Google Sheets from Power Query Desktop, take the following steps:

1. In the Get Data experience, search for and select **Google Sheets**.

    :::image type="content" source="./media/google-sheets/get-data.png" alt-text="Get Data from Google Sheets.":::

2. You'll be prompted for a Google Sheets URL. Copy and paste the URL from your browser address bar into the input prompt.

3. The Google Sheets connector supports connecting through an organizational (Google) account. Select **Sign In** to continue.

    :::image type="content" source="./media/google-sheets/sign-in.png" alt-text="Sign in to Google Sheets.":::

4. A **Sign in with Google** dialog appears in an external browser window. Select your Google account and approve connecting to Power BI Desktop.

    :::image type="content" source="./media/google-sheets/sign-into-google.png" alt-text="Sign in to Google.":::

5. Once signed in, select **Connect** to continue.

    :::image type="content" source="./media/google-sheets/connect-online-to-data.png" alt-text="Connect to Google Sheets Data.":::

6. Once you successfully connect, a **Navigator** window appears and displays the data available on the server. Select your data in the navigator. Then select either **Transform Data** to transform the data in Power Query or **Load** to load the data in Power BI Desktop.

## Limitations and considerations

[!INCLUDE [Includes_google-sheets_limitations-and-considerations](includes/google-sheets/google-sheets-limitations-and-considerations-include.md)]
