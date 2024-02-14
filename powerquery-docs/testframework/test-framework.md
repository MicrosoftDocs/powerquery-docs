---
title: Power Query SDK Test Framework reference sequence
description: Overview and listing of the PowerQuery SDK Testing Framework reference sequence.
author: ryan-syed

ms.topic: reference
ms.date: 01/19/2024
ms.author: v-ryansyed
ms.custom:
---

# Power Query SDK Test Framework Reference

This multi-part reference covers the setup and running of a standard suite of tests for Power Query connector developers. The reference is meant to be followed sequentially—to ensure that your environment is set up for testing your extension connector.

This reference uses Power Query SDK Test Framework, a standardized test suite, and a modified version of the [NewYork City Taxi & Limousine Commission (TLC)](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page) green trip record data. The subsequent lessons walk through the steps to get your environment setup to validate your extension connector.

The Test Framework allows Power Query SDK Developers to have access to standard tests and a test harness to verify the direct query (DQ) capabilities of an extension connector. With this new capability, developers have a standard way of verifying connectors and a platform for adding custom tests. We envision this as the first step in enhancing the productivity of the testing workflow provided by the Power Query SDK.

## What is Power Query SDK Test Framework?

Power Query SDK Test Framework is a ready-to-go test harness with prebuilt tests to standardize the testing of new and existing extension connectors. It provides the ability to perform functional, compliance, and regression testing-at-scale. It helps address the need for a comprehensive test framework to satisfy the needs of extension connectors.

:::image type="content" source="../connectors/media/test-framework/power-query-sdk-test-framework-design.png" alt-text="Test Framework Design":::

## Workflow for a developer

Following is the typical workflow to work with the Test Framework for a Power Query SDK Developer:

* **Install the Power Query SDK VS Code Extension:** A connector developer has to [install the PowerQuery SDK](./../install-sdk.md#installing-the-power-query-sdk) VS Code extension for developing an extension connector. The VS Code extension wraps the *"Microsoft.PowerQuery.SdkTools"* NuGet package, which also contains test harness *"PQTest.exe"*. The PQTest test harness contains the new *"compare"* command to execute the tests present in the test framework. Refer to [To Do: Link to the section of the PQTest.md file in Power Query Docs] for further information on PQTest compare command.
* **Clone the DataConnectors GitHub Repo:** Clone the [DataConnectors GitHub](https://github.com/microsoft/DataConnectors/tree/master) repo to access the [Test Data](https://github.com/microsoft/DataConnectors/tree/master/testframework/data/) and [Tests](https://github.com/microsoft/DataConnectors/tree/master/testframework/tests/) contained in the test framework. Refer to [PowerQuery SDK Test Framework part 4 - Test Suite](./4-tests.md) for further details on the tests.
* **Load the Test Data to the Data Source:** The connector developer has to load the test data consisting of two csv files as tables to their data source ensuring the schema matches the SQL schema file provided. Refer to [Power Query SDK Test Framework part 3 - Test Data](./3-data.md) for further details.
* **Configure and run the tests:** The connector developer has to then run the tests using the provided *"RunPQSDKTestSuites"* PowerShell utility, which uses *"PQTest*" compare command to run the tests. Refer to [Power Query SDK Test Framework part 6 - Testing your extension connector](./6-connector.md) for further details.
* **Reporting & CI/CD:** The default test report is generated in console and there are also options to generate the report in summary, detailed, trx, and json formats. The TRX (Visual Studio Test Results File) format is useful to view the results when they're run as part of a pipeline. Refer to [Power Query SDK Test Framework part 8 - Pipeline Guide](./8-pipeline.md) for further details.

## Goals of the Test Framework

The long-term goal of Power Query SDK Test Framework is to provide a robust testing solution integrated with the VS Code SDK to test extension connectors. It should greatly improve the developer experience for the development of the connectors. It should also bring standardization to rather fragmented test practices, eventually increasing the quality bar and decreasing sustainment efforts of the connectors. We also envision this to plug into the connector certification process and enhance the experience of the partners.

The goals of the Test Framework Initial Release are to provide:

* **Easy to use command-line utility for users to easily test their extension connectors:** The test framework introduces the *"PQTest"* compare command with intuitive options to run the tests. It also provides the *"RunPQSDKTestSuites"* PowerShell utility also helps with batch testing. Easy and automatic configurations are provided to configure and run the tests.
* **Ready-to-go initial set of standard tests to execute to verify a connector:** The test framework provides a suite of Sanity tests to validate the schema, row count, and data of the test tables. It also provides a standard test suite to verify Datatypes, Math, Date, Time, Text functions, operators, and joins.
* **Effortless way of manually adding tests to extend the testing:** The tests in test framework use the new *"PQ/PQOut"* test format, which simplifies the test creation process by minimizing the configurations needed. The connector developers can focus on creating the M query for their testing. Each test if modular and separated into individual files to simplify the maintenance. The expected output is also generated in the first run.
* **Ability to test query folding tests:** The test framework can also generate the diagnostics for a connector. Currently, the diagnostic capability is limited to SQL query generation during query folding for an ODBC based connector. This is going to be extended to other diagnostics in future.

## Parts

|Part|Lesson                                                   |Details                                                                                                |
|----|:--------------------------------------------------------|:------------------------------------------------------------------------------------------------------|
|1   |[Introduction](1-intro.md)                               | What is Power Query SDK Test Framework                                                                |
|2   |[Setup](2-setup.md)                                      | Set up your environment                                                                               |
|3   |[Preparing Data](3-data.md)                              | Preparing the test data                                                                               |
|4   |[Test Suite](4-tests.md)                                 | Fetching and understanding the Test Suite                                                             |
|5   |[Test Format Spec](5-testformat.md)                      | Understanding various file formats used within the test framework                                     |
|6   |[Connector Testing](6-connector.md)                      | Testing your extension connector                                                                      |
|7   |[Adding Tests](7-adding.md)                              | Adding your own tests and understanding various options and configurations within the test framework  |
|8   |[Pipeline Setup Guide](8-pipeline.md)                    | Running the tests in pipeline                                                                         |
