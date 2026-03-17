---
title: Include file for the Limitations and considerations section of the Power Query Sumtotal connector documentation
description: Include file for the Limitations and considerations section of the Power Query Sumtotal connector documentation
ms.date: 03/10/2026
ms.topic: include
---

This section describes any issues or limitations associated with the SumTotal connector.

### SumTotal OData API performance and throttling limits

For information about OData API performance and throttling limits for SumTotal connections, go to [SumTotal's OData API functionality](https://marketplace.sumtotalsystems.com/Home/ODataAPI) under the **Important Notes** section. These limitations apply to both the SumTotal connector (which uses the OData API as an implementation detail) and the 'actual' OData Hosted API when accessing the same endpoints.

### Table retrieval rate

As a guideline, most default tables are retrieved at approximately 1000 rows per second using the SumTotal connector. If you require faster retrieval rates, consider using the **RowVersionId** filter parameter. You can pass this parameter directly to the environment hosted URL by appending it as a query string parameter. Full URL example with **rowVersionId** parameter: `https://{host}.sumtotalystems.com/?rowVersionId=1234`.
