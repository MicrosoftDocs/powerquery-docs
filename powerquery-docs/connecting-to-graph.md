---
title: Lack of Support for Microsoft Graph in Power Query
description: This article describes Power Query's lack of support for connecting to Microsoft Graph
author: mattmasson
ms.date: 1/17/2024
ms.author: mmasson
ms.subservice: get-data
---

# Lack of Support for Microsoft Graph in Power Query

Connecting to [Microsoft Graph](/graph/overview) REST [APIs](https://graph.microsoft.com) from Power Query isn't recommended or supported. Instead, we recommend users explore alternative solutions for retrieving analytics data based on Graph, such as [Microsoft Graph data connect](/graph/overview#access-microsoft-graph-data-at-scale).

You might find you can make certain REST calls to Microsoft Graph API endpoints work through the `Web.Contents` or `OData.Feed` functions, but these approaches aren't reliable as long-term solutions.

This article outlines the issues associated with Microsoft Graph connectivity from Power Query and explains why it isn't recommended.

## Authentication

The built-in Organizational Account authentication flow for Power Query's `Web.Contents` and `OData.Feed` functions isn't compatible with most Graph endpoints. Specifically, Power Query's Microsoft Entra ID client requests the `user_impersonation` scope, which isn't compatible with Graph's security model. Graph uses a rich set of permissions that aren't available through our generic Web and OData connectors.

Implementing your own Microsoft Entra ID credential retrieval flows directly from your query, or using hardcoded or embedded credentials, also isn't recommended for security reasons.

## OData libraries' incompatibility

Certain Graph endpoints and extensions to Graph may require the use of OData libraries and features that aren't supported by Power Query's built-in `OData.Feed` function because Graph and Power Query might be using two different versions of OData libraries. These issues generally result in errors retrieving the service's `$metadata` document. You might discover common guidance related to passing the `Implementation = "2.0"` option to the `OData.Feed` function call to ensure the latest supported OData libraries are used. While this approach does resolve certain OData incompatibilities, you might still encounter errors over time as Graph and Power Query adopt new versions of the OData libraries at different times.

## Performance

The Microsoft Graph API is designed to support many application scenarios, but is suboptimal for the large-scale data retrieval required for most analytics scenarios. If you try to retrieve large amounts of data from Graph APIs, you might encounter performance issues. Details around scenario applicability can be found in the [Graph documentation](/graph).

## Using a custom connector

Some Power Query users have enabled Graph connectivity through custom connectors, limiting their functionality to certain parts of the Graph API. This approach allows connector developers to resolve general authentication issues by defining their own Microsoft Entra ID client with Graph specific permissions. Some custom connectors work around OData challenges by using `Web.Contents` and simulating OData support within their connector logic. However, this approach isn't recommended as users frequently hit the performance and scalability issues described above. Developers who take this route should continue with these limitations in mind.
