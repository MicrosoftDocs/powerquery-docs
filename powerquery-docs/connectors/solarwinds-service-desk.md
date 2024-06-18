---
title: SolarWinds Service Desktop
description: Provides basic information, prerequisites, and instructions on how to connect to the SolarWinds Service Desktop connector.
author: giladsmg
ms.author: dougklo
ms.topic: conceptual
ms.date: 2/15/2024
---

# SolarWinds Service Desk

This connector lets you incrementally import incidents and different asset records from SolarWinds Service Desk (SWSD) to Microsoft Power BI. The import provides raw data on the topics most relevant to your organization. You can then review and analyze the data by viewing it in various formats, such as tables, graphs, and charts.

> [!NOTE]
> The following connector article is provided by SolarWinds, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or want to request changes to it, visit the [SolarWinds Service Desk - Power BI Connector](https://documentation.solarwinds.com/en/success_center/swsd/default.htm#powerbi.htm?cshid=swsd_powerbi) documentation website.

## Summary

| Item                           | Description                                  |
|--------------------------------|----------------------------------------------|
| Release state                  | General Availability                                         |
| Products                       | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/> Fabric (Dataflow Gen2) |
| Authentication Types Supported | SolarWinds Service Desk JSON Web Token (JWT) |

## Prerequisites

Before you can use this connector to get SolarWinds Service Desk data, you must have a SolarWinds Service Desk user who has set up [Token authentication for API integration](https://documentation.solarwinds.com/en/success_center/swsd/content/completeguidetoswsd/token-authentication-for-api-integration.htm).

## Capabilities supported

* Import

## Connect to SolarWinds Service Desk

The following instructions contain special steps for customers who previously used the BETA SWSD Power BI connector to create reports and want to connect those reports with the new out-of-the-box version.

1. In Power BI Desktop, select **Get Data** from **Home**. Select **SolarWinds Service Desk**, and then select **Connect**.

   :::image type="content" source="./media/solarwinds-service-desk/get-data.png" alt-text="Screenshot of Get Data from SolarWinds Service Desk.":::

2. Sign in with the JSON web token you generated as described in prerequisites, and then select **Connect** to verify your access to SWSD.

   :::image type="content" source="./media/solarwinds-service-desk/auth-key.png" alt-text="Screenshot of Auth Key Dialog.":::

3. In the **Navigator** dialog box, select the tables you want to import. Then select **Load**.

   :::image type="content" source="./media/solarwinds-service-desk/nav-data.png" alt-text="Screenshot of SolarWinds Service Desk Navigator." lightbox="./media/solarwinds-service-desk/nav-data.png":::

4. After you complete the previous steps, you should see your chosen models load under Data view. The records you have just imported were created in SWSD during the last month.

### Extra steps for previous users of the BETA connector

If you previously used the BETA SWSD Power BI Connector to create reports, and you already have model name incidents and reports based on it, and you want to connect those reports with the new out-of-the-box version, follow these steps:

1. Go to the **Incidents** model, and right-click **Edit query**. A Power Query editor opens.

   :::image type="content" source="./media/solarwinds-service-desk/open-query-editor.png" alt-text="Screenshot Open Query editor.":::

2. Select the **Incidents** query and open the advanced editor.

   :::image type="content" source="./media/solarwinds-service-desk/open-advanced-editor.png" alt-text="Screenshot Open Advanced Editor.":::

   You should see the following lines:

   ````powerquery-m
       Source = SolarWindsServiceDesk.Contents(),
       Incidents1 = Source{[Name="Incidents"]}[Data] 
   ````

3. Replace those lines with the following lines:

   ````powerquery-m
       Source = SolarWindsServiceDesk.ContentsV110(null, null),
       #"All Objects" = Source{[Name="All Objects"]}[Data], 
       Incidents1 = #"All Objects"{[Name="Incidents"]}[Data] `
   ````

4. Select **Done**.
5. Select **Close & Apply**.

The reports display data from the past month instead of the last two years. Going forward, those reports are connected to the new SWSD Power BI connector.

## Incremental refresh setting

Incremental refresh saves download time after your initial download is performed. To set up incremental refresh, follow these steps:

1. On the **Home** menu bar, select **Transform Data**. A Power Query editor opens.
2. Open **Manage Parameters** > **Create parameters**. Create two new DateTime parameters named **RangeEnd** and **RangeStart**, with one month set as the range between them. These new parameters reduce download time. For instructions, go to [create-parameters](/power-bi/connect-data/incremental-refresh-configure#create-parameters).

   :::image type="content" source="./media/solarwinds-service-desk/create-parameters.png" alt-text="Screenshot create parameters.":::

3. For each query you want to set with incremental refresh, open the advanced editor.

   The following line displays:

   ````powerquery-m
       Source = SolarWindsServiceDesk.ContentsV110(null, null),
   ````

4. Replace the line with the following code:

   ````powerquery-m
       Source = SolarWindsServiceDesk.ContentsV110(RangeStart, RangeEnd),
   ````

5. Select **Done**.
6. Select **Close & Apply**.
7. Go to Data view.
8. For each model you’re downloading, define the policy for incremental refresh and real-time data as shown in the following image.

   :::image type="content" source="./media/solarwinds-service-desk/open-incremental-refresh.png" alt-text="Screenshot open incremental refresh.":::

   1. Archive data starting two years before the refresh date. Don't exceed two years.

   1. Incrementally refresh data starting one day before the refresh date. For instructions, go to [define-policy](/power-bi/connect-data/incremental-refresh-configure#define-policy).

   :::image type="content" source="./media/solarwinds-service-desk/set-incremental-refresh.png" alt-text="Screenshot set incremental refresh.":::

## Publishing reports

All customers publishing to the Power BI service (cloud) need to perform the following steps. These steps apply to both first-time publishers and those who have published in the past.

1. Publish the report to Power BI service workspace, based on the out-of-the-box connector.
2. Establish settings for each published semantic model in the Power BI service.

   :::image type="content" source="./media/solarwinds-service-desk/semantic-model.png" alt-text="Screenshot set semantic model.":::

3. For each semantic model, open the **Data Source Credentials** section and edit the credentials with the key and token you used when you established the connection with the connector in desktop Power BI.

   :::image type="content" source="./media/solarwinds-service-desk/data-source-credentails.png" alt-text="Screenshot set data source credentials.":::

Your reports in desktop and cloud are now connected to and using the new version of SolarWinds Service Desk connector.

You can refresh each semantic model for the first time. The refresh downloads the archived data you defined in the incremental refresh policy (records from a maximum of two years ago).

SolarWinds suggests setting the first large download with a scheduled refresh. Optionally, you can run it manually by selecting **Refresh the semantic model**.

For instructions on configuring a scheduled refresh, go to [scheduled-refresh](/power-bi/connect-data/refresh-scheduled-refresh).

After the first refresh, future refreshes are much quicker and download only the new records from SWSD.

## Limitations and issues

Users should be aware of the following limitations and issues associated with accessing SolarWinds Service Desk:

* There's no limit on the number of users who can pull data. But if they aren't using incremental refresh and try to import data from a range larger than one year, each user can refresh only once every 24 hours.

* The fields that are imported are limited. For more fields, submit a feature request in [THWACK](https://thwack.solarwinds.com/products/solarwinds-service-desk-swsd/i/feature-requests/create). For feedback or support, reach out to [SolarWinds support](https://www.solarwinds.com/company/contact-us).

### Credential error in the navigator

If a credential error occurs in the navigator, clear your recent data source settings.

1. In Power BI Desktop, select **File** > **Data source settings**.

   :::image type="content" source="./media/solarwinds-service-desk/data-source-clear.png" alt-text="Screenshot of Select SolarWinds Service Desk datasource.":::

2. Select the SWSD data source, and then select **Clear permissions**.
3. Establish the connection to the navigator again.
