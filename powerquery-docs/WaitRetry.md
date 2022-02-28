---
title: Using the wait-retry pattern in Power Query connectors
description: Use the wait-retry pattern for Power Query connectors
author: cpopell


ms.topic: conceptual
ms.date: 12/12/2019
ms.author: dougklo

LocalizationGroup: reference
---

# Wait-Retry Pattern

In some situations a data source's behavior does not match that expected by Power Query's [default HTTP code handling](HandlingStatusCodes.md). The examples below show how to work around this situation.

In this scenario you'll be working with a REST API that occassionally returns a 500 status code, indicating an internal server error. In these instances, you could wait a few seconds and retry, potentially a few times before you give up.

## ManualStatusHandling
If `Web.Contents` gets a 500 status code response, it throws a `DataSource.Error` by default. You can override this behavior by providing a list of codes as an optional argument to `Web.Contents`:

```
response = Web.Contents(url, [ManualStatusHandling={404, 500}])
``` 

By specifying the status codes in this way, Power Query will continue to process the web response as normal. However, normal response processing is often not appropriate in these cases. You'll need to understand that an abnormal response code has been received and perform special logic to handle it. To determine the response code that was returned from the web service, you can access it from the `meta` Record that accompanies the response:

```
responseCode = Value.Metadata(response)[Response.Status]
```

Based on whether `responseCode ` is 200 or 500, you can either process the result as normal, or follow your wait-retry logic that you'll flesh out in the next section.

>[!Note] 
> We recommended that you use `Binary.Buffer` to force Power Query to cache the `Web.Contents` results if you'll be implementing complex logic such as the Wait-Retry pattern shown here. This prevents Power Query's multi-threaded execution from making multiple calls with potentially inconsistent results.

## Value.WaitFor
`Value.WaitFor()` is a standard [helper function](HelperFunctions.md) that can usually be used with no modification. It works by building a List of retry attempts.

### `producer` Argument
This contains the task to be (possibly) retried. It's represented as a function so that the iteration number can be used in the `producer` logic. The expected behavior is that `producer` will return `null` if a retry is determined to be necessary. If anything other than `null` is returned by `producer`, that value is in turn returned by `Value.WaitFor`.

### `delay` Argument
This contains the logic to execute between retries. It's represented as a function so that the iteration number can be used in the `delay` logic. The expected behavior is that `delay` returns a Duration.

### `count` Argument (optional)
A maximum number of retries can be set by providing a number to the `count` argument.

## Putting It All Together
The following example shows how `ManualStatusHandling` and `Value.WaitFor` can be used to implement a delayed retry in the event of a 500 response. Wait time between retries here is shown as doubling with each try, with a maximum of 5 retries.
```
let
    waitForResult = Value.WaitFor(
        (iteration) =>
            let
                result = Web.Contents(url, [ManualStatusHandling = {500}]), 
                buffered = Binary.Buffer(result),
                status = Value.Metadata(result)[Response.Status],
                actualResult = if status = 500 then null else buffered
            in
                actualResult,
        (iteration) => #duration(0, 0, 0, Number.Power(2, iteration)),
        5)
in
    waitForResult,
```
