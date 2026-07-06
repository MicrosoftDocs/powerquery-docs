---
title: Gateway Support for Power Query connectors
description: Handle gateway support in Power Query connectors effectively. Learn TestConnection requirements, function signatures, and practical examples for enabling scheduled data refresh.
author: ptyx507x
ms.topic: concept-article
ms.date: 07/01/2026
ms.author: miescobar
ms.subservice: custom-connectors
ms.custom: sfi-ropc-blocked
---

# Handling gateway support

## Test connection

Both Personal and Standard modes of the [on-premises data gateway](https://powerbi.microsoft.com/blog/on-premises-data-gateway-july-update-is-now-available/) support custom connectors.

Both gateway modes support **Import**. **Direct Query** is only supported in Standard mode. OAuth for custom connectors through gateways currently supports only gateway admins, not other data source users.

The method for implementing TestConnection functionality might change while the Power BI Custom Data Connector functionality is in preview.

To support scheduled refresh through the on-premises data gateway, your connector **must** implement a TestConnection handler.
The function is called when the user is configuring credentials for your source, and used to ensure they're valid.
The [Data Source Kind](HandlingDataAccess.md#data-source-kind) sets the TestConnection handler in  record. It has the following signature:

```
(dataSourcePath) as list => ...
```

Where `dataSourcePath` is the [Data Source Path](HandlingAuthentication.md#data-source-paths) value for your function, and the return value is a list composed of:

* The name of the function to call (this function must be marked as `#shared`, and is usually your primary data source function).
* One or more arguments to pass to your function.

If the invocation of the function results in an error, TestConnection fails, and the credential isn't persisted.

> [!Note]
> As stated earlier, the function name provided by TestConnection must be a `shared` member.

#### Example: Connector with no required arguments

The following code snippet implements TestConnection for a data source with no required parameters (such as the one found in the [TripPin tutorial](samples/trippin/readme.md)). Connectors with no required parameters (referred to as *Singletons*) don't need any user-provided input to test a connection (other than credentials). In this case, the `dataSourcePath` value is equal to the name of the Data Source Kind, and you can ignore it.

The `TripPin.Contents` function is invoked with no other parameters.

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

If your data source function has a single required parameter of the type `Uri.Type`, its `dataSourcePath` is equal to the URL provided by the user. The following snippet shows the TestConnection implementation from the [GitHub Sample](samples/github/readme.md).

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
then the `dataSourcePath` value is a JSON string containing the parameters. The following snippet
comes from the [DirectQueryForSQL](https://github.com/Microsoft/DataConnectors/tree/master/samples/DirectQueryForSQL) sample.

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
