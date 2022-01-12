---
title: Power Query Dataflow connector
description: Provides basic information and connection instructions for connecting to a Dataflow.
author: Luitwieler
ms.service: powerquery
ms.topic: conceptual
ms.date: 01/12/2022
ms.author: jeluitwi
LocalizationGroup: reference
---

# Dataflows

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights |
| Authentication types | Organizational account |
| | |

>[!Note]
>Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

You must have an existing Dataflow with maker permissions to access the portal, and read permissions to access data from the Dataflow.

## Capabilities supported

* Import
* Direct Query*
* Organizational account sign-in

>[!Note]
>Direct query requires Power BI premium, read [this article](/power-bi/transform-model/dataflows/dataflows-premium-features) to learn more.

## Get data fom Dataflows in Power BI Desktop

To get data from Dataflows in Power BI Desktop:

1. Select **Get data** from the **Home** tab.

2. In the **Get Data** dialog box, select **Power Platform > Dataflows**, and then select **Connect**.

   ![Get data from Power BI Desktop.](../Dataflows/media/GetDatafromDataflow.png)

3. If this attempt is the first time you're connecting to this site, select **Sign in** and input your credentials. Then select **Connect**.

   ![Sign in to this site.](media/dataflows/sign-in.png)

4. In **Navigator**, select the Dataflow you require, then either load or transform the data.

   ![Load or transform from navigator.](media/dataflows/navigate.png)

## Get data from Dataflows in Power Query Online

To get data from Dataflows in Power Query Online:

1. From the **Data sources** page, select **Dataflows**.

   ![Get data from Power Query Online.](media/dataflows/pqo-select-datasource.png)

2. Adjust the connection name.

   ![Enter the server URL.](media/dataflows/pqo-sign-in.png)

3. If necessary, enter an on-premises data gateway if you're going to be using on-premises data. For example, if you're going to combine data from Dataflows and an on-premises SQL Server database.

4. Sign in to your organizational account.

5. When you've successfully signed in, select **Next**.

6. In the navigation page, select the data you require, and then select **Transform Data**.

## Frequently asked questions

_**Direct query is not working for me in Power BI, what should I do?**_

To get direct query to run you need have Power BI Premium and adjust a few configuration items in your Power BI workspace. This is explained in the [dataflows premium features](/power-bi/transform-model/dataflows/dataflows-premium-features) article.

_**My dataflow table does not show up in the dataflow connector in Power BI**_

You are probably using a Dataverse table as destination for your standard dataflow. Use the [Dataverse/CDM connector](../Connectors/Dataverse.md) instead or consider switching to an analytical dataflow.

_**There is a difference in the data when I remove duplicates in dataflows, how can I resolve this?**_

There could be a difference in data between design-time and refresh-time. We do not guarantee which instance is being kept during refresh time. [This article](/powerquery-docs/working-with-duplicates) will help you to avoid inconsistencies in your data.

### See also

* [Using the output of Dataflows from other Power Query experiences](../dataflows/using-output-power-platform-dataflows-other-azure.md)
* [Best practices for designing and developing complex dataflows](../dataflows/best-practices-developing-complex-dataflows.md)
* [Best practices for reusing dataflows across environments and workspaces](../dataflows/best-practices-reusing-dataflows.md)
