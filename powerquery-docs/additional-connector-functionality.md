---
title: Additional connector functionality
description: Provides information to custom and certified connector developers on adding more connector functionality
author: bezhan-msft
ms.service: powerquery
ms.topic: conceptual
ms.date: 5/4/2021
ms.author: bezhan
LocalizationGroup: reference
---

# Additional connector functionality

This article outlines different types of extra connector functionality that connector developers may want to invest in. For each type, this article outlines availability and instructions enable the functionality.

## Authentication

While implementing authentication is outlined in the [authentication](handlingauthentication.md) article, there are other methods which connector owners may be interested in offering. 

### Windows authentication

Windows-based authentication is supported. To enable Windows-based authentication in your connector, add the following line in the **Authentication** section of your connector.

```
Windows = [ SupportsAlternateCredentials = true ]
```

This change will expose Windows authentication as an option in the Power BI Desktop authentication experience. The **SupportsAlternateCredentials** flag will expose the option to "Connect using alternative credentials". After this flag is enabled, you can specify explicit Windows account credentials (username and password). You can use this to test impersonation by providing your own account credentials. 

### Single sign-on (SSO) authentication

This section outlines options available for implementing single sign-on (SSO) functionality into your certified connector. Currently, there is no support for "plug and play" extensibility for SSO. Enabling SSO would require changes and collaboration both on the Microsoft and data source or connector sides. 

#### Azure Active Directory (AAD) SSO

Azure Active Directory (AAD)-based single sign-on is supported in Cloud scenarios. The data source must accept AAD access tokens, as the Power BI AAD user token will be exchanged with a data source token from Azure Active Directory. If you have a certified connector, reach out to your Microsoft contact to learn more.

#### Kerberos SSO 

Kerberos-based single sign-on is supported in gateway scenarios. The data source must support Windows authentication. Generally, these scenarios include the use of a driver for Direct Query; the driver must support thread-based user impersonation. The gateway must be [configured](/power-bi/connect-data/service-gateway-sso-kerberos) to support Kerberos Constrained Delegation (KCD). An example can be found in the open-sourced [Impala](https://github.com/microsoft/DataConnectors/blob/master/samples/ODBC/ImpalaODBC/ImpalaODBC.pq) connector. 

Power BI will send the user's Azure Active Directory information to the gateway, which runs the query process with user impersonation to connect to the end data source.

After making the above changes, the connector owner can test in their own instance of the gateway and in Power BI service to validate functionality. For certified connectors, Microsoft must make a change to enable Kerberos-based SSO; reach out to your Microsoft contact to learn more.

#### SAML SSO

SAML-based SSO is often not supported by end data sources and isn't a recommended approach. If your scenario requires the use of SAML-based SSO, reach out to your Microsoft contact or visit our documentation to [learn more](/power-bi/connect-data/service-gateway-sso-saml).

