---
title: Power Query SDK Testing Framework reference sequence
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

The following application is used throughout this reference:

* [Power Query SDK for Visual Studio](https://aka.ms/powerquerysdk)

We suggest that you review:

* [Installing the PowerQuery SDK](./../install-sdk.md#installing-the-power-query-sdk)

## Parts

|Part|Lesson                                                   |Details                                                                       |
|----|:--------------------------------------------------------|:-----------------------------------------------------------------------------|
|1   |[Introduction](1-intro/readme.md)                        | What is Power Query SDK Testing Framework                                    |
|2   |[Setup](2-setup/readme.md)                               | Initial Setup                                                                |
|3   |[Preparing Data](3-data/readme.md)                       | Preparing the data                                                           |
|4   |[Test Suite](4-tests/readme.md)                          | Fetching and understanding the Test suite                                    |
|5   |[Test Format Spec](5-testformat/readme.md)               | Understanding various file formats used with test framework                  |
|6   |[Connector Testing](6-connector/readme.md)               | Testing your extension connector                                             |
|7   |[Adding Tests](7-adding/readme.md)                       | Adding your own tests and reference for various options and configurations   |
|8   |[Pipeline Setup Guide](8-pipeline/readme.md)             | Running the tests in pipeline                                                |
