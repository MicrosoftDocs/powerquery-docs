---
title: Include file for the Limitations and considerations section of the Power Query Solarwinds Service Desk connector documentation
description: Include file for the Limitations and considerations section of the Power Query Solarwinds Service Desk connector documentation
ms.date: 03/10/2026
ms.topic: include
---

Users should be aware of the following limitations and issues associated with accessing SolarWinds Service Desk:

* There's no limit on the number of users who can pull data. But if they aren't using incremental refresh and try to import data from a range larger than one year, each user can refresh only once every 24 hours.

* The fields that are imported are limited. For more fields, submit a feature request in [THWACK](https://thwack.solarwinds.com/kb/articles/20027-how-to-create-a-feature-request). For feedback or support, reach out to [SolarWinds support](https://www.solarwinds.com/company/contact-us).

### Credential error in the navigator

If a credential error occurs in the navigator, clear your recent data source settings.

1. In Power BI Desktop, select **File** > **Data source settings**.

   :::image type="content" source="/power-query/connectors/media/solarwinds-service-desk/data-source-clear.png" alt-text="Screenshot of Select SolarWinds Service Desk datasource.":::

2. Select the SWSD data source, and then select **Clear permissions**.
3. Establish the connection to the navigator again.
