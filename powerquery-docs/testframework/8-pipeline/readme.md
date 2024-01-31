
---
title: Setting up a pipeline for testing Power Query connectors
description: High level guide for setting up a pipeline for the automated testing of Power Query connectors
author: v-jbrandrick
ms.topic: conceptual
ms.date: 1/9/2024
ms.author: v-jbrandrick
---

# Pipeline Setup Guide for Power Query connectors

This guide provides you with the steps that are needed for setting up a pipeline for PQ SDK Test Framework. On a high level, it requires setting up an agent, configure the connector being tested including any drivers setup, configure the credentials for PQTest with the supported authentication mechanism, running the tests and reporting the results. This document uses Azure Pipelines and resources for all of its examples, however these concepts can be applied to other pipeline architectures.
The pipeline uses the following structure:

- Retrieve the tests from a repo
- Retrieve and/or set the credentials to access the data source using the supported authentication mechanism
- Run the tests retrieved in the prior step
- Update the results and logs

The Azure Pipelines has documentation on [how to setup a basic pipeline](/azure/devops/pipelines/create-first-pipeline). Refer to the following sections for advice on setting up these features.

- Agent Prerequisites
  - Networking
  - Permissions
  - PQTest
  - Drivers
- Credentials
- Scripts
  - Automated Credential Access
  - Running Tests
  - Automating Scripts

## Agent Prerequisites

The pipeline agent needs to include the Power Query SDK and be configured to be able to run PQTest. This configuration includes access to the relevant data source and credential manager if applicable.

These requirements can all be fulfilled using a [Self-Hosted Agent](/azure/devops/pipelines/agents/windows-agent). Azure Pipelines can provide [Microsoft-Hosted agents](/azure/devops/pipelines/agents/hosted), but these agents are unlikely to contain the Power Query SDK and there might be networking hurdles to consider. Using a virtual machine or physical computer as a pipeline agent can ensure that PQTest can connect to your data source.

### Networking

To run connector tests, the agent needs to be able to access the relevant data source. Cloud data sources (for example: Snowflake and Google Big Query) likely are easily accessible, however on-premises data sources (for example: SAP BW and SQL Server) need more configurations. These configurations could mean to ensure the agent is connected to the same virtual network, the agent's firewall allows the correct ports, etc.

### Permissions

If the intention is to automatically pull credentials from a key vault, the agent needs a method to do so. The recommended method is to [set a managed identity for a virtual machine](/azure/active-directory/managed-identities-azure-resources/qs-configure-portal-windows-vm) and assigning the necessary permissions to the key vault.

### PQTest

The PQTest executable needs to be on installed onto the agent. The recommended method is to download the [Power Query SDK NuGet package](https://www.nuget.org/packages/Microsoft.PowerQuery.SdkTools/) and unzip it onto the agent.

The PQTest executable can be found in the NuGet packages *tools* folder. Use the *--help* argument to display help information for PQTest.exe and familiarize yourself with its commands.

### Drivers

For ODBC connectors, any drivers need to be added to an ODBC Drivers folder alongside PQTest.exe.

```m
Microsoft.PowerQuery.SdkTools folder
    tools
        ODBC Drivers
            <drivers>
        PQTest.exe