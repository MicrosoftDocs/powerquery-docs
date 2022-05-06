---
title: Analyze data in Azure Data Lake Storage Gen2 by using Power BI
description: Use Power BI to analyze data stored in Azure Data Lake Storage Gen2
author: bensack

ms.topic: conceptual
ms.date: 01/29/2020
ms.author: bensack
---

# Analyze data in Azure Data Lake Storage Gen2 by using Power BI

In this article you'll learn how to use Power BI Desktop to analyze and visualize data that is stored in a storage account that has a hierarchical namespace (Azure Data Lake Storage Gen2).

## Prerequisites

Before you begin this tutorial, you must have the following prerequisites:

> [!div class="checklist"]
>
> * An Azure subscription. Go to [Get Azure free trial](https://azure.microsoft.com/pricing/free-trial/).
> * A storage account that has a hierarchical namespace. Follow the instructions at [Create a storage account](/azure/storage/common/storage-account-create) to create one. This article assumes that you've created a storage account named `myadlsg2`.
> * Ensure you are granted one of the following roles for the storage account: **Blob Data Reader**, **Blob Data Contributor**, or **Blob Data Owner**.
> * A sample data file named `Drivers.txt` located in your storage account. You can download this sample from [Azure Data Lake Git Repository](https://github.com/Azure/usql/tree/master/Examples/Samples/Data/AmbulanceData/Drivers.txt), and then upload that file to your storage account.
> * **Power BI Desktop**. You can download this application from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=45331).

## Create a report in Power BI Desktop

1. Launch Power BI Desktop on your computer.

2. Follow the instructions in the [Azure Data Lake Storage Gen2 connector article](AzureDataLakeStorageGen2.md#connect-to-azure-data-lake-storage-gen2-from-power-query-desktop) to connect to the sample data.

3. From the Power Query **Navigator**, select **Load**.

    ![File systems.](media/azure-data-lake-storage-gen2/file-systems.png)

4. After the data has been successfully loaded into Power BI, you'll see the following fields in the **Fields** tab.

    ![Fields tab.](media/DataLakeStorage/fields.png)

    However, to visualize and analyze the data, you might prefer the data to be available using the following fields.

    ![Fields.](media/DataLakeStorage/preferred-fields.png)

    In the next steps, you'll update the query to convert the imported data to the desired format.

5. From the **Home** tab on the ribbon, select **Edit Queries**.

    ![Select edit queries.](media/DataLakeStorage/queries.png)

6. In the **Query Editor**, under the **Content** column, select **Binary**. The file will automatically be detected as CSV and you should see an output as shown below. Your data is now available in a format that you can use to create visualizations.

    ![Output.](media/DataLakeStorage/binary.png)

7. From the **Home** tab on the ribbon, select **Close & Apply**.

    ![Close and apply.](media/DataLakeStorage/close-apply.png)

8. Once the query is updated, the **Fields** tab will show the new fields available for visualization.

    ![New fields.](media/DataLakeStorage/new-fields.png)

9. Now you can create a pie chart to represent the drivers in each city for a given country. To do so, make the following selections.

    From the **Visualizations** tab, select the symbol for a pie chart.

    ![Select pie chart symbol in Visualizations.](media/DataLakeStorage/visualizations.png)

    In this example, the columns you're going to use are Column 4 (name of the city) and Column 7 (name of the country). Drag these columns from the **Fields** tab to the **Visualizations** tab as shown below.

    ![Drag fields.](media/DataLakeStorage/visualizations-drag-fields.png)

    The pie chart should now resemble the one shown below.

    ![Pie chart.](media/DataLakeStorage/pie-chart.png)

10. By selecting a specific country from the page level filters, you can now see the number of drivers in each city of the selected country. For example, under the **Visualizations** tab, under **Page level filters**, select **Brazil**.

    ![Page filters.](media/DataLakeStorage/page-filters.png)

11. The pie chart is automatically updated to display the drivers in the cities of Brazil.

    ![Brazil.](media/DataLakeStorage/pie-chart-updated.png)

12. From the **File** menu, select **Save** to save the visualization as a Power BI Desktop file.

## Publish report to Power BI service

After you've created the visualizations in Power BI Desktop, you can share it with others by publishing it to the Power BI service. For instructions on how to do that, see [Publish from Power BI Desktop](https://powerbi.microsoft.com/documentation/powerbi-desktop-upload-desktop-files/).

## See also

[Azure Data Lake Storage Gen2](AzureDataLakeStorageGen2.md)
