---
title: Error handling for Power Query connectors
description: Manage error handling for Power Query connectors
author: cpopell
manager: kfile
ms.reviewer: ''

ms.service: powerquery
ms.component: power-query
ms.topic: overview
ms.date: 08/10/2018
ms.author: gepopell

LocalizationGroup: reference
---

# Error Handling
Errors in Power Query generally halt query evaluation and display a message to the user.

## Throwing an Error with the `error` Expression
Throwing an error in Power Query is as simple as invoking the `error` expression:
```
let
    Source = "foo",
    Output = error "error message"
in
    Output
```

![](images/expressionError.png)

The [`Error.Record`](https://msdn.microsoft.com/en-us/query-bi/m/error-record) function can be used for more control:
```
let
    Source = "foo",
    Output = error Error.Record("error reason", "error message", "error detail")
in
    Output
```

![](images/expressionError2.png)

## Catching an Error with `try` and `otherwise`
The `try` expression converts values and errors into a record value that indicates whether the `try` expression handled an error or not, as well as the proper value or the error record.

If no error is found, the following record is returned from the `try` expression:
```
try "foo"
```
![](images/HasErrorFalse.png)

If an error is found, the following record is returned from the `try` expression:
```
try "foo"+1
```
![](images/HasErrorTrue.png)

The Error record contains Reason, Message, and Detail fields:

![](images/ErrorRecord.png)

Depending on the error, the Detail field may contain additional information.

The `otherwise` clause can be used with a `try` expression to perform some action in the event of an error:
```
try "foo"+1 otherwise "There was an error"
```
is a more compact form of:
```
result = try "foo"+1,
if result[HasError] then "There was an error" else result[Value]
``` 