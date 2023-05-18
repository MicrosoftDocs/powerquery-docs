---
title: Handling authentication for Power Query connectors
description: Manage authentication for Power Query connectors
author: ptyx507x
ms.topic: conceptual
ms.date: 1/9/2023
ms.author: miescobar
---

# Handling authentication

## Authentication kinds

An extension can support one or more kinds of Authentication. Each authentication kind is a different type of credential. The authentication UI displayed to end users in Power Query is driven by the type of credential(s) that an extension supports.

The list of supported authentication types is defined as part of an extension's [Data Source Kind](HandlingDataAccess.md#data-source-kind) definition. Each Authentication value is a record with specific fields. The following table lists the expected fields for each kind. All fields are required unless marked otherwise.

| Authentication Kind | Field         | Description                                                                                                                                                    |
| :------------------ | :------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Anonymous           |               | The Anonymous (also called `Implicit`) authentication kind doesn't have any fields.                                                                                         |
| OAuth               | StartLogin    | Function that provides the URL and state information for starting an OAuth flow.<br/></br>Go to the [Implementing an OAuth Flow](#implementing-an-oauth-flow) section. |
|                     | FinishLogin   | Function that extracts the access_token and other properties related to the OAuth flow.                                                                        |
|                     | Refresh       | **(optional)** Function that retrieves a new access token from a refresh token.                                                                                |
|                     | Logout        | **(optional)** Function that invalidates the user's current access token.                                                                                      |
|                     | Label         | **(optional)** A text value that allows you to override the default label for this AuthenticationKind.                                                         |
| Aad                 | AuthorizationUri | `text` value or function that returns the Azure AD authorization endpoint (example: `"https://login.microsoftonline.com/common/oauth2/authorize"`).<br/></br>Go to the [Azure Active Directory authentication](#azure-active-directory-authentication) section. |
|                     | Resource         | `text` value or function that returns the Azure AD resource value for your service.                                                                              |
| UsernamePassword    | UsernameLabel | **(optional)** A text value to replace the default label for the _Username_ text box on the credentials UI.                                                    |
|                     | PasswordLabel | **(optional)** A text value to replace the default label for the _Password_ text box on the credentials UI.                                                    |
|                     | Label         | **(optional)** A text value that allows you to override the default label for this AuthenticationKind.                                                         |
| Windows             | UsernameLabel | **(optional)** A text value to replace the default label for the _Username_ text box on the credentials UI.                                                    |
|                     | PasswordLabel | **(optional)** A text value to replace the default label for the _Password_ text box on the credentials UI.                                                    |
|                     | Label         | **(optional)** A text value that allows you to override the default label for this AuthenticationKind.                                                         |
| Key                 | KeyLabel      | **(optional)** A text value to replace the default label for the _API Key_ text box on the credentials UI.                                                     |
|                     | Label         | **(optional)** A text value that allows you to override the default label for this AuthenticationKind.                                                         |

The following sample shows the Authentication record for a connector that supports OAuth, Key, Windows, Basic (Username and Password), and Anonymous credentials.

**Example:**

```powerquery
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
    Anonymous = []
]
```

## Accessing the current credentials

The current credentials can be retrieved using the `Extension.CurrentCredential()` function.

M data source functions that have been enabled for extensibility will automatically inherit your extension's credential scope. In most cases, you won't need to explicitly access the current credentials, however, there are exceptions, such as:

- Passing in the credential in a custom header or query string parameter (such as when you're using the API Key auth type)
- Setting connection string properties for ODBC or ADO.NET extensions
- Checking custom properties on an OAuth token
- Using the credentials as part of an OAuth v1 flow

The `Extension.CurrentCredential()` function returns a record object. The fields it contains will be authentication type specific. The following table contains details.

| Field              | Description                                                                                                                                                                                                                                                                                                                                         | Used By                        |
| :----------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------- |
| AuthenticationKind | Contains the name of the authentication kind assigned to this credential (UsernamePassword, OAuth, and so on).                                                                                                                                                                                                                                      | All                            |
| Username           | Username value                                                                                                                                                                                                                                                                                                                                      | UsernamePassword, Windows      |
| Password           | Password value. Typically used with UsernamePassword, but it's also set for Key.                                                                                                                                                                                                                                                                   | Key, UsernamePassword, Windows |
| access_token       | OAuth access token value.                                                                                                                                                                                                                                                                                                                           | OAuth                          |
| Properties         | A record containing other custom properties for a given credential. Typically used with OAuth to store other properties (such as the refresh_token) returned with the access_token during the authentication flow.                                                                                                                             | OAuth                          |
| Key                | The API key value. Note, the key value is also available in the Password field as well. By default, the mashup engine will insert this key in an Authorization header as if this value were a basic auth password (with no username). If this isn't the behavior you want, you must specify the ManualCredentials = true option in the options record. | Key                            |
| EncryptConnection  | A logical value that determined whether to require an encrypted connection to the data source. This value is available for all Authentication Kinds, but will only be set if EncryptConnection is specified in the [Data Source](HandlingDataAccess.md#data-source-kind) definition.                                                                | All                            |

The following code sample accesses the current credential for an API key and uses it to populate a custom header (`x-APIKey`).

**Example:**

```powerquery
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

## Implementing an OAuth flow

The OAuth authentication type allows an extension to implement custom logic for their service.
To do this, an extension will provide functions for `StartLogin` (returning the authorization URI to initiate the OAuth flow)
and `FinishLogin` (exchanging the authorization code for an access token).
Extensions can optionally implement `Refresh` (exchanging a refresh token for a new access token) and `Logout` (expiring the current refresh and access tokens) functions as well.

> [!NOTE]
> Power Query extensions are evaluated in applications running on client machines. Data Connectors _should not_ use confidential secrets in their OAuth flows, as users may inspect the extension or network traffic to learn the secret. Go to the [Proof Key for Code Exchange by OAuth Public Clients RFC](https://tools.ietf.org/html/rfc7636) (also known as PKCE) for further details on providing flows that don't rely on shared secrets. A [sample](https://github.com/microsoft/DataConnectors/blob/master/samples/OAuthPKCE/PKCESample.pq) implementation of this flow can be found on our GitHub site.

There are two sets of OAuth function signatures; the original signature that contains a minimal number of parameters, and an advanced signature that
accepts more parameters. Most OAuth flows can be implemented using the original signatures. You can also mix and match signature types in your implementation. The function calls are matches based on the number of parameters (and their types). The parameter names aren't taken into consideration.

Go to the [GitHub](samples/github/readme.md) sample for more details.

### Original OAuth signatures

```powerquery
StartLogin = (dataSourcePath, state, display) => ...;

FinishLogin = (context, callbackUri, state) => ...;

Refresh = (dataSourcePath, refreshToken) =>  ...;

Logout = (accessToken) => ...;
```

### Advanced OAuth signatures

Notes about the advanced signatures:

- All signatures accept a `clientApplication` record value, which is reserved for future use.
- All signatures accept a `dataSourcePath` (also referred to as `resourceUrl` in most samples).
- The `Refresh` function accepts an `oldCredential` parameter, which is the previous `record` returned by your `FinishLogin` function (or previous call to `Refresh`).

```powerquery
StartLogin = (clientApplication, dataSourcePath, state, display) => ...;

FinishLogin = (clientApplication, dataSourcePath, context, callbackUri, state) => ...;

Refresh = (clientApplication, dataSourcePath, oldCredential) =>  ...;

Logout = (clientApplication, dataSourcePath, accessToken) => ...;
```

### Azure Active Directory authentication

The `Aad` authentication kind is a specialized version of OAuth for Azure Active Directory. It uses the same Azure AD client as the built-in Power Query connectors that support
Organization Account authentication.

> [!NOTE]
> If your data source requires scopes other than `user_impersonation`, or is incompatible with the use of `user_impersonation`, then you should use the `OAuth` authentication kind.

> [!NOTE]
> If you implement your own OAuth flow for Azure AD, users who have enabled [Conditional Access](/azure/active-directory/conditional-access/overview) for their tenant might encounter issues when refreshing using the Power BI service. This won't impact gateway-based refresh, but would impact a certified connector that supports refresh from the Power BI service. Users might run into a problem stemming from the connector using a [public client application](/azure/active-directory/develop/msal-client-applications) when configuring web-based credentials through the Power BI service. The access token generated by this flow will ultimately be used on a different computer (that is, the Power BI service in an Azure data center, not on the company's network) than the one used to originally authenticate (that is, the computer of the user who configures the data source credentials on the company's network). The built-in `Aad` type works around this problem by using a different Azure AD client when configuring credentials in the Power BI service. This option won't be available to connectors that use the `OAuth` authentication kind.

Most connectors will need to provide values for the `AuthorizationUri` and `Resource` fields. Both fields can be `text` values, or a single argument function that returns a `text value`.

```powerquery
AuthorizationUri = "https://login.microsoftonline.com/common/oauth2/authorize"
```

```powerquery
AuthorizationUri = (dataSourcePath) => FunctionThatDeterminesAadEndpointFromDataSourcePath(dataSourcePath)
```

```powerquery
Resource = "77256ee0-fe79-11ea-adc1-0242ac120002"   // Azure AD resource value for your service - Guid or URL
```

```powerquery
Resource = (dataSourcePath) => FunctionThatDeterminesResourceFromDataSourcePath(dataSourcePath)
```

Connectors that use a [Uri based identifier](#functions-with-a-uri-parameter) don't need to provide a `Resource` value.
By default, the value will be equal to the root path of the connector's Uri parameter.
If the data source's Azure AD resource is different than the domain value (for example, it uses a GUID), then a `Resource` value needs to be provided.

#### Aad authentication kind samples

In this case, the data source supports global cloud Azure AD using the common tenant (no Azure B2B support).

```powerquery
Authentication = [
    Aad = [
        AuthorizationUri = "https://login.microsoftonline.com/common/oauth2/authorize",
        Resource = "77256ee0-fe79-11ea-adc1-0242ac120002" // Azure AD resource value for your service - Guid or URL
    ]
]
```

In this case, the data source supports tenant discovery based on OpenID Connect (OIDC) or similar protocol. This allows the connector to determine the correct Azure AD endpoint
to use based on one or more parameters in the data source path. This dynamic discovery approach allows the connector to support Azure B2B.

```powerquery

// Implement this function to retrieve or calculate the service URL based on the data source path parameters
GetServiceRootFromDataSourcePath = (dataSourcePath) as text => ...;

GetAuthorizationUrlFromWwwAuthenticate = (url as text) as text =>
    let
        // Sending an unauthenticated request to the service returns
        // a 302 status with WWW-Authenticate header in the response. The value will
        // contain the correct authorization_uri.
        // 
        // Example:
        // Bearer authorization_uri="https://login.microsoftonline.com/{tenant_guid}/oauth2/authorize"
        responseCodes = {302, 401},
        endpointResponse = Web.Contents(url, [
            ManualCredentials = true,
            ManualStatusHandling = responseCodes
        ])
    in
        if (List.Contains(responseCodes, Value.Metadata(endpointResponse)[Response.Status]?)) then
            let
                headers = Record.FieldOrDefault(Value.Metadata(endpointResponse), "Headers", []),
                wwwAuthenticate = Record.FieldOrDefault(headers, "WWW-Authenticate", ""),
                split = Text.Split(Text.Trim(wwwAuthenticate), " "),
                authorizationUri = List.First(List.Select(split, each Text.Contains(_, "authorization_uri=")), null)
            in
                if (authorizationUri <> null) then
                    // Trim and replace the double quotes inserted before the url
                    Text.Replace(Text.Trim(Text.Trim(Text.AfterDelimiter(authorizationUri, "=")), ","), """", "")
                else
                    error Error.Record("DataSource.Error", "Unexpected WWW-Authenticate header format or value during authentication.", [
                        #"WWW-Authenticate" = wwwAuthenticate
                    ])
        else
            error Error.Unexpected("Unexpected response from server during authentication.");

<... snip ...>

Authentication = [
    Aad = [
        AuthorizationUri = (dataSourcePath) =>
            GetAuthorizationUrlFromWwwAuthenticate(
                GetServiceRootFromDataSourcePath(dataSourcePath)
            ),
        Resource = "https://myAadResourceValue.com", // Azure AD resource value for your service - Guid or URL
    ]
]

```

## Data Source paths

The M engine identifies a data source using a combination of its _Kind_ and _Path_.
When a data source is encountered during a query evaluation, the M engine will try to find matching credentials.
If no credentials are found, the engine returns a special error that results in a credential prompt in Power Query.

The _Kind_ value comes from the [Data Source Kind](HandlingDataAccess.md#data-source-kind) definition.

The _Path_ value is derived from the _required parameters_ of your [data source function](HandlingDataAccess.md#data-source-functions). Optional parameters aren't factored into the data source path identifier.
As a result, all data source functions associated with a data source kind must have the same parameters.
There's special handling for functions that have a single parameter of type `Uri.Type`. Go to [Functions with a Uri parameter](#functions-with-a-uri-parameter) for details.

You can see an example of how credentials are stored in the **Data source settings** dialog in Power BI Desktop. In this dialog, the Kind is represented by an icon, and the Path value is displayed as text.

![DataSourcePaths.](media/handling-authentication/data-source-settings-creds.png)

> [!NOTE]
> If you change your data source function's required parameters during development, previously stored credentials will no longer work (because the path values no longer match). You should delete any stored credentials any time you change your data source function parameters. If incompatible credentials are found, you may receive an error at runtime.

### Data source path format

The _Path_ value for a data source is derived from the data source function's required parameters.
Required parameters can be excluded from the path by adding `DataSource.Path = false` to the function's metadata (go to[Excluding required parameters from you data source path](#excluding-required-parameters-from-your-data-source-path)).

By default, you can see the actual string value in the Data source settings dialog in Power BI Desktop, and in the credential prompt.
If the Data Source Kind definition has included a `Label` value, you'll see the label value instead.

For example, the data source function in the [HelloWorldWithDocs sample](https://github.com/Microsoft/DataConnectors/tree/master/samples/HelloWorldWithDocs) has the following signature:

```powerquery
HelloWorldWithDocs.Contents = (message as text, optional count as number) as table => ...
```

The function has a single required parameter (`message`) of type `text`, and will be used to calculate the data source path. The optional parameter (`count`) would be ignored. The path would be displayed

Credential prompt:

![DataSourceCredentials.](media/handling-authentication/credential-prompt-with-path.png)

Data source settings UI:

![DataSourceSettings.](media/handling-authentication/data-source-settings-json.png)

When a Label value is defined, the data source path value wouldn't be shown:

![DataSourceLabel.](media/handling-authentication/data-source-settings-label.png)

> [!NOTE]
> We currently recommend you _do not_ include a Label for your data source if your function has required parameters, as users won't be able to distinguish between the different credentials they've entered. We are hoping to improve this in the future (that is, allowing data connectors to display their own custom data source paths).

#### Excluding required parameters from your data source path

If you want a function parameter to be required, but not to be included as part of your data source path, you can add `DataSource.Path = false` to the function documentation metadata.
This property can be added to one or more parameters for your function. This field removes the value from your data source path (meaning that it will no longer be passed to your `TestConnection` function), so it should only be used for parameters that aren't required to identify your data source, or distinguish between user credentials.

For example, the connector in the [HelloWorldWithDocs sample](https://github.com/Microsoft/DataConnectors/tree/master/samples/HelloWorldWithDocs) would require different credentials for different `message` values.
Adding `DataSource.Path = false` to the `message` parameter removes it from the data source path calculation, effectively making the connector a "singleton". All calls to `HelloWorldWithDocs.Contents` are treated as the same data source, and the user will only provide credentials once.

```powerquery
HelloWorldType = type function (
    message as (type text meta [
        DataSource.Path = false,
        Documentation.FieldCaption = "Message",
        Documentation.FieldDescription = "Text to display",
        Documentation.SampleValues = {"Hello world", "Hola mundo"}
    ]),
    optional count as (type number meta [
        Documentation.FieldCaption = "Count",
        Documentation.FieldDescription = "Number of times to repeat the message",
        Documentation.AllowedValues = { 1, 2, 3 }
    ]))
    as table meta [
        Documentation.Name = "Hello - Name",
        Documentation.LongDescription = "Hello - Long Description",
        Documentation.Examples = {[
            Description = "Returns a table with 'Hello world' repeated 2 times",
            Code = "HelloWorldWithDocs.Contents(""Hello world"", 2)",
            Result = "#table({""Column1""}, {{""Hello world""}, {""Hello world""}})"
        ],[
            Description = "Another example, new message, new count!",
            Code = "HelloWorldWithDocs.Contents(""Goodbye"", 1)",
            Result = "#table({""Column1""}, {{""Goodbye""}})"
        ]}
    ];
```

### Functions with a Uri parameter

Because data sources with a Uri based identifier are so common, there's special handling in the Power Query UI when dealing with Uri based data source paths.
When a Uri-based data source is encountered, the credential dialog provides a drop-down allowing the user to select the base path, rather than the full path (and all paths in between).

![DataSourceUrl.](media/handling-authentication/credential-prompt-with-url.png)

As `Uri.Type` is an _ascribed type_ rather than a _primitive type_ in the M language, you'll need to use the [Value.ReplaceType](/powerquery-m/value-replacetype) function to indicate that your text parameter should be treated as a Uri.

```powerquery
shared GithubSample.Contents = Value.ReplaceType(Github.Contents, type function (url as Uri.Type) as any);
```

## Additional types of authentication

For information on additional types of authentication not covered in this article, such as Kerberos-based single sign-on, visit the [additional connector functionality](additional-connector-functionality.md) article to learn more.
