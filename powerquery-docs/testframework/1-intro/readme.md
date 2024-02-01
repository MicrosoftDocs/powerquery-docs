---
title: Intro to Power Query SDK Testing Framework
description: Overview of Power Query SDK Testing Framework
author: ryan-syed

ms.topic: reference
ms.date: 01/19/2024
ms.author: v-ryansyed
ms.custom:
---

# Power Query SDK Test Framework part 1 - Introduction

This multi-part reference covers the setup and running of a standard suite of tests for Power Query connector developers. The reference is meant to be followed sequentially—to ensure that your environment is set up for testing your extension connector.

In this lesson, you will:

> [!div class="checklist"]
>
> * Learn about the Power Query SDK Test Framework
> * Goals for creating the test framework
> * Summary of the reference guide

## Overview of Power Query SDK Test Framework

Power Query SDK Test Framework is a ready-to-go test harness with prebuilt tests to standardize the testing of new and existing extension connectors. It allows functional, compliance and regression testing of connectors and can be easily scaled.

## Goals

The goal of Power Query SDK Test Framework is to provide a robust testing solution integrated with the VS Code SDK to test extension connectors. This framework would greatly improve the developer experience for the development of the connectors. It would also bring standardization to rather fragmented test practices, eventually increasing the quality bar and decreasing sustainment efforts of the connectors.

## Summary of the reference guide

In this guide:

* You gain an understanding of the Power Query SDK Test Framework
* Learn to set up the development environment by installing the Test Framework
* Fetch the dataset used in the test suite and upload it to a data source based on your extension connector
* Understand test format specifications that are, the file formats and their functionality within the Test Framework
* Fetch and run the test suite that contains the tests to validate your extension connector
* Run individual tests with different configurations
* Add your own tests to verify your connector specific functionality
* Automate tests run by setting up a pipeline for the tests

## Conclusion

This lesson gave you an overview of Power Query SDK Test Framework and its goals. It also walked you through the summary of the subsequent lessons in this guide.

In the next lesson, you'll set up the development environment for the Testing Framework.

## Next steps

[Power Query SDK Test Framework part 2 - Setup](../2-setup/readme.md)
