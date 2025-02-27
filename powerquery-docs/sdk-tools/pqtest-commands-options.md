---
title: Commands and options
description: Provides a list of commands and options in the test harness
author: ryan-syed
ms.topic: conceptual
ms.date: 02/14/2024
ms.author: v-ryansyed
ms.subservice: custom-connectors
---

# Commands and options

PQTest offers a suite of commands, each with its own set of options, to streamline your testing process. Detailed explanations and usage instructions for these commands are outlined in the sections that follow.

## Commands

The following table lists all the commands for PQTest.exe:

| Command             | Description                                                                                                                                                       |
| :------------------ | :-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| credential-template | Generates a template for setting data source credentials.                                                                                                         |
| compare             | Executes PQ (test file) and compares the results with PQOut (test output file). If the test output file doesn't exist, it will automatically be generated for you.|
| delete-credential   | Deletes credentials from the credential store.                                                                                                                    |
| discover            | Returns data source discovery results for a given expression.                                                                                                     |
| info                | Returns all extension module information.                                                                                                                         |
| list-credential     | Returns all credentials in the credential store.                                                                                                                  |
| oauth               | Displays OAuth client information for a given expression or data source.                                                                                          |
| refresh-credential  | Refreshes OAuth credentials in the credential store.                                                                                                              |
| run-test            | Executes tests and returns the results.                                                                                                                           |
| set-credential      | Sets a credential and saves it into the credential store.                                                                                                         |
| test-connection     | Performs a TestConnection call for a given connector.                                                                                                             |
| validate            | Validates the connector's TestConnection implementation.                                                                                                          |
| version             | Returns product version information.                                                                                                                              |

## Options

The following table lists all the options for PQTest.exe commands:

| Option                         | Abbr. | Description                                                                                                             |
| :----------------------------- | :---- | :-----------------------------------------------------------------------------------------------------------------------|
| --help                         | -?/-h | Displays help information for commands and options.                                                                     |
| --authenticationKind           | -ak   | Specifies the authentication kind (Anonymous, UsernamePassword, Key, Windows, OAuth2).                                  |
| --applicationProperty          | -ap   | Individual application property setting (key=value format).                                                             |
| --applicationPropertyFile      | -apf  | Path to application properties file.                                                                                    |
| --diagnosticChannels           | -dc   | List of diagnostic channels to subscribe for the Mashup Connection (currently supported: Odbc).                         |
| --dataSourceKind               | -dsk  | Data source kind.                                                                                                       |
| --dataSourcePath               | -dsp  | Data source path.                                                                                                       |
| --environmentConfiguration     | -ec   | Individual environment configuration setting (key=value format).                                                        |
| --environmentConfigurationFile | -ecf  | Path to the environment configuration file.                                                                             |
| --extension                    | -e    | Specify connector extension source modules (.mez/.pqx).<br>This option can be specified more than once.                 |
| --failOnFoldingFailure         | -foff | Replicates DirectQuery behavior by failing when a query doesn't completely fold.                                        |
| --failOnMissingOutputFile      | -fomof| Compare doesn't generate a PQOut file and fails if it doesn't exist.                                                    |
| --interactive                  |       | Allow user interaction (for example authentication).                                                                    |
| --keyVault                     | -kv   | Use Azure Key Vault for credential storage with the given secret name.                                                  |
| --logMashupEngineTraces        | -l    | Enable logging. Accepted values are: `all` \| `user` \| `engine`.                                                       |
| --parameterQueryFile           | -pa   | Parameter query file that contains M expression (.m/.pq) pointing at the test data on datasource.                       |
| --prettyPrint                  | -p    | Specify tabbed expansion of JSON output that's more easily readable.                                                    |
| --queryFile                    | -q    | Query file containing section document or M expression (.m/.pq).                                                        |
| --settingsFile                 | -sf   | Path to settings JSON file that has configurations for test runs.                                                       |
| --trxReportPath                | -trx  | Generates a TRX (Visual Studio Test Results File) results file and separate JSON files for each test in a given path.   |
| --useLegacyBrowser             |       | Use legacy browser control (IE11) for interactive OAuth flow (instead of Microsoft Edge Chromium/Webview2).             |
| --useSystemBrowser             |       | Use system browser for interactive OAuth flow.                                                                          |
