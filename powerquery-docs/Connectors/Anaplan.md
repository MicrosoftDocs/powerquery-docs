---
title: Power Query Anaplan connector
description: Provides basic information, prerequisites, and instructions on how to connect to your Anaplan data, as well as troubleshooting tips.
author: a.paul.anaplan

ms.topic: conceptual
ms.date: 6/24/2022
ms.author: dougklo
ms.reviewer: kvivek
LocalizationGroup: reference
---

# Anaplan

> [!Note]
> The following connector article is provided by Anaplan, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Anaplan website and use the support channels there.

## Summary

| Item                             | Description          |
| -------------------------------- | -------------------- |
| Release State                    | General Availability |
| Products                         | Power BI (Datasets)  |
| Authentication Types Supported   | Basic, OAuth2        |
| Function Reference Documentation | -                    |
|                                  |                      |

# Anaplan

# Anaplan Connector Power BI Desktop

The Anaplan Connector for Power BI Desktop enables access to your Anaplan model exports. It also:

-   Runs via Anaplan public data integration APIs.
-   Loads export actions saved in your Anaplan models, directly into Power BI.
-   Displays Anaplan models (those not archived), within your default Tenant.
-   Create datasets in the Power BI Desktop and export or refresh them to the Power BI Service (cloud).

There are [system requirements](https://www.microsoft.com/en-us/download/details.aspx?id=58494 "System Requirements") to verify before you install the Microsoft Power BI Desktop.

# Get data

To access your saved export from the Power BI desktop, you **Get data**.

(1)) Select **Get data** from the ribbon menu.\
The **Get data** dialog displays.

![Get data and dropdown.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/a0c31347-fb4d-4df5-83a3-e8d0f3ffa144/Get-data-more.png)

(2)  Click **More** from the dropdown.\
A new window appears.

(3)  Type Anaplan into the blank field\
The **Anaplan Connector** displays.

(4)  Select  **Anaplan Connector**.

![Anaplan-Connector-beta.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/4911c385-e11e-4afe-b3b4-71e9f18a3875/Connector-Beta.png)

(5)  Click **Connect**.

# Configure the connector

Configure the connector once you've downloaded it. This step allows you to connect via Anaplan APIs.

The connector uses either Basic Authentication (User ID, Password) or the Anaplan-configured IDP for logging into Anaplan. To use the second method, you can set your own configuration.

The image below shows Anaplan Connection Configuration dialog.

![Dialog for Anaplan Connection Configuration.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/89361e08-eea8-4c59-8b0a-11124cb95c9f/Main-config.png)

Enter the API and Authentication (auth) URLs.

(1) If you choose Basic auth, enter the following URLs and then select **OK**.

**Anaplan API URL**

`https://api.anaplan.com`

**Anaplan Auth URL**

`https://auth.anaplan.com`

(2) If you prefer the Anaplan configured IDP for logging into Anaplan, enter the following URLs and then select **OK**.

**Anaplan API URL**

`https://api.anaplan.com`

**Anaplan Auth URL**

`https://us1a.app.anaplan.com`

-   Select **OK**.

From the next **Anaplan** dialog, choose either **Basic** or **Organizational account** (this triggers Anaplan-configured IDP).

![Anaplan authentication dialog. Arrows show Basic or Organizational account (Anaplan-configured IDP) menu choices.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/b81534aa-6550-45d8-832b-2a60a3623f21/8-Basic-or-SSO.png)

# Authenticate

You've chosen either basic authentication or Anaplan Anaplan-configured IDP.

(1) If you chose **Basic** auth, from the **Anaplan** dialog:

![The Anaplan Connect dialog. Here you enter your User name and Password.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/a8b3dcd8-ce77-42f5-87bd-d33877ce50c5/With-Basic.png)

-   Enter your **User name** and **Password**.
-   Select **Connect**.
-   Proceed to the next step, **Get data**.

(2) If you chose **Organizational account** (Anaplan-configured IDP), from the **Welcome to Anaplan** dialog:

-   Select **Log in with Single Sign-on (Anaplan-configured IDP)**.

![null](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/d6e1520d-a04a-4d99-bf86-001992df0c34/3-SSO-login.png)

(3) On your company's Anaplan-configured IDP dialog, enter your:

-   User name
-   Password

(4) Select **Sign In**.

**Note**: Your company's Anaplan-configured IDP service generates this dialog. A common ID management service is Okta.

![Sign In dialog for Okta. Okta is one example of a likely identity management tool.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/530d7977-5486-4d1a-bea8-0ecb3ce5e683/5-Okta-example.png)

(5) Select **Connect** on the next **Anaplan** dialog.

![The Connect dialog for the Anaplan Power BI connector.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/6e4a2ad9-108a-418e-9c10-918f2a0dca46/2-Org-acct_powerBI.png)

# Run a Power BI export action

Anaplan connector for Power BI uses exports to download data from your Anaplan model. Make sure you have an export action set. The Navigator step is where you load and run these exports.

When you run an export action:

-   Only exports that output .csv and .txt files are supported.
-   If you do not see the export action in the Power BI connector, check your model role and the export actions in your model.

To run an export action, use the **Navigator** dialog to locate your export.

![Run Export Action and Load.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/fd245739-4a34-4433-8e3e-eaed27d4d4cf/Export-load.png)

(1)  Search your Anaplan models to find and set your export.\
Click the white chevron, it expands to a drop-down list.\
You can also locate for your model name via the search field.

(2)  Check the box next to **ƒx Run Export Action** to select your export.

-   When you select the **ƒx Run Export Action**, this does not trigger the export run. Instead this selection downloads the last version of the exported Anaplan data for preview.
-   A preview displays in the right panel. If the Anaplan export is set to **Admins only**, model users may see a blank preview, but the export will run as normal.
-   You'll see the preview the next time you set an integration with same export.
-   See About Default Import and Export files.

(3)  Click **Load**. This starts the export.\
The **Load** dialog displays.

Your data loads.

# Manage your data

Once your data loads into the Power BI Desktop, you can perform data visualizations.

[_How to make the most of data visualization_](https://powerbi.microsoft.com/en-us/data-visualization/ "How to make the most of data visualization") helps you to select **Columns**, apply **Filters**, perform **Visualizations**, and **Publish**.

![Data and tables.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/6ebf06a2-cdb5-4dfb-9d1b-c4f88c799776/Data-and-tables.png)

# Publish a report to Power BI Service (cloud)

The publish step sends the report from the Power BI Desktop to the Power BI Service (cloud).

See the Microsoft documentation: [Create reports in Power BI](https://docs.microsoft.com/en-us/power-bi/create-reports/ "Create reports in Power BI"). You need a report to begin.

To publish a report to Power BI Service (cloud):

(1)  Select **Publish** from the Power BI Desktop report dialog.

![Microsoft Power BI report dialog with a left menu that displays the Publish option.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/906e806a-70e9-4ed9-9c11-3a85779f106c/PBI-report.png)

The report is now in the Power BI Service (cloud). Sign in to Power BI Service (cloud) to see the report.

# Schedule a refresh (Power BI Service)

Once you've created a **Dataset** in the Power BI Service (cloud), you can schedule a data refresh.

First, create a report in the Power BI Desktop.\
See [Create reports in Power BI](https://docs.microsoft.com/en-us/power-bi/create-reports/ "Create reports in Power BI").

To refresh your dataset:

(1) Select **Add Data Source** (top left of dialog).

(2)  Select from the **Data Source Type** and **Data Source Information** dropdowns.

(3)  Select **Apply**.

![The Microsoft New data source dialog. Arrows point to the button itself and two dropdowns.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/c57e0ad9-c034-4911-a494-268638397a18/Use1-gateway.PNG)

This image displays an example dataset entitled **New data source**.

From the **Anaplan** dialog:

(1)  Select  **OAuth2** from the **Authentication method** dropdown.
(2)  Select **Sign in**.

![The Anaplan Authentication method dialog with a dropdown and Sign in button.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/890ba7f7-8dbf-43bc-a6fa-7b2a08a56df8/gateway3.PNG)

Once you've created a scheduled refresh within the PowerBI Service (Cloud):

-   If your scheduled refresh frequency is more than 15 days, you must re-enter your login credentials before the end of the 15th day. If you don't, you need to authenticate anew.
-   We recommend a refresh frequency that is less than every 15 days.
-   Apart from data refreshes, you need to re-enter your login credentials every 90 days.

# Common errors and solutions

You may get error messages. Here are some common scenarios and steps for resolution.

If you do get an error message, select the refresh icon. This resolves the error in most cases.

## Error scenarios

**Credential error in the Navigator**

`We couldn't authenticate with the credentials provided, please try again.`

To resolve such an error:

-   Select **Refresh** (top right).

![Authentication error. This image shows an arrow to highlight the refresh button.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/fa59c069-e970-4864-9e14-952a7c5e3f28/auth-cred-error.2.png)

-   Select **File**.
-   Select **Options and settings**.
-   Select **Data source settings**.
-   Select the permission **Anaplan Connector** from the list.
-   Select **Clear Permissions**.
-   Select **Delete**.

This removes expired Anaplan API tokens. You must re-authenticate to proceed.

**Credential error in the** [**Power Query Editor**](https://docs.microsoft.com/en-us/power-query/power-query-quickstart-using-power-bi "Power Query")

-   When you reopen a Power BI report
-   When you edit a prior data set

To resolve this, select either **Close & Apply** or **Refresh Preview**.

![Power query error.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/5bc46bb5-843c-40bb-ae5d-f52eed51f9c4/Power-query-error.png)

Your data refreshes.

**Integration list, display error**

Solution: If you do not see your complete list of integrations after you switch your **Workspace**, you can:

-   Select refresh button (next to **Integrations**)
-   Or refresh your browser

    You can also:

-   Select **Recent sources**

![Select recent sources.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/e9151dbc-0dea-4d99-97ed-de04b04a5623/Recent-sources-1.png)

-   Select **Remove from list**

![Remove source from list.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/ab64c9a3-1526-4b59-a897-ff617f31032e/Recent-sources-2.png)

-   Connection to the export again.\
    Your data refreshes.

![Close & Apply and Refresh Preview icons.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/153e8ab2-28ca-4021-872a-e85f1c50c1bd/Power-query-solution.png)

**Power Query** [**Expression**](https://docs.microsoft.com/en-us/powerquery-m/expression-functions "Power Query Expression") **error**

`Expression.Error: They key didn't match any rows in the table.`

Click **Refresh Preview**

![Power Query error Key and Table.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/eb19585d-46a4-48dc-901d-6c7af89e5916/Expression-error.png)

The first [1,000 rows](https://community.powerbi.com/t5/Desktop/Limit-of-1000-value-reached/td-p/368850 "first 1,000 rows of data") of data display.

![Refresh preview.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/dba42050-d209-4acf-8215-0d59b44188e6/Refresh-preview.png)

**Large file download error**

If you go beyond the 5 gigabytes (GB) size limit you'll get this error.`Anaplan connector supports file downloads up to 5 GB in size.`

![Error message when a file is too large.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/40867efe-efd4-4781-a1af-1c9d8e1a4ecf/file-too-large.png)

Return to your Anaplan model, decrease the size of your file, and try again.
