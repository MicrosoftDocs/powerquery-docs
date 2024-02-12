---
title: Power Query Smartsheet EU connector
description: Provides basic information and prerequisites for the connector and detailed instructions for connecting.
author: work-insights-data
ms.topic: conceptual
ms.date: 7/14/2023
ms.author: bezhan
---

# Smartsheet EU
 
## Summary

| Item                             | Description                                                             |
|----------------------------------|-------------------------------------------------------------------------|
| Release State                    | Beta                                                                    |
| Products                         | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported   | Organizational account                                                  |
| Function Reference Documentation | &mdash;                                                                 |

## Prerequisites

Before you can sign in to Smartsheet, you must have a Smartsheet account.

## Capabilities Supported

* Import

## Connect to Smartsheet

To connect to Smartsheet:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop.

2. In the search box, enter **Smartsheet**. Select **Smartsheet EU**, and then select **Connect**.

   ![Get Data from Smartsheet.](./media/smartsheet-eu/get-data.png)

3. If this is the first time you're getting data through the Smartsheet connector, a third-party notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

4. To sign in to your Smartsheet account, select **Sign in**.

   ![Select sign in button.](./media/smartsheet-eu/sign-in.png)

5. In the Smartsheet window that appears, select your login method and provide your credentials to sign in to your Smartsheet account.

   ![Sign in to Smartsheet.](./media/smartsheet-eu/smartsheet-sign-in.png)

6. Upon first login, you'll be prompted to allow the connector access to Smartsheet, select **Allow**.

   ![Allow connector to access Smartsheet.](./media/smartsheet-eu/allow-power-bi-to-access-smartsheet.png)

7. Once successfully logged in, select **Connect**.

   ![Signed in and ready to connect.](./media/smartsheet-eu/signed-in-ready-to-connect.png)

Once the connection is established, you'll see the folders and workspaces you have access to within the **Navigator** dialog. Select the data you want to import and then select **Load**. 

![Select data using Navigator.](./media/smartsheet-eu/navigator-view.png)
