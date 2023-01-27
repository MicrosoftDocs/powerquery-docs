---
title: Power Query BitSight Security Ratings connector
description: Provides basic information and prerequisites for the BitSight Security Ratings connector, descriptions of the optional input parameters, and discusses limitations and issues you might encounter.
author: bezhan-msft
ms.topic: conceptual
ms.date: 6/24/2022
ms.author: bezhan
---

# BitSight Security Ratings

>[!Note]
>The following connector article is provided by BitSight, the owner of this connector and a 
member of the Microsoft Power Query Connector Certification Program. If you have questions 
regarding the content of this article or have changes you would like to see made to this article, visit the BitSight website and use the support channels there.

## Summary

| Item | Description |
| ------ | ------ |
| Release State | Generally Available |
| Products | Power BI (Datasets) |
| Authentication Types Supported | API key |
| Function Reference Document | &mdash; |

## Prerequisites

A user must have a BitSight Security Ratings product in order to access the BitSight data in Power BI. For more information on BitSight Security Ratings, go to https://www.bitsight.com/security-ratings.

Users must also have the March 2021 release of Power BI Desktop or later.

## Capabilities Supported

* Import

## Connect to BitSight from Power BI Desktop

To connect to BitSight:

1. Retrieve API token from BitSight.

2. In Power BI Desktop, select **Get Data** from the **Home** ribbon, select **More** from the drop down, and search for **BitSight**.

3. If this is the first time you're getting the data through the BitSight connector, a prompt appears to inform you of the connection to a third-party service.

4. Place your BitSight API token in Power BI. In the Window that appears, provide your credentials.

5. Once the connection is established, you can preview and select multiple data points in the **Navigator** dialog box to create an output.

You can **Load** the selected table, which brings the entire table into Power BI Desktop, or you can select **Transform Data** to edit the query, which opens the Power Query editor. You can then filter and refine the set of data you want to use, and then load that refined set of data into Power BI Desktop.

## Limitations and Issues

### BitSight for Security Performance Management

Can only view data on one company at a time, and assumes the parent company. The parent company can be changed.  
