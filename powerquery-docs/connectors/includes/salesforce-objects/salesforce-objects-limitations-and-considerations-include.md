---
title: Include file for the Limitations and considerations section of the Power Query Salesforce Objects connector documentation
description: Include file for the Limitations and considerations section of the Power Query Salesforce Objects connector documentation
author: whhender
ms.author: whhender
ms.date: 03/10/2026
ms.topic: include
---

* If there are missing tables in the results from the Salesforce Objects connector, one cause might be that the ApiVersion must be specified or updated to a version that Salesforce supports. To specify or update the ApiVersion, use the Advanced Editor and explicitly add the `ApiVersion` parameter. For example:

   ```Source = Salesforce.Data("https://login.salesforce.com/", [ApiVersion = 54.0])```

   Salesforce periodically deprecates ApiVersions, so ensure that you're specifying a [Salesforce supported ApiVersion](https://na1.salesforce.com/services/data/).

* There's a limit on the number of fields a query to Salesforce can contain. The limit varies depending on the type of the columns, the number of computed columns, and so on. When you receive the `Query is either selecting too many fields or the filter conditions are too complicated` error, it means that your query exceeds the limit. To avoid this error, use the **Select Query** advanced option and specify fields that you really need.

* Salesforce session settings can block this integration. Ensure that the setting **Lock sessions to the IP address from which they originated** is disabled.

* Salesforce API access should be enabled. To verify access settings, go to profile settings for the current user and search for the **API Enabled** checkbox.

* Salesforce trial accounts don't have API access.

* The "Create record" and "Update record" operations don't support custom fields of type `Picklist (Multi-Select)`.

* Lightning URLs aren't supported.

* Custom URLs only support the salesforce.com and cloudforce.com domains. The use of other domains results in an "Invalid Arguments" error.

* Salesforce limits the number of concurrent queries that a single account can execute. ['INVALID_QUERY_LOCATOR ' error](https://help.salesforce.com/s/articleView?id=000323582&type=1) This is a Salesforce limit, and can be encountered when there are multiple concurrent queries against Salesforce using the same account. This limit includes all client applications (not just the PowerQuery connector) using the Salesforce API. To reduce the likelihood of this error:
  * Ensure that the number of Salesforce queries are kept to a minimum.
  * Use available options (such as dataflows) to stage the data from Salesforce.
  * Confirm that other uses of the Salesforce API with the same account aren't scheduled concurrently.

For more information about Salesforce internal API limits, go to [Salesforce Developer Limits and Allocations Quick Reference](https://developer.salesforce.com/docs/atlas.en-us.salesforce_app_limits_cheatsheet.meta/salesforce_app_limits_cheatsheet/salesforce_app_limits_platform_api.htm#!).
