---
title: Gateway Support for Power Query connectors
description: Manage gateway support for Power Query connectors, including test connection
author: cpopell
manager: kfile
ms.reviewer: ''

ms.service: powerquery
ms.component: power-query
ms.topic: overview
ms.date: 08/10/2018
ms.author: gepopell

LocalizationGroup: reference

# Handling Gateway Support

## Test Connection

> Custom Connector support is now available in both Personal and Enterprise modes of the [On-Premises Data Gateway](https://powerbi.microsoft.com/en-us/blog/on-premises-data-gateway-july-update-is-now-available/).
> Both gateway modes support **Import** - **Direct Query** support in the Enterprise mode is targeted at an upcoming release.

> The method for implementing TestConnection functionality is likely to change prior while the Power BI Custom Data Connector functionality is in preview.

To support scheduled refresh through the on-premises data gateway, your connector **must** implement a TestConnection handler.
The function is called when the user is configuring credentials for your source, and used to ensure they are valid.
The TestConnection handler is set in the [Data Source Kind](#data-source-kind) record, and has the following signature:

```
(dataSourcePath) as list => ...
```

Where `dataSourcePath` is the [Data Source Path](#data-source-paths) value for your function, and the return value is a list composed of:

1. The name of the function to call (this function must be marked as `#shared`, and is usually your primary data source function)
2. One or more arguments to pass to your function

If the invocation of the function results in an error, TestConnection is considered to have failed, and the credential will not be persisted.

> **Note:** As stated above, the function name provided by TestConnection must be a `shared` member.

#### Example: Connector with no required arguments

The code snippet below implements TestConnection for a data source with no required parameters (such as the one found in the [TripPin tutorial](~/../samples/TripPin/README.md)).
Connectors with no required parameters (referred to as 'Singletons') do not need any user provided input to test a connection (other than credentials).
In this case, the `dataSourcePath` value would be equal to the name of the Data Source Kind, and can be ignored.
The `TripPin.Contents` function is invoked with no additional parameters.

```
TripPin = [
    TestConnection = (dataSourcePath) => { "TripPin.Contents" },
    Authentication = [
        Anonymous = []
    ],
    Label = "TripPin"
];
```

#### Example: Connector with a URL parameter

If your data source function has a single required parameter of the type `Uri.Type`, its `dataSourcePath` will be equal to the URL provided by the user. The snippet below 
shows the TestConnection implementation from the [Github Sample](~/../samples/Github/README.md).

```
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
then the `dataSourcePath` value will be a json string containing the parameters. The snippet
below comes from the [DirectQueryForSQL](~/../samples/DirectQueryForSQL/README.md) sample. 

```
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
