# Power Query's 'Get Data' Experience
When connecting to a data source with Power Query, the process will follow a set of steps or stages before landing the data to a destination whether that is a table or the Power Query Editor Window.
This article describes these set of steps or stages to better understand how things work with Power Query.
>[!NOTE]
>This 'Get Data' experience could vary from connector to connector. In some cases some conectors might have all of these stages and in others just a few of them. For more information about the experience of a specific connector, please visit the documentation available for the connector.

![image-20200510085022228](C:\Users\MiguelEscobar\AppData\Roaming\Typora\typora-user-images\image-20200510085022228.png)

These set of steps or stages are:

1. Connector Parameters
2. Authentication
3. Navigation Table
4. Output Query

## Connector Parameters

With most connectors, they initially require at least one parameter in order to initialize a connection to the data source. For example, the SQL Server connector will require at least the hostname to establish a connection to a SQL Server.

![image-of-SQL-Param](someplace.jpg)

In comparison, when trying to connect to an Excel file, Power Query will require the user to find the file that wants to connect to by using the file path.

The connector parameters are commonly used to establish a connection to a data source and they, in conjunction with the connector used, define what's called a Data Source Path.

![image-of-Data-Source-Path](image.jpg)

>[!NOTE]
>Some connectors will not require you to enter any parameters at all.
>These are called Singleton Connectors and will only have one data source path available per environment. Some examples are Adobe Analytics, MailChimp, and Google Analytics.

## Authentication
Every single connection that made in Power Query has to be authenticated. 
The authentications methods vary from connector to connector and some connectors might offer multiple methods of authentication.

![image-of-Authentication-Window](image.jpg)

The current available methods of authentication for Power Query are:

- **Anonymous** - Commonly used when connecting to a Web Page 
- **Basic** - accepts a **username** and **password** to be sent in base64 encoding
- **API Key** - Accepts a single API Key for authentication
- **Organizational account** - also known as **OAuth 2.0**
- **Windows** - Can be implicit or explicit. Impersonation can also be an option.
- **Database** - Only available in some connectors specific to databases

## Navigation Table (Navigator)
The navigation table or navigator's window goal is to display, in a user-friendly way, the objects available from the data source to the end user. 

![image-of-navigator](image.jpg)

The main 2 sections of this window are:
* **Object selection** - displayed on the left hand side of the window. The user can interact with these objects and select one or enable the multi-select to get multiple objects.
* **The data preview** - it displays a preview of the data from the selected object on the right hand side of the window

>[!NOTE]
>Some connectors will completely bypass this window and will go straight to the output query phase. A connector that can do this is the 'From Folder' connector.

## Output Query
This is the phase where the user defines where to load the query. The options vary from integration to integration, but one option that will always be available is the load to the Power Query Editor window to further transform and enrich the query.
![image-of-Power-Query-Editor-Window](image.jpg)
