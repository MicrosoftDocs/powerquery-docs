---
title: Power Query Azure Table Storage connector
description: Provides basic information, prerequisites, and instructions on how to connect to Azure Table Storage, along with native query folding instructions and troubleshooting tips.
author: bezhan-msft
ms.topic: conceptual
ms.date: 10/19/2022
ms.author: bezhan
---

# Snowflake

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Power Apps (Dataflows)<br/>Customer Insights (Dataflows)<br/>Analysis Services |
| Authentication Types Supported | Account Key |
| Function Reference Documentation | [AzureStorage.Table](/powerquery-m/azurestorage-tables) |
| | |

> [!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Capabilities Supported

- Import

## Connect to Azure Table Storage from Power Query Desktop

To make the connection to a **Azure Table Storage**, follow these steps:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop, select **Azure** from the categories on the left, select **Azure Table Storage**, and then select **Connect**.

   :::image type="content" source="./media/azure-table-storage/desktop-select-azure-table-storage.png" alt-text="Screenshot of the Get Data dialog, showing the Azure Table Storage database selection.":::

1. In the **Azure Table Storage** window that appears, enter the name or the URL of the storage account where your table is located. Don't add the name of the table to the URL.

   :::image type="content" source="./media/azure-table-storage/desktop-connect-with-URL.png" alt-text="Screenshot of the Azure Table Storage dialog, showing full storage url added.":::

   :::image type="content" source="./media/azure-table-storage/desktop-connect-with-name.png" alt-text="Screenshot of the Azure Table Storage dialog, showing only the storage name added.":::

1. Select **OK**.

1. Add the account key for your storage account and select **Connect**.

   :::image type="content" source="./media/azure-table-storage/desktop-add-your-account-key.png" alt-text="Screenshot of the Azure Table Storage dialog, showing an account key entered in the space.":::

1. In **Navigator**, select one or multiple tables to import and use in Power BI Desktop. Then select either **Load** to load the table in Power BI Desktop, or **Transform Data** to open the Power Query Editor where you can filter and refine the set of data you want to use, and then load that refined set of data into Power BI Desktop.

   :::image type="content" source="./media/azure-table-storage/desktop-load-data.png" alt-text="Screenshot of the Azure Table Storage navigator, showing one of two tables selected.":::

## Connect to Azure Table Storage from Power Query Online

To make the connection, take the following steps:

1. Select the **Azure Table Storage** option in the connector selection.

1. In the **Azure Table Storage** dialog that appears, enter the name or URL of the Azure Storage account where the table is housed. Do not add the name of the table to the URL.

   :::image type="content" source="./media/azure-table-storage/online-connect-to-azure-storage.png" alt-text="Screenshot of the Azure Table Storage window in Power Query online.":::

1. Select one or multiple tables to import and use, then select **Transform Data** to transform data in the Power Query editor.

   :::image type="content" source="./media/azure-table-storage/online-choose-data.png" alt-text="Screenshot of the Azure Table Storage choose data window in Power Query online.":::

## Connect to Azure Table Storage from Excel

1. In the Power Query Editor in Excel, select **New Source**, then select **Azure**, and **Table Storage**

   :::image type="content" source="./media/azure-table-storage/excel-connect-to-table-storage.png" alt-text="Screenshot of the Azure Table Storage option in the new source dropdown in the excel Power Query Editor.":::

1. In the **Azure Table Storage** window that appears, enter the name or the URL of the storage account where your table is located. Don't add the name of the table to the URL.

   :::image type="content" source="./media/azure-table-storage/excel-connect-with-name.png" alt-text="Screenshot of the Azure Table Storage dialog in Excel, showing only the storage name added.":::

1. Select **OK**.

1. Add the account key for your storage account and select **Connect**.

   :::image type="content" source="./media/azure-table-storage/excel-add-account-key.png" alt-text="Screenshot of the Azure Table Storage dialog in Excel, showing an account key entered in the space.":::

1. In **Navigator**, select one or multiple tables to import. Then select **OK**.

   :::image type="content" source="./media/azure-table-storage/excel-load-data.png" alt-text="Screenshot of the Azure Table Storage navigator in Excel, showing one of two tables selected.":::