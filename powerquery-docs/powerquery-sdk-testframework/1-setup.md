---
title: Power Query SDK test framework setup guide
description: Setting up the development environment for the Power Query SDK test framework
author: ryan-syed
ms.topic: reference
ms.date: 01/19/2024
ms.author: v-ryansyed
---

# Power Query SDK test framework part 1 - Setup

This multi-part reference covers the setup and running of a standard suite of tests for Power Query connector developers. This reference is meant to be followed sequentially to ensure that your environment is set up for testing your extension connector.

In this section, you:

> [!div class="checklist"]
>
> * Learn to install the Power Query SDK extension for Visual Studio Code
> * Verify that the Power Query SDK test framework is available

## Installing Power Query SDK extension

The Power Query SDK test framework comes bundled with [Power Query SDK for Visual Studio](https://aka.ms/powerquerysdk). Follow the steps in [Installing the PowerQuery SDK](./../install-sdk.md#installing-the-power-query-sdk) to get it set up for Visual Studio Code.

## Locate the Power Query SDK for Visual Studio Code install directory

Install the Power Query SDK for Visual Studio Code and use it to create a new connector project, or open an existing project. On first use, the SDK downloads the latest "Microsoft.PowerQuery.SdkTools" NuGet to the extension's cache folder.

The default location of the extension folder is:

%UserProfile%\.vscode\extensions\powerquery.vscode-powerquery-sdk-*x.x.x*-win32-x64

Where *x.x.x* is the current version of Power Query SDK extension.

The SdkTools NuGet package is found under:

\<*extension_path*>\.nuget\Microsoft.PowerQuery.SdkTools.2.*xxx.x*\tools

Where *xxx.x* is the current version of Power Query SDK Tools.

If you don't have a .NuGet folder, be sure to load a connector workspace in Visual Studio Code to trigger the SDK's autodownload mechanism. The SdkTools NuGet contains the Power Query SDK test framework.

## Conclusion

This section covered the set up of the Power Query SDK test framework.

In the next section, you learn about the test data that's used by the standard test suite within the testing framework.

## Next steps

[Power Query SDK test framework part 2 - Test data](./2-data.md)
