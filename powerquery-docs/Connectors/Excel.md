---
title: PostgreSQL
description: Power Query PostgreSQL connector reference
author: cpopell

ms.service: powerquery
ms.topic: conceptual
ms.date: 09/13/2019
ms.author: gepopell

LocalizationGroup: reference
---

# Excel
 
## Summary
 
Release State: General Availability

Products: Power BI Desktop, Power BI Service (Gateway for on-premise or .xls files), Dataflows in PowerBI.com (Gateway for on-premise or .xls files), Dataflows in PowerApps.com (Gateway for on-premise or .xls files), Excel, 

Authentication Types Supported: No authentication

Note: Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.
 
## Prerequisites
In order to connect to a legacy workbook (such as .xls or .xlsb), the 

The 32-bit (or 64-bit) version of the Access Database Engine 2010 OLEDB provider may be required to read this type of file. To download the client software, visit the following site: https://go.microsoft.com/fwlink/?LinkID=285987.
 
To install the Npgsql provider, go to the [releases page](https://github.com/npgsql/Npgsql/releases) and download the relevant release. The provider architecture (32-bit vs. 65-bit) needs to match the architecture of the product where you intent to use the connector. When installing, make sure that you select Npgsql GAC Installation to ensure Npgsql itself is added to your machine.
 
![Npgsql installer with GAC Installation selected](images/Postgres1.png)
 
## Capabilities Supported
* Import

## Connect to a PostgreSQL database
 
## Troubleshooting

### Legacy ACE Connector
** Error resolution **

Workbooks built in a legacy format (such as .xls and .xlsb) are accessed via the Access Database Engine OLEDB provider, and Power Query will display values as returned by this provider. This may cause a lack of fidelity in certain cases compared to what you would see in an equivalent xlsx (OpenXML based) file.

**Incorrect column typing returning nulls**

When Ace loads a sheet, it looks at the first 8 rows to try to guess the data types to use. If the first 8 rows of data are not inclusive of the following data (for example, numeric only in the first 8 rows vs text in the following rows), ACE will apply an incorrect type to that column and return nulls for any data that does not match the type.


### Existing Excel documentation we wrote ###
