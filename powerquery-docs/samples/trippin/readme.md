---
title: TripPin tutorial sequence
description: Overview and listing of the TripPin connector development tutorial sequence.
author: ptyx507x

ms.topic: tutorial
ms.date: 6/6/2024
ms.author: miescobar
ms.custom:
---

# TripPin Tutorial

This multi-part tutorial covers the creation of a new data source extension for Power Query. The tutorial is meant to be done sequentially&mdash;each lesson builds on the connector created in previous lessons, incrementally adding new capabilities to your connector.

This tutorial uses a public [OData](https://www.odata.org/documentation/) service ([TripPin](https://services.odata.org/v4/TripPinService/)) as a reference source. Although this lesson requires the use of the M engine's OData functions, subsequent lessons will use [Web.Contents](/powerquery-m/web-contents), making it applicable to (most) REST APIs.

## Prerequisites

The following applications will be used throughout this tutorial:

* [Power BI Desktop](https://aka.ms/pbiSingleInstaller), May 2017 release or later
* [Power Query SDK for Visual Studio Code](https://aka.ms/powerquerysdk)
* [Fiddler](https://www.telerik.com/fiddler)&mdash;Optional, but recommended for viewing and debugging requests to your REST service

It's strongly suggested that you review:

* [Installing the PowerQuery SDK](../../install-sdk.md#installing-the-power-query-sdk)
* [Start developing custom connectors](../../install-sdk.md#connector-development-process)
* [Creating your first connector: Hello World](../../creating-first-connector.md)
* [Handling Data Access](../../handling-data-access.md)
* [Handling Authentication](../../handling-authentication.md)

>[!Note]
>You can also start trace logging of your work at any time by enabling diagnostics, which is described later on in this tutorial. More information: [Enabling diagnostics](8-diagnostics/readme.md#enabling-diagnostics)

## Parts

|Part|Lesson                               |Details|
|----|:------------------------------------|:----------------------------------------------------|
|1   |[OData](1-odata/readme.md)                     |Create a simple Data Connector over an OData service |
|2   |[Rest](2-rest/readme.md)                       |Connect to a REST API that returns a JSON response   |
|3   |[Nav Tables](3-navtables/readme.md)            |Provide a navigation experience for your source    |
|4   |[Data Source Paths](4-paths/readme.md)         |How credentials are identified for your data source  |
|5   |[Paging](5-paging/readme.md)                   |Read with a paged response from a web service        |
|6   |[Enforcing Schema](6-schema/readme.md)         |Enforce table structure and column data types        |
|7   |[Advanced Schema](7-advancedschema/readme.md)  |Dynamically enforce table structure using M types and external metadata |
|8   |[Diagnostics](8-diagnostics/readme.md)         |Add detailed tracing to the connector                |
|9   |[Test Connection](9-testconnection/readme.md)  |Implement a TestConnection handler to enable refresh through the gateway |
|10  |[Basic query Folding](10-tableview1/readme.md)|Implement basic query folding handlers               |
