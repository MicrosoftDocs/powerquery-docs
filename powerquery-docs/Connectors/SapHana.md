---
title: SAP HANA database
description: Power Query SAP HANA database connector reference
author: dougklopfenstein

ms.service: powerquery
ms.topic: conceptual
ms.date: 5/27/2020
ms.author: v-douklo

LocalizationGroup: reference
---

# SAP HANA database
 
## Summary
 
Release State: General Availability

Products: Power BI Desktop, Power BI Service (Enterprise Gateway), Dataflows in PowerBI.com (Enterprise Gateway), Dataflows in PowerApps.com (Enterprise Gateway), Excel

Authentication Types Supported: Windows, Database

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.
 
## Prerequisites

You'll need an SAP account to login to the website and download the drivers. If you are unsure, contact the SAP administrator in your organization.

To use SAP HANA in Power BI Desktop or Excel, you must have the SAP HANA ODBC driver installed on the local client computer for the SAP HANA data connection to work properly. You can download the SAP HANA Client tools from [SAP Development Tools](https://tools.hana.ondemand.com/#hanatools), which contains the necessary ODBC driver. Or you can get it from the [SAP Software Download Center](https://support.sap.com/en/my-support/software-downloads.html). In the Software portal, search for the SAP HANA CLIENT for Windows computers. Since the SAP Software Download Center changes its structure frequently, more specific guidance for navigating that site isn't available. You'll need an SAP account to access 

To use SAP HANA in Excel, you must have either the 32-bit or 64-bit SAP HANA ODBC driver (depending on whether you're using the 32-bit or 64-bit version of Excel) installed on the local client computer.

This feature is only available in Excel for Windows if you have Office 2019 or a [Microsoft 365 subscription](https://products.office.com/en-us/buy/compare-microsoft-office-products). If you are a Microsoft 365 subscriber, [make sure you have the latest version of Office](https://support.office.com/en-us/article/how-do-i-upgrade-office-ee68f6cf-422f-464a-82ec-385f65391350).
 
## Capabilities Supported
* Import
* Direct Query
* Advanced
    * SQL Statement

## Connect to a SAP HANA database from the desktop

To connect to a SAP HANA database from Power BI Desktop or Excel:

1. Select **Get Data > SAP HANA database** in Power BI Desktop or **From Database > From SAP HANA Database** in the **Data** ribbon in Excel.

2. Enter the name and port of the SAP HANA server you want to connect to. The example in the following figure uses `SAPHANATestServer` on port `30015`. Optionally, if you want to import data using a native database query, select **Advanced options** and in the **SQL Statement** box enter the query. Then select **OK**.

   ![Enter the SAP HANA server information](media/sap-hana/sap-hana-connect.png)

   If you are connecting to a SAP HANA database from Power BI Desktop, you are also given the option of selecting either **Import** or **DirectQuery**. For more information about connecting to the database using DirectQuery, see [Connect to SAP HANA data sources by using DirectQuery in Power BI](https://docs.microsoft.com/power-bi/connect-data/desktop-directquery-sap-hana).

   ![Power BI Desktop import or Direct Query option](media/sap-hana/sap-hana-server.png)

3. When accessing the database for the first time and the SAP HANA server requires database user credentials, then select **Database** and enter your user name and password. If required, enter your server certificate information. Then select **Connect**.

   ![Enter the server credentials](media/sap-hana/sap-hana-signin.png)

4. From the **Navigator** dialog box, you can either transform the data in the Power Query editor by selecting **Transform Data**, or load the data by selecting **Load**.

## Connect to a SAP HANA database online
 
To connect to SAP HANA data from Power BI Service, dataflows in PowerBI.com, or dataflows in PowerApps.com:

1. From the **Data sources** page, select **SAP HANA database**.

2. Enter the name and port of the SAP HANA server you want to connect to. The example in the following figure uses `SAPHANATestServer` on port `30015`. 

3. Select the name of the on-premises data gateway to use for accessing the database. You'll also need to enter a username and password.

   Select **Next** to continue.

   <kbd>![SAP HANA database online sign-in](media/sap-hana/sap-hana-online-signin.png)

3. From the **Navigator** dialog box, you can either transform the data in the Power Query editor by selecting **Transform Data**, or load the data by selecting **Load**.

## Supported features for SAP HANA

The following list shows the supported features for SAP HANA. Note that not all features listed here are supported in all implementations of the SAP HANA database connector.

* Both the Power BI and Excel connector for a SAP HANA database use the SAP ODBC driver to provide the best user experience.

* In Power BI, SAP HANA supports both DirectQuery and Import options.

* Power BI supports HANA information models, such as Analytic and Calculation Views, and has optimized navigation.

* With SAP HANA, you can also use the direct SQL feature to connect to Row and Column Tables.

* Power BI includes Optimized Navigation for HANA Models.

* Power BI supports SAP HANA Variables and Input parameters.

* Power BI supports HDI-container-based Calculation Views.

   * Support for HDI-container-based Calculation Views is in public preview in the August 2019 release of Power BI Desktop. To access your HDI-container-based Calculation Views in Power BI, ensure that the HANA database users you use with Power BI have permission to access the HDI runtime container that stores the views you want to access. To grant this access, create a Role that allows access to your HDI container. Then assign the role to the HANA database user you'll use with Power BI. (This user must also have permission to read from the system tables in the _SYS_BI schema, as usual.) Consult the official SAP documentation for detailed instructions on how to create and assign database roles. This SAP blog post may be a good place to start.

   * There are currently some limitations for HANA variables attached to HDI-based Calculation Views. These limitations are because of errors on the HANA side.

      First, it isn't possible to apply a HANA variable to a shared column of an HDI-container-based Calculation View. To fix this limitation, upgrade to HANA 2 version 37.02 and onwards or to HANA 2 version 42 and onwards. Second, multi-entry default values for variables and parameters currently don't show up in the Power BI UI. An error in SAP HANA causes this limitation, but SAP hasn't announced a fix yet.

## Known issues and limitations

There are a few limitations to using SAP HANA, shown below:

- NVARCHAR strings are truncated to a maximum length of 4000 Unicode characters.
- SMALLDECIMAL isn't supported.
- VARBINARY isn't supported.
- Valid Dates are between 1899/12/30 and 9999/12/31.

## Next steps

The following topics contain more information that you may find useful when connecting to a SAP HANA dabase.

- [Enable encryption for SAP HANA](https://docs.microsoft.com/power-bi/connect-data/desktop-sap-hana-encryption)
- [Manage your data source - SAP HANA](https://docs.microsoft.com/power-bi/connect-data/service-gateway-enterprise-manage-sap)
- [Use Kerberos for single sign-on (SSO) to SAP HANA](https://docs.microsoft.com/power-bi/connect-data/service-gateway-sso-kerberos-sap-hana)