---
title: Power Query Bitsight Security Ratings connector
description: Provides basic information and prerequisites for the Bitsight Security Ratings connector, descriptions of the optional input parameters, and discusses limitations and issues you might encounter.
author: whhender
ms.topic: concept-article
ms.date: 9/15/2025
ms.author: whhender
ms.subservice: connectors
---

# Bitsight Security Ratings

>[!Note]
>This connector is owned and provided by Bitsight.

## Summary

| Item | Description |
| ------ | ------ |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | API key |
| Function Reference Document | &mdash; |

## Prerequisites

A user must have a Bitsight Security Ratings product in order to access the Bitsight data in Power BI. For more information on Bitsight Security Ratings, go to https://www.bitsight.com/security-ratings.

Users must also have the March 2021 release of Power BI Desktop or later.

## Capabilities supported

* Import

## Connect to Bitsight from Power BI Desktop

To connect to Bitsight:

1. Retrieve API token from Bitsight.

2. In Power BI Desktop, select **Get Data** from the **Home** ribbon, select **More** from the drop down, and search for **Bitsight**.

3. If this is the first time you're getting the data through the Bitsight connector, a prompt appears to inform you of the connection to a third-party service.

4. Place your Bitsight API token in Power BI. In the Window that appears, provide your credentials.

5. Once the connection is established, you can preview and select multiple data points in the **Navigator** dialog box to create an output.

You can **Load** the selected table, which brings the entire table into Power BI Desktop, or you can select **Transform Data** to edit the query, which opens the Power Query editor. You can then filter and refine the set of data you want to use, and then load that refined set of data into Power BI Desktop.

## Limitations and issues

### Bitsight for Security Performance Management

Can only view data on one company at a time, and assumes the parent company. The parent company can be changed.  
