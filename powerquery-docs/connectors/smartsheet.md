---
title: Power Query Smartsheet connector
description: Provides basic information, prerequisites, and connection instructions, along with troubleshooting information for the Smartsheet connector.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 1/24/2024
ms.author: dougklo
---

# Smartsheet

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI Dataflow<br/>Fabric Dataflow Gen2 |
| Authentication Types Supported | Smartsheet account |
| Function Reference Documentation | &mdash; |

> [!NOTE]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

Before you can sign in to Smartsheet, you must have a Smartsheet account.

## Capabilities Supported

* Import

### Supported Smartsheet Regions

The Smartsheet connector supports the Smartsheet US region (https://app.smartsheet.com) and Smartsheet EU region (https://app.smartsheet.eu).

## Connect to Smartsheet

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop.

2. In the search box, enter **Smartsheet** and then select **Connect**.

   ![Get Data from Smartsheet.](./media/smartsheet/get-data.png)

3. Select the region to connect to.

   ![Select region.](./media/smartsheet/select-region.png)

4. If this is the first time you're getting data through the Smartsheet connector, a third-party notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

5. To sign in to your Smartsheet account, select **Sign in**.

   ![Select sign in button.](./media/smartsheet/sign-in.png)

6. In the Smartsheet window that appears, select your login method and provide your credentials to sign in to your Smartsheet account.

   ![Sign in to Smartsheet.](./media/smartsheet/smartsheet-sign-in.png)

7. Upon first login, you'll be prompted to allow the connector access to Smartsheet, select **Allow**.

   ![Allow connector to access Smartsheet.](./media/smartsheet/allow-power-bi-to-access-smartsheet.png)

8. Once successfully logged in, select **Connect**.

   ![Signed in and ready to connect.](./media/smartsheet/signed-in-ready-to-connect.png)

Once the connection is established, you'll see the folders and workspaces you have access to within the **Navigator** dialog. Select the data you want to import and then select **Load**. 

   ![Select data using Navigator.](./media/smartsheet/navigator-view.png)

## Getting Help

If you run into problems when connecting to your data, [Contact Support](https://help.smartsheet.com/contact).
