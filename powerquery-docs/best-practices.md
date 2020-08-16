---
title: Best practices when working with Power Query
description: Top 10 Best practices when working with Power Query
author: ptyx507
ms.service: powerquery
ms.reviewer: 
ms.date: 08/31/2020
ms.author: v-miesco
---
# Top 10 Best practices when working with Power Query

**************************** 

## 1. Use the best connector for the task and leverage the *Get Data* experience

Power Query offers a vast amount of data connectors ranging from data sources such as TXT, CSV and Excel files, to databases such as Microsoft SQL Server and popular SaaS services such as Microsoft Dynamics 365 and Salesforce. 
If you don't see your data source listed in the *Get Data* window, you can always use an ODBC / OLEDB to your data source. 

Using the best connector for the task will provide you with the best experience and performance. For example, using the SQL Server connector instead of the ODBC connector when connecting to a SQL Server database will not only provide you with a much better *Get Data* experience, but the SQL Server connector also offers you features that can improve your experience and performace such as query folding. You can read more about query folding from the article [Power Query query folding](power-query-folding.md).

> [!NOTE]
> You can see the full list of available connector for Power Query from the article [Connectors in Power Query](Connectors/index.md).

Each data connector follows a standard experience as explained in the article on [Getting data](get-data-experience.md). This standardized experience has a stage called **Data Preview** in which you're provided with a user-friendly window to select the data that you want to get from your data source, If the connector allows it, and a simple data preview of that data. You can even select multiple datasets from your datasource through the *Navigation* window as shown in the next image.

![Sample navigator window](images/me-navigator.png)

## 2.	Explore your data
    * Trying to promote the usage of the Data Profiling tools
    * We already have an article on this.
## 3.	Filter as early as you can
    * Explain a little bit about query folding and how powerful it is
    * We already got this article and I’m pretty proud of them (let’s make sure we talk about dynamic filters, e.g. “in the previous N days” and others, which come up very frequently and are not easy to discover)
## 4.	Use parameters to drive dynamic and flexible queries
    * Probably use a text parameter when connecting to a database for the servername or something similar
    * This is why I wanted to cover the “Parameters” article first – makes sense. I still get several pings on this blog post as it seems to cover much more than the documentation article that we currently have, particularly around the parameter binding widgets.
## 5.	Creating groups to stay organized
## 6.	Reference queries to decouple transformation phases (also cover “Extract Previous” option on Steps)
## 7.	Rename or add a description at a step/query/group level to further understanding your work
## 8.	Make sure to always have the correct data types defined (include “Detect Data Types” shortcut, and the Options to enable/disable type detection locally and globally)
## 9. Query resilient to changes
    * Select columns or Remove columns
## 10. Create reusable transformations with Custom Functions
    * Creating functions through the UI

Structure:
*	Headline: Best practice #1
*	The reason why and how
*	A link to a supporting article
