---
title: Include file for the Limitations and considerations section of the Power Query Adobe Analytics connector documentation
description: Include file for the Limitations and considerations section of the Power Query Adobe Analytics connector documentation
ms.reviewer: whhender
ms.date: 03/10/2026
ms.topic: include
---

You should be aware of the following limitations and issues associated with accessing Adobe Analytics data.

* Adobe Analytics has a built-in limit of 50,000 rows returned per API call.

* If the number of API calls exceeds four per second, a warning is issued. If the number exceeds five per second, an error message is returned. For more information about these limits and the associated messages, see [Web Services Error Codes](https://github.com/AdobeDocs/analytics-1.4-apis/blob/master/docs/getting-started/c_Web_Services_Error_Codes.md#web-services-error-codes).

* The API request timeout through adobe.io is currently 60 seconds.

* The default rate limit for an Adobe Analytics Company is 120 requests per minute per user (the limit is enforced as 12 requests every 6 seconds).

* This connector isn't supported with an on-premises data gateway. However the [virtual network data gateway](/data-integration/vnet/use-data-gateways-sources-power-bi#supported-azure-data-services) is supported.

Import from Adobe Analytics stops and displays an error message whenever the Adobe Analytics connector hits any of the API limits.

When accessing your data using the Adobe Analytics connector, follow the guidelines provided under the [Best Practices](https://developer.adobe.com/analytics-apis/docs/2.0/guides/faq/#what-are-some-best-practices-and-guidelines-when-using-the-apis) heading.

For more guidelines on accessing Adobe Analytics data, see [Recommended usage guidelines](https://experienceleague.adobe.com/en/docs/analytics/analyze/admin-overview/use-cases).
