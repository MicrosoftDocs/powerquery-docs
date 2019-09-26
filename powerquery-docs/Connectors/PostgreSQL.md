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

# PostgreSQL
 
## Summary
 
Release State: General Availability

Products: Power BI Desktop, Power BI Service (Enterprise Gateway), Dataflows in PowerBI.com (Enterprise Gateway), Dataflows in PowerApps.com (Enterprise Gateway), Excel

Authentication Types Supported: Database (Username/Password)

Note: Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.
 
## Prerequisites
In order to connect to a PostgreSQL database with  **Power BI Desktop**, the Npgsql provider must be installed on the computer running Power BI Desktop.
 
To install the Npgsql provider, go to the [releases page](https://github.com/npgsql/Npgsql/releases) and download the relevant release. The provider architecture (32-bit vs. 65-bit) needs to match the architecture of the product where you intent to use the connector. When installing, make sure that you select Npgsql GAC Installation to ensure Npgsql itself is added to your machine.
 
![Npgsql installer with GAC Installation selected](images/Postgres1.png)
 
## Capabilities Supported
* Import
* DirectQuery (Power BI only, learn more)
* Advanced options
    * Command timeout in minutes
    * Native SQL statement
    * Relationship columns
    * Navigate using full hierarchy
## Connect to a PostgreSQL database
Once the matching Npgsql provider is installed, you can connect to a PostgreSQL database. To make the connection, take the following steps:
 
1.  From the Power Query Get Data dialog (or Data tab in the Excel ribbon), select  **Database > PostgreSQL**
 
![PostgreSQL connection builder in Power BI](images/Postgres2.png)
 
2. In the  **PostgreSQL**  dialog that appears, provide the name of the server and database. Optionally, you may provide a command timeout and a native query (SQL statement), as well as select whether or not you want to include relationship columns and navigate using full hierarchy. Once you are done, select  **Connect**.
3. If the PostgreSQL database requires database user credentials, input those credentials in the dialogue when prompted.
## Native Query Folding
To enable Native Query Folding, set the EnableFolding flag to "true" for [Value.NativeQuery()](https://docs.microsoft.com/en-us/powerquery-m/value-nativequery) in the advanced editor.
Sample:
```Value.NativeQuery(target as any, query, null, [EnableFolding=true])```
 
Operations that are capable of folding will be applied on top of your native query according to normal Import or Direct Query logic. Native Query folding is not applicable with optional parameters present in [Value.NativeQuery()](https://docs.microsoft.com/en-us/powerquery-m/value-nativequery).
 
## Troubleshooting
Your native query may throw the error:
```We cannot fold on top of this native query. Please modify the native query or remove the 'EnableFolding' option.```
A basic trouble shooting step is to check if the query in [Value.NativeQuery()](https://docs.microsoft.com/en-us/powerquery-m/value-nativequery) throws the same error with a limit 1 clause around it:
```select * from (query) _ limit 1```
