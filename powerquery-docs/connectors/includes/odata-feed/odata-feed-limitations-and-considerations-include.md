---
title: Include file for the Limitations and considerations section of the Power Query Odata Feed connector documentation
description: Include file for the Limitations and considerations section of the Power Query Odata Feed connector documentation
ms.date: 03/10/2026
ms.topic: include
---

### Connections closed when joining with OData / Web sources

Due to the architecture of OData and other web connectors, joins can be slow. A slow join can sometimes cause the source to fail the connection, resulting in an error such as 'An existing connection was forcibly closed by the remote host.' While you have the option to use navigation columns when merging between tables from an OData source, you don't have this option when merging with non-OData sources. If you're seeing such issues when merging an OData or Web source, and are unable to use a navigation column instead, you should apply [Table.Buffer](/powerquery-m/table-buffer) to your query in the advanced editor before you merge the data.

We recommend buffering the smaller of the queries being merged to optimize the performance. You can also try switching the order of the queries in the join to optimize the query.

### Test Connection issues

In cases where you're passing in a URL to the OData connector that's not just the service root (for example, if you have a filter on the URL), when you set up refresh in the service you should select **Skip Test Connection**.

When you enter credentials for an OData service into Power BI service (for example, after publishing a PBIX that uses `OData.Feed`), Power BI service tests the credentials but ignores any query options that were specified in the M query. These query options might have been specified directly in the formula (for example, using the formula bar or advanced editor), or might have been added by the Power Query editor by default. You can find the full list of these query options in [OData.Feed](/powerquery-m/odata-feed).

### Authenticating to arbitrary services

Some services support the ability for the OData connector to authenticate with OAuth/Microsoft Entra ID authentication out of the box. However, this ability doesn't work in most cases.

When attempting to authenticate, if the following error occurs:

`We were unable to connect because this credential type isn’t supported for this resource. Please choose another credential type.`

:::image type="content" source="/power-query/connectors/media/odata-feed/credential-type-not-supported.png" alt-text="Screenshot of the error from connecting to an endpoint that doesn't support OAuth with the web connector.":::

Contact the service owner. They either need to change the authentication configuration or build a custom connector.

### Maximum URL length

If you're using the OData feed connector to connect to a SharePoint list, SharePoint online list, or Project Online, the maximum URL length for these connections is approximately 2,100 characters. Exceeding the character limit results in a 401 error. This maximum URL length is built in the SharePoint front end and can't be changed.

To get around this limitation, start with the root OData endpoint and then navigate and filter inside Power Query. Power Query filters this URL locally when the URL is too long for SharePoint to handle. For example, start with:

`OData.Feed("https://contoso.sharepoint.com/teams/sales/_api/ProjectData")`

instead of

`OData.Feed("https://contoso.sharepoint.com/teams/sales/_api/ProjectData/Projects?select=_x0031_MetricName...etc...")`
