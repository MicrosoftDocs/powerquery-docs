---
title: Common Authoring Issues in Power Query
description: How to address common authoring issues in Power Query
author: cpopell

ms.service: powerquery
ms.topic: conceptual
ms.date: 12/19/2019
ms.author: gepopell

LocalizationGroup: reference
---


# Common Issues

## Preserving Sort

In Power Query, you'll often want to sort your data before you perform some other operation. For example, if you wanted to sort a sales table by the Store ID and the sale amount, and then you wanted to perform a group, you might expect sort order to be preserved. Due to how operation application works however, sort order is not preserved through aggregations or joins. 

If you sorted your table, applied an aggregation, and then you tried to apply a distinct to the original sort operation, you might be surprised to find out that you had lost both the first and the second sort. In other words, if you had two rows with sales for a single store, and you had them sorted in descending order so that the first row had a greater dollar value than the second, you might find that the second row was preserved when you ran a distinct on the Store ID.

There are ways to achieve this outcome via a smart combination of aggregations, but these aren't exposed by the user experience. Unfortunately, there are a sufficiently large number of possible transformations here that we can't give an example for all outcomes, but here is how you might address the problem above.

```
let
    Source = Sql.Database("Server", "AdventureWorks"),
    Sales_SalesPerson = Source{[Schema="Sales",Item="SalesPerson"]}[Data],
    #"Grouped Rows" = Table.Group(Sales_SalesPerson, {"TerritoryID"}, {{"Rows", each _}}),
    Custom1 = Table.TransformColumns(#"Grouped Rows", {{"Rows", each Table.FirstN(Table.Sort(_, {"SalesYTD", Order.Descending}), 1)}})
in
    Custom1
```

The data you want is the entire record with the highest SalesYTD in each TerritoryID. If you only wanted the max, it would be an aggregation&mdash;but you want the entire input record. To get this, you need to group by TerritoryID and then sort inside each group, keeping the first record.

## Data Type Inference

When you import a table, you may find that Power Query sometimes incorrectly detects a column’s data type. One reason incorrect detection can happen is that Power Query infers data types using only the first 200 rows of data. If the data in the first 200 rows is somehow different than the data after row 200, Power Query may detect an incorrect column type. This may or may not result in errors, which can make the incorrect type inference tricky to detect in some cases.
                                                                                                          
As an example, imagine a column that contains integers in the first 200 rows (such as all zeroes), but contains decimal numbers after row 200. In this case, Power Query will infer the data type of the column to be Whole Number (Int64.Type). This will result in the decimal portions of any non-integer numbers being truncated.

Or imagine a column that contains textual date values in the first 200 rows, and other kinds of text values after row 200. In this case, Power Query will infer the data type of the column to be Date. This will result in the non-date text values being treated as type conversion errors.

Because type detection works on the first 200 rows, but Data Profiling can operate over the entire dataset, you can consider using the Data Profiling functionality to get an early indication in the Query Editor about Errors (from type detection or any number of other reasons) beyond the top N rows.

## Connections forcibly closed by the remote host

When connecting to various APIs, you might get the following warning:

`Data source error: Unable to read data from the transport connection: An existing connection was forcibly closed by the remote host`

If you run into this error, it's most likely a networking issue. Generally, the first people to check with are the owners of the data source you're attempting to connect to. If they don’t think they’re the ones closing the connection, then it’s possible something along the way is (for example, a proxy server, intermediate routers/gateways, and so on).

Whether this only reproduces with any data or only larger data sizes, it's likely that there's a network timeout somewhere on the route. If it's only with larger data, customers should consult with the data source owner to see if their APIs support paging, so that they can split their requests into smaller chunks. Failing that, alternative ways to extract data from the API (following data source best practices) should be followed.

## TLS RSA cipher suites are deprecated

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

Cipher suites are used to encrypt messages to secure a network connection between clients/servers and other servers. We are removing the above list of cipher suites to comply with our current security protocols. Beginning March 1, 2021, customers can only use our [standard cipher suites](https://docs.microsoft.com/power-platform/admin/server-cipher-tls-requirements).

These are the cipher suites the server you connect to must support to connect from Power Query Online or Power BI.

In Power Query Desktop (Power BI, Excel), we don’t control your cipher suites. If you're trying to connect to Power Platform  (for example Power Platform Dataflows) or the Power BI Service, you will need one of those cipher suites enabled on your OS. You may either upgrade the [Windows version](https://docs.microsoft.com/windows/win32/secauthn/cipher-suites-in-schannel) or update the [Windows TLS registry](https://docs.microsoft.com/windows-server/security/tls/tls-registry-settings) to make sure that your server endpoint supports one of these ciphers.

 To verify that your server complies with the security protocol, you can perform a test using a TLS cipher and scanner tool. One example might be [SSLLABS](https://www.ssllabs.com/ssltest/analyze.html).

Customers must upgrade their servers before March 1, 2021. For more information about configuring TLS Cipher Suite order, see [Manage Transport Layer Security (TLS)](https://docs.microsoft.com/windows-server/security/tls/manage-tls).

## Certificate revocation

An upcoming version of Power BI Desktop will cause SSL connections failure from Desktop when any certificates in the SSL chain are missing certificate revocation status. This  is a change from the current state, where revocation only caused connection failure in the case where the certificate was explicitly revoked. Other certificate issues might include invalid signatures, and certificate expiration.

As there are configurations in which revocation status may be stripped, such as with corporate proxy servers, we will be providing another option to ignore certificates that don't have revocation information. This option will allow situations where revocation information is stripped in certain cases, but you don't want to lower security entirely, to continue working.

It isn't recommended, but users will continue to be able to turn off revocation checks entirely.

## Cancelled evaluation error

Power Query will return the message "Evaluation was cancelled" when background analysis is disabled and the user switches between queries or closes the Query Editor while a query is in the process of refreshing.
