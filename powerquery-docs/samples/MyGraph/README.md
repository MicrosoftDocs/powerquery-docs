---
title: Microsoft Graph tutorial for Power Query
description: Writing a Microsoft Graph connector for Power Query including OAuth
author: cpopell
manager: kfile

ms.service: powerquery
ms.topic: tutorial
ms.date: 12/09/2019
ms.author: gepopell

LocalizationGroup: reference
---

# MyGraph Connector Sample
In this sample you'll create a basic data source connector for [Microsoft Graph](https://graph.microsoft.io/en-us/). It is written as a walk-through that you can follow step by step.

To access Graph, you'll first need to register your own Azure Active Directory (AAD) client application. If you don't have an application ID already, you can create one through the [Getting Started with Microsoft Graph](https://graph.microsoft.io/en-us/getting-started) site.
Select the **Universal Windows** option, and then the **Let's go** button. Follow the steps and receive an App ID. As described in the steps below, use `https://oauth.powerbi.com/views/oauthredirect.html` as your redirect URI when registering your app. 
Use the Client ID value to replace the existing value in the `client_id` file in the code sample.

## Writing an OAuth v2 Flow with Power BI Desktop
There are three parts to implementing your OAuth Flow:
* Create the URL for the Authorization endpoint
* Post a code to the Token endpoint and extract the auth and refresh tokens
* Trade a refresh token for a new auth token 

You'll use Power Query (through Power BI Desktop) to write the M code for the Graph OAuth flow.

First, review details about how the OAuth v2 flow works for Graph:
* [Microsoft Graph App authentication using Azure AD](https://graph.microsoft.io/en-us/docs/authorization/app_authorization)
* [Authentication Code Grant Flow](https://docs.microsoft.com/azure/active-directory/active-directory-protocols-oauth-code)
* [Permission scopes](https://graph.microsoft.io/en-us/docs/authorization/permission_scopes)

You'll also want to download and install [Fiddler](https://www.telerik.com/fiddler) to help trace the raw HTTP requests you make while developing the extension.

To get started, create a new blank query in Power BI Desktop and bring up the advanced query editor. 

Define the following variables that will be used in your OAuth flow:

```
let
    client_id = "<your app id>",
    redirect_uri = "https://oauth.powerbi.com/views/oauthredirect.html",
    token_uri = "https://login.microsoftonline.com/common/oauth2/v2.0/token",
    authorize_uri = "https://login.microsoftonline.com/common/oauth2/v2.0/authorize",
    logout_uri = "https://login.microsoftonline.com/logout.srf"
in
    logout_uri
```

Set the `client_id` with the app id you received when you registered your Graph application.

Graph has an extensive list of permission scopes that your application can request. For this sample, the app will request all scopes that do not require admin consent. You'll define two more variables&mdash;a list of the scopes you want, and the prefix string that graph uses. You'll also add a couple of helper functions to convert the scope list into the expected format.

```
// The "offline_access" scope is required to receive a refresh token value. It is added
// separately from the Graph scopes. Please see
// https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-permissions-and-consent#offline_access
//
// For more information on available Graph scopes, please see 
// https://developer.microsoft.com/en-us/graph/docs/authorization/permission_scopes 
scope_prefix = "https://graph.microsoft.com/",
scopes = {
    "User.ReadWrite",
    "Contacts.Read",
    "User.ReadBasic.All",
    "Calendars.ReadWrite",
    "Mail.ReadWrite",
    "Mail.Send",
    "Contacts.ReadWrite",
    "Files.ReadWrite",
    "Tasks.ReadWrite",
    "People.Read",
    "Notes.ReadWrite.All",
    "Sites.Read.All"
},
Value.IfNull = (a, b) => if a <> null then a else b,

GetScopeString = (scopes as list, optional scopePrefix as text) as text =>
    let
        prefix = Value.IfNull(scopePrefix, ""),
        addPrefix = List.Transform(scopes, each prefix & _),
        asText = Text.Combine(addPrefix, " ")
    in
        asText,
```

The `GetScopeString` function will end up generating a scope string that looks like this:
`https://graph.microsoft.com/User.ReadWrite https://graph.microsoft.com/Contacts.Read https://graph.microsoft.com/User.ReadBasic.All ...`

You'll need to set [several query string parameters](https://docs.microsoft.com/azure/active-directory/active-directory-protocols-oauth-code) as part of the authorization URL. You can use the `Uri.BuildQueryString` function to properly encode the parameter names and values. Construct the URL by concatenating the `authorize_uri` variable and query string parameters.

The full code sample is below. 

```
let
    client_id = "<your app id>",
    redirect_uri = "urn:ietf:wg:oauth:2.0:oob",
    token_uri = "https://login.microsoftonline.com/common/oauth2/v2.0/token",
    authorize_uri = "https://login.microsoftonline.com/common/oauth2/v2.0/authorize",
    logout_uri = "https://login.microsoftonline.com/logout.srf",

    scope_prefix = "https://graph.microsoft.com/",
    scopes = {
        "User.ReadWrite",
        "Contacts.Read",
        "User.ReadBasic.All",
        "Calendars.ReadWrite",
        "Mail.ReadWrite",
        "Mail.Send",
        "Contacts.ReadWrite",
        "Files.ReadWrite",
        "Tasks.ReadWrite",
        "People.Read",
        "Notes.ReadWrite.All",
        "Sites.Read.All"
    },

    Value.IfNull = (a, b) => if a <> null then a else b,

    GetScopeString = (scopes as list, optional scopePrefix as text) as text =>
        let
            prefix = Value.IfNull(scopePrefix, ""),
            addPrefix = List.Transform(scopes, each prefix & _),
            asText = Text.Combine(addPrefix, " ")
        in
            asText,

    authorizeUrl = authorize_uri & "?" & Uri.BuildQueryString([
        client_id = client_id,  
        redirect_uri = redirect_uri,      
        scope = GetScopeString(scopes, scope_prefix),
        response_type = "code",
        response_mode = "query",
        login = "login"    
    ])
in
    authorizeUrl
```

Close the Advanced Query Editor to see the generated authorization URL. 

![authorizeUrl value in Power BI Desktop](../../images/graph1.png)

Launch [Fiddler](https://www.telerik.com/fiddler), and copy and paste the URL into the browser of your choice. 

>[!Note]
> You'll need to configure Fiddler to decrypt HTTPS traffic and skip decryption for the following hosts: `msft.sts.microsoft.com`.

Entering the URL should bring up the standard Azure Active Directory login page. Complete the auth flow using your regular credentials, and then look at the fiddler trace.
You'll be interested in the lines with a status of 302 and a host value of login.microsoftonline.com. 

![Fiddler trace of AAD auth flow](../../images/graph2.png)

Select the request to `/login.srf` and view the Headers of the Response.
Under Transport, you'll find a location header with the `redirect_uri` value you specified in your code, and a query string containing a very long code value.
Extract the code value only, and paste it into your M query as a new variable.
Note, the header value will also contain a `&session_state=xxxx` query string value at the end&mdash;remove this part from the code.
Also, be sure to include double quotes around the value after you paste it into the advanced query editor. 

To exchange the code for an auth token, you'll need to create a POST request to the token endpoint.
You can do this using the `Web.Contents` call, and use the `Uri.BuildQueryString` function to format your input parameters.
The code will look like this:

```
tokenResponse = Web.Contents(token_uri, [
    Content = Text.ToBinary(Uri.BuildQueryString([
        client_id = client_id,
        code = code,
        scope = GetScopeString(scopes, scope_prefix),
        grant_type = "authorization_code",
        redirect_uri = redirect_uri])),
    Headers = [
        #"Content-type" = "application/x-www-form-urlencoded",
        #"Accept" = "application/json"
    ]
]),

jsonResponse = Json.Document(tokenResponse)
```

When you return the `jsonResponse`, Power Query will likely prompt you for credentials. Choose **Anonymous**, and select **OK**. 

![Authentication prompt](../../images/graph3.png)

The authentication code returned by AAD has a short timeout&mdash;probably shorter than the time it took you to do the previous steps.
If your code has expired, you'll see a response like this:

![Error for expired code](../../images/graph4.png)

If you check the fiddler trace, you'll see a more detailed error message in the JSON body of the response related to timeout.
Later in this sample you'll update your code so that end users will be able to see the detailed error messages instead of the generic 400 Bad Request error.
Try the authentication process again (you'll likely want your browser to be In Private mode to avoid any stored auth information).
Capture the `Location` header, and update your M query with the new code value.
Run the query again, and you should see a parsed record containing an `access_token` value. 

![access_token example](../../images/graph5.png)

You now have the raw code you'll need to implement your OAuth flow. 
As an optional step, you can improve the error handling of your OAuth code by using the `ManualStatusHandling` option to `Web.Contents`.
This will let you process the body of an error response (which is a JSON document with [error] and [error_description] fields),
rather than displaying a `DataSource.Error` to the user. The updated code looks like this:

```
tokenResponse = Web.Contents(token_uri, [
    Content = Text.ToBinary(Uri.BuildQueryString([
        client_id = client_id,
        code = code,
        scope = GetScopeString(scopes, scope_prefix),
        grant_type = "authorization_code",
        redirect_uri = redirect_uri])),
    Headers = [
        #"Content-type" = "application/x-www-form-urlencoded",
        #"Accept" = "application/json"
    ],
    ManualStatusHandling = {400} 
]),
body = Json.Document(tokenResponse),
result = if (Record.HasFields(body, {"error", "error_description"})) then 
            error Error.Record(body[error], body[error_description], body)
         else
            body
```

Run your query again and you'll receive an error (because your code was already exchanged for an auth token). This time you should see the full detailed error message from the service, rather than a generic 400 status code.

![Improved error messages](../../images/graph6.png)

## Creating Your Graph Connector
Take a copy of the code contained within this sample, and open the MyGraph.mproj project file in Visual Studio. Update the `client_id` file with the AAD client_id you received when you registered your own app.
You'll likely notice that the code is very similar to the OAuth sample code above, with some key differences that will be described below. There are also slight formatting differences due to the code being within a section document (rather than query expression). 

Another difference is the `MyGraph.Feed` function. This will be the data source function You'll expose to the engine. You'll be adding your logic to access and read Graph data in here. You've associated the function with the `MyGraph` Data Source Kind, and exposed it in the UI using the MyGraph.UI record (`[DataSource.Kind="MyGraph", Publish="MyGraph.UI"]`). 

Since your data source function has no required arguments, it acts as a `Singleton` data source credential type.
This means that a user will have a single credential for the data source, and that the credential isn't dependent on any of the parameters supplied to the function. 

In the following sample, you declare that `OAuth` is one of your supported credential types and provide function names for the OAuth interface functions. 

```
[DataSource.Kind="MyGraph", Publish="MyGraph.UI"]
MyGraph.Feed = () =>
    let
        source = OData.Feed("https://graph.microsoft.com/v1.0/me/", null, [ ODataVersion = 4, MoreColumns = true ])
    in
        source;

//
// Data Source definition
//
MyGraph = [
    Authentication = [
        OAuth = [
            StartLogin=StartLogin,
            FinishLogin=FinishLogin,
            Refresh=Refresh,
            Logout=Logout
        ]
    ],
    Label = "My Graph Connector"
];

//
// UI Export definition
//
MyGraph.UI = [
    Beta = true,
    ButtonText = { "MyGraph.Feed", "Connect to Graph" },
    SourceImage = MyGraph.Icons,
    SourceTypeImage = MyGraph.Icons
];
```

## Implementing the OAuth Interface
The code that you wrote to test out the Graph OAuth flow in Power BI Desktop won't work in the connector as-is, but at least you've proven that it works (which is generally the trickiest part).
Now you'll reformat the code to fill in the four functions expected by the M Engine's OAuth interface:

* StartLogin
* FinishLogin
* Refresh
* Logout

### StartLogin
The first function you'll implement is `StartLogin`.
This function will create the Authorization URL that will be sent to users to initiate their 
OAuth flow. The function signature must look like this:
```
StartLogin = (resourceUrl, state, display) as record
```
This function is expected to return a record with all the fields that Power BI will need to initiate an OAuth flow.

Since your data source function has no required parameters, you won't be making use of the `resourceUrl` value. If your data source function required a user supplied URL or sub-domain name, then this is where it would be passed to you.
The `State` parameter includes a blob of state information that you're expected to include in the URL.
You won't need to use the `display` value at all.
The body of the function will look a lot like the `authorizeUrl` variable you created earlier in this sample&mdash;the main difference will be the inclusion of the `state` parameter (which is used to prevent [replay attacks](https://docs.microsoft.com/azure/active-directory/develop/active-directory-v2-protocols-oauth-code)).

```
StartLogin = (resourceUrl, state, display) =>
    let
        authorizeUrl = authorize_uri & "?" & Uri.BuildQueryString([
            client_id = client_id,  
            redirect_uri = redirect_uri,
            state = state,
            scope = "offline_access " & GetScopeString(scopes, scope_prefix),
            response_type = "code",
            response_mode = "query",
            login = "login"    
        ])
    in
        [
            LoginUri = authorizeUrl,
            CallbackUri = redirect_uri,
            WindowHeight = 720,
            WindowWidth = 1024,
            Context = null
        ];
```

### FinishLogin
The `FinishLogin` function will be called once the user has completed their OAuth flow. Its signature looks like this:
```
FinishLogin = (context, callbackUri, state) as record
```

The `context` parameter will contain any value set in the Context field of the record returned by `StartLogin`.
Typically, this will be a tenant ID or other identifier that was extracted from the original resource URL.
The `callbackUri` parameter contains the redirect value in the `Location` header, which you'll parse to extract the code value.
The third parameter (`state`) can be used to round-trip state information to the service&mdash;you won't need to use it for AAD. 

Use the `Uri.Parts` function to break apart the `callbackUri` value. For the AAD auth flow, all you'll care about is the code parameter in the query string. 

```
FinishLogin = (context, callbackUri, state) =>
    let
        parts = Uri.Parts(callbackUri)[Query],
        result = if (Record.HasFields(parts, {"error", "error_description"})) then 
                    error Error.Record(parts[error], parts[error_description], parts)
                 else
                    TokenMethod("authorization_code", "code", parts[code])
    in
        result;
```

If the response doesn't contain `error` fields, pass the `code` query string parameter from the `Location` header to the `TokenMethod` function.

The `TokenMethod` function converts the `code` to an `access_token`. It's not a direct part of the OAuth interface, but it provides all the heavy lifting for the `FinishLogin` and `Refresh` functions. Its implementation is essentially the tokenResponse logic you created earlier with one small addition&mdash;you'll use a `grantType` variable rather than hardcoding the value to "authorization_code".

```
TokenMethod = (grantType, tokenField, code) =>
    let
        queryString = [
            client_id = client_id,
            scope = "offline_access " & GetScopeString(scopes, scope_prefix),
            grant_type = grantType,
            redirect_uri = redirect_uri
        ],
        queryWithCode = Record.AddField(queryString, tokenField, code),

        tokenResponse = Web.Contents(token_uri, [
            Content = Text.ToBinary(Uri.BuildQueryString(queryWithCode)),
            Headers = [
                #"Content-type" = "application/x-www-form-urlencoded",
                #"Accept" = "application/json"
            ],
            ManualStatusHandling = {400} 
        ]),
        body = Json.Document(tokenResponse),
        result = if (Record.HasFields(body, {"error", "error_description"})) then 
                    error Error.Record(body[error], body[error_description], body)
                 else
                    body
    in
        result;
```

### Refresh
This function is called when the `access_token` expires&mdash;Power Query will use the `refresh_token` to retrieve a new `access_token`. The implementation here is just a call to `TokenMethod`, passing in the refresh token value rather than the code.

```
Refresh = (resourceUrl, refresh_token) => TokenMethod("refresh_token", "refresh_token", refresh_token);
```

### Logout
The last function you need to implement is Logout. The logout implementation for AAD is very simple&mdash;you just return a fixed URL. 

```
Logout = (token) => logout_uri;
```

## Testing the Data Source Function
`MyGraph.Feed` contains your actual data source function logic. Since Graph is an OData v4 service, you can leverage the built-in OData.Feed function to do all the hard work for you (including query folding and generating a navigation table!).

```
[DataSource.Kind="MyGraph", Publish="MyGraph.UI"]
MyGraph.Feed = () =>
    let
        source = OData.Feed("https://graph.microsoft.com/v1.0/me/", null, [ ODataVersion = 4, MoreColumns = true ])
    in
        source;
```

Once your function is updated, make sure there are no syntax errors in your code (look for red squiggles). Also be sure to update your `client_id` file with your own AAD app ID. If there are no errors, open the MyGraph.query.m file. 

The `<project>.query.m` file lets you test out your extension. You (currently) don’t get the same navigation table / query building experience you get in Power BI Desktop, but this does provide a quick way to test out your code. 

A query to test your data source function would be:

```
MyGraph.Feed()
```

Select the **Start (Debug)** button to execute the query.

Since this is the first time you are accessing your new data source, you'll receive a credential prompt.

![Credential prompt in visual studio](../../images/graph7.png)

Select OAuth2 from the Credential Type drop down, and then select **Login**. This will popup your OAuth flow. After completing your flow, you should see a large blob (your token). Select the **Set Credential** button at the bottom of the dialog, and close the MQuery Output window.

![Setting credentials](../../images/graph8.png)

Run the query again. This time you should get a spinning progress dialog, and a query result window.

![Graph query results](../../images/graph9.png)

You can now build your project in Visual Studio to create a compiled extension file, and deploy it to your Custom Connectors directory. Your new data source should now appear in the **Get Data** dialog the next time you launch Power BI Desktop. 
