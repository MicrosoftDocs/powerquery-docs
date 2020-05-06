---
title: SAP HANA
description: Power Query SAP HANA connector reference
author: dougklopfenstein

ms.service: powerquery
ms.topic: conceptual
ms.date: 5/4/2020
ms.author: v-douklo

LocalizationGroup: reference
---

# SAP HANA
 
## Summary
 
Release State: General Availability

Products: Power BI Desktop, Excel

Authentication Types Supported: Windows, Database

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.
 
## Prerequisites

You'll need an SAP account to login to the website and download the drivers. If you are unsure, contact the SAP administrator in your organization.

To use SAP HANA, you must have the SAP HANA ODBC driver installed on the local client computer for the SAP HANA data connection to work properly. You can download the SAP HANA Client tools from [SAP Development Tools](https://tools.hana.ondemand.com/#hanatools), which contains the necessary ODBC driver. Or you can get it from the [SAP Software Download Center](https://support.sap.com/en/my-support/software-downloads.html). In the Software portal, search for the SAP HANA CLIENT for Windows computers. Since the SAP Software Download Center changes its structure frequently, more specific guidance for navigating that site isn't available. You'll need an SAP account to access 

To use SAP HANA in Excel, you must have either the 32-bit or 64-bit SAP HANA ODBC driver (depending on whether you're using the 32-bit or 64-bit version of Excel) installed on the local client computer.

This feature only available in Excel for Windows if you have Office 2019 or a [Microsoft 365 subscription](https://products.office.com/en-us/buy/compare-microsoft-office-products). If you are a Microsoft 365 subscriber, [make sure you have the latest version of Office](https://support.office.com/en-us/article/how-do-i-upgrade-office-ee68f6cf-422f-464a-82ec-385f65391350).
 
## Capabilities Supported
* Import
* Direct Query
* Advanced
    * SQL Statement

## Connect to SAP HANA
To connect to SAP HANA data:

1. Select **Get Data > SAP HANA database** in Power BI or **From Database > From SAP HANA Database** in the **Data** ribbon in Excel.

2. Enter the name and port of the SAP HANA server you want to connect to. The example in the following figure uses `SAPHANATestServer` on port `30015`. Optionally, if you want to import data using a native database query, select **Advanced options** and in the **SQL Statement** box enter the query. Then select **OK**.

   ![Enter the SAP HANA server information](media/sap-hana/sap-hana-server.png)

3. If the SAP HANA server requires database user credentials, then select **Database** and enter your user name and password. If required, enter your server certificate information. Then select **Connect**.

   ![Enter the server credentials](media/sap-hana/sap-hana-signin.png)



## Troubleshooting

## Next steps

[Connect to SAP HANA data sources by using DirectQuery in Power BI](https://docs.microsoft.com/power-bi/desktop-directquery-sap-hana)