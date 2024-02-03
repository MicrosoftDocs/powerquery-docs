---
title: Power Query SDK Test Framework Setup guide
description: Setting up development environment for Power Query SDK Test Framework
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
> * Learn to install Power Query SDK extension for Visual Studio Code
> * Verify that the Power Query SDK Test Framework is available

## Installing Power Query SDK extension

Power Query SDK Test Framework comes bundled with [Power Query SDK for Visual Studio](https://aka.ms/powerquerysdk). Follow the steps in [Installing the PowerQuery SDK](./../../install-sdk.md#installing-the-power-query-sdk) to get it setup for Visual Studio Code.

## Locate Power Query SDK for VS Code install directory

Install the Power Query SDK for VS Code and use it to create a new connector project, or open an existing project. On first use, the SDK downloads the latest Microsoft.PowerQuery.SdkTools NuGet to the extension's cache folder.

The default location of the extension folder is:

`%UserProfile%\.vscode\extensions\powerquery.vscode-powerquery-sdk-x.x.x-win32-x64`

Where `x.x.x`` is the current version of Power Query SDK extension.

The SdkTools NuGet package is found under:

`<extension_path>\.nuget\Microsoft.PowerQuery.SdkTools.2.xxx.x\tools`

If you don't have a ".NuGet" folder, be sure to load a connector workspace in VS Code to trigger the SDK's autodownload mechanism. The SdkTools NuGet contains the Power Query SDK Test Framework. If the NuGet is still not downloaded, then retry the steps after updating the [Power Query SDK for Visual Studio](https://aka.ms/powerquerysdk) extension.

## Conclusion

This lesson covered the setup of Power Query SDK Test Framework.

In the next lesson, you'll learn about the test data that is used by the standard test suite within the testing framework.

## Next steps

[Power Query SDK Test Framework part 3 - Test Data](../3-data/readme.md)
