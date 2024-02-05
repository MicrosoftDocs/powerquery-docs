---
title: Power Query Access database connector
description: Provides basic information, prerequisites, and connection instructions, along with tips about using the on-premises data gateway and fixing mismatched bit versions.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 1/18/2024
ms.author: dougklo
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
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

If you're connecting to an Access database from Power Query Online, the system that contains the on-premises data gateway must have the 64-bit version of the [Access Database Engine 2016 OLEDB provider](https://www.microsoft.com/download/details.aspx?id=54920) installed.

If you're loading an Access database to Power BI Desktop, the versions of the Access Database Engine 2016 OLEDB provider and Power BI Desktop on that machine must match (that is, either 32-bit or 64-bit). For more information, go to [Import Access database to Power BI Desktop](#import-access-database-to-power-bi-desktop).

## Capabilities Supported

* Import

## Connect to an Access database from Power Query Desktop

To make the connection from Power Query desktop:

1. Select the **Access database** option in the connector selection.

2. Browse for and select the Access database you want to load. Then select **Open**.

   :::image type="content" source="./media/access-database/select-database.png" alt-text="Enter the Access database connection." lightbox="./media/access-database/select-database.png":::

   If the Access database is online, use the [Web connector](./web/web.md) to connect to the database.

3. In **Navigator**, select the database information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

   :::image type="content" source="./media/access-database/navigator-desktop.png" alt-text="Select the data you want to import in the Navigator." lightbox="./media/access-database/navigator-desktop.png":::

## Connect to an Access database from Power Query Online

To make the connection from Power Query desktop:

1. Select the **Access database** option in the connector selection.

2. In the **Access database** dialog that appears, provide the path to the Access database.

   :::image type="content" source="./media/access-database/online-select-database.png" alt-text="Enter Access database online connection." lightbox="./media/access-database/online-select-database.png":::

3. Enter the file path or URL address to the Access database.

4. Select the name of your on-premises data gateway.

      > [!NOTE]
      > You must select an on-premises data gateway for this connector, whether the Access database is on your local network or on a web site.

5. Select the type of credentials for the connection to the Access database in **Authentication kind**.

6. Enter your credentials.

7. Select **Next** to continue.

8. In **Navigator**, select the data you require, and then select **Transform data** to continue transforming the data in Power Query Editor.

   :::image type="content" source="./media/access-database/navigator-online.png" alt-text="Select the data you want in the Navigator." lightbox="./media/access-database/navigator-online.png":::

## Troubleshooting

### Connect to local file from Power Query Online

When you attempt to connect to a local Access database using Power Query Online, you must select an on-premises data gateway, even if your Access database is online.

### On-premises data gateway error

A 64-bit version of the Access Database Engine 2016 OLEDB provider must be installed on your on-premises data gateway machine to be able to load Access database files. If you already have a 64-bit version of Microsoft Office installed on the same machine as the gateway, the Access Database Engine 2016 OLEDB provider is already installed. If not, you can download the driver from the following location:

[Access Database Engine 2016 OLEDB provider](https://www.microsoft.com/download/details.aspx?id=54920)

> [!NOTE]
>Microsoft Office has stopped supporting the Access Database Engine 2010 OLEDB provider as part of end-of-life for Office 2010. However, some legacy use cases, such as using 32-bit Office and 64-bit PBI Desktop, might require the continued use of the older 2010 version. In these cases, you can still download the 2010 version from the following location:
>
>[Access Database Engine 2010 OLEDB provider](https://www.microsoft.com/download/details.aspx?id=13255)

### Import Access database to Power BI Desktop

In some cases, you might get a `The 'Microsoft.ACE.OLEDB.12.0' provider is not registered` error when attempting to import an Access database file to Power BI Desktop. This error can be caused by using mismatched bit versions of Power BI Desktop and the Access Database Engine 2016 OLEDB provider. For more information about how you can fix this mismatch, go to [Troubleshoot importing Access and Excel .xls files in Power BI Desktop](/power-bi/connect-data/desktop-access-database-errors).
