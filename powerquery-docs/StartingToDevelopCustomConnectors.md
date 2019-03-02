---
title: Start developing custom connectors for Power Query 
description: Create custom Power Query connectors
author: cpopell

ms.service: powerquery
ms.topic: quickstart
ms.date: 08/10/2018
ms.author: gepopell

LocalizationGroup: reference
---

# Starting to Develop Custom Connectors
To get you up to speed with Power Query, we've listed some of the most common questions on this page.

### What software do I need to get started with the Power Query SDK?
You need to install the [Power Query SDK](https://www.aka.ms/powerquerysdk) in addition to Visual Studio. To be able to test your connectors we suggest that you also have Power BI installed.

### What can you do with a Connector?
Data Connectors allow you to create new data sources or customize and extend an existing source. Common use cases include:
* Creating a business analyst-friendly view for a REST API
* Providing branding for a source that Power Query supports with an existing connector (such as an OData service or ODBC driver)
* Implementing OAuth v2 authentication flow for a SaaS offering
* Exposing a limited or filtered view over your data source to improve usability
* Enabling DirectQuery for a data source via ODBC driver

Data Connectors are currently only supported in Power BI Desktop.
