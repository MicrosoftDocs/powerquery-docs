# Power Query Authoring in Power BI

When authoring in Power Query, the basic workflow is that you connect to a data source, apply some transformations, potentially refresh your data in the Power Query editor, and then load it to the Power BI model. Once it's in the Power BI model, you may refresh it from time to time in Power BI Desktop (if you're using Desktop to view analytics), aside from any refreshes you do in the service.

While you may get a similar result at the end of an authoring workflow, refreshing in the editor, or refreshing in Power BI proper, very different evaluations are run by the software for the different user experiences provided. It's important to know what to expect when doing query diagnostics in these different workflows so you aren't surprised by the very different diagnostic data.

## Connector Specifics

It's important to mention that there is no way to cover all the different permutations of what you'll see in Query Diagnostics. There are lots of things that can change exactly what you see in results:

* Connector
* Transforms applied
* System that you're running on
* Network configuration
* Advanced configuration choices
* ODBC configuration

For the most broad coverage this documentation will focus on Query Diagnostics of the Northwind Customers table, both on SQL and OData. The OData notes use the public endpoint found at LOCATION, while you'll need to provide a SQL server for yourself. Many data sources will differ significantly from these, and will have connector specific documentation added over time.

## Authoring

The authoring workflow's primary difference is that it will generally generate more individual evaluations than seen in other workflows. As discussed in the primary Query Diagnostics article, these are a result of populating various user interfaces such as the navigator or filter dropdowns.

To get diagnostics on an authoring session, you first need to make sure that Query Diagnostics are enabled as a Preview Feature. When this is done, there will be a new 'Tools' tab on the Power Query ribbon. Click 'Start Diagnostics', then return back to the 'Home' tab to create a new Query.

If you trace an entire authoring session, you will generally expect to see something like a source query evaluation, then evaluations related to the relevant navigator, then at least one query emitted for each step you apply (with potentially more depending on the exact UX actions taken). In some connectors, parallel evaluations will happen for performance reasons that will yield very similar sets of data.

## Refresh

When you have finished transforming your data, you have a sequence of steps in a query. When you press 'Refresh' in the Power Query editor, you won't see just one step in your query diagnostics. The reason for this is that refreshing in the Power Query Editor explicitly refreshes the query ending with the last step applied, and then steps back through the applied steps and refreshes for the query up to that point, back to the source.

This means that if you have five steps in your query, including Source and Navigator, you will expect to see five different evaluations in your diagnostics. The first one, chronologically, will often (but not always) take the longest. This is due to two different reasons:

* It may potentially cache input data that the queries run after it (representing earlier steps in the User Query) can access faster locally.
* It may have transforms applied to it that significantly truncate how much data has to be returned.
