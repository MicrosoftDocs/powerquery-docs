---
title: Power Query Anaplan connector
description: Provides basic information, prerequisites, and instructions on how to connect to your Anaplan data, as well as troubleshooting tips.
author: cpopell
ms.service: powerquery
ms.topic: conceptual
ms.date: 4/2/2021
ms.author: gepopell
ms.reviewer: kvivek
LocalizationGroup: reference
---

# Anaplan

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)|
| Authentication Types Supported | Basic |
| Function Reference Documentation | - |
| | |

## Capabilities Supported

The connector runs through Anaplan public data integration APIs and allows you to load all Anaplan models (aside from archived ones) and saved export actions into Power BI.

## Connect to Anaplan from Power Query Desktop

To connect to Anaplan data:

1. Select **Anaplan** from the product-specific data connector list, and then select **Connect**.
2. In the Anaplan Connector Configuration screen, enter the API and Authentication URLs:
  
  **Anaplan API URL**:  https://api.anaplan.com

  **Anaplan Auth URL**: https://auth.anaplan.com

  ![Connection Configuration.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/f8db985b-d21d-4c68-bd45-3082cdf9ce12/Connection-Configuration.png)

  Once you've entered the API and Auth URL, select **ok**.
3. Log in to the connector to verify your access to an Anaplan workspace. 
  ![ID and password dialog.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/8d7f8f1f-3d07-4a57-aa7a-b55630e568bf/Your-id.png)
  
  Once you've succeeded, select **Connect**.

## Run an export action

The Anaplan connector leverages export actions to download data from your Anaplan model. First, ensure that you have an export action set.

When you run an export action:

*   Only exports that output .csv and .txt files are supported.
*   With every export action run, you need to wait ten minutes to repeat the same export action. The time is calculated from one export run completion until the next export run begins. The 10 minute wait does not apply to different exports.
*   If you do not see the export action in the Power BI connector, check your role and the export actions in your model.

To run an export action, use the **Navigator** dialog to locate your export.

![Run Export Action and Load.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/fd245739-4a34-4433-8e3e-eaed27d4d4cf/Export-load.png)

1.  Search your Anaplan models to find and set your export. You can also locate for your model name via the search field.
2.  Check the box next to **ƒx Run Export Action** to select your export.
    *   When you select the **ƒx Run Export Action**, this does not trigger the export run. Instead this selection downloads the last version of the exported Anaplan data for preview.
    *   A preview displays in the right panel. If the Anaplan export is set to **Admins only**, model users may see a blank preview, but the export will run as normal. 
    *   You'll see the preview the next time you set an integration with same export. 
3.  Click **Load** to trigger the export run.

The **Load** dialog displays and your data loads. 

![Load dialog for data.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/d2e8b066-6b57-4f3e-b60c-be2ac72aad9b/Data-load-dialog.png)

## Troubleshooting

If you get a connector related error message, first, try refreshing.

### Credential error in the Navigator

  *   Clear cache within Power BI (**File**, **Options**, **Clear cache)** and restart the connector, or
  *   Click **Cancel** and select **Refresh** (top right).

![Authentication error.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/fa59c069-e970-4864-9e14-952a7c5e3f28/auth-cred-error.2.png)

If you still receive a credential error after you clear cache, also clear your recent sources. 

 *   Select **Recent sources**

![Select recent sources.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/e9151dbc-0dea-4d99-97ed-de04b04a5623/Recent-sources-1.png)

  *  Select **Remove from list**

![Remove source from list.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/ab64c9a3-1526-4b59-a897-ff617f31032e/Recent-sources-2.png)

Establish the connection to the export again, and your data refreshes.


### Credential error in the Power Query Editor

Click **Close & Apply** or **Refresh Preview**

![Power query error.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/5bc46bb5-843c-40bb-ae5d-f52eed51f9c4/Power-query-error.png)

Your data refreshes.

![Close & Apply and Refresh Preview icons.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/153e8ab2-28ca-4021-872a-e85f1c50c1bd/Power-query-solution.png)


### Power Query Expression error

Click **Refresh Preview** to refresh.

![Power Query error Key and Table.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/eb19585d-46a4-48dc-901d-6c7af89e5916/Expression-error.png)

![Refresh preview](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/dba42050-d209-4acf-8215-0d59b44188e6/Refresh-preview.png)