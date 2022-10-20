---
title: Power Query Socialbakers connector
description: Provides basic information, prerequisites, and instructions on how to connect to Socialbakers.
author: bezhan-msft
ms.topic: conceptual
ms.date: 10/20/2022
ms.author: bezhan
---

# Socialbakers (Beta) 

The following connector article is provided by Socialbakers (now Emplifi), the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to 
this article, visit the Emplifi website and use the support channels there.

## Summary

| Item | Description |
| --- | --- |
| Release state | Beta |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows) |
| Authentication Types Supported | Basic |
| Function Reference Documentation | - |

---

> [!Note] Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.
> 

## **Prerequisites**

To use the Socialbakers (Emplifi) Connector you must have Socialbakers (Emplifi) credentials (Token and Secret). Contact the Emplifi Support team to get yours, if you don't have them. 
The credentials allow the user to get the data and metrics from the profiles the user has added to the Emplifi platform. 

## **Capabilities Supported**

- Import

## Connect to Socialbakers API from Power BI Desktop

### Authentication

When the connector is started for the first time authentication is needed. Please enter your **Token** and **Secret** to the new modal window. Credentials can be provided to you by the Emplifi Support team.

![Authentication](./media/socialbakers/image.png)

Once logged in the auth information is automatically stored by Power BI for future uses. It can be found under `File -> Options and settings -> Data source settings -> Global permissions`

At any time the permissions can be cleared (or edited) and new credentials can be entered.

![DataSourceSettings](./media/socialbakers/image1.png)

## Navigator

Once authenticated, a Navigator window pops up. All possible data sources can be selected here.

![Navigator](./media/socialbakers/image2.png)

Not all data sources are the same, this is described [later](#facebook-ads-data-source).

### Example usage

1. By clicking on the checkbox, please select the Data Source you would like to work with.
    - Parameters can be selected on the right section of the Navigator

![DataSources](./media/socialbakers/image3.png)

2. Enter the data and select the metrics in the Parameters section. For more details about the metrics please visit [Socialbakers API documentation](https://api.socialbakers.com).
    - An example selection follows below
        - **Start Date:** `07/01/2021`
        - **End Date:** `07/30/2021`
        - **End Today:** `No`
        - **Metrics:** `engagement_rate (FB, IG, TW, YT, VK), likes(FB, IG, TW, YT)`
        - **Time dimension:** `day`
        - **Dimensions:** `profile`
        - **Profiles Facebook:** `Emplifi (<profile_id>)`
        - **Profiles Instagram:** `Emplifi (<profile_id>)`
        - **Profiles Youtube:** `Emplifi (<profile_id>)`
3. Once all required parameters are selected press **Apply**
    - **Note:** Not all parameters are explicitly mandatory but they could be needed for specific selections.
    **For example:** The profile selection is optional but you still need to select some profiles to get any data.

![Preview](./media/socialbakers/image4.png)

4. Once all data and metrics are selected, using the **Load** button, load the data to the report. It is also possible to **Transform Data** before loading it into the report.
    - **Note:** It is possible to select more than one data source by checking more of the boxes, setting their parameters, and simply clicking **Load**

#### Facebook Ads Data Source

Facebook Ads is a little bit specific data source that differs from the other sources. All other sources (for example Aggregated Post Metrics, Post Metrics, Profile Metrics) follow the same process as described above. Facebook Ads has an additional step to perform before the Parameters are set.

When selected, Facebook Ads displays first a list of the last 12 months.

![FacebookAds](./media/socialbakers/image5.png)

By selecting the specific month(s) you get you are narrowing down all your Facebook Ad Accounts to the ones that were active in the selected time period. 

![SelectedMonth](./media/socialbakers/image6.png)

You can select the specific Ad Accounts in the Parameters section, under the **"Accounts"** parameter along with the **Campaigns** selection.

## Troubleshooting

If any error occurs, please check the [documentation](https://api.socialbakers.com/) and make sure you are following the guidelines of the API.

## Additional instructions

- It is possible to clear the parameter selection by choosing **Clear**
- If **Transform Data** is chosen, you can see all of the function documentation from which it’s possible to gain more understanding of what is going on behind the screen.