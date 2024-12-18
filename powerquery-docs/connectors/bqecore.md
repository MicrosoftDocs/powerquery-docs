---
title: Power Query BQE Core connector
description: Provides basic information, prerequisites, and instructions on how to connect to BQE Core.
author: cruzgreg
ms.topic: conceptual
ms.date: 1/24/2024
ms.author: dougklo
ms.subservice: connectors
---

# BQE Core

> [!NOTE]
>The following connector article is provided by BQE, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the BQE website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | BQE Core Account |
| Function Reference Documentation | &mdash; |

## Prerequisites

To use the BQE Core Power BI connector, you must have a BQE Core account with username and password.

## Capabilities supported

* Import

## Connect to BQE Core from Power Query Desktop

To connect to BQE Core data:

1. Launch Power BI Desktop and enter the **Get Data** experience.

2. From the **Other** category, select **BQEDataConnector**, and then select **Connect**.

   ![Get Data.](media/bqe-core/core-bi-9.png)

3. Select **Sign In**. You'll be prompted to sign in to Core.

   ![Login.](media/bqe-core/core-bi-11.png)

4. In the sign in screen, enter your Core email and password. Select **Login**.

5. You'll then be prompted to select your Core company file.
   1. Select the Core company file you want to use.
   1. (Optional) If you select **Remember my consent**, the next time you connect to this Core company file you won't need to grant permission again.
   1. Select **Grant Permission**.

   ![Grant Permissions.](media/bqe-core/core-bi-13.png)

6. Select **Connect**, and then select a module. For reference, review the API Reference under the [Core API Documentation](https://api-explorer.bqecore.com/).

7. From the Navigator, select the tables to load, and then select **Transform Data** to transform the data in Power Query.
