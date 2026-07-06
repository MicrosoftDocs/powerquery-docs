---
title: Handle Status Codes by Using Web.Contents for Power Query Connectors
description: Learn how to handle HTTP status codes using Web.Contents in Power Query connectors. Manage automatic retries, authentication exceptions, and redirects effectively.
author: ptyx507x
ms.topic: concept-article
ms.date: 07/01/2026
ms.author: miescobar
ms.subservice: custom-connectors
---

# Handle status codes by using `Web.Contents`

The [Web.Contents](/powerquery-m/web-contents) function has some built-in functionality for dealing with certain HTTP status codes. You can override the default behavior in your extension by using the `ManualStatusHandling` field in the [options record](/powerquery-m/web-contents#__toc360793395).

## Automatic retry

[Web.Contents](/powerquery-m/web-contents) automatically retries requests that fail with one of the following status codes:

| Code | Status                     |
|:-----|:---------------------------|
| 408  | Request Timeout            |
| 429  | Too Many Requests          |
| 503  | Service Unavailable        |
| 504  | Gateway Timeout            |
| 509  | Bandwidth Limit Exceeded   |

The function retries requests up to three times before failing. The engine uses an exponential back-off algorithm to determine how long to wait until the next retry, unless the response contains a [`Retry-after`](https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.37) header. When the header is found, the engine waits the specified number of seconds before the next retry. The minimum supported wait time is 0.5 seconds, and the maximum value is 120 seconds.

> [!Note]
> The `Retry-after` value must be in the `delta-seconds` format. The `HTTP-date` format isn't currently supported. 

## Authentication exceptions

The following status codes cause a credentials exception. The exception prompts the user to provide credentials or sign in again if an OAuth token expired.

| Code | Status         |
|:-----|:---------------|
| 401  | Unauthorized   |
| 403  | Forbidden      |

> [!Note]
> Extensions can use the `ManualStatusHandling` option with status codes 401 and 403. You can't use this option in `Web.Contents` calls made outside of a custom data connector (that is, directly from Power Query).

## Redirection

The following status codes cause an automatic redirect to the URI specified in the [`Location`](https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30) header. A missing `Location` header causes an error.

| Code | Status             |
|:-----|:-------------------|
| 300  | Multiple Choices   |
| 301  | Moved Permanently  |
| 302  | Found              |
| 303  | See Other          |
| 307  | Temporary Redirect |

> [!Note]
> Only status code 307 keeps a `POST` request method. All other redirect status codes switch to `GET`.
