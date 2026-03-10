---
title: Include file for the Limitations and considerations section of the Power Query Salesforce Reports connector documentation
description: Include file for the Limitations and considerations section of the Power Query Salesforce Reports connector documentation
ms.reviewer: whhender
ms.date: 03/10/2026
ms.topic: include
---

* There's a limit on the number of fields a query to Salesforce can contain. The limit varies depending on the type of the columns, the number of computed columns, and so on. When you receive a `Query is either selecting too many fields or the filter conditions are too complicated` error, it means that your query exceeds the limit. To avoid this error, use the **Select Query** advanced option and specify fields that you really need.

* Salesforce session settings can block this integration. Ensure that the setting **Lock sessions to the IP address from which they originated** is disabled.

* The number of rows you can access in Salesforce Reports is limited by Salesforce to 2,000 rows. As a workaround for this issue, you can use the [Salesforce Objects](salesforce-objects.md) connector in Power BI Desktop to retrieve all the rows from individual tables and recreate reports you'd like. The Object connector doesn't have the 2,000-row limit.

* Salesforce API access should be enabled. To verify access settings, go to profile settings for the current user and search for the **API Enabled** checkbox.

* Salesforce trial accounts don't have API access.

* Lightning URLs aren't supported.

* Custom URLs only support the salesforce.com and cloudforce.com domains. The use of other domains results in an "Invalid Arguments" error.

For more information about Salesforce internal API limits, go to [Salesforce Developer Limits and Allocations Quick Reference](https://developer.salesforce.com/docs/atlas.en-us.salesforce_app_limits_cheatsheet.meta/salesforce_app_limits_cheatsheet/salesforce_app_limits_platform_api.htm#!).
