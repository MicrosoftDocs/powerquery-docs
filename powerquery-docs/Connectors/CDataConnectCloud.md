---
title: Power Query CData Connect Cloud connector
description: Provides basic information, prerequisites, and connection steps for CData Connect Cloud.
author: bezhan-msft

ms.date: 12/11/2022 
ms.author: bezhan
LocalizationGroup: reference
---

# CData Connect Cloud (Beta)

> [!Note]
> The following connector article is provided by CData, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the CData website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products Supported | Power BI (Datasets) </br> Power BI (Dataflows) |
| Authentication Types Supported | CData account (OAuth) |
| Function Reference Docs | - |

## Prerequisites

* A [CData Connect Cloud](https://cloud.cdata.com/) account
* At least one [connection](https://cloud.cdata.com/docs/Connections.html) configured in your CData Connect Cloud account

## Capabilities Supported

* Import

## Connect to CData Connect Cloud

Follow these steps to connect to your CData Connect Cloud account:

1. In Power BI Desktop, click **Get Data**.

2. In the search field, enter *CData*.

3. Select **CData Connect Cloud** in the list and click **Connect**.

    ![Select CData Connect Cloud](./media/cdata-connect-cloud/cdata-1.png)

4. In the **CData Connect Cloud** connection window, click **Sign in**.

    ![Connection sign in](./media/cdata-connect-cloud/cdata-2.png)

5. In the login window, enter your CData Connect Cloud login information and click **Continue**.

    ![Login window](./media/cdata-connect-cloud/cdata-3.png)

6. Click **Connect** in the connection window.

    ![Connection finalize](./media/cdata-connect-cloud/cdata-4.png)

The **Navigator** window appears and allows you to import your data.

### Import Data

With the **Navigator** window open, follow these steps to access your CData Connect Cloud data:

1. Expand the **CData Connect Cloud** tree. Your connections appear as sub-trees.

2. Select the data from each connection that you want to import.

3. Click **Load** or **Transform Data**.
    * **Load** instructs the connector to execute the underlying query to CData Connect Cloud.
    * **Transform Data** launches the Query Editor and allows you to adjust the query before loading the data. When you are finished using the Query Editor, click **Close & Apply** in the navigation ribbon to apply your changes and load the data.
