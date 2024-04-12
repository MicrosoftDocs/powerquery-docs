---
title: Additional connector functionality
description: Provides information to custom and certified connector developers on adding more connector functionality
author: ptyx507x
ms.topic: conceptual
ms.date: 2/13/2024
ms.author: miescobar
---

# Additional connector functionality

This article provides information about different types of additional connector functionality that connector developers might want to invest in. For each type, this article outlines availability and instructions to enable the functionality.

If there's connector-specific or platform functionality that requires direct Microsoft engagement or investment, end users and developer partners can express their need through the standard [feedback process](feedback.md).

## Authentication

While implementing authentication is covered in the [authentication](handlingauthentication.md) article, there are other methods that connector owners might be interested in offering.

### Windows authentication

Windows authentication is supported. To enable Windows-based authentication in your connector, add the following line in the **Authentication** section of your connector.

```powerquery-m
Windows = [ SupportsAlternateCredentials = true ]
```

This change exposes Windows authentication as an option in the Power BI Desktop authentication experience. The **SupportsAlternateCredentials** flag exposes the option to "Connect using alternative credentials". After this flag is enabled, you can specify explicit Windows account credentials (username and password). You can use this feature to test impersonation by providing your own account credentials.

### Single sign-on authentication

This section outlines options available for implementing single sign-on (SSO) functionality into your certified connector. Currently, there's no support for "plug and play" extensibility for SSO. Enabling SSO would require changes and collaboration both on the Microsoft and data source or connector sides, so reach out to your Microsoft contact prior to starting work.

#### Microsoft Entra ID SSO

Microsoft Entra ID-based SSO is supported in cloud scenarios. The data source must accept Microsoft Entra ID access tokens, as the Power BI Microsoft Entra ID user token is exchanged with a data source token from Microsoft Entra ID. As a requirement, your connector must support the [Aad authentication kind](/power-query/handling-authentication#microsoft-entra-id-authentication). If you have a certified connector, reach out to your Microsoft contact to learn more.

## Native database query support

Some Power Query connectors offer end users the ability to specify [native database queries](native-database-query.md) under **Advanced options** in the connection experience. Custom connector developers may be interested in offering native database query support in their connector.

For information on how to implement native database query support in your connector, follow the walk-through in the [handling native query support](native-query-sdk.md) article.
