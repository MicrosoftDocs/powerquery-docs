---
title: FHIR Power Query authentication
description: FHIR Power Query authentication
author: hansenms
ms.topic: concept-article
ms.date: 7/16/2025
ms.author: mihansen
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# FHIR connector authentication

This article explains authenticated access to FHIR servers using the Power Query connector for FHIR. The connector supports anonymous access to publicly accessible FHIR servers and authenticated access to FHIR servers using Microsoft Entra ID (organizational) authentication. The [Azure API for FHIR](/azure/healthcare-apis) is secured with Microsoft Entra ID.

> [!NOTE]
> If you're connecting to a FHIR server from an online service, such as Power BI service, you can only use an organizational account.

## Anonymous access

There are many [publicly accessible FHIR servers](https://confluence.hl7.org/display/FHIR/Public+Test+Servers). To enable testing with these public servers, the Power Query connector for FHIR supports the "Anonymous" authentication scheme. For example, to access the public `https://server.fire.ly` server:

1. Enter the URL of the public Firely server.

   :::image type="content" source="fhir-access-firely.png" alt-text="Screenshot of the URL filled in with the public Firely FHIR server.":::

1. Select **Anonymous** authentication scheme.

   :::image type="content" source="fhir-access-firely-anonymous.png" alt-text="Screenshot demonstrating the anonymous authentication selection to access the Firely FHIR server.":::

After that, follow the steps to [query and shape your data](fhir.md).

## Microsoft Entra ID (organizational) authentication

The Power Query connector for FHIR supports OAuth authentication for FHIR servers that are secured with [Microsoft Entra ID](https://www.microsoft.com/security/business/identity-access/microsoft-entra-id).

To use Microsoft Entra ID authentication, select **Organizational account** when connecting.

:::image type="content" source="fhir-sign-in.png" alt-text="Screenshot of the authentication dialog with the Organizational account selected for sign in.":::

There are some restrictions to be aware of:

* The expected Audience for the FHIR server **must** be equal to the base URL of the FHIR server. For the [Azure API for FHIR](/azure/healthcare-apis/), you can set this when you [provision the FHIR service](/azure/healthcare-apis/fhir-paas-portal-quickstart#additional-settings) or later in the portal.

* If your FHIR server doesn't return a `WWW-Authenticate` challenge header with an `authorization_uri` field on failed authorization, you must use an organizational account to sign in. You can't use a guest account in your active directory tenant. For the Azure API for FHIR, you **must** use a Microsoft Entra ID organizational account.

* If your FHIR service isn't the Azure API for FHIR (for example, if you're running the [open source Microsoft FHIR server for Azure](https://github.com/Microsoft/fhir-server)), you registered an [Microsoft Entra ID resource application](/azure/healthcare-apis/azure-api-for-fhir/register-resource-azure-ad-client-app) for the FHIR server. You must preauthorize the Power BI client application to be able to access this resource application.

   :::image type="content" source="fhir-preauthorize-powerbi.png" alt-text="Screenshot demonstrating how to preauthorize the Power BI client application." lightbox="fhir-preauthorize-powerbi.png":::

   The client ID for the Power BI client is `a672d62c-fc7b-4e81-a576-e60dc46e951d`.

* The Power Query (for example, Power BI) client only requests a single scope: `user_impersonation`. This scope must be available and the FHIR server can't rely on other scopes.

## Next steps

In this article, you learned how to use the Power Query connector for FHIR authentication features. Next, explore query folding.

>[!div class="nextstepaction"]
>[FHIR Power Query folding](fhir-queryfolding.md)
