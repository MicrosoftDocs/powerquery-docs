---
title: Start developing custom connectors for Power Query 
description: Create custom Power Query connectors
author: ptyx507x


ms.topic: quickstart
ms.date: 2/28/2022
ms.author: miescobar
LocalizationGroup: reference
---

# Starting to develop custom connectors

To get you up to speed with Power Query, this page lists some of the most common questions.

### What software do I need to get started with the Power Query SDK?

You need to install the [Power Query SDK](https://www.aka.ms/powerquerysdk) in addition to Visual Studio. To be able to test your connectors, you should also have Power BI installed.

### What can you do with a custom connector?

Custom connectors allow you to create new data sources or customize and extend an existing source. Common use cases include:

* Creating a business analyst-friendly view for a REST API.
* Providing branding for a source that Power Query supports with an existing connector (such as an OData service or ODBC driver).
* Implementing OAuth v2 authentication flow for a SaaS offering.
* Exposing a limited or filtered view over your data source to improve usability.
* Enabling DirectQuery for a data source using an ODBC driver.

Custom connectors are only available in Power BI Desktop and Power BI Service through the use of an on-premises data gateway. More information: [TripPin 9 - Test Connection](samples/TripPin/9-TestConnection/README.md)
