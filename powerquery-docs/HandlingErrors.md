---
title: Error handling for Power Query connectors
description: Manage error handling for Power Query connectors
author: cpopell


ms.topic: conceptual
ms.date: 2/28/2022
ms.author: dougklo

LocalizationGroup: reference
---

# Handling errors
Errors in Power Query generally halt query evaluation and display a message to the user.

## Throwing an error with the `error` expression
Throwing an error in Power Query is as simple as invoking the `error` expression.
```
let
    Source = "foo",
    Output = error "error message"
in
    Output
```

![An example of an Expression.Error error message.](images/expressionError.png)

The [`Error.Record`](/powerquery-m/error-record) function can be used for more control.
```
let
    Source = "foo",
    Output = error Error.Record("error reason", "error message", "error detail")
in
    Output
```

![An example of an Expression.Error error message with more details.](images/expressionError2.png)

## Catching an error with `try` and `otherwise`
The `try` expression converts values and errors into a record value that indicates whether the `try` expression handled an error or not, as well as the proper value of the error record.

If no error is found, the following record is returned from the `try` expression:
```
try "foo"
```
![HasError false with value.](images/HasErrorFalse.png)

If an error is found, the following record is returned from the `try` expression:
```
try "foo"+1
```
![HasError true with error record.](images/HasErrorTrue.png)

The Error record contains **Reason**, **Message**, and **Detail** fields.

![Content of error record.](images/ErrorRecord.png)

Depending on the error, the **Detail** field may contain additional information.

The `otherwise` clause can be used with a `try` expression to perform some action if an error occurs:
```
try "foo"+1 otherwise "There was an error"
```
is a more compact form of:
```
result = try "foo"+1,
if result[HasError] then "There was an error" else result[Value]
``` 
