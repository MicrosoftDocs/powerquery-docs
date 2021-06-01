---
title: Power Query BQE Core connector
description: Provides basic information, prerequisites, and instructions on how to connect to BQE Core.
author: cruzgreg

ms.service: powerquery
ms.topic: conceptual
ms.date: 05/25/2020
ms.author: bezhan

LocalizationGroup: reference
---

# BQE Core (Beta)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Datasets) |
| Authentication Types Supported | BQE Core Account |
| Function Reference Documentation | - |

## Prerequisites

To use the BQE Core Power BI connector, you must have a BQE Core account with username and password.

## Capabilities supported

* Import

## Connect to BQE Core from Power Query Desktop

To connect to BQE Core data:

1. Launch Power BI Desktop and enter the **Get Data** experience.

2. From the **Other** category, select **BQEDataConnector**, and then select **Connect**.

   ![Get Data](media/bqe-core/core-bi-9.png)

3. Select **Sign In**. You'll be prompted to sign in to Core.

   ![Login](media/bqe-core/core-bi-11.png)

4. In the sign in screen, enter your Core email and password. Select **Login**.

5. You'll then be prompted to select your Core company file. Select **Grant Permission**.

   ![Grant Permissions](media/bqe-core/core-bi-13.png)

6. Select **Connect**, and then select a module. For reference, review the API Reference under the [Core API Documentation](https://api-explorer.bqecore.com/).

7. From the Navigator, select the tables to load, and then select **Transform Data** to transform the data in Power Query.
