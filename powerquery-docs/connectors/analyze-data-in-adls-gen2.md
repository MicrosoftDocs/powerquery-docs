---
title: Analyze data in Azure Data Lake Storage Gen2 by using Power BI
description: Use Power BI to analyze data stored in Azure Data Lake Storage Gen2
author: bensack
ms.topic: conceptual
ms.date: 2/3/2023
ms.author: bensack
---

# Analyze data in Azure Data Lake Storage Gen2 by using Power BI

In this article, you'll learn how to use Power BI Desktop to analyze and visualize data that's stored in a storage account that has a hierarchical namespace (Azure Data Lake Storage Gen2).

## Prerequisites

Before you begin this tutorial, you must have the following prerequisites:

> [!div class="checklist"]
>
> * An Azure subscription. Go to [Get Azure free trial](https://azure.microsoft.com/pricing/free-trial/).
> * A storage account that has a hierarchical namespace. Follow the instructions at [Create a storage account](/azure/storage/common/storage-account-create) to create one. This article assumes that you've created a storage account named `contosoadlscdm`.
> * Ensure you are granted one of the following roles for the storage account: **Blob Data Reader**, **Blob Data Contributor**, or **Blob Data Owner**.
> * A sample data file named `Drivers.txt` located in your storage account. You can download this sample from [Azure Data Lake Git Repository](https://github.com/Azure/usql/tree/master/Examples/Samples/Data/AmbulanceData/Drivers.txt), and then upload that file to your storage account.
> * **Power BI Desktop**. You can download this application from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=45331).

## Create a report in Power BI Desktop

1. Launch Power BI Desktop on your computer.

2. Follow the instructions in the [Azure Data Lake Storage Gen2 connector article](data-lake-storage.md#connect-to-azure-data-lake-storage-gen2-from-power-query-desktop) to connect to the sample data.

3. From the Power Query **Navigator**, select **Load**.

    [![Screenshot of the Navigator, with data from the Drivers.txt file displayed.](media/data-lake-storage/file-systems.png)](media/azure-data-lake-storage-gen2/file-systems.png#lightbox)

4. After the data has been successfully loaded into Power BI, the following fields are displayed in the **Fields** panel.

    ![Screenshot of the Fields panel, showing Query1, which contains Date accessed, Date created, Date modified, Extension, Folder Path, and Name fields.](media/data-lake-storage/fields.png)

    However, to visualize and analyze the data, you might prefer the data to be available using the following fields.

    ![Screenshot of a data table, with names and addresses from the Content column in the original table displayed in rows.](media/data-lake-storage/preferred-fields.png)

    In the next steps, you'll update the query to convert the imported data to the desired format.

5. From the **Home** tab on the ribbon, select **Transform Data**. The Power Query editor then opens, displaying the contents of the file.

    [![Screenshot of the Power Query editor, with the query created from the original Drivers.txt file.](media/data-lake-storage/queries.png)](media/data-lake-storage/queries.png#lightbox)

6. In the Power Query editor, under the **Content** column, select **Binary**. The file will automatically be detected as CSV and will contain the output as shown below. Your data is now available in a format that you can use to create visualizations.

    [![Screenshot of the Power Query editor, showing the data from the Binary field expanded to a table with names and addresses, with Imported CSV and Changed Type added to the Applied Steps panel.](media/data-lake-storage/binary.png)](media/data-lake-storage/binary.png#lightbox)

7. From the **Home** tab on the ribbon, select **Close & Apply**.

    ![Closeup screenshot of the Power Query editor, showing the Close & Apply option.](media/data-lake-storage/close-apply.png)

8. Once the query is updated, the **Fields** tab displays the new fields available for visualization.

    ![Screenshot of the Fields pane in Power BI, with Query1 now displaying Column1 through Column8.](media/data-lake-storage/new-fields.png)

9. Now you can create a pie chart to represent the drivers in each city for a given country/region. To do so, make the following selections.

    From the **Visualizations** tab, select the symbol for a pie chart.

    ![Screenshot of the Visualizations pane, with the pie chart symbol emphasized.](media/data-lake-storage/visualizations.png)

    In this example, the columns you're going to use are Column 4 (name of the city) and Column 7 (name of the country/region). Drag these columns from the **Fields** tab to the **Visualizations** tab as shown below.

    ![Screenshot with Column4 dragged and dropped in Details and Column7 dragged and dropped in Values in the Visualization pane, and Column7 also dragged and dropped into Filters on this page in the Filters pane.](media/data-lake-storage/visualizations-drag-fields.png)

    The pie chart should now resemble the one shown below.

    ![Screenshot of pie chart showing the percentages of each slice of the pie, along with color coding of each of the locations, and a column containing all locations and their color code on the right side.](media/data-lake-storage/pie-chart.png)

10. If you select a specific country/region from the page level filters, the number of drivers in each city of the selected country/region will be displayed. For example, under the **Visualizations** tab, under **Page level filters**, select **Brazil**.

    ![Screenshot of the Filters on this page pane, with Brazil selected as the country/region to display.](media/data-lake-storage/page-filters.png)

11. The pie chart is automatically updated to display the drivers in the cities of Brazil.

    ![Screenshot of pie chart with the percentages of each slice of the pie for locations in Brazil, along with a list of all locations in Brazil and their color code in a column on the right side.](media/data-lake-storage/pie-chart-updated.png)

12. From the **File** menu, select **Save** to save the visualization as a Power BI Desktop file.

## Publish report to Power BI service

After you've created the visualizations in Power BI Desktop, you can share it with others by publishing it to the Power BI service. For instructions on how to do that, go to [Publish from Power BI Desktop](/power-bi/create-reports/desktop-upload-desktop-files).

## See also

* [Azure Data Lake Storage Gen2](data-lake-storage.md)
