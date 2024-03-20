---
title: Setting up a pipeline for testing Power Query connectors
description: High level guide for setting up a pipeline for the automated testing of Power Query connectors
author: v-jbrandrick
ms.topic: reference
ms.date: 01/09/2024
ms.author: v-jbrandrick
---

# Power Query SDK test framework part 7 - Pipeline guide

This multi-part reference covers the setup and running of a standard suite of tests for Power Query connector developers. The reference is meant to be done sequentially to ensure that your environment is set up for testing your custom connector.

This guide provides you with the steps that are needed for setting up a pipeline for the Power Query SDK test framework.

In this section, you:

> [!div class="checklist"]
>
> * Overview of setting up the pipeline
> * Set up a pipeline agent
> * Learn to configure the connector, including driver and credentials setup
> * Run the tests to verify your extension connector
> * Generate the report of the test run

## Pipeline setup guide for Power Query connectors

This guide provides you with the steps that are needed for setting up a pipeline for the Power Query SDK test framework. On a high level, it requires setting up an agent, configuring the connector being tested including any drivers setup, configuring the credentials for PQTest with the supported authentication mechanism, running the tests, and reporting the results. This document uses Azure Pipelines and resources for all of its examples. However these concepts can be applied to other pipeline architectures.

The pipeline uses the following structure:

1. Retrieve the tests from a repo.
2. Retrieve and/or set the credentials to access the data source using the supported authentication mechanism.
3. Run the tests retrieved in the prior step.
4. Update the results and logs.

The Azure Pipelines documentation describes [how to setup a basic pipeline](/azure/devops/pipelines/create-first-pipeline). Refer to the following sections for advice on setting up these features.

* Agent Prerequisites
  * Networking
  * Permissions
  * PQTest
  * Drivers
* Credentials
* Scripts
  * Automated Credential Access
  * Running Tests
  * Automating Scripts

## Agent Prerequisites

The pipeline agent needs to include the Power Query SDK and be configured to be able to run PQTest. This configuration includes access to the relevant data source and credential manager if applicable.

These requirements can all be fulfilled using a [Self-Hosted Agent](/azure/devops/pipelines/agents/windows-agent). Azure Pipelines can provide [Microsoft-Hosted agents](/azure/devops/pipelines/agents/hosted), but these agents are unlikely to contain the Power Query SDK and there might be networking hurdles to consider. Using a virtual machine or physical computer as a pipeline agent can ensure that PQTest can connect to your data source.

### Networking

To run connector tests, the agent needs to be able to access the relevant data source. Cloud data sources (for example, Snowflake and Google Big Query) likely are easily accessible, however on-premises data sources (for example, SAP BW and SQL Server) need more configurations. These configurations could require that you ensure the agent is connected to the same virtual network, the agent's firewall allows the correct ports, and so on.

### Permissions

If your intention is to automatically pull credentials from a key vault, the agent needs a method to do so. The recommended method is to [set a managed identity for a virtual machine](/azure/active-directory/managed-identities-azure-resources/qs-configure-portal-windows-vm) and assign the necessary permissions to the key vault.

### PQTest

The PQTest executable needs to be on installed onto the agent. The recommended method is to download the [Power Query SDK NuGet package](https://www.nuget.org/packages/Microsoft.PowerQuery.SdkTools/) and unzip it onto the agent.

The PQTest executable can be found in the NuGet packages \tools folder. Use the **--help** argument to display help information for PQTest.exe and familiarize yourself with its commands.

### Drivers

For ODBC connectors, any drivers need to be added to an ODBC Drivers folder at the following path:

\<*power_query_sdk_extension_path*>\Microsoft.PowerQuery.SdkTools.2.*xxx.x*\tools\ODBC Drivers\<drivers>

Example for Contoso driver, the path could be as follows :

C:\Users\ContosoUser\.vscode\extensions\powerquery.vscode-powerquery-sdk-0.2.3-win32-x64\.nuget\Microsoft.PowerQuery.SdkTools.2.126.3\tools\ODBC Driver\Contoso

## Credentials

Credentials are passed to PQTest using either the Visual Studio Code extension or the **set-credential** command through the command line. Once set, these credentials can be reused for multiple test runs.

Depending on the type of authentication, these credentials might only need to be set once (Username/Password) or kept updated (OAuth2 refresh token). The former case can be set up easily by using the Visual Studio Code interface. The latter case can be accomplished by creating a script.

## Scripts

PQTest can be used entirely from the command line, which allows for automation through scripts.

### Automated Credential Access

To automate credential access for PQTest, we recommend using a key vault. This way credentials can be refreshed easily and it can be scripted.

1. The first step is to [grant access](/entra/identity/managed-identities-azure-resources/tutorial-windows-vm-access-nonaad) to the agent's managed identity.
2. Then you can invoke a Rest API to [access data](/entra/identity/managed-identities-azure-resources/tutorial-windows-vm-access-nonaad).

Now that you have a way to get secrets, you can add them to PQTest's credential cache.

1. Use the **credential-template** command to create a JSON template. This template contains placeholder text (`$$USERNAME$$`, `$$REFRESH_TOKEN$$`, and so on), which can be dynamically altered through string replace functions.

    ```PowerShell
    $keyVaultOutput = invoke-expression 'Get-AzKeyVaultSecret -VaultName $keyVaultName -Name $secretName -AsPlainText'
    $jsonTemplate = invoke-expression "$pqTestExe credential-template -e $extensionFile -q $queryFile -ak $authenticationType"
    $jsonCredential = $jsonTemplate.Replace('$$USERNAME$$', $credentialName)
    $jsonCredential = $jsonCredential.Replace('$$PASSWORD$$', $keyVaultOutput)
    ```

2. Pass the altered JSON template to the **set-credential** command using either pipe (|) or input (<).

    ```PowerShell
    $jsonCredential | & $pqTestExe set-credential -e $extensionFile -q $queryFile
    ```

Now that credentials are set, tests can be run.

Note: The list-credential command can be used to confirm the credential are properly set.

### Running Tests

Tests can be run through the command using the **compare** command. For example, to run a single test:

`.\PQTest.exe compare -e <connector file> -q <query file> -p`

To run multiple tests:

`.\PQTest.exe compare -e <connector file> -q <query folder> -sq <base query file> -p`

### Automating Scripts

Scripts can be automated by running them from a pipeline task. For Azure Pipelines, the [PowerShell task](/azure/devops/pipelines/tasks/reference/powershell-v2?view=azure-pipelines) can be used:

```yaml
# Example Azure pipeline for running connector tests using PQTest.
# Azure Pipelines reference: https://aka.ms/yaml
trigger: none
pool:
  name: SelfHosted-AgentPool
steps:
  - task: PowerShell@2
    inputs:
      filePath: '<path_to_run_test_script>/RunConnectorTest.ps1'
    displayName: 'Run Connector Tests'
```

## Conclusion

This section showed you how to set up and configure the pipeline to use the Power Query SDK test framework, using the provided test suite and also your own tests to validate your extension connector.

Overall, you should now be able to reliably make changes to your extension and validate it during the development and release.
