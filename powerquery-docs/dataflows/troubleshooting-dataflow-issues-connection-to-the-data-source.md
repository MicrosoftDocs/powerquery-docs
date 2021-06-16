---
title: Troubleshooting dataflow issues - connection to the data source
description: Troubleshooting dataflow issues - connection to the data source
author: radacad

ms.service: powerquery
ms.reviewer: kvivek
ms.topic: conceptual
ms.date: 12/3/2020
ms.author: bezhan
---

# Troubleshooting dataflow issues: Connection to the data source

When you create a dataflow, sometimes you get an error connecting to the data source. This error can be caused by the gateway, credentials, or other reasons. This article explains the most common connection errors and problems, and their resolution.

## Error: An on-premises data gateway is required to connect

This problem can happen when you move a query from Power Query in desktop tools to Power Query in the dataflow, and you get the error "An on-premises data gateway is required to connect."

![Gateway selection error](media/GatewaySelectError.png)

**Reason:**

When your entity in the dataflow gets data from an on-premises data source, a gateway is needed for the connection, but the gateway hasn't been selected.

**Resolution:**

Select **Select gateway**. If the gateway hasn't been set up yet, see [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install).

## Error: Please specify how to connect

This problem happens when you're connected to a data source, but haven't set up the credentials or connection details yet. It can happen when you migrate queries into a dataflow.

![Configure a connection](media/ConfigureConnection.png)

**Reason:**

The connection details aren't set up correctly.

**Resolution:**

Select **Configure connection**. Set up the connection details and credentials.

## Expression.Error: The module named 'xyz' has been disabled in this context

Sometimes, when you migrate your queries from Power Query in desktop tools to the dataflow, you get an error saying that a module is disabled in this context. One example of this situation is when your query uses functions such as `Web.Page` or `Web.BrowserContents`.

![Disabled module](media/DisabledModule.png)

**Reason:**

Disabled modules are related to functions that require an on-premises data gateway connection to work. Even if the function is getting data from a webpage, because of some security compliance requirements, it needs to go through a gateway connection.

**Resolution:**

First, [install and set up an on-premises gateway](/data-integration/gateway/service-gateway-install). Then add a web data source for the web URL you're connecting to.

![Add a web data source](media/WebDataSourceInGateway.png)

After adding the web data source, you can select the gateway in the dataflow from **Options** > **Project options**.

![Project options in the dataflow](media/ProjectOptions.png)

You might be asked to set up credentials. When you've set up the gateway and your credentials successfully, the modules will no longer be disabled."

![Disabled functions now working](media/DisabledFunctionWorkingFine.png)