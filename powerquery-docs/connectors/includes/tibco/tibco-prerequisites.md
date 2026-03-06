---
title: Include file for the Prerequisites section of the TIBCO(R) Data Virtualization connector connector documentation
description: Include file for the Prerequisites section of the TIBCO(R) Data Virtualization connector connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

To access the TIBCO eDelivery site, you must purchase TIBCO software. There's no TIBCO license required for the TIBCO(R) Data Virtualization (TDV) software&mdash;a TIBCO customer only needs to have a valid contract in place. If you don't have access, then you need to contact the TIBCO admin in your organization.

The Power BI Connector for TIBCO(R) Data Virtualization must first be downloaded from [https://edelivery.tibco.com](https://edelivery.tibco.com) and installed on the machine running Power BI Desktop. The eDelivery site downloads a ZIP file (for example, TIB_tdv_drivers_\<_VERSION_>_all.zip*.zip where \<_VERSION_>=TDV Version) that contains an installer program that installs all TDV client drivers, including the Power BI connector.

:::image type="content" source="../../media/tibco/tdv-setup.png" alt-text="Screenshot of the TDV installation setup dialog.":::

Once the connector is installed, configure a data source name (DSN) to specify the connection properties needed to connect to the TIBCO(R) Data Virtualization server.

> [!NOTE]
> The DSN architecture (32-bit or 64-bit) needs to match the architecture of the product where you intend to use the connector.

:::image type="content" source="../../media/tibco/tdv_dsn.png" alt-text="Screenshot of the TDV DSN Configuration dialog.":::

> [!NOTE]
>Power BI Connector for TIBCO(R) Data Virtualization is the driver used by the TIBCO(R) Data Virtualization connector to connect Power BI Desktop to TDV.

