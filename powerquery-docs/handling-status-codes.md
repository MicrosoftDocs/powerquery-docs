---
title: Handling status codes with Web.Contents for Power Query connectors
description: Manage status codes with Web.Contents for Power Query connectors
author: ptyx507x
ms.topic: concept-article
ms.date: 10/16/2022
ms.author: miescobar
ms.subservice: custom-connectors
---

# Status Code Handling with `Web.Contents`

The [`Web.Contents`](/powerquery-m/web-contents) function has some built-in functionality for dealing with certain HTTP status codes. The default behavior can be overridden in your extension using the `ManualStatusHandling` field in the [options record](/powerquery-m/web-contents#__toc360793395).

## Automatic retry

[`Web.Contents`](/powerquery-m/web-contents) will automatically retry requests that fail with one of the following status codes:

| Code | Status                     |
|:-----|:---------------------------|
| 408  | Request Timeout            |
| 429  | Too Many Requests          |
| 503  | Service Unavailable        |
| 504  | Gateway Timeout            |
| 509  | Bandwidth Limit Exceeded   |

Requests will be retried up to three times before failing. The engine uses an exponential back-off algorithm to determine how long to wait until the next retry, unless the response contains a [`Retry-after`](https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.37) header. When the header is found, the engine will wait the specified number of seconds before the next retry. The minimum supported wait time is 0.5 seconds, and the maximum value is 120 seconds.

>[!Note]
> The `Retry-after` value must be in the `delta-seconds` format. The `HTTP-date` format is currently not supported. 

## Authentication exceptions

The following status codes will result in a credentials exception, causing an authentication prompt asking the user to provide credentials (or sign in again in the case of an expired OAuth token).

| Code | Status         |
|:-----|:---------------|
| 401  | Unauthorized   |
| 403  | Forbidden      |

>[!Note]
> Extensions are able to use the `ManualStatusHandling` option with status codes 401 and 403, which is not something that can be done in `Web.Contents` calls made outside of a custom data connector (that is, directly from Power Query).

## Redirection

The following status codes will result in an automatic redirect to the URI specified in the [`Location`](https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30) header. A missing `Location` header will result in an error.

| Code | Status             |
|:-----|:-------------------|
| 300  | Multiple Choices   |
| 301  | Moved Permanently  |
| 302  | Found              |
| 303  | See Other          |
| 307  | Temporary Redirect |

>[!Note]
> Only status code 307 will keep a `POST` request method. All other redirect status codes will result in a switch to `GET`.
