---
title: "Getting data"
description: "Overview of the Power Query get data experience and all its components, such as connector parameters, authentication, navigation table, and query destination."
author: ptyx507
ms.service: powerquery
ms.reviewer: kvivek
ms.date: 12/12/2021
ms.author: dougklo
ms.custom: intro-internal
---

# Getting data

Power Query can connect to many different data sources so you can work with the data you need. This article walks you through the steps for bringing in data to Power Query either in the Power Query Desktop or the Power Query Online experience.

Connecting to a data source with Power Query follows a standard set of stages before landing the data at a destination. This article describes each of these stages.

>[!NOTE]
>To better understand how to get data using the different product integrations of Power Query, you can read the article on [Where to get data](where-to-get-data.md).

>[!IMPORTANT]
>In some cases, a connector might have all stages of the get data experience, and in other cases a connector might have just a few of them. For more information about the experience of a specific connector, go to the documentation available for the specific connector by searching on the [Connectors in Power Query article](connectors.md).

## Power Query Desktop experience

The stages for getting data in the Power Query Desktop experiences are:

1. Connection settings

2. Authentication

3. Data preview

4. Query destination

![Flow diagram showing the four stages of getting data.](images/getting-data-flow-diagram.png "Flow diagram showing the four stages of getting data")

### 1. Connection settings

Most connectors initially require at least one parameter to initialize a connection to the data source. For example, the SQL Server connector requires at least the host name to establish a connection to the SQL Server database.

![SQL Server connector parameters.](images/me-connector-parameters.png "SQL Server connector parameters")

In comparison, when trying to connect to an Excel file, Power Query requires that you use the file path to find the file you want to connect to.

The connector parameters are commonly used to establish a connection to a data source, and they&mdash;in conjunction with the connector used&mdash;define what's called a *data source path*.

>[!Note] 
>Some connectors don't require you to enter any parameters at all. These are called *singleton connectors* and will only have one data source path available per environment. Some examples are Adobe Analytics, MailChimp, and Google Analytics.

### 2. Authentication

Every single connection that's made in Power Query has to be authenticated. The authentication methods vary from connector to connector, and some connectors might offer multiple methods of authentication.

The currently available methods of authentication for Power Query are:

* **Anonymous**: Commonly used when connecting to a data source that doesn't require user authentication, such as a webpage or a file available over public HTTP.
* **Basic**: A **username** and **password** sent in base64 encoding are accepted for authentication.
* **API Key**: A single API key is accepted for authentication.
* **Organizational account** or **Microsoft account**: This method is also known as **OAuth 2.0**.
* **Windows**: Can be implicit or explicit.
* **Database**: This is only available in some database connectors.

For example, the available authentication methods for the SQL Server database connector are Windows, Database, and Microsoft account.

![SQL Server database connector authentication methods.](images/me-authentication.png "SQL Server database connector authentication methods")

### 3. Data preview

The goal of the data preview stage is to provide you with a user-friendly way to preview and select your data.

Depending on the connector that you're using, you can preview data by using either:

* Navigator window
* Table preview dialog box

#### Navigator window (navigation table)

The **Navigator** window consists of two main sections:

* The object selection pane is displayed on the left side of the window. The user can interact with and select these objects.

    >[!NOTE]
    >For Power Query in Excel, select the **Select multiple items** option from the upper-left corner of the navigation window to select more than one object at a time in the object selection pane.

    >[!NOTE]
    >The list of objects in Power Query Desktop is limited to 10,000 items. This limit does not exist in Power Query Online. For a workaround in Power Query Desktop, see [Object limitation workaround](#object-limitation-workaround).
    
* The data preview pane on the right side of the window shows a preview of the data from the object you selected.

![SQL Server connector navigator window.](images/me-navigator.png "SQL Server connector navigator window")

##### Object limitation workaround

There’s a fixed limit of 10,000 objects in the **Navigator** in Power Query Desktop. This limit does not occur in Power Query Online. Eventually, the Power Query Online UI will replace the one in the desktop.

In the interim, you can use the following workaround:

1. Right-click on the root node of the **Navigator**, and then select **Transform Data**.

    ![Selecting the root node in Navigator and selecting transform data from the drop-down menu.](images/navigator-transform-data.png)

2. Power Query Editor then opens with the full navigation table in the table preview area. This view doesn't have a limit on the number of objects, and you can use filters or any other Power Query transforms to explore the list and find the rows you want (for example, based on the **Name** column).

3. Upon finding the item you want, you can get at the contents by selecting the data link (such as the **Table** link in the following image).

    ![Selecting the Table link to view the contents.](images/select-table-link.png)

#### Table preview dialog box

The table preview dialog box consists of only one section for the data preview. An example of a connector that provides this experience and window is the [Folder](connectors/folder.md) connector.

![Table preview dialog box.](images/combinefiles1.png "Table preview dialog box")

### 4. Query destination

This is the stage in which you specify where to load the query. The options vary from integration to integration, but the one option that's always available is loading data to the Power Query Editor to further transform and enrich the query.

## Power Query Online experience

The stages for getting data in Power Query Online are:

1. Connection settings and Authentication

2. Data preview

3. Query destination

![Flow diagram showing the three stages of getting data in Power Query Online.](images/getting-data-pqo-flow.png "Flow diagram showing the three stages of getting data in Power Query Online")

### 1. Connection settings and Authentication

In the Power Query online experience you are greeted with the *Connect to data source* dialog that requires you to enter values in two distinct sections:
* Connection settings
* Connection credentials

![Connect to data source dialog when using the SQL Server database connector that showcases the Connection settings and Connection credentials sections](images/connect-to-data-source-pqo.png)

#### Connection Settings

This is the section where you are able to define the information needed to establish a connection to your data source. Depending on your connector, that could be the name of the server, database, a folder path, file path, or other information required by the connector in order to establish a connection to your data source. Some connectors also enable advanced sections or specific sub-sections to give you more control and options on how to connect to your data source.

![Connect to data source dialog when using the SQL Server database connector that showcases the Connection settings with the advanced options section expanded](images/connection-settings-pqo-advanced.png)

#### Connection credentials

* parameters
* authentication
* connection name 
* gateway

>[!NOTE]
>Some Power Query integrations do not currently enable you to establish a defined connection or a privacy level, but all Power Query online experiences do provide a way to define the data gateway, authentication kind, and the credentials that need to be used.

### 2. Data preview

### 3. Query destination