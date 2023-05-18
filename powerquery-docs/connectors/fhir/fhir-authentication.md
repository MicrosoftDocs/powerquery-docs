---
title: FHIR Power Query authentication
description: FHIR Power Query authentication
author: hansenms
ms.topic: conceptual
ms.date: 3/14/2023
ms.author: mihansen
---

# FHIR connector authentication

This article explains authenticated access to FHIR servers using the Power Query connector for FHIR. The connector supports anonymous access to publicly accessible FHIR servers and authenticated access to FHIR servers using Azure Active Directory authentication. The [Azure API for FHIR](/azure/healthcare-apis) is secured with Azure Active Directory.

>[!Note]
>If you are connecting to a FHIR server from an online service, such as Power BI service, you can only use an organizational account.

## Anonymous access

There are many [publicly accessible FHIR servers](https://confluence.hl7.org/display/FHIR/Public+Test+Servers). To enable testing with these public servers, the Power Query connector for FHIR supports the "Anonymous" authentication scheme. For example to access the public https://vonk.fire.ly server:

1. Enter the URL of the public Vonk server.

    ![Access public Vonk server.](FHIR-Access-Vonk.png)

1. Select **Anonymous** authentication scheme.

    ![Vonk anonymous authentication.](FHIR-Access-Vonk-Anonymous.png)

After that, follow the steps to [query and shape your data](FHIR.md).

## Azure Active Directory (organizational) authentication

The Power Query connector for FHIR supports OAuth authentication for FHIR servers that are secured with [Azure Active Directory](https://azure.microsoft.com/services/active-directory/). 

To use Azure Active Directory authentication, select **Organizational account** when connecting.

![FHIR Sign In.](FHIR-Sign-In.png)

There are some restrictions to be aware of:

* The expected Audience for the FHIR server **must** be equal to the base URL of the FHIR server. For the [Azure API for FHIR](/azure/healthcare-apis/), you can set this when you [provision the FHIR service](/azure/healthcare-apis/fhir-paas-portal-quickstart#additional-settings) or later in the portal.

* If your FHIR server doesn't return a `WWW-Authenticate` challenge header with an `authorization_uri` field on failed authorization, you must use an organizational account to sign in. You can't use a guest account in your active directory tenant. For the Azure API for FHIR, you **must** use an Azure Active Directory organizational account.

* If your FHIR service isn't the Azure API for FHIR (for example, if you're running the [open source Microsoft FHIR server for Azure](https://github.com/Microsoft/fhir-server)), you'll have registered an [Azure Active Directory resource application](/azure/healthcare-apis/register-resource-azure-ad-client-app) for the FHIR server. You must pre-authorize the Power BI client application to be able to access this resource application.

    ![Pre Authorize Power BI.](FHIR-PreAuthorize-PowerBI.png)

    The client ID for the Power BI client is `a672d62c-fc7b-4e81-a576-e60dc46e951d`.

* The Power Query (for example, Power BI) client will only request a single scope: `user_impersonation`. This scope must be available and the FHIR server can't rely on other scopes.

## Next steps

In this article, you've learned how to use the Power Query connector for FHIR authentication features. Next, explore query folding.

>[!div class="nextstepaction"]
>[FHIR Power Query folding](FHIR-QueryFolding.md)