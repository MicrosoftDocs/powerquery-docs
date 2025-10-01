---
title: Alternatives to out-of-box connectivity in Power Query Desktop
description: Provides users alternatives to connect to their data when no out-of-box connector is available
author: ptyx507x
ms.topic: conceptual
ms.date: 9/11/2025
ms.author: miescobar
ms.subservice: get-data
---

# Alternatives to out-of-box connectivity in Power Query

While Power Query offers out-of-box connectivity to over 150 data sources, there might be cases where you want to connect to a data source for which no out-of-box connector is available.

## Connectivity through generic interfaces

It might be possible to connect to certain data sources without a built-in out-of-box connector by using generic interface connectors.

For example, the [ODBC](connectors/odbc.md) connector can connect to services with ODBC interfaces, and the [Web](connectors/web/web.md) connector can connect to services with REST API interfaces.

Using available Power Query out-of-box generic interface connectors to connect through interfaces that the end data source supports lets you connect to many more data sources on the internet than there are specific out-of-box connectors for.

To learn more about connectivity through generic interfaces, go to [Connect to data using generic interfaces](connect-using-generic-interfaces.md).

## Connectivity through a custom connector

The [Power Query SDK](./installingsdk.md) lets you create custom connectors to unblock connectivity scenarios to Power Query. You can create and distribute custom connectors to end services and data sources they can authenticate to.

Community members and organizations can also share custom connectors that they've created. While Microsoft doesn't offer any support, ownership, or guarantees for these custom connectors, you might be able to use them for your scenarios. The Microsoft Partner Program also includes many partners that can build Power Query custom connectors. To learn more about the program or find a partner, go to [Contact a Power BI or Fabric Partner](https://powerbi.microsoft.com/find-a-partner/?term=Power+Query).