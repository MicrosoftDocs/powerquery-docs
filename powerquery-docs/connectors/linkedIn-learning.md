---
title: Configure LinkedIn Learning Power BI connector
description: Describes how to configure LinkedIn Learning Power BI connector. 
author: lmasterson
ms.topic: conceptual
ms.date: 04/11/2024
ms.author: jburchel
---

# LinkedIn Learning - Power BI connector

The LinkedIn Learning Power BI connector is a specialized data connector designed and developed to establish a direct connection between Power BI and LinkedIn Learning APIs. Through this integration, users can access essential insights and engagement metrics, including course completions, hours of content viewed, and active learning days.

These insights can be aggregated, based on various entities, such as individuals, groups, accounts, or content objects like courses and videos. Organizations analyzing these metrics can effectively measure the effect and success of their learning and development initiatives.

> [!NOTE]
> The following connector article is provided by LinkedIn Learning, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the LinkedIn Learning website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI Desktop <br/> Power Apps |
| Authentication Types Supported | Oauth 2-Step |

## Capabilities supported

* The Power BI Connector facilitates the extraction of learner engagement data and course information in a straightforward and practical manner.

> [!NOTE]
> Some capabilities shown may not be present by default and may require additional support from LinkedIn to enable. Please reach out to your LinkedIn Learning account team.

### Advantages

* No need to download or receive CSV files.​
* Ability to query data periods greater than one year.
* No requirement for coding solutions to connect to the LinkedIn Learning API for learner and asset data.

### Limitations

* Learner license status isn't accessible in our reporting API. So this data isn't available in the Power BI Connector.

## Prerequisites

The scenario outlined in this tutorial assumes that you already have the following prerequisites:

* A Microsoft Windows PC ​
* Microsoft Power BI Desktop: [Download here](https://powerbi.microsoft.com/downloads/)
* LinkedIn Learning admin access

## Steps to configure LinkedIn Learning Power BI connector

The following steps outline the process for configuring the LinkedIn Learning Power BI Connector:

> [!NOTE]
> Before starting this configuration, ensure that you have already generated the API Keys to obtain the **Client ID and Client Secret** required for the Power BI Connector.
>
>
> [**Select Here: For steps on how to provision API Keys**](/linkedin/learning/reporting/reporting-docs/reporting-api)
>
> Please ensure when generating the API keys you have selected the **"content & report"** checkboxes.

### Authentication

To obtain your Client ID & Client Secret from LinkedIn Learning, follow these steps:

1. Sign-in to LinkedIn Learning, if you aren't already in the **Admin** screen, select **Go to Admin**, then select **Me > Integrate**.

    ![Screenshot with Client Id and Client Secret location within LinkedIn Learning integrate settings.](./media/linkedin-learning/client-id-secret-location.png)


2. Within the **Access content and reports via API**, the client ID and Secret that was generated for the Power BI Connector will be located here.

3. Next, open Power BI, select **File**, then select **Get Data**

4. In the search box, look for **"LinkedIn Learning"**

   ![Screenshot of the get data search box with returned search results when LinkedIn Learning is searched.](./media/linkedin-learning/power-bi-get-data.png)

5. Select the **LinkedIn Learning Connector**; when prompted input the **Client ID & Client Secret** that was generated within LinkedIn Learning.

   ![Screenshot of where the Client ID and Client Secret should be inputted within Power BI.](./media/linkedin-learning/power-bi-client-id-client-secret.png)

> [!NOTE]
> The **Client ID and Client Secret** are stored within Power BI and only need to be entered once. However, you can update them under Transform Data and then Data Source Settings.

Once successfully connected, the data tables that are available to load into Power BI are now visible.

![Screenshot of LinkedIn Learning data tables that are available to be loaded into Power BI.](./media/linkedin-learning/power-bi-data-tables-options.png)

### Overview of data tables

To load data into tables, follow these steps:

1. Select on **Get Data**
2. Select the **LinkedIn Learning data connector**
3. Then select the tables you would like to load or create

   [ ![Screenshot highlighing the steps needed to be done in order to load LinkedIn Learning data into tables.](./media/linkedin-learning/data-tables-steps-power-bi.png) ](./media/linkedin-learning/data-tables-steps-power-bi.png)

> [!NOTE]
> By default 1 year’s worth of data will load for each data table. Please be aware that this may take some time to load.
> **Additionally the data tables used in the LinkedIn Learning Power BI connector match our documented API end points.**

**API endpoint documentation:**

* LinkedIn Learning API documentation [Located Here](/linkedin/learning/overview/)
* Account Popular Courses [Located Here](/linkedin/learning/integrations/learning-activity-reports#account-popular-courses-report)
* Account Popular Custom Content [Located Here](/linkedin/learning/integrations/learning-activity-reports#learner-custom-content-activity-detail-report)
* Account Total Activity Summary [Located Here](/linkedin/learning/integrations/learning-activity-reports#account-total-activity-summary-report)
* Content Summary [Located Here](/linkedin/learning/integrations/learning-activity-reports#content-summary-report)
* Learner Activity Summary [Located Here](/linkedin/learning/integrations/learning-activity-reports#learner-activity-summary-report)
* Learner Course Activity Detail [Located Here](/linkedin/learning/integrations/learning-activity-reports#learner-course-activity-detail-report)
* Learner Custom Content Activity Detail [Located Here](/linkedin/learning/integrations/learning-activity-reports#account-popular-custom-content-report)
* Learner Detail [Located Here](/linkedin/learning/integrations/learning-activity-reports#learner-detail-report)
* Learner Summary [Located Here](/linkedin/learning/integrations/learning-activity-reports#learner-summary-report)
* Organization Summary [Located Here](/linkedin/learning/integrations/learning-activity-reports#organization-summary-report)

All data tables, except for Learning Assets, represent learner activity reports. The Learning Assets table provides our full catalog of courses, including all languages.

Despite the multiple possible queries available in the learning assets API endpoint, **all assets are loaded with complete information.** More details on the endpoint can be found in our API documentation. [Located Here](/linkedin/learning/integrations/locale-and-type-api)

### Data refresh options

In Power BI, there are two main options to refresh data to ensure that the latest up-to-date information is available:

* **On-Demand Refresh:** Allows users to manually trigger a refresh of the dataset whenever they need to update the data. On-demand refresh can be done directly from the Power BI Service interface or through the Power BI Desktop application. On-demand refresh is useful when immediate access to the latest data is required, or when the data source doesn't support scheduled refreshes.

    ![Screenshot of where the On-demand refresh button is located within Power BI.](./media/linkedin-learning/data-refresh-option-one.png)

* **Scheduled Refresh:** This option allows you to set up a refresh schedule for your dataset in Power BI Service. You can define how often you want the data to be refreshed, such as daily, weekly, or even multiple times per day.

     A scheduled refresh can be configured to run at specific times or intervals to ensure that the data is always current.

    This option is suitable for regularly updated datasets where the data source supports scheduled refresh.

   ![Screenshot of where the Schedule refresh button is located within Power BI.](./media/linkedin-learning/data-refresh-option-two.png)

#### Data refresh feature in the published dataset

To update the data tables, you can either schedule a refresh or perform an on-demand refresh.

1. Select the dataset name you wish to refresh.

   ![Screenshot of the datasets available for refresh.](./media/linkedin-learning/data-refresh-select-table.png)

2. Select refresh option:
    1. Refresh now
    1. Schedule refresh

   ![Screenshot of refresh buttons that show the options available for refresh which are Refresh now or Schedule refresh.](./media/linkedin-learning/data-refresh-selected-table-button.png)

### Incremental refresh (optional)

> [!NOTE]
> Before beginning, ensure you have a plan that supports incremental refreshes **Incremental refresh is supported for Power BI Premium, Premium per user, Power BI Pro, and Power BI Embedded models.** [Click Here](../dataflows/incremental-refresh.md)

Incremental refresh improves update performance and offers several benefits. This refresh method works by defining a data window for data archival, incremental refresh, and real-time data (when supported).

![Screenshot of how an incremental refresh is performed.](./media/linkedin-learning/incremental-refresh-one.png)

Additional information on incremental refresh. [Located Here](../dataflows/incremental-refresh.md)

* Incremental updates are configured table by table and **require editing the query of each table in Power BI Desktop**.

> [!NOTE]
> This process is optional and not required for successful integration with LinkedIn Learning using the Power BI connector.

#### Setting up incremental refresh

To set up the incremental refresh, follow these steps:

1. Right-click on the **"Specific table name"**
2. Select **"Edit Query"**

   ![Screenshot of where the edit query option is within Power BI.](./media/linkedin-learning/incremental-refresh-edit-query.png)

> [!NOTE]
> Two parameters of type datetime are needed: **RangeStart**  and **RangeEnd.** > **The names of parameters cannot be changed.**
>
> * **RangeStart**: Set this parameter to the date from which the data needs to be queried from the API.
> * **RangeEnd**: Set this parameter to today's date.

3. Select "Manage Parameters"

   ![Screenshot of where the manage parameters option is within Power BI.](./media/linkedin-learning/manage-parameters-select.png)

4. Set up the parameters for **RangeStart** and **RangeEnd**.

    1. Select **"New"**
    2. In the **Name** section, enter datetime parameter name e.g **RangeEnd**.
    3. Ensure the **"Required"** checkbox is ticked.
    4. Enter values as follows:
        1. Type: **Date/Time**
        2. Suggested Values: **Any value**
        3. Current Value: **Present date**
        4. Repeat the same to create the **RangeStart** parameter but ensure that **Current Value** is set to the date from which the data needs to be queried.

           ![Screenshot highlighting the steps needed in order to create the RangeStart and RangeEnd parameters.](./media/linkedin-learning/manage-parameters-select-option.png)

5. After creating the parameters, move them to the top of the query section.

6. Then, select on the table name and then within applied steps, select **"Source"**.

    ![Screenshot of the data tables and the source to be selected within the applied steps section.](./media/linkedin-learning/incremental-data-range-table-select.png)

7. In the source function, set the parameters as shown: **"= LinkedInLearning.Contents(RangeStart, RangeEnd)"**

    ![Screenshot of where the parameters are set within the source function.](./media/linkedin-learning/source-function-incremental.png)

8. Repeat the process for all data tables, ensuring that the same parameters (**RangeStart** and **RangeEnd**) are set for all sources within the applied steps section for each table.

9. Next, configure the **date range filtering.**

10. In each table or query select **Navigation** within the Applied Steps section.
1. 
    [ ![Screenshot of the filtering available for the date, week column.](./media/linkedin-learning/date-range-filtering.png) ](./media/linkedin-learning/date-range-filtering.png)

11. Create a **datetime filter**.
    1. Select the dropdown arrow of the "Week column."
    2. Select "Date/Time Filters."
    3. Select "Custom Filter."
    4. Enter values as follows:
        1. Select **Basic**.
        2. Choose **"is after or equal to"**.
        3. Ensure parameter is set, then select **"RangeStart"**.
        4. Select **And**.
        5. Choose **"is before"**.
        6. Ensure parameter is set, then select **"RangeEnd"**.

            [ ![Screenshot of the filtering available for the date, week column.](./media/linkedin-learning/filtering-date-week-column.png) ](./media/linkedin-learning/filtering-date-week-column.png)

12. Save and close the Power Query Editor. This process might take time depending on the number of tables and the date range.

13. The next step is to enable the incremental refresh for each table.

    1. Right-click on the **"Specific table name"**.
    2. Select **"Incremental Refresh"**.
    3. Select **"Incrementally refresh this table"**.
    4. Configure based on preference.
    5. Select **"Apply"**.

        ![Screenshot of the incremental refresh option.](./media/linkedin-learning/incremental-refresh-on-each-table.png)

> [!TIP]
> **Archive Data:** Defines the range when you no longer want to see data.
> **Incremental Refresh data:** Defines when data is no longer queried from the API. Ensure incremental refresh is set to no less than 1 month and a maximum of 6 months.

#### Data columns / JSON

The following columns are used by the data connector and shouldn't be deleted, as doing so might cause errors during data refresh:

* epoch week
* week
* parameters
* total_pages_week
* page_index
* param_w_start
* page_data.paging

Additionally, the column page_data.paging contains the paging information returned by the API.

If you encounter the **"expand"** symbol while editing a query, it indicates that the column can be expanded to show more rows.

![Screenshot of expand option located within the data columns.](./media/linkedin-learning/data-columns-json.png)

Expanding the column **adds a step in the query settings.**

* Expanding columns can be done when needed, which duplicates rows.
* Expanding columns is important for displaying skills in learning assets and custom properties in learner detail reports.

**Congratulations!** Your learning admins can now gain key insights and engagement metrics through their Microsoft Power BI application.

## Common issues & troubleshooting tips

If the data update fails when attempting to refresh data:

1. Select on the warning sign to see the details of the error message to diagnose issue.

![Screenshot of warning sign that can be used to review error messages.](./media/linkedin-learning/data-update-fail.png)

2. Review the details of the error message. Reviewing this message helps identify and address any issues preventing the data refresh.

![Screenshot of error message.](./media/linkedin-learning/data-update-error-message.png)

## Frequently asked questions

For further information, review our [LinkedIn Learning Reporting API FAQ.](/linkedin/learning/reporting/reporting-docs/reporting-api-faq)

## Extra resources

* LinkedIn Learning API documentation [Located Here](/linkedin/learning/overview/)
* Microsoft Power BI: [Located Here](https://www.microsoft.com/power-platform/products/power-bi/)

## Disclaimer

LinkedIn Learning is constantly investing in our reporting infrastructure. In the future, there might be changes to the Reporting API that might require
adjustments to how data is queried. These updates might require you to make some updates on your platform. We intend to provide detailed guidance in advance of any potential changes to ensure that you have enough time to make necessary changes in your application.
