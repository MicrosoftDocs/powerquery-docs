---
title: Power Query Access database connector
description: Provides basic information, prerequisites, and connection instructions, along with tips about using the on-premises data gateway and fixing mismatched bit versions.
author: whhender
ms.topic: concept-article
ms.date: 10/28/2024
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Access database

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Excel<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Anonymous<br/>Windows<br/>Basic<br/>Organizational Account |
| Function Reference Documentation | [Access.Database](/powerquery-m/access-database) |

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

[!INCLUDE [Includes_access-database_prerequisites](includes/access-database/access-database-prerequisites.md)]

## Capabilities Supported

[!INCLUDE [Includes_access-database_capabilities-supported](includes/access-database/access-database-capabilities-supported.md)]

## Connect to an Access database from Power Query Desktop

To make the connection from Power Query desktop:

1. Select the **Access database** option in the connector selection.

2. Browse for and select the Access database you want to load. Then select **Open**.

   :::image type="content" source="./media/access-database/select-database.png" alt-text="Screenshot of the File Explorer with an example of where you enter the Access database connection." lightbox="./media/access-database/select-database.png":::

   If the Access database is online, use the [Web connector](./web/web.md) to connect to the database.

3. In **Navigator**, select the database information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

   :::image type="content" source="./media/access-database/navigator-desktop.png" alt-text="Screenshot of the Navigator dialog where you select the data you want to import." lightbox="./media/access-database/navigator-desktop.png":::

## Connect to an Access database from Power Query Online

[!INCLUDE [Includes_access-database_connect-to-power-query-online](includes/access-database/access-database-connect-to-power-query-online.md)]

## Troubleshooting

### Connect to local file from Power Query Online

When you attempt to connect to a local Access database using Power Query Online, you must select an on-premises data gateway, even if your Access database is online.

### On-premises data gateway error

A 64-bit version of the Access Database Engine OLEDB provider must be installed on your on-premises data gateway machine to be able to load Access database files. If you already have a 64-bit version of Microsoft Office installed on the same machine as the gateway, the Access Database Engine OLEDB provider is already installed. If not, you can download the driver from the following location:

[Access 365 Runtime](https://support.microsoft.com/office/download-and-install-microsoft-365-access-runtime-185c5a32-8ba9-491e-ac76-91cbe3ea09c9)

### Import Access database to Power BI Desktop

In some cases, you might get a `The 'Microsoft.ACE.OLEDB.12.0' provider is not registered` error when attempting to import an Access database file to Power BI Desktop. This error can be caused by using mismatched bit versions of Power BI Desktop and the Access Database Engine OLEDB provider. For more information about how you can fix this mismatch, go to [Troubleshoot importing Access and Excel .xls files in Power BI Desktop](/power-bi/connect-data/desktop-access-database-errors).
