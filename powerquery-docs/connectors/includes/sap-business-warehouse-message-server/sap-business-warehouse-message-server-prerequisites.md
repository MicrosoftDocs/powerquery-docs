---
title: Include file for the Prerequisites section of the Power Query SAP Business Warehouse Message Server connector documentation
description: Include file for the Prerequisites section of the Power Query SAP Business Warehouse Message Server connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

> [!IMPORTANT]
> Version 1.0 of the SAP BW Message Server connector has been deprecated. New connections will use Implementation 2.0 of the SAP BW Message Server connector. All support for version 1.0 will be removed from the connector in the near future.

You'll need an SAP account to sign in to the website and download the drivers. If you're unsure, contact the SAP administrator in your organization.

To use the SAP BW Message Server connector in Power BI Desktop or Power Query Online, you must install the SAP .NET Connector 3.0 or 3.1. Access to the download requires a valid S-user. Contact your SAP Basis team to get the SAP .NET Connector 3.0 or 3.1. You can download the [SAP .NET Connector 3.0 or 3.1](https://support.sap.com/en/product/connectors/msnet.html) from SAP. The connector comes in 32-bit and 64-bit versions. Choose the version that matches your Power BI Desktop installation. For Power Query Online, choose the 64-bit version. 

When you install, in **Optional setup steps**, make sure you select **Install assemblies to GAC**.

:::image type="content" source="../../sap-bw/install-to-gac.png" alt-text="Select to install assemblies to GAC.":::

> [!NOTE]
>As of late 2023, the SAP BW Application Server connector contains support for SAP .NET Connector 3.1.

