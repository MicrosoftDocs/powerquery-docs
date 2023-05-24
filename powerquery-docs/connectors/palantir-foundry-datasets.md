---
title: Palantir Foundry Power Query Connector
description: Provides basic information and prerequisites for using the Palantir Foundry Power Query connector.
author: mshafer
ms.date: 5/17/2023
ms.author: bezhan
---

# Palantir Foundry

>[!Note]
>The following connector article is provided by Palantir, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Palantir website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows) |
| Authentication Types Supported | Organizational Account (Power BI Desktop)<br/>Personal Access Token |

## Prerequisites

This connector works with any active Palantir Foundry environment. Ensure you've completed the following setup steps before using the connector: 

1. Download and install the [Foundry datasets ODBC driver](https://www.palantir.com/docs/foundry/analytics-connectivity/downloads/#foundry-datasets-odbc-driver).
2. If using OAuth authentication, ensure your Foundry administrators have enabled the "Power BI®" third-party application in Control Panel. See the documentation for [Foundry third-party apps](https://www.palantir.com/docs/foundry/platform-security-third-party/third-party-apps-overview/) for more details. 

## Capabilities supported

* Import
* DirectQuery (Power BI only)

## Connect to Palantir Foundry from Power Query Desktop

To connect to Palantir Foundry from Power Query Desktop, take the following steps:

1. In the **Get Data** experience, select the **Palantir Foundry** option in the connector selection.
2. In **Connection Settings**, provide the **Base URL** of your Foundry environment. For example, `https://<subdomain>.palantirfoundry.com/`. Optionally, provide a **Dataset RID** and **Branch**.

   ![Enter Palantir Foundry connection settings in Power Query Desktop.](./media/palantir-foundry-datasets/connection-settings.png)

3. Select either the **Import** or **Direct Query** data connectivity mode.
4. Select **OK**.
5. If you're connecting to Foundry for the first time, select the authentication type: **Foundry OAuth** (recommended) or **Foundry Token**. After signing in (Foundry OAuth) or entering a token (Foundry Token), select **Connect**.

   ![Palantir Foundry authentication.](./media/palantir-foundry-datasets/oauth.png)

   For more details on these authentication options, see Foundry's documentation: [Power BI: Authenticate with Foundry](https://www.palantir.com/docs/foundry/analytics-connectivity/power-bi-getting-started/#authenticate-with-foundry)
6. In **Navigator**, select the dataset(s) you want, then select either **Load** to load the data or **Transform Data** to continue transforming the data in the Power Query editor.

   ![Power Query Desktop Navigator showing the selected dataset.](./media/palantir-foundry-datasets/select-data.png)

## Connect to Palantir Foundry from Power Query Online

>[!Note]
> Before you begin, ensure you have access to an on-premises gateway with an existing connection to Foundry.

To connect to Palantir Foundry from Power Query Online, take the following steps:

1. Select the **Palantir Foundry** option in the connector selection.
2. In **Connection Settings**, provide the Base URL that matches a connection already configured on your on-premises data gateway. For example, `https://<subdomain>.palantirfoundry.com/`. Optionally, provide a **Dataset RID** and **Branch**.

    ![Enter Palantir Foundry connection settings in Power Query Online.](./media/palantir-foundry-datasets/online-connection-settings.png)
    
    Ensure that the **Connection** dropdown shows the name of your on-premises gateway.
3. Select **Next** to continue.
4. In **Navigator**, select the data you require, and then select **Transform data**.

   ![Power Query Online Navigator showing the selected dataset.](./media/palantir-foundry-datasets/online-select-data.png)

### Troubleshooting

If you encounter issues connecting to Foundry, refer to the following resources in Palantir Foundry's documentation for troubleshooting steps:

* [Power BI Connector: FAQs](https://www.palantir.com/docs/foundry/analytics-connectivity/power-bi-faqs/)
* [Troubleshooting issues when configuring ODBC & JDBC Drivers](https://www.palantir.com/docs/foundry/analytics-connectivity/troubleshooting-odbc-jdbc/)
