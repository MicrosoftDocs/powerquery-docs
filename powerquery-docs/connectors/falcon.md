---
title: Power Query Falcon connector
description: Provides basic information, prerequisites, and instructions on how to connect to Falcon app.
author: Baitech
ms.topic: conceptual
ms.date: 12/12/2023
ms.author: Baitech
---

# Falcon

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Falcon Account |
| Function Reference Documentation | &mdash; |

## Prerequisites

Before you can sign in to Falcon connector, you must have an Falcon account (username/password) and a personal access token.

## Capabilities supported

* Import

## Connect to Falcon from Power Query Desktop

To connect to Falcon data from Power Query Desktop, take the following steps::

1. Launch Power BI Desktop and enter the **Get Data** section.

2. From the **Other** category, select **Falcon**, and then select **Connect**.

   ![Get Data.](media/falcon/Falcon_Get_Data.png)

3. In the sign in screen, enter your Falcon email and your personal access token. Select **Connect**.

   ![Login.](media/falcon/Falcon_Sign_in.png)

4. In **Navigator** section, select any of the 9 tables provided by Falcon and then select **load**.
   * Calendar
   * Effect
   * Phases
   * Positions
   * Process
   * Profiles
   * Schedules
   * Status
   * Users

   ![Navigator.](media/falcon/Falcon_Navigator.png)
