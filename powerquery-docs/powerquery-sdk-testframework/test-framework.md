---
title: Power Query SDK test framework reference sequence
description: Overview and listing of the PowerQuery SDK testing framework reference sequence.
author: ryan-syed
ms.topic: reference
ms.date: 01/19/2024
ms.author: v-ryansyed
---

# Power Query SDK test framework reference

This multi-part reference covers the setup and running of a standard suite of tests for Power Query connector developers. The reference is meant to be followed sequentially to ensure that your environment is set up for testing your extension connector.

This reference uses the Power Query SDK test framework, a standardized test suite, and a modified version of the [NewYork City Taxi & Limousine Commission (TLC)](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page) green trip record data. The subsequent sections walk through the steps to get your environment set up to validate your extension connector.

The test framework allows Power Query SDK developers to have access to standard tests and a test harness to verify the DirectQuery (DQ) capabilities of an extension connector. With this new capability, developers have a standard way of verifying connectors and a platform for adding custom tests. We envision this as the first step in enhancing the productivity of the testing workflow provided by the Power Query SDK.

## What is the Power Query SDK test framework?

The Power Query SDK test framework is a ready-to-go test harness with prebuilt tests to standardize the testing of new and existing extension connectors. It has the ability to perform functional, compliance, and regression testing-at-scale. It helps address the need for a comprehensive test framework to satisfy the needs of extension connectors.

:::image type="content" source="../connectors/media/test-framework/power-query-sdk-test-framework-design.png" alt-text="Test Framework Design":::

## Workflow for a developer

The following list is the typical Power Query SDK developer workflow with the test framework:

1. **Install the Power Query SDK Visual Studio Code extension:** A connector developer has to [install the PowerQuery SDK](./../install-sdk.md#installing-the-power-query-sdk) Visual Studio Code extension for developing an extension connector. The Visual Studio Code extension wraps the Microsoft.PowerQuery.SdkTools NuGet package, which also contains test harness PQTest.exe. The PQTest test harness contains the new [compare](https://learn.microsoft.com/power-query/powerquery-sdktools/pqtest-compare) command to execute the tests present in the test framework.
2. **Clone the DataConnectors GitHub Repo:** Clone the [DataConnectors GitHub](https://github.com/microsoft/DataConnectors/tree/master) repo to access the [test data](https://github.com/microsoft/DataConnectors/tree/master/testframework/data/) and [tests](https://github.com/microsoft/DataConnectors/tree/master/testframework/tests/) contained in the test framework. For more details about these tests, go to [PowerQuery SDK test framework part 3 - Test suite](./3-tests.md).
3. **Load the test data to the data source:** The connector developer has to load the test data, consisting of two CSV files, as tables to their data source, which ensures the schema matches the SQL schema file provided. For more details, go to [Power Query SDK test framework part 2 - Test data](./2-data.md).
4. **Configure and run the tests:** The connector developer has to then run the tests using the provided RunPQSDKTestSuites PowerShell utility, which uses the PQTest **compare** command to run the tests. For more details, go to [Power Query SDK test framework part 5 - Testing your extension connector](./5-connector.md).
5. **Reporting & CI/CD:** The default test report is generated in console and there are also options to generate the report in summary, detailed, TRX, and JSON formats. The TRX (Visual Studio test results file) format is useful to view the results when they're run as part of a pipeline. For more details, go to [Power Query SDK test framework part 7 - Pipeline guide](./7-pipeline.md).

## Goals of the test framework

The long-term goal of Power Query SDK test framework is to provide a robust testing solution integrated with the Visual Studio Code SDK to test extension connectors. It should greatly improve the developer experience for the development of the connectors. It should also bring standardization to rather fragmented test practices, eventually increasing the quality bar and decreasing sustainment efforts of the connectors. We also envision the test framework to plug into the connector certification process and enhance the experience for the partners.

The goals of the test framework initial release are to provide:

* **Easy to use command-line utility for users to easily test their extension connectors:** The test framework introduces the PQTest **compare** command with intuitive options to run the tests. It also provides the RunPQSDKTestSuites PowerShell utility, which also helps with batch testing. Easy and automatic configurations are provided to configure and run the tests.
* **Ready-to-go initial set of standard tests to execute to verify a connector:** The test framework provides a suite of sanity tests to validate the schema, row count, and data of the test tables. It also provides a standard test suite to verify Datatypes, Math, Date, Time, Text functions, operators, and joins.
* **Effortless way of manually adding tests to extend the testing:** The tests in the test framework use the new PQ/PQOut test format, which simplifies the test creation process by minimizing the configurations needed. Connector developers can then focus on creating the M query for their testing. Each test is modular and separated into individual files to simplify the maintenance. The expected output is also generated in the first run.
* **Ability to test query folding tests:** The test framework can also generate the diagnostics for a connector. Currently, the diagnostic capability is limited to SQL query generation during query folding for an ODBC based connector. This capability is going to be extended to other diagnostics in the future.

## Overview of the reference guide

In this guide, you:

* Gain an understanding of the Power Query SDK test framework.
* Learn to set up the development environment by installing the test framework.
* Fetch the dataset used in the test suite and upload it to a data source based on your extension connector.
* Understand test format specifications that are, the file formats and their functionality within the Test Framework.
* Fetch and run the test suite that contains the tests for validating your extension connector.
* Run individual tests with different configurations.
* Add your own tests to verify your connector-specific functionality.
* Automate test runs by setting up a pipeline for the tests.

## Parts

|Part|section                                                   |Details                                                                                                |
|----|:--------------------------------------------------------|:-------------------------------------------------------------------------------------------------------|
|1   |[Setup](1-setup.md)                                      | Set up your environment.                                                                               |
|2   |[Preparing data](2-data.md)                              | Preparing the test data.                                                                               |
|3   |[Test suite](3-tests.md)                                 | Fetching and understanding the test suite.                                                             |
|4   |[Test format spec](4-testformat.md)                      | Understanding various file formats used in the test framework.                                         |
|5   |[Connector testing](5-connector.md)                      | Testing your extension connector.                                                                      |
|6   |[Adding tests](6-adding.md)                              | Adding your own tests and understanding various options and configurations in the test framework.      |
|7   |[Pipeline setup guide](7-pipeline.md)                    | Running the tests in a pipeline.                                                                         |
