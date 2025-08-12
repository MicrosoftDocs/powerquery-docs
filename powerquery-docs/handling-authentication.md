---
title: Handling authentication for Power Query connectors
description: Manage authentication for Power Query connectors
author: ptyx507x
ms.topic: conceptual
ms.date: 12/4/2024
ms.author: miescobar
ms.subservice: custom-connectors
ms.custom: sfi-ropc-blocked
---

# Handling authentication

## Authentication kinds

An extension can support one or more kinds of Authentication. Each authentication kind is a different type of credential. The authentication UI displayed to end users in Power Query is driven by the type of credential(s) that an extension supports.

The list of supported authentication types is defined as part of an extension's [Data Source Kind](handling-data-access.md#data-source-kind) definition. Each Authentication value is a record with specific fields. The following table lists the expected fields for each kind. All fields are required unless marked otherwise.

| Authentication Kind | Field         | Description                                                                                                                                                    |
| :------------------ | :------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Anonymous           |               | The Anonymous (also called `Implicit`) authentication kind doesn't have any fields.                                                                                         |
| OAuth               | StartLogin    | Function that provides the URL and state information for starting an OAuth flow.<br/></br>Go to the [Implementing an OAuth Flow](#implementing-an-oauth-flow) section. |
|                     | FinishLogin   | Function that extracts the access_token and other properties related to the OAuth flow.                                                                        |
|                     | Refresh       | **(optional)** Function that retrieves a new access token from a refresh token.                                                                                |
|                     | Logout        | **(optional)** Function that invalidates the user's current access token.                                                                                      |
|                     | Label         | **(optional)** A text value that allows you to override the default label for this AuthenticationKind.                                                         |
| Aad                 | AuthorizationUri | `text` value or unary function that returns the Microsoft Entra ID authorization endpoint (example: `"https://login.microsoftonline.com/common/oauth2/authorize"`).<br/></br>Go to the [Microsoft Entra ID authentication](#microsoft-entra-id-authentication) section. |
|                     | Resource         | `text` value or unary function that returns the Microsoft Entra ID resource value for your service.                                                                              |
|                     | Scope         | **(optional)** `text` value or unary function that returns the list of scope(s) to request as part of the authentication flow. Multiple scope values should be separated by a space. The scope value should be the scope name, without an Application ID URI (example: `Data.Read`). When not provided, the `user_impersonation` scope is requested. |
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

```powerquery-m
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

The current credentials can be retrieved using the `Extension.CurrentCredential` function.

M data source functions that have been enabled for extensibility automatically inherit your extension's credential scope. In most cases, you don't need to explicitly access the current credentials, however, there are exceptions, such as:

- Passing in the credential in a custom header or query string parameter (such as when you're using the API Key auth type).
- Setting connection string properties for ODBC or ADO.NET extensions.
- Checking custom properties on an OAuth token.
- Using the credentials as part of an OAuth v1 flow.

The `Extension.CurrentCredential` function returns a record object. The fields it contains are authentication type specific. The following table contains details.

| Field              | Description                                                                                                                                                                                                                                                                                                                                         | Used By                        |
| :----------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------- |
| AuthenticationKind | Contains the name of the authentication kind assigned to this credential (UsernamePassword, OAuth, and so on).                                                                                                                                                                                                                                      | All                            |
| Username           | Username value                                                                                                                                                                                                                                                                                                                                      | UsernamePassword, Windows      |
| Password           | Password value. Typically used with UsernamePassword, but it's also set for Key.                                                                                                                                                                                                                                                                   | Key, UsernamePassword, Windows |
| access_token       | OAuth access token value.                                                                                                                                                                                                                                                                                                                           | OAuth                          |
| Properties         | A record containing other custom properties for a given credential. Typically used with OAuth to store other properties (such as the refresh_token) returned with the access_token during the authentication flow.                                                                                                                             | OAuth                          |
| Key                | The API key value. Note, the key value is also available in the Password field as well. By default, the mashup engine inserts this key in an Authorization header as if this value were a basic auth password (with no username). If this type of behavior isn't what you want, you must specify the ManualCredentials = true option in the options record. | Key                            |
| EncryptConnection  | A logical value that determined whether to require an encrypted connection to the data source. This value is available for all Authentication Kinds, but is only set if EncryptConnection is specified in the [Data Source](handling-data-access.md#data-source-kind) definition.                                                                | All                            |

The following code sample accesses the current credential for an API key and uses it to populate a custom header (`x-APIKey`).

**Example:**

```powerquery-m
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
To do this, an extension provides functions for `StartLogin` (returning the authorization URI to initiate the OAuth flow) and `FinishLogin` (exchanging the authorization code for an access token). Extensions can optionally implement `Refresh` (exchanging a refresh token for a new access token) and `Logout` (expiring the current refresh and access tokens) functions as well.

> [!NOTE]
> Power Query extensions are evaluated in applications running on client machines. Data Connectors _should not_ use confidential secrets in their OAuth flows, as users may inspect the extension or network traffic to learn the secret. Go to [Proof Key for Code Exchange by OAuth Public Clients RFC](https://tools.ietf.org/html/rfc7636) (also known as PKCE) for further details on providing flows that don't rely on shared secrets. A [sample](https://github.com/microsoft/DataConnectors/blob/master/samples/OAuthPKCE/PKCESample.pq) implementation of this flow can be found on our GitHub site.

There are two sets of OAuth function signatures: the original signature that contains a minimal number of parameters, and an advanced signature that accepts more parameters. Most OAuth flows can be implemented using the original signatures. You can also mix and match signature types in your implementation. The function calls are matches based on the number of parameters (and their types). The parameter names aren't taken into consideration.

Go to the [GitHub sample](samples/github/readme.md) for more details.

### Original OAuth signatures

```powerquery-m
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

```powerquery-m
StartLogin = (clientApplication, dataSourcePath, state, display) => ...;

FinishLogin = (clientApplication, dataSourcePath, context, callbackUri, state) => ...;

Refresh = (clientApplication, dataSourcePath, oldCredential) =>  ...;

Logout = (clientApplication, dataSourcePath, accessToken) => ...;
```

### Microsoft Entra ID authentication

The `Aad` authentication kind is a specialized version of OAuth for Microsoft Entra ID. It uses the same Microsoft Entra ID client as the built-in Power Query connectors that support organizational account authentication. More information can be found in the [Configuring Microsoft Entra for a custom connector](configure-microsoft-entra-for-connector.md) quickstart guide.

> [!NOTE]
> If you implement your own OAuth flow for Microsoft Entra ID, users who have enabled [Conditional Access](/azure/active-directory/conditional-access/overview) for their tenant might encounter issues when refreshing using the Power BI service. This won't impact gateway-based refresh, but would impact a certified connector that supports refresh from the Power BI service. Users might run into a problem stemming from the connector using a [public client application](/azure/active-directory/develop/msal-client-applications) when configuring web-based credentials through the Power BI service. The access token generated by this flow will ultimately be used on a different computer (that is, the Power BI service in an Azure data center, not on the company's network) than the one used to originally authenticate (that is, the computer of the user who configures the data source credentials on the company's network). The built-in `Aad` type works around this problem by using a different Microsoft Entra ID client when configuring credentials in the Power BI service. This option won't be available to connectors that use the `OAuth` authentication kind.

Most connectors need to provide values for the `AuthorizationUri` and `Resource` fields. Both fields can be `text` values, or a single argument function that returns a `text value`.

```powerquery-m
AuthorizationUri = "https://login.microsoftonline.com/common/oauth2/authorize"
```

```powerquery-m
AuthorizationUri = (dataSourcePath) => FunctionThatDeterminesAadEndpointFromDataSourcePath(dataSourcePath)
```

```powerquery-m
Resource = "44445555-eeee-6666-ffff-7777aaaa8888"   // Microsoft Entra ID resource value for your service - Guid or URL
```

```powerquery-m
Resource = (dataSourcePath) => FunctionThatDeterminesResourceFromDataSourcePath(dataSourcePath)
```

Connectors that use a [Uri based identifier](handling-resource-path.md#functions-with-a-uri-parameter) don't need to provide a `Resource` value. By default, the value is equal to the root path of the connector's Uri parameter.
If the data source's Microsoft Entra ID resource is different than the domain value (for example, it uses a GUID), then a `Resource` value needs to be provided.

#### Aad authentication kind samples

In the following case, the data source supports global cloud Microsoft Entra ID using the common tenant (no Azure B2B support).
Requesting the [.default scope](/entra/identity-platform/scopes-oidc#the-default-scope) returns a token with all previously authorized scopes for the Power Query client application ID.

```powerquery-m
Authentication = [
    Aad = [
        AuthorizationUri = "https://login.microsoftonline.com/common/oauth2/authorize",
        Resource = "44445555-eeee-6666-ffff-7777aaaa8888", // Entra Application ID URI or app guid
        Scope = ".default"
    ]
]
```

In the following case, the data source supports tenant discovery based on OpenID Connect (OIDC) or similar protocol. This ability allows the connector to determine the correct Microsoft Entra ID endpoint to use based on one or more parameters in the data source path. This dynamic discovery approach allows the connector to support Azure B2B.

```powerquery-m

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
        Resource = "https://myAadResourceValue.com", // Microsoft Entra ID resource value for your service - Guid or URL
        Scope = ".default"
    ]
]

```

## Other types of authentication

For information on other types of authentication not covered in this article, such as Kerberos-based single sign-on, visit the [additional connector functionality](additional-connector-functionality.md) article to learn more.
