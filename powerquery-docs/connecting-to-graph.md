---
title: Lack of Support for Microsoft Graph in Power Query
description: This article describes Power Query's lack of support for connecting to Microsoft Graph
author: mattmasson
ms.service: powerquery
ms.reviewer: kvivek
ms.date: 02/23/2021
ms.author: mmasson

---

# Lack of Support for Microsoft Graph in Power Query

## Summary

Connecting to [Microsoft Graph](https://docs.microsoft.com/graph/overview) REST [APIs](https://graph.microsoft.com) from Power Query is not recommended or supported. Instead, we recommend users consider alternative solutions for retrieving analytics data based on Graph, such as [Microsoft Graph data connect](https://docs.microsoft.com/graph/overview#access-microsoft-graph-data-at-scale-using-microsoft-graph-data-connect).

Users may find they can make certain REST calls to Microsoft Graph API endpoints work through the ```Web.Contents``` or ```OData.Feed``` functions, but these approaches are not reliable as long-term solutions. 

This article outlines the issues associated with Microsoft Graph connectivity from Power Query and explain why it is not recommended.

### Authentication

The built-in Organizational Account authentication flow for Power Query’s ```Web.Contents``` and ```OData.Feed``` functions is not compatible with most Graph endpoints. Specifically, Power Query’s Azure Active Directory (Azure AD) client requests the ```user_impersonation``` scope, which is not compatible with Graph’s security model. Graph uses a rich set of permissions that are not available through our generic Web and OData connectors.

Implementing your own Azure AD credential retrieval flows directly from your query, or using hardcoded or embedded credentials, is also not recommended for security reasons.

### OData Libraries’ Incompatibility

Certain Graph endpoints and extensions to Graph may require the use of OData libraries and features that are unsupported by Power Query’s built-in ```OData.Feed``` function, due to Graph and Power Query potentially using two different versions of OData libraries. These issues generally result in errors retrieving the service’s $metadata document. Users may discover common guidance related to passing the ```Implementation = "2.0"``` option to the ```OData.Feed``` function call to ensure the latest supported OData libraries are used. While this does resolve certain OData incompatibilities, users may still encounter errors over time as Graph and Power Query adopt new versions of the OData libraries at different times.

### Performance

The Microsoft Graph API is designed to support many application scenarios but is suboptimal for the large-scale data retrieval required for most analytics scenarios. Users trying to retrieve large amounts of data from Graph APIs may encounter performance issues. Details around scenario applicability can be found in the Graph documentation. 

## Using a Custom Connector

Some Power Query users have enabled Graph connectivity through custom connectors, limiting their functionality to certain parts of the Graph API. This approach allows connector developers to resolve general authentication issues by defining their own Azure AD client with Graph specific permissions. Some custom connectors work around OData challenges by using ```Web.Contents``` and simulating OData support within their connector logic. However, this approach is still not generally recommended as consumers frequently hit the performance and scalability issues described above. Developers who take this route should proceed with these limitations in mind.
