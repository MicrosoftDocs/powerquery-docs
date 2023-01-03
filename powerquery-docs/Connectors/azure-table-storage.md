---
title: Power Query Azure Table Storage connector
description: Provides basic information, prerequisites, and instructions on how to connect to Azure Table Storage, along with native query folding instructions and troubleshooting tips.
author: bezhan-msft
ms.topic: conceptual
ms.date: 10/26/2022
ms.author: bezhan
---

# Azure Table Storage

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Excel<br/>Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Power Apps (Dataflows)<br/>Customer Insights (Dataflows)<br/>Analysis Services |
| Authentication Types Supported | [Account Key](#copy-your-account-key-for-azure-table-storage) |
| Function Reference Documentation | [AzureStorage.Table](/powerquery-m/azurestorage-tables) |

## Capabilities Supported

- Import

## Connect to Azure Table Storage from Power Query Desktop

Power Query Desktop includes Excel, Power BI (Datasets), and Analysis Services as experiences.

To make the connection to **Azure Table Storage**, follow these steps:

1. From **Get Data**, select the **Azure** category, select **Azure Table Storage**, and then select **Connect**. More information: [Where to get data](../where-to-get-data.md)

   :::image type="content" source="./media/azure-table-storage/desktop-select-azure-table-storage.png" alt-text="Screenshot of the Get Data dialog, showing the Azure Table Storage database selection.":::

1. In the **Azure Table Storage** window that appears, enter the name or the URL of the storage account where your table is located. Don't add the name of the table to the URL.

   :::image type="content" source="./media/azure-table-storage/desktop-connect-with-URL.png" alt-text="Screenshot of the Azure Table Storage dialog, showing full storage url added.":::

   :::image type="content" source="./media/azure-table-storage/desktop-connect-with-name.png" alt-text="Screenshot of the Azure Table Storage dialog, showing only the storage name added.":::

1. Select **OK**.

1. Add the [Azure table storage account key](#copy-your-account-key-for-azure-table-storage) and select **Connect**.

   :::image type="content" source="./media/azure-table-storage/desktop-add-your-account-key.png" alt-text="Screenshot of the Azure Table Storage dialog, showing an account key entered in the space.":::

1. In **Navigator**, select one or multiple tables to import and use in your application. Then select either **Load** to load the table, or **Transform Data** to open the Power Query Editor where you can filter and refine the set of data you want to use, and then load that refined set of data.

   :::image type="content" source="./media/azure-table-storage/desktop-load-data.png" alt-text="Screenshot of the Azure Table Storage navigator, showing one of two tables selected.":::

## Connect to Azure Table Storage from Power Query Online

Power Query Online includes Power BI (Dataflows), Power Apps (Dataflows), and Customer Insights (Dataflows) as experiences.

To make the connection, take the following steps:

1. Select the **Azure Table Storage** option in the connector selection. More information: [Where to get data](../where-to-get-data.md)

1. In the **Azure Table Storage** dialog that appears, enter the name or URL of the Azure Storage account where the table is housed. Don't add the name of the table to the URL.

   :::image type="content" source="./media/azure-table-storage/online-connect-to-azure-storage.png" alt-text="Screenshot of the Azure Table Storage window in Power Query online.":::

1. Add your [Azure table storage account key](#copy-your-account-key-for-azure-table-storage), and then select **Next**.

1. Select one or multiple tables to import and use, then select **Transform Data** to transform data in the Power Query editor.

   :::image type="content" source="./media/azure-table-storage/online-choose-data.png" alt-text="Screenshot of the Azure Table Storage choose data window in Power Query online.":::

## Copy your account key for Azure Table Storage

Your Azure Table Storage account key is the same as your Azure Blob storage account key. To retrieve your Azure Table Storage account key to use while authenticating your account in Power Query, follow these steps:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Locate your Azure Blob Storage account where your table is housed.

1. In the storage account menu pane, under **Security + networking**, select **Access keys**.

   :::image type="content" source="./media/azure-table-storage/access-key-location.png" alt-text="Screenshot of the example storage account in Azure, with Security + networking and Access keys emphasized." lightbox="./media/azure-table-storage/access-key-location.png":::

1. In the **key1** section, locate the **Key** value. Select **Show** next to the key value.

1. Select the **Copy to clipboard** icon to copy the **Key** value.

   :::image type="content" source="./media/azure-table-storage/account-key-location.png" alt-text="Screenshot of the Access keys page, with the Key under key1 shown, and the Copy to clipboard icon emphasized.":::
