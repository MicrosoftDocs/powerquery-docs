---
title: Alternatives to out-of-box connectivity in Power BI Desktop
description: Provides users alternatives to connect to their data when no out-of-box connector is available
author: bezhan-msft
ms.topic: conceptual
ms.date: 1/5/2023
ms.author: bezhan
---

# Alternatives to out-of-box connectivity in Power BI Desktop

While Power BI Desktop offers out-of-box connectivity to over 150 data sources, there might be cases where you want to connect to a data source for which no out-of-box connector is available.

## Connectivity through generic interfaces

It might be possible to connect to certain data sources without a built-in out-of-box connector by using generic interface connectors.

For example, the [ODBC](connectors/odbc.md) connector can connect to services with ODBC interfaces, and the [Web](connectors/web/web.md) connector can connect to services with REST API interfaces.

Using available Power BI out-of-box generic interface connectors to connect through interfaces that the end data source supports lets you connect to many more data sources on the internet than there are specific out-of-box connectors for.

To learn more about connectivity through generic interfaces, go to [Connect to data using generic interfaces](connect-using-generic-interfaces.md).

## Connectivity through a custom connector

The [Power Query SDK](./installingsdk.md) lets you create custom connectors to unblock connectivity scenarios to Power BI Desktop. You can create and distribute custom connectors to end services and data sources they can authenticate to.

Community members and organizations can also share custom connectors that they've created. While Microsoft doesn't offer any support, ownership, or guarantees for these custom connectors, you might be able to use them for your scenarios. The Power BI Partner Program also includes many partners that can build custom connectors. To learn more about the program or find a partner, go to [Contact a Power BI Partner](https://powerbi.microsoft.com/find-a-partner/?term=Power+Query).

Users that own an end service or data source can create a custom connector and might be eligible to [certify](./CertificationSubmission.md) the connector to have it made available publicly out-of-box within Power BI Desktop.

## Request the data source owner to build and certify a connector

As only the data source owner or an approved third party can build and certify a custom connector for any service, end users are encouraged to share the demand for a connector directly with the data source owner to encourage investment into creating and certifying one.

## Request in Power BI Ideas forum

In addition to directly engaging the data source owner, you should also create or vote on ideas in the [Power BI Ideas Forum](https://ideas.powerbi.com) to demonstrate the need and demand for a connector. This feedback also helps encourage the data source owner to invest in a certified connector that's available for users out-of-box in Power BI Desktop.
