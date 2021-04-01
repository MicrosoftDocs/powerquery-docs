---
title: EarthSoft's EQuIS Data Connector
description: Provides basic information and connection instructions.
author: mathew-weaver
---

# EQuIS

## Summary

| Item | Description |
| ------- | ---------- |
| Release State | Preview |
| Products | Power BI (Datasets) |
| Authentication Types Supported | Basic<br/>Web API (aka **API Token**)<br/>Organizational Account |
| Function Reference Documentation | n/a |

## Prerequisites

To use the **EQuIS** connector, you must have a valid user account in an **EQuIS Enterprise** site (version 7.0.0.19300 or later) that includes a REST API license. Your user account must be a member of the REST API role. To verify user account configuration, go to the **Roles** tab in your [user profile](https://help.earthsoft.com/index.htm?ent-user_profile_editor.htm) and verify that you are a member of the REST API role.
## Capabilities supported

* Import

## Connect to EQuIS from Power BI Desktop

To connect to an **EQuIS Enterprise** site from Power BI Desktop, take the following steps:

1. Select the **EQuIS** connector in the connector list, then click **Connect**.
2. Type or paste the URL of the **EQuIS Enterprise** site you are connecting to, then click **OK**.
![Enter URL of EQuIS Enterprise site](./media/EQuIS/enterprise_connection-ok.png)
3. Choose the appropriate type of authentication:
    - **Basic**: Enter your EQuIS username and password for the given **EQuIS Enterprise** site
    - **API Token**: Enter an API Token that you generated in **EQuIS Enterprise** (see [User Profile](https://help.earthsoft.com/index.htm?ent-user_profile_editor.htm))
    - **Organizational Account**: If your **EQuIS Enterprise** site is appropriately configured, you may authenticate with Azure Active Directory.
4. In **Navigator**, browse to the dataset or report you want to load, then click **Load** or **Transform Data**. See [Using EQuIS Data](https://help.earthsoft.com/index.htm?pbi-power-bi-adding-datasets.htm) for more information about available datasets. 
![Select dataset in Navigator](./media/EQuIS/navigator_cropped.png)

## Connect to EQuIS from Power BI Online

To connect to an **EQuIS Enterprise** site from Power BI Desktop, take the following steps:

1. Select the **EQuIS** connector in the connector list, then click **Connect**.
2. Type or paste the URL of the **EQuIS Enterprise** site you are connecting to, then click **OK**.
3. If this is the first time you're connecting to this site, select the authentication kind and input your credentials.
4. Click **Next** to continue.
5. In **Navigator**, browse to the dataset or report you want to load, then click **Load** or **Transform Data**. See [Using EQuIS Data](https://help.earthsoft.com/index.htm?pbi-power-bi-adding-datasets.htm) for more information about available datasets. 

## Additional Information

* For best functionality and performance, we recommend that you use the **EQuIS** connector with the latest build of **EQuIS Enterprise**
* When using reports in a facility group, non-administrator users must have permission to all facilities contained in the facility group
* Only "grid" reports will be available in the **Navigator**
* All datasets consumed by the **EQuIS** connector will use camelCase for column names
* The current version of the **EQuIS** connector will retrieve a dataset in a single request and is limited to 1,048,576 rows in a single dataset (this limitation may be removed in a future version of the connector)