---
title: Additional connector functionality
description: Provides information to custom and certified connector developers on adding more connector functionality
author: ptyx507x
ms.topic: conceptual
ms.date: 1/8/2024
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

This change will expose Windows authentication as an option in the Power BI Desktop authentication experience. The **SupportsAlternateCredentials** flag will expose the option to "Connect using alternative credentials". After this flag is enabled, you can specify explicit Windows account credentials (username and password). You can use this feature to test impersonation by providing your own account credentials.

### Single sign-on authentication

This section outlines options available for implementing single sign-on (SSO) functionality into your certified connector. Currently, there is no support for "plug and play" extensibility for SSO. Enabling SSO would require changes and collaboration both on the Microsoft and data source or connector sides, so reach out to your Microsoft contact prior to starting work.

#### Azure Active Directory SSO

Azure Active Directory (Azure AD)-based SSO is supported in cloud scenarios. The data source must accept Azure AD access tokens, as the Power BI Azure AD user token will be exchanged with a data source token from Azure AD. If you have a certified connector, reach out to your Microsoft contact to learn more.

#### Kerberos SSO

Kerberos-based single sign-on is supported in gateway scenarios. The data source must support Windows authentication. Generally, these scenarios involve Direct Query-based reports, and a connector based on an ODBC driver. The primary requirements for the driver are that it can determine Kerberos configuration settings from the current thread context, and that it supports thread-based user impersonation. The gateway must be [configured](/power-bi/connect-data/service-gateway-sso-kerberos) to support Kerberos Constrained Delegation (KCD). An example can be found in the [Impala](https://github.com/microsoft/DataConnectors/blob/master/samples/ODBC/ImpalaODBC/ImpalaODBC.pq) sample connector.

Power BI will send the current user information to the gateway. The gateway will use Kerberos Constrained Delegation to invoke the query process as the impersonated user.

After making the above changes, the connector owner can test the following scenarios to validate functionality.

- In Power BI Desktop: Windows impersonation (current user)
- In Power BI Desktop: Windows impersonation using alternate credentials
- In the gateway: Windows impersonation using alternate credentials, by pre-configuring the data source with Windows account credentials in the Gateway Power BI Admin portal.

Connector developers can also use this procedure to test their implementation of Kerberos-based SSO.

1. Set up an on-premises data gateway with single sign-on enabled using instructions in the [Power BI Kerberos SSO documentation](/power-bi/connect-data/service-gateway-sso-kerberos#prerequisites) article.

2. Validate the setup by testing with SQL Server and Windows accounts. Set up the [SQL Server Kerberos configuration manager](/troubleshoot/sql/connect/kerberos-configuration-manager-available). If you can use Kerberos SSO with SQL Server then your Power BI data gateway is properly set up to enable Kerberos SSO for other data sources as well.

3. Create an application (for example, a command-line tool) that connects to your server through your ODBC driver. Ensure that your application can use Windows authentication for the connection.

4. Modify your test application so that it can take a username (UPN) as an argument and use the [WindowsIdentity](/dotnet/api/system.security.principal.windowsidentity.-ctor#System_Security_Principal_WindowsIdentity__ctor_System_String_) constructor with it. Once complete, with the privileges granted to the gateway account set up in Step 1, you should be able to obtain the user's [AccessToken](/dotnet/api/system.security.principal.windowsidentity.accesstoken) property and [impersonate](/dotnet/api/system.security.principal.windowsidentity.impersonate) this token.

5. Once you've made the changes to your application, ensure that you can use impersonation to load and connect to your service through the ODBC driver. Ensure that data can be retrieved. If you want to use native C or C++ code instead, you'll need to use [LsaLoginUser](/windows/win32/api/ntsecapi/nf-ntsecapi-lsalogonuser) to retrieve a token with just the username and use the [KERB_S4U_LOGON](/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_s4u_logon) option.

After this functionality is validated, Microsoft will make a change to thread the UPN from the Power BI Service down through the gateway. Once at the gateway, it will essentially act the same way as your test application to retrieve data.

Reach out to your Microsoft contact prior to starting work to learn more on how to request this change.

#### SAML SSO

SAML-based SSO is often not supported by end data sources and isn't a recommended approach. If your scenario requires the use of SAML-based SSO, reach out to your Microsoft contact or visit our documentation to [learn more](/power-bi/connect-data/service-gateway-sso-saml).

## Native database query support

Some Power Query connectors offer end users the ability to specify [native database queries](native-database-query.md) under **Advanced options** in the connection experience. Custom connector developers may be interested in offering native database query support in their connector.

For information on how to implement native database query support in your connector, follow the walk through in the [handling native query support](native-query-sdk.md) article.
