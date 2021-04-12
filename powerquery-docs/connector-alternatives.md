---
title: Alternatives to out-of-box connectivity in Power BI Desktop
description: Provides users alternatives to connect to their data when no out-of-box connector is available
author: bezhan-msft
ms.service: powerquery
ms.topic: conceptual
ms.date: 04/08/2020
ms.author: bezhan

LocalizationGroup: reference
---

# Alternatives to out-of-box connectivity in Power BI Desktop

## Introduction

While Power BI Desktop offers out-of-box connectivity to over 150 data sources, there may be cases where a user wishes to connect to a data source for which no out-of-box connector is available. 

This article describes connectivity options available to users in those cases.

## Connectivity through generic interfaces

It may be possible to connect to certain data sources without a built-in out-of-box connector by using generic interface connectors.

For example, the **ODBC** connector can connect to services with ODBC interfaces, and the **Web** connector can connect to services with REST API interfaces.

Using available Power BI out-of-box generic interface connectors to connect through interfaces that the end data source supports allows users to connect to many more data sources on the internet than there are specific out-of-box connectors for. 

Learn more about connectivity through generic interfaces [here](/power-bi/connect-data/desktop-connect-using-generic-interfaces).

## Connectivity through a custom connector

The [Power Query SDK](./installingsdk.md) allows users to create custom connectors to unblock connectivity scenarios to Power BI Desktop. Users can create and distribute custom connectors to end services and data sources they can authenticate to. 

Community members and organizations may also share custom connectors that they've created. While Microsoft doesn't offer any support, ownership, or guarantees for these custom connectors, users may be able to use them for their scenarios. 

Users that own an end service or data source can create a custom connector and may be eligible to [certify](./CertificationSubmission.md) the connector to have it made available publicly out-of-box within Power BI Desktop. 

## Request the data source owner to build and certify a connector

As only the data source owner or an approved third party can build and certify a custom connector for any service, end users are encouraged to share the demand for a connector directly with the data source owner to encourage investment into creating and certifying one.

## Request in Power BI Ideas forum

In addition to directly engaging the data source owner, users should also create or vote on ideas in the (Power BI Ideas Forum)[https://ideas.powerbi.com] to demonstrate the need and demand for a connector. This feedback may also help encourage the data source owner to invest into a certified connector available for users out-of-box in Power BI Desktop. 