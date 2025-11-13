---
title: Common Authoring Issues in Power Query
description: How to address common authoring issues in Power Query
author: ptyx507x
ms.topic: conceptual
ms.date: 1/18/2024
ms.author: miescobar
ms.subservice: user-assistance
---


# Common Issues

## Power Query

### Preserving sort

You might assume that if you sort your data, any downstream operations preserve the sort order.

For example, if you sort a sales table so that each store's largest sale is shown first, you might expect that doing a "Remove duplicates" operation returns only the top sale for each store. And this operation might, in fact, appear to work. However, this behavior isn't guaranteed.

Because of the way Power Query optimizes certain operations, including skipping them or offloading them to data sources (which can have their own unique ordering behavior), sort order isn't guaranteed to be preserved through aggregations (such as `Table.Group`), merges (such as `Table.NestedJoin`), or duplicate removal (such as `Table.Distinct`).

There are a number of ways to work around this. Here are a few suggestions:

* Perform a sort *after* applying the downstream operation. For example, when grouping rows, sort the nested table in each group before applying further steps. Here's some sample M code that demonstrates this approach: `Table.Group(Sales_SalesPerson, {"TerritoryID"}, {{"SortedRows", each Table.Sort(_, {"SalesYTD", Order.Descending})}})`
* Buffer the data (using `Table.Buffer`) before applying the downstream operation. In some cases, this operation causes the downstream operation to preserve the buffered sort order.
* Use [ranking](rank-column.md). For example, instead of using `Table.Distinct`, you could order by the column(s) containing the duplicate values, rank based on a tie-breaker column (such as `modified_date`), and then filter to keep just the rank 1 rows.

### Data type inference

Sometimes Power Query might incorrectly detect a column's data type. This is due to the fact that Power Query infers data types using only the first 200 rows of data. If the data in the first 200 rows is somehow different than the data after row 200, Power Query can end up picking the wrong type. (Be aware that an incorrect type won't always produce errors. Sometimes the resulting values are simply incorrect, making the issue harder to detect.)

For example, imagine a column that contains integers in the first 200 rows (such as all zeroes), but contains decimal numbers after row 200. In this case, Power Query infers the data type of the column to be Whole Number (Int64.Type). This inference results in the decimal portions of any non-integer numbers being truncated.

Or imagine a column that contains textual date values in the first 200 rows, and other kinds of text values after row 200. In this case, Power Query infers the data type of the column to be Date. This inference results in the non-date text values being treated as type conversion errors.

Because type detection works on the first 200 rows, but Data Profiling can operate over the entire data set, you can consider using the Data Profiling functionality to get an early indication in the Query Editor about Errors (from type detection or any number of other reasons) beyond the top N rows.

### Connections forcibly closed by the remote host

When connecting to various APIs, you might get the following warning:

`Data source error: Unable to read data from the transport connection: An existing connection was forcibly closed by the remote host`

If you run into this error, it's most likely a networking issue. Generally, the first people to check with are the owners of the data source you're attempting to connect to. If they don’t think they’re the ones closing the connection, then it’s possible something along the way is (for example, a proxy server, intermediate routers/gateways, and so on).

Whether this only reproduces with any data or only larger data sizes, it's likely that there's a network timeout somewhere on the route. If it's only with larger data, customers should consult with the data source owner to see if their APIs support paging, so that they can split their requests into smaller chunks. Failing that, alternative ways to extract data from the API (following data source best practices) should be followed.

### TLS RSA cipher suites are deprecated

Effective October 30, 2020, the following cipher suites are being deprecated from our servers.

* "TLS_RSA_WITH_AES_256_GCM_SHA384”
* "TLS_RSA_WITH_AES_128_GCM_SHA256”
* "TLS_RSA_WITH_AES_256_CBC_SHA256”
* "TLS_RSA_WITH_AES_128_CBC_SHA256”

The following list are the supported cipher suites:

* "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"
* "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384"
* "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"
* "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384"
* "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256"
* "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384"
* "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256"
* "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384"

Cipher suites are used to encrypt messages to secure a network connection between clients/servers and other servers. We're removing the above list of cipher suites to comply with our current security protocols. Beginning March 1, 2021, customers can only use our [standard cipher suites](/power-platform/admin/server-cipher-tls-requirements).

These are the cipher suites the server you connect to must support to connect from Power Query Online or Power BI.

In Power Query Desktop (Power BI, Excel), we don’t control your cipher suites. If you're trying to connect to Power Platform  (for example Power Platform Dataflows) or the Power BI Service, you need one of those cipher suites enabled on your OS. You may either upgrade the [Windows version](/windows/win32/secauthn/cipher-suites-in-schannel) or update the [Windows TLS registry](/windows-server/security/tls/tls-registry-settings) to make sure that your server endpoint supports one of these ciphers.

To verify that your server complies with the security protocol, you can perform a test using a TLS cipher and scanner tool. One example might be [SSLLABS](https://www.ssllabs.com/ssltest/analyze.html).

Customers must upgrade their servers before March 1, 2021. For more information about configuring TLS Cipher Suite order, see [Manage Transport Layer Security (TLS)](/windows-server/security/tls/manage-tls).

### Certificate revocation

An upcoming version of Power BI Desktop causes SSL connections failure from Desktop when any certificates in the SSL chain are missing certificate revocation status. This  is a change from the current state, where revocation only caused connection failure in the case where the certificate was explicitly revoked. Other certificate issues might include invalid signatures, and certificate expiration.

As there are configurations in which revocation status might be stripped, such as with corporate proxy servers, we'll be providing another option to ignore certificates that don't have revocation information. This option allows situations where revocation information is stripped in certain cases, but you don't want to lower security entirely, to continue working.

It isn't recommended, but users can continue to be able to turn off revocation checks entirely.

### Error: Evaluation was canceled

Power Query returns the message "Evaluation was canceled" when background analysis is disabled and the user switches between queries or closes the Query Editor while a query is in the process of refreshing.

### Error: The key didn't match any rows in the table

There are many reasons why Power Query might return an error that **the key didn't match any rows in the table**. When this error happens, the Mashup Engine is unable to find the table name it's searching for. Reasons why this error might happen include:

* The table name has been changed, for example in the data source itself.
* The account used to access the table doesn't have sufficient privileges to read the table.
* There can be multiple credentials for a single data source, which [isn't supported in Power BI Service when using Personal Cloud Connections](/power-bi/connect-data/refresh-data#accessing-cloud-data-sources). This error might happen, for example, when the data source is a cloud data source and multiple accounts are being used to access the data source at the same time with different credentials. If the data source is on-premises, you'll need to use the on-premises data gateway.

### Limitation: Domain-joined requirement for gateway machines when using Windows authentication

Using Windows authentication with an on-premises gateway requires the gateway machine to be domain joined. This applies to any connections that are set up with "Windows authentication through the gateway*. Windows accounts that are used to access a data source might require read access to the shared components in the Windows directory and the gateway installation.

### Limitation: Cross tenant OAuth2 refresh isn't supported in Power BI service

If you want to connect to a data source from Power BI service using OAuth2, the data source must be in the same tenant as Power BI service. Currently, multi-tenant connection scenarios aren’t supported with OAuth2.

### Limitation: Custom AD FS authentication endpoint isn't supported in Power BI service

The ability to use a custom Active Directory Federation Services (AD FS) authentication endpoint isn't supported in Power BI service. Users might encounter the following error: **The token service reported by the resource is not trusted**.

### Limitation: Guest accounts aren't supported

Using guest accounts of a tenant to connect to data using Power Query connectors isn't currently supported.

### Expression.Error: Evaluation resulted in a stack overflow and cannot continue

Stack overflow errors can be caused by a bug in your M code. For example, the following function produces a stack overflow because it repeatedly calls back into itself without any kind of end condition. A function that calls itself like this is known as a "recursive" function.

`let f = (x) => @f(x + 1) in f(0)`

Here are some common ways to resolve a stack overflow in your M code.
* Ensure that your recursive functions actually terminate when the expected end condition is reached.
* Replace recursion with iteration (for example, by using functions such as [List.Transform](/powerquery-m/list-transform), [List.Generate](/powerquery-m/list-generate), or [List.Accumulate](/powerquery-m/list-accumulate)).

### Expression.Error: Evaluation ran out of memory and can't continue

"Out of memory" errors (or OOMs) can be caused by doing too many memory intensive operations against very large tables. For example, the following M code produces an OOM because it attempts to load a billion rows into memory at once.

`Table.Buffer(Table.FromList({1..1000000000}, Splitter.SplitByNothing()))`

To resolve out of memory errors, optimize memory intensive operations like sorts, joins, grouping, and distincts by ensuring they fold to the source, or by removing them altogether where possible. Sorts, for example, are often unnecessary.

### Power Query Online cannot connect via public endpoint when a private endpoint is configured to a Storage
When a private endpoint to a Storage Account is configured, Power Query Online will always resolve the private link address and cannot connect via the public internet—even if public access is set to “Allowed” in the private endpoint configuration.

This behavior occurs because the private endpoint takes precedence over public connectivity. As a result, any attempt to connect without a gateway will fail.


## Dataflows

### Cancel dataflow refresh

Sometimes you start a dataflow refresh, but after starting it you realize you wanted to change one more thing before refreshing your data. In that case, you have to wait until the refresh is finished. Stopping a refresh midway as the process is already working on getting the data and updating the tables in your workspace or environment isn't currently supported.

We do plan to add support for canceling a dataflow refresh in the future.
