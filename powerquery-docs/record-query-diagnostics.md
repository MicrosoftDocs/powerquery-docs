---
title: Record Query Diagnostics in Power BI
description: Learn how to record Query Diagnostics in Power BI using Diagnose Step, Start, and Stop commands. Understand what to expect from different refresh workflows.
author: ptyx507x
ms.topic: concept-article
ms.date: 07/13/2026
ms.update-cycle: 1095-days
ms.author: miescobar
ms.subservice: transform-data
ms.custom: sfi-image-nochange
---

# Record query diagnostics in Power BI

When you author a query in Power Query, the basic workflow is to connect to a data source, apply some transformations, potentially refresh your data in the Power Query editor, and then load it to the Power BI model. After the data is in the Power BI model, you can refresh it from time to time in Power BI Desktop (if you're using Desktop to view analytics), aside from any refreshes you do in the service.

While you might get a similar result at the end of an authoring workflow, refreshing in the editor, or refreshing in Power BI proper, the software runs very different evaluations for the different user experiences it provides. It's important to know what to expect when doing query diagnostics in these different workflows so you aren't surprised by the different diagnostic data.

To start Query Diagnostics, go to the **Tools** tab in the Power Query editor ribbon. You see a few different options.

:::image type="content" source="media/query-diagnostics/diagnostics-toolbar.png" alt-text="Screenshot of the Power Query editor ribbon.":::

Two primary options are available: **Diagnose Step** and **Start Diagnostics** (paired with **Stop Diagnostics**). The former option gives you information on a query up to a selected step, and is most useful for understanding what operations are performed locally or remotely in a query. The latter option gives you more insight into various other cases, discussed in the following section.

## Connector specifics

This article can't cover all the different permutations available in Query Diagnostics. Many things can change the results you see, including:

* Connector
* Transforms applied
* System that you're running on
* Network configuration
* Advanced configuration choices
* ODBC configuration

For the most broad coverage, this article focuses on Query Diagnostics of the Northwind Customers table, both on SQL and OData. The OData notes use the public endpoint found at [the OData.org website](https://services.odata.org/V4/Northwind/Northwind.svc/), while you need to provide a SQL server for yourself. Many data sources differ significantly from these sources. Over time, Microsoft adds connector specific documentation.

## Start and stop diagnostics

The **Start Diagnostics** and **Stop Diagnostics** commands cover more scenarios than **Diagnose Step**. They also provide more information that you need to sort through. For example, starting diagnostics, refreshing a preview, and then stopping diagnostics provides equivalent information to running **Diagnose Step** on every step. This equivalence exists because of how Power Query works in the editor to refresh each step independently.

To start recording, select **Start Diagnostics**, perform whatever evaluations you want (authoring, preview refresh, full refresh), and then select **Stop Diagnostics**.

### Authoring

The authoring workflow primarily differs from other workflows in that it generally generates more individual evaluations. As discussed in the primary Query Diagnostics article, these evaluations result from populating various user interfaces such as the navigator or filter dropdowns.

This section walks through an example. The example uses the OData connector, but when reviewing the output, you also look at the SQL version of the same database. For both data sources, you connect to the data source via **New Source**, **Recent Sources**, or **Get Data**. For the SQL connection, you need to enter credentials for your server, but for the public OData endpoint, you can enter the endpoint linked earlier.

:::image type="content" source="media/record-query-diagnostics/diagnostics-odata-northwind.png" alt-text="Screenshot that shows the OData connection.":::

After you connect and choose authentication, select the **Customers** table from the OData service.

:::image type="content" source="media/record-query-diagnostics/diagnostics-odata-selecttable.png" alt-text="Screenshot that shows the Northwind navigation.":::

You see the **Customers** table in the Power Query interface. Suppose that you want to know how many Sales Representatives there are in different countries or regions. First, right-click on **Sales Representative** under the **Contact Title** column, mouse over **Text Filters**, and select **Equals**.

:::image type="content" source="media/record-query-diagnostics/diagnostics-odata-filter.png" alt-text="Screenshot that shows the text filter option.":::

Now, select **Group By** from the ribbon and do a grouping by **Country**, with your aggregate being a **Count**.

:::image type="content" source="media/record-query-diagnostics/diagnostics-odata-group-by.png" alt-text="Screenshot that shows the Group By operation.":::

You see the same data you see in the following image.

:::image type="content" source="media/record-query-diagnostics/diagnostics-odata-end.png" alt-text="Screenshot that shows the results.":::

Finally, go back to the **Tools** tab of the ribbon and select **Stop Diagnostics**. This action stops the tracing and builds your diagnostics file. The summary and detailed tables appear on the left-hand side.

If you trace an entire authoring session, you generally see something like a source query evaluation, then evaluations related to the relevant navigator, and then at least one query emitted for each step you apply (with potentially more depending on the exact UX actions taken). In some connectors, parallel evaluations happen for performance reasons that yield similar sets of data.

### Refresh preview

After you finish transforming your data, you create a sequence of steps in a query. When you select **Refresh Preview** or **Refresh All** in the Power Query editor, you don't see just one step in your query diagnostics. Refreshing in the Power Query Editor explicitly refreshes the query ending with the last step applied. Then, it steps back through the applied steps and refreshes the query up to that point, back to the source.

This process means that if you have five steps in your query, including Source and Navigator, you see five different evaluations in your diagnostics. The first evaluation, chronologically, often (but not always) takes the longest. Two different reasons cause this longer duration:

* It potentially caches input data that the queries run after it (representing earlier steps in the User Query) can access faster locally.
* It has transforms applied to it that significantly truncate how much data it returns.

When you select **Refresh All**, it refreshes all queries. You need to filter to the ones you care about, as you might expect.

### Full refresh

Query Diagnostics can be used to diagnose the so-called *final query* that's emitted during the Refresh in Power BI, rather than just the Power Query editor experience. To do this, you first need to load the data to the model once. If you plan to do this, make sure that you realize that if you select **Close and Apply** that the editor window closes (interrupting tracing), so you either need to do it on the second refresh, or select the dropdown icon under **Close and Apply** and select **Apply** instead.

:::image type="content" source="media/record-query-diagnostics/diagnostics-close-and-apply.png" alt-text="Screenshot that shows the button to apply query changes.":::

Either way, make sure to select **Start Diagnostics** in the **Diagnostics** section of the **Tools** tab in the editor. When you select this option, refresh your model, or even just the table you care about.

:::image type="content" source="media/record-query-diagnostics/diagnostics-refresh.png" alt-text="Screenshot that shows the refresh data option.":::

When the data finishes loading to the model, select **Stop Diagnostics**.

You see some combination of metadata and data queries. Metadata calls grab the information they can about the data source. Data retrieval is about accessing the data source, emitting the final built up Data Source Query with folded down operations, and then performing whatever evaluations are missing on top, locally.

It's important to note that just because you see a resource (database, web endpoint, and so on) or a data source query in your diagnostics, it doesn't mean that it's necessarily performing network activity. Power Query might retrieve this information from its cache.

## Diagnose step

The **Diagnose Step** feature provides insights into what evaluations happen up to a single step. This information helps you identify how performance looks up to that step and which parts of your query run locally or remotely.

If you use **Diagnose Step** on the query you built earlier, you see that it returns about 10 rows. If you look at the last row with a Data Source Query, you get a clear picture of what your final emitted query to the data source looks like. In this case, you see that Power Query filters the Sales Representative remotely, but the grouping happens locally.

:::image type="content" source="media/record-query-diagnostics/diagnose-step-odata-customers.png" alt-text="Screenshot that shows the filtered and grouped Customers table.":::

If you start and stop diagnostics and refresh the same query, you get 40 rows. As mentioned earlier, Power Query gets information on every step, not just the final step. This behavior makes it harder to get insight into one particular part of your query.

## Related content

- [Query diagnostics](query-diagnostics.md)
- [Visualize and interpret Query Diagnostics in Power BI](read-query-diagnostics.md)
- [Understand folding by using Query Diagnostics](query-diagnostics-folding.md)
