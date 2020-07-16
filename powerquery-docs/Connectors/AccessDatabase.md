---
title: Access database
description: Power Query Access database connector reference
author: DougKlopfenstein
ms.service: powerquery
ms.topic: conceptual
ms.date: 07/9/2020
ms.author: v-douklo
LocalizationGroup: reference
---

# Access database
 
## Summary
 
Release State: General Availability

Products: Power BI Desktop, Power BI Service (Enterprise Gateway), Dataflows in PowerBI.com (Enterprise Gateway), Dataflows in PowerApps.com (Enterprise Gateway), Excel

Authentication Types Supported: Anonymous, Windows, Basic, Organizational Account

Function Reference Documentation: [Access.Database](https://docs.microsoft.com/powerquery-m/access-database)

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

If you're connecting to an Access database from Power Query Online, the system that contains the on-premises data gateway must have the 64-bit version of the [Access Database Engine 2010 OLEDB provider](https://www.microsoft.com/download/details.aspx?id=13255) installed. 

Also, if you are loading an Access database to Power BI Desktop, the bit versions of the Access Database Engine 2010 OLEDB provider and Power BI Desktop on that machine must match (that is, either 32-bit or 64-bit). For more information, see [Import Access database to Power BI Desktop](#import-access-database-to-power-bi-desktop).
 
## Capabilities Supported
* Import
    
## Connect to a Microsoft Access database

To make the connection, take the following steps:
 
1. Select the **Access database** option in the connector selection.
 
2. If you're connecting from Power BI Desktop or Excel, browse for and select the Access database you want to load. Then select **Open**. 

   ![Enter Access database connection](./media/access-database/select-database.png)

   If the Access database is online, use the [Web connector](web.md) to connect to the database.

3. If you're connecting from Power Query Online:

   1. In the **Access database** dialog that appears, provide the path to the Access database.

      ![Enter Access database online connection](./media/access-database/online-select-database.png)

   2. Enter the file path or URL address to the Access database.

   3. Select the name of your on-premises data gateway.

      >[!Note]
      > You must select an on-premises data gateway for this connector, whether the Access database is on your local network or on a web site.

   4. Select the type of credentials for the connection to the Access database in **Authentication kind**.

   5. Enter your credentials.

   6. Select **Next** to continue.

4. In **Navigator**, select the data you require, then either load or transform the data.

## Troubleshooting

### Connect to local file from Power Query Online

When you attempt to connect to a local Access database using Power Query Online, you must select an on-premises data gateway, even if your Access database is online.

### On-premises data gateway error

A 64-bit version of the Access Database Engine 2010 OLEDB provider must be installed on your on-premises data gateway machine to be able to load Access database files. If you already have a 64-bit version of Microsoft Office installed on the same machine as the gateway, the Access Database Engine 2010 OLEDB provider is already installed. If not, you can download the driver from the following location:

[https://www.microsoft.com/download/details.aspx?id=13255](https://www.microsoft.com/download/details.aspx?id=13255)

### Import Access database to Power BI Desktop

In some cases, you may get a `The 'Microsoft.ACE.OLEDB.12.0' provider is not registered` error when attempting to import an Access database file to Power BI Desktop. This error may be caused by using mismatched bit versions of Power BI Desktop and the Access Database Engine 2010 OLEDB provider. For more information about how you can fix this mismatch, see [Troubleshoot importing Access and Excel .xls files in Power BI Desktop](https://docs.microsoft.com/power-bi/connect-data/desktop-access-database-errors).

