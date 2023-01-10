---
title: Gateway Support for Power Query connectors
description: Manage gateway support for Power Query connectors, including test connection
author: ptyx507x
ms.topic: conceptual
ms.date: 1/9/2023
ms.author: miescobar
---

# Handling Gateway Support

## Test Connection

> Custom Connector support is available in both Personal and Standard modes of the [on-premises data gateway](https://powerbi.microsoft.com/blog/on-premises-data-gateway-july-update-is-now-available/).
> Both gateway modes support **Import**. **Direct Query** is only supported in Standard mode. OAuth for custom connectors via gateways is currently supported only for gateway admins but not other data source users.

> The method for implementing TestConnection functionality is likely to change while the Power BI Custom Data Connector functionality is in preview.

To support scheduled refresh through the on-premises data gateway, your connector **must** implement a TestConnection handler.
The function is called when the user is configuring credentials for your source, and used to ensure they are valid.
The TestConnection handler is set in the [Data Source Kind](HandlingDataAccess.md#data-source-kind) record, and has the following signature:

```
(dataSourcePath) as list => ...
```

Where `dataSourcePath` is the [Data Source Path](HandlingAuthentication.md#data-source-paths) value for your function, and the return value is a list composed of:

* The name of the function to call (this function must be marked as `#shared`, and is usually your primary data source function).
* One or more arguments to pass to your function.

If the invocation of the function results in an error, TestConnection is considered to have failed, and the credential won't be persisted.

>[!Note]
> As stated above, the function name provided by TestConnection must be a `shared` member.

#### Example: Connector with no required arguments

The code snippet below implements TestConnection for a data source with no required parameters (such as the one found in the [TripPin tutorial](samples/trippin/readme.md)). Connectors with no required parameters (referred to as 'Singletons') do not need any user provided input to test a connection (other than credentials). In this case, the `dataSourcePath` value would be equal to the name of the Data Source Kind, and can be ignored.
The `TripPin.Contents` function is invoked with no additional parameters.

```powerquery-m
TripPin = [
    TestConnection = (dataSourcePath) => { "TripPin.Contents" },
    Authentication = [
        Anonymous = []
    ],
    Label = "TripPin"
];
```

#### Example: Connector with a URL parameter

If your data source function has a single required parameter of the type `Uri.Type`, its `dataSourcePath` will be equal to the URL provided by the user. The snippet below shows the TestConnection implementation from the [Github Sample](samples/github/readme.md).

```powerquery-m
GithubSample = [
    TestConnection = (dataSourcePath) => {"GithubSample.Contents", dataSourcePath},
    Authentication = [
        OAuth = [
            StartLogin = StartLogin,
            FinishLogin = FinishLogin,
            Label = Extension.LoadString("AuthenticationLabel")
        ]
    ]
];
```

#### Example: Connector with required parameters

If your data source function has multiple parameters, or a single non-URL parameter,
then the `dataSourcePath` value will be a JSON string containing the parameters. The snippet
below comes from the [DirectQueryForSQL](https://github.com/Microsoft/DataConnectors/tree/master/samples/DirectQueryForSQL) sample.

```powerquery-m
DirectSQL = [
    TestConnection = (dataSourcePath) =>
        let
            json = Json.Document(dataSourcePath),
            server = json[server],
            database = json[database]
        in
            { "DirectSQL.Database", server, database },
    Authentication = [
        Windows = [],
        UsernamePassword = []
    ],
    Label = "Direct Query for SQL"
];
```
