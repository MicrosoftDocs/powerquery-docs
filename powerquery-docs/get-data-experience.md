---
title: "Getting data"
description: "Overview of the Power Query get data experience and all its components, such as connector parameters, authentication, navigation table, and query destination."
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/01/2019
ms.author: v-miesco
ms.custom: edited
---

# Getting data

Power Query can connect to many different data sources so you can work with the data you need. This article walks you through the steps for bringing in data to Power Query. 

Connecting to a data source with Power Query follows a standard set of stages before landing the data at a destination. This article describes each of these stages.

>[!Note] 
>In some cases, a connector might have all of these stages, and in other cases a connector might have just a few of them. <!--This is a bit ambiguous. Can it be either "Some connectors might have all these stages, and others might have just a few of them." or "In some cases, a connector might have all these stages and in other cases it might have just a few of them."?--> For more information about the experience of a specific connector, go to<!--Via Writing Style Guide.--> the documentation available for the connector.

The stages are:

1. Connection settings

2. Authentication

3. Data preview

4. Query destination

![Flow diagram for getting data](images/getting-data-flow-diagram.png "Flow diagram for getting data")

## 1. Connection settings

Most connectors initially require at least one parameter to initialize a connection to the data source. For example, the SQL Server connector requires at least the host name to establish a connection to the SQL Server database.<!--Edit okay? We can't use "a SQL Server." Or this could be "...a connection to the server running SQL Server." (Also, "host name" is via WSG.)-->

![SQL Server connector parameters](images/me-connector-parameters.png "SQL Server connector parameters")

In comparison, when trying to connect to an Excel file, Power Query requires that you use the file path to find the file you want to connect to.<!--Suggested.-->

The connector parameters are commonly used to establish a connection to a data source,<!--Comma required to join two independent clauses, hence the em dashes.--> and they&mdash;in conjunction with the connector used&mdash;define what's called a *data source path*.

>[!Note] 
>Some connectors don't require you to enter any parameters at all. These are called *singleton connectors* and will only have one data source path available per environment. Some examples are Adobe Analytics, MailChimp, and Google Analytics.

## 2. Authentication

Every single connection that's made in Power Query has to be authenticated. The authentication methods vary from connector to connector, and some connectors might offer multiple methods of authentication.

The currently available methods of authentication for Power Query are:

* **Anonymous**&mdash;Commonly used when connecting to a data source that doesn't require user authentication, such as a webpage or a file available over public HTTP.
* **Basic**&mdash;A **username** and **password** sent in base64 encoding are accepted for authentication.<!--Edit okay? "Accepts username and password to be sent..." is ambiguous. In this case it seems that passive voice might actually be clearer.-->
* **API Key**&mdash;A single API key is accepted for authentication.
* **Organizational account** or **Microsoft account**&mdash;This method is also known as **OAuth 2.0**.
* **Windows**&mdash;Can be implicit or explicit.
* **Database**&mdash;This is only available in some database connectors.

For example, the available authentication methods for the SQL Server<!--"Azure" isn't part of the SQL Server brand.--> connector are Windows, Database, and Microsoft account.

![SQL Server connector authentication methods](images/me-authentication.png "SQL Server connector authentication methods")

## 3. Data preview

The goal of the data preview stage is to provide you with a user-friendly way to preview and select your data.

Depending on the connector that you're using, you can preview data by using either:

* Navigator window
* Table preview dialog box

### Navigator window (navigation table)

The **Navigator** window consists of two main sections:

* The object selection pane is displayed on the left side of the window. The
    user can interact with and select these objects.
    >[!NOTE]
    >For Power Query in Excel, you need to enable the multi-select option<!--Will the reader know how to do this? If it's an icon, can we supply it here? --> from the upper-left corner of the navigation window.
* The data preview pane on the right side of the window shows a preview of the data from the object you selected.

![SQL Server connector navigator window](images/me-navigator.png "SQL Server connector navigator window")

### Table preview dialog box

The table preview<!--Removed bold format because it doesn't seem to actually have this name (or any fixed name) in the UI.--> dialog box consists of only one section for the data preview. An example of a connector that provides this experience and window is the [Folder](connectors/folder.md) connector.

![Table preview dialog box](images/combinefiles1.png "Table preview dialog box")

## 4. Query destination

This is the stage where you specify where to load the query. The options vary from integration to integration, but the one option that's always available is loading data to the Power Query Editor to further transform and enrich the query.
