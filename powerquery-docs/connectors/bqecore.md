---
title: Power Query BQE Core connector
description: Provides basic information, prerequisites, and instructions on how to connect to BQE Core.
author: cruzgreg
ms.topic: concept-article
ms.date: 11/11/2025
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# BQE Core

>[!Note]
>This connector is owned and provided by BQE.

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

   :::image type="content" source="media/bqe-core/core-bi-9.png" alt-text="Screenshot of the Get data dialog with the BQE connector emphasized.":::

3. Select **Sign In**. You're prompted to sign in to Core.

   :::image type="content" source="media/bqe-core/core-bi-11.png" alt-text="Screenshot of the Core sign in page.":::

4. In the sign in screen, enter your Core email and password. Select **Sign in**.

5. You're then prompted to select your Core company file.
   1. Select the Core company file you want to use.
   1. (Optional) If you select **Remember my consent**, the next time you connect to this Core company file you won't need to grant permission again.
   1. Select **Grant Permission**.

   :::image type="content" source="media/bqe-core/core-bi-13.png" alt-text="Screenshot emphasizing the Core company file, the Remember my consent option, and the Grant permissions button.":::

6. Select **Connect**, and then select a module. For reference, review the API Reference under the [Core API Documentation](https://api-explorer.bqecore.com/).

7. From the Navigator, select the tables to load, and then select **Transform Data** to transform the data in Power Query.
