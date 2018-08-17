---
title: Handling authentication for Power Query connectors
description: Manage authentication for Power Query connectors
author: cpopell
manager: kfile
ms.reviewer: ''

ms.service: powerquery
ms.component: power-query
ms.topic: conceptual
ms.date: 08/16/2018
ms.author: gepopell

LocalizationGroup: reference
---

# Handling Authentication

## Authentication Kinds
An extension can support one or more kinds of Authentication. Each authentication kind is a different type of credential. The authentication UI displayed to end users in Power Query is driven by the type of credential(s) that an extension supports.

The list of supported authentication types is defined as part of an extension's [Data Source Kind](HandlingDataAccess.md#data-source-kind) definition. Each Authentication value is a record with specific fields. The table below lists the expected fields for each kind. All fields are required unless marked otherwise.

| Authentication Kind | Field         | Description                                                                                                                 |
|:--------------------|:--------------|:----------------------------------------------------------------------------------------------------------------------------|
| Implicit            |               | The Implicit (anonymous) authentication kind does not have any fields.                                                      |
| OAuth               | StartLogin    | Function which provides the URL and state information for initiating an OAuth flow.<br><br>See [Implementing an OAuth Flow](#implementing-an-oauth-flow) below.|
|                     | FinishLogin   | Function which extracts the access\_token and other properties related to the OAuth flow.                                   |
|                     | Refresh       | **(optional)** Function that retrieves a new access token from a refresh token.                                             |
|                     | Logout        | **(optional)** Function that invalidates the user's current access token.                                                   |
|                     | Label         | **(optional)** A text value that allows you to override the default label for this AuthenticationKind.                      |
| UsernamePassword    | UsernameLabel | **(optional)** A text value to replace the default label for the *Username* text box on the credentials UI.                 |
|                     | PasswordLabel | **(optional)** A text value to replace the default label for the *Password* text box on the credentials UI.                 |
|                     | Label         | **(optional)** A text value that allows you to override the default label for this AuthenticationKind.                      |
| Windows             | UsernameLabel | **(optional)** A text value to replace the default label for the *Username* text box on the credentials UI.                 |
|                     | PasswordLabel | **(optional)** A text value to replace the default label for the *Password* text box on the credentials UI.                 |
|                     | Label         | **(optional)** A text value that allows you to override the default label for this AuthenticationKind.                      |
| Key                 | KeyLabel      | **(optional)** A text value to replace the default label for the *API Key* text box on the credentials UI.                  |
|                     | Label         | **(optional)** A text value that allows you to override the default label for this AuthenticationKind.                      |


The sample below shows the Authentication record for a connector that supports OAuth, Key, Windows, Basic (Username and Password), and anonymous credentials.

**Example:**

```
Authentication = [
    OAuth = [
        StartLogin = StartLogin,
        FinishLogin = FinishLogin,
        Refresh = Refresh,
        Logout = Logout
    ],
    Key = [],
    UsernamePassword = [],
    Windows = [],
    Implicit = []
]
```

#### Accessing the Current Credentials

The current credentials can be retrieved using the `Extension.CurrentCredential()` function.

M data source functions that have been enabled for extensibility will automatically inherit your extension's credential scope. In most cases, you will not need to explicitly access the current credentials, however, there are exceptions, such as:

* Passing in the credential in a custom header or query string parameter (such as when you are using the API Key auth type)
* Setting connection string properties for ODBC or ADO.N<i></i>ET extensions
* Checking custom properties on an OAuth token
* Using the credentials as part of an OAuth v1 flow

The `Extension.CurrentCredential()` function returns a record object. The fields it contains will be authentication type specific. See the table below for details.

| Field              | Description                                                                                                                                                                                                                                                                                                                                          | Used By                        |
|:-------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------|
| AuthenticationKind | Contains the name of the authentication kind assigned to this credential (UsernamePassword, OAuth, etc).                                                                                                                                                                                                                                             | All                            |
| Username           | Username value                                                                                                                                                                                                                                                                                                                                       | UsernamePassword, Windows      |  
| Password           | Password value. Typically used with UsernamePassword, but it is also set for Key.                                                                                                                                                                                                                                                                    | Key, UsernamePassword, Windows |
| access_token       | OAuth access token value.                                                                                                                                                                                                                                                                                                                            | OAuth                          |
| Properties         | A record containing other custom properties for a given credential. Typically used with OAuth to store additional properties (such as the refresh\_token) returned with the access\_token during the authentication flow.                                                                                                                            | OAuth                          |
| Key                | The API key value. Note, the key value is also available in the Password field as well. By default the mashup engine will insert this in an Authorization header as if this value were a basic auth password (with no username). If this is not the behavior you want, you must specify the ManualCredentials = true option in the options record.   | Key                            |
| EncryptConnection  | A logical value that determined whether to require an encrypted connection to the data source. This value is available for all Authentication Kinds, but will only be set if EncryptConnection is specified in the [Data Source](HandlingDataAccess.md#data-source-kind) definition.                                                                                      | All                            |

The following is an example of accessing the current credential for an API key and using it to populate a custom header (`x-APIKey`).

**Example:**

```
MyConnector.Raw = (_url as text) as binary =>
let
    apiKey = Extension.CurrentCredential()[Key],
    headers = [

        #"x-APIKey" = apiKey,
        Accept = "application/vnd.api+json",
        #"Content-Type" = "application/json"
    ],
    request = Web.Contents(_url, [ Headers = headers, ManualCredentials = true ])
in
    request
```

#### Implementing an OAuth Flow

The OAuth authentication type allows an extension to implement custom logic for their service. 
To do this, an extension will provide functions for `StartLogin` (returning the authorization URI to initiate the OAuth flow) 
and `FinishLogin` (exchanging the authorization code for an access token).
Extensions can optionally implement `Refresh` (exchanging a refresh token for a new access token) and `Logout` (expiring the current refresh and access tokens) functions as well.

>**Note:** Power Query extensions are evaluated in applications running on client machines.
>Data Connectors **should not** use confidential secrets in their OAuth flows, as users may
>inspect the extension or network traffic to learn the secret.
>Please see the [OAuth 2.0 for Native Apps](https://tools.ietf.org/html/draft-ietf-oauth-native-apps-12) draft RFC for further details on providing 
>flows that do not rely on shared secrets. 

>In the future we plan to support data sources that require confidential secrets (using a proxy based mechanism).

Please see the [MyGraph](~/../samples/MyGraph/README.md) and [Github](~/../samples/Github/README.md) samples for more details.

### Data Source Paths

The M engine identifies a data source using a combination of its *Kind* and *Path*.
When a data source is encountered during a query evaluation, the M engine will try to find matching credentials.
If no credentials are found, the engine returns an special error which results in a credential prompt in Power Query. 

The *Kind* value comes from [Data Source Kind](HandlingDataAccess.md#data-source-kind) definition. 

The *Path* value is derived from the _required parameters_ of your [data source function](HandlingDataAccess#data-source-functions). Optional parameters are not factored into the data source path identifier.
As a result, all data source functions associated with a data source kind must have the same parameters.
There is special handling for functions that have a single parameter of type `Uri.Type`. See the [section below](#functions-with-an-uri-parameter) for details.

You can see an example of how credentials are stored in the *Data source settings* dialog in Power BI Desktop. In this dialog, the Kind is represented by an icon, and the Path value is displayed as text.

![DataSourcePaths](images/dataSourceSettingsCreds.png)

>**Note:** If you change your data source function's required parameters during development, previously stored credentials will no longer work (because the path values no longer match). You should delete any stored credentials any time you change your data source function parameters. If incompatible credentials are found, you may receive an error at runtime.

#### Data Source Path Format
The _Path_ value for a data source is derived from the data source function's required parameters. 

By default, you can see the actual string value in the Data source settings dialog in Power BI Desktop, and in the credential prompt.
If the Data Source Kind definition has included a `Label` value, you will see the label value instead.

For example, the data source function in the [HelloWorldWithDocs sample](~/../samples/HelloWorldWithDocs/README.md) has the following signature:

```
HelloWorldWithDocs.Contents = (message as text, optional count as number) as table => ...
```

The function has a single required parameter (`message`) of type `text`, and will be used to calculate the data source path. The optional parameter (`count`) would be ignored. The path would be displayed 

Credential prompt: 

![DataSourceCredentials](images/credentialPromptWithPath.png)

Data source settings UI:

![DataSourceSettings](images/dataSourceSettingsJson.png)

When a Label value is defined, the data source path value would not be shown:

![DataSourceLabel](images/dataSourceSettingsLabel.png)

>**Note:** We currently recommend you _do not_ include a Label for your data source if your function has required parameters, as users will not be able to distinguish between the different credentials they have entered. We are hoping to improve this in the future (i.e. allowing data connectors to display their own custom data source paths).

#### Functions with an Uri parameter
Because data sources with an Uri based identifier are so common, there is special handling in the Power Query UI when dealing with Uri based data source paths.
When an Uri-based data source is encountered, the credential dialog provides a drop down allowing the user to select the base path, rather than the full path (and all paths in between).

![DataSourceUrl](images/credentialPromptWithUrl.png)

As `Uri.Type` is an _ascribed type_ rather than a _primitive type_ in the M language, you will need to use the [Value.ReplaceType](https://msdn.microsoft.com/library/mt260838) function to indicate that your text parameter should be treated as an Uri.

```
shared GithubSample.Contents = Value.ReplaceType(Github.Contents, type function (url as Uri.Type) as any);
```
