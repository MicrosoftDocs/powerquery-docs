---
title: "Getting data"
description: "Complete overview of the Power Query Get Data experience and all of its components such as connector parameters, authentication, navigation table and output."
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/01/2019
ms.author: v-miesco
---

# Getting data

Power Query can connect to many different data sources so you can work with the data you need. This article walks you through the steps for bringing in data into Power Query. 

When connecting to a data source with Power Query, the process will follow a set of steps or stages before landing the data at a destination, whether the destination is a table or the Power Query Editor window. This article describes the set of steps or stages to better understand how things work with Power Query.

>[!Note] 
>In some cases, a connector might have all of these stages and in other cases a connector might have just a few of them. For more information about the experience of a specific connector, visit the documentation available for the connector.

![Sample process image (To be replaced)](https://350519-1085912-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2019/09/092119_1322_TheGetData1-1024x576.png)

The set of steps or stages are:

1.  Connection Settings

2.  Authentication

3.  Data preview

4.  Output Query

## 1. Connection Settings

Most connectors initially require at least one parameter to initialize a connection to the data source. For example, the SQL Server connector requires at least the hostname to establish a connection to a SQL Server.

![SQL Server connector parameters](images/me-connector-parameters.png)

In comparison, when trying to connect to an Excel file, Power Query requires the user to find the file they want to connect to by using the file path.

The connector parameters are commonly used to establish a connection to a data source and they, in conjunction with the connector used, define what's called a *data source path*.

>[!Note] 
>Some connectors don't require you to enter any parameters at all. These are called *singleton connectors* and will only have one data source path available per environment. Some examples are Adobe Analytics, MailChimp, and Google Analytics.

## 2. Authentication 

Every single connection that is made in Power Query has to be authenticated. The authentication methods vary from connector to connector, and some connectors might offer multiple methods of authentication.

The current available methods of authentication for Power Query are:
* **Anonymous**&mdash;Commonly used when connecting to a Web Page.
* **Basic**&mdash;Accepts a **username** and **password** to be sent in base64 encoding.
* **API Key**&mdash;Accepts a single API Key for authentication.
* **Organizational account / Microsoft Account**&mdash;Also known as **OAuth 2.0**.
* **Windows**&mdash;Can be implicit or explicit. Impersonation can also be an option.
* **Database**&mdash;Only available in some connectors specific to databases.

For example, the available authentication methods for the Azure SQL Server connector are Windows, Database, and Microsoft account.

![SQL Server connector authentication methods](images/me-authentication.png)

## 3. Data preview

The goal of this data preview stage is to provide you with a user-friendly to preview and select your data.

Depending on the connector that you're using, you can get one of two available experiences:
* Navigator window
* Table preview dialog

### Navigator window (Navigation table)

The Navigator window consists of two main sections:

![SQL Server connector navigator](images/me-navigator.png)

* **Object selection**&mdash;Displayed on the left-hand side of the window. The
    user can interact with these objects and select one, or enable
    multi-select to get multiple objects.
* **The data preview**&mdash;Displays a preview of the data from the selected
    object on the right-hand side of the window.

### Table preview dialog

The Table preview dialog is a simple window that consists of only one section for the the data preview. An example of a connector that provides this experience and window the Folder connector. 

![Table preview dialog](images/combinefiles1.png)

## 4. Output query

This is the phase where the user defines where to load the query. The options vary from integration to integration. But one option that is always available is the option to load data to the Power Query Editor to further transform and enrich the query.
