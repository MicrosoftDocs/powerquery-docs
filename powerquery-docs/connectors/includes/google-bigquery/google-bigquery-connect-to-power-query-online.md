---
title: Include file for the Connect to Power Query Online section of the Google BigQuery connector documentation
description: Include file for the Connect to Power Query Online section of the Google BigQuery connector documentation
ms.date: 03/06/2026
ms.topic: include
---

To connect to Google BigQuery from Power Query Online, take the following steps:

1. Select the **Google BigQuery** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](/power-query/where-to-get-data).

   :::image type="content" source="/power-query/connectors/media/google-bigquery/get-data-online.png" alt-text="Screenshot of the Get Data dialog with emphasis on the Google BigQuery connector." lightbox="/power-query/connectors/media/google-bigquery/get-data-online.png":::

2. In the **Google BigQuery Database** dialog, you might need to either create a new connection or select an existing connection. Select either an organizational or service account to sign in. If you're using on-premises data, select an on-premises data gateway. Then select **Sign in**.

    :::image type="content" source="/power-query/connectors/media/google-bigquery/sign-in-online.png" alt-text="Screenshot of the Connect to data source dialog where you sign in to Google BigQuery." lightbox="/power-query/connectors/media/google-bigquery/sign-in-online.png":::

3. A **Sign in with Google** dialog appears. Select your Google account and approve connecting.

    > [!NOTE]
    >Although the sign in dialog box says you continue to Power BI Desktop once you sign in, you're sent to your online app instead.

    :::image type="content" source="/power-query/connectors/media/google-bigquery/sign-into-google-online.png" alt-text="Screenshot of the Google sign in dialog where you sign in to your account.":::

4. If you want to use any advance options, select **Advanced options**. More information: [Connect using advanced options](/power-query/connectors/google-bigquery#connect-using-advanced-options)

5. Once signed in, select **Next** to continue.

    :::image type="content" source="/power-query/connectors/media/google-bigquery/connect-online-to-data.png" alt-text="Screenshot of the Connect to data source dialog with the user successfully signed in." lightbox="/power-query/connectors/media/google-bigquery/connect-online-to-data.png":::

6. Once you successfully connect, a **Navigator** window appears and displays the data available on the server. Select your data in the navigator. Then select **Next** to transform the data in Power Query.

    :::image type="content" source="/power-query/connectors/media/google-bigquery/navigator-bigquery-online.png" alt-text="Screenshot of the Power Query navigator loading Google BigQuery data to online app." lightbox="/power-query/connectors/media/google-bigquery/navigator-bigquery-online.png":::

