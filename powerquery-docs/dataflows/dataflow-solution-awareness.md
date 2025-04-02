---
title: Dataflows in solutions
description: Provides an overview of dataflows in solutions, and includes special considerations and limitations.
author: Luitwieler
ms.author: jeluitwi
ms.topic: conceptual 
ms.date: 4/2/2025 
ms.subservice: dataflows
---
# Overview of solution-aware dataflows

When you include your dataflows in a solution, their definitions become portable, making it easier to move them from one environment to another, saving the time required to author the dataflow.

A typical use case is for an independent software vendor (ISV) to develop a solution containing a dataflow that extracts and transforms data from a data source to Dataverse tables, in a sandbox environment. The ISV would then move that dataflow and destination tables to a test environment to test with their test data source to validate that the solution works well and is ready for production. After testing completes, the ISV would provide the dataflow and tables to clients who will import them into their production environment to operate on client’s data. This process is much easier when you add both the dataflows and tables they load data to into solutions, and then move the solutions and their contents between environments.

Dataflows added to a solution are known as *solution-aware* dataflows. You can add multiple dataflows to a single solution.

> [!NOTE]
>
> * Only dataflows created in Power Platform environments can be solution-aware.
> * The data loaded by dataflows to their destination isn't portable as part of solutions, only the dataflow definitions are. To recreate the data after a dataflow was deployed as part of a solution, you need to refresh the dataflow.

## Add a new dataflow to a solution

Follow these steps to add a dataflow to a solution.

### Prerequisites

You need to create a solution before you can add a dataflow to it. More information: [Create solutions](/power-apps/maker/data-platform/create-solution)

### Add the dataflow

1. Sign in to [Power Apps](https://powerapps.microsoft.com).  

2. Select **Solutions** from the navigation bar.

   :::image type="content" source="media/dataflows-solution-awareness/select-solutions.png" alt-text="Screenshot of the Power Apps home page with the Solutions selection emphasized.":::

3. Select the solution you’d like to add a new dataflow to, and from the context menu select **Edit**.

   :::image type="content" source="media/dataflows-solution-awareness/edit-solution.png" alt-text="Screenshot of the solution page with a selected solution with the Edit option emphasized." lightbox="media/dataflows-solution-awareness/edit-solution.png":::

4. Select **New** from the menu and navigate to **Automation** > **Dataflow**.

   :::image type="content" source="media/dataflows-solution-awareness/select-automation-dataflow.png" alt-text="Screenhot of the opened New menu with Automation shown and Dataflow selected." lightbox="media/dataflows-solution-awareness/select-automation-dataflow.png":::

5. Proceed to create a new dataflow.

   :::image type="content" source="media/dataflows-solution-awareness/create-dataflow.png" alt-text="Screenshot of the dataflow added to the solution." lightbox="media/dataflows-solution-awareness/create-dataflow.png":::

## Add an existing dataflow to a solution

Follow these steps to add a dataflow to a solution.

### Prerequisites

* You need to create a solution before you can add a dataflow to it. More information: [Create solutions](/powerapps/maker/data-platform/create-solution)
* You need to be the owner of at least one dataflow in the environment. More information: [Create dataflows](/data-integration/dataflows/dataflows-integration-overview)

### Add the dataflow

1. Sign in to [Power Apps](https://powerapps.microsoft.com).
2. Select **Solutions** from the navigation bar.

   :::image type="content" source="media/dataflows-solution-awareness/select-solutions-from-left-nav.png" alt-text="Screenshot of the left navigation bar with the Solutions option highlighted.":::

3. Select the solution you'll add your dataflow to, and from the context menu select **Edit**.

   :::image type="content" source="media/dataflows-solution-awareness/solutions-02-edit-solution.png" alt-text="Screenshot of the list of solutions." lightbox="media/dataflows-solution-awareness/solutions-02-edit-solution.png":::

4. Select **Add Exiting** > **Automation** > **Dataflow**.

   :::image type="content" source="media/dataflows-solution-awareness/solutions-03-add-existing-dataflow.png" alt-text="Screen of the add existing dataflow option highlighted." lightbox="media/dataflows-solution-awareness/solutions-03-add-existing-dataflow.png":::

5. Optional: If your dataflow loads data into a custom Dataverse table, add the custom table to the solution as well.

   In this example, the dataflow you added to the solution loads data into a custom table called **Full Order Details**, which you want to also include in the solution with the dataflow.

   Once both the dataflow and table it loads data to are added to the solution, it has the two artifacts added to the solution. In this case, the artifacts are **cr0c8_FullOrderDetails** and **Import Sales Data**.

   :::image type="content" source="media/dataflows-solution-awareness/solutions-06-components-added.png" alt-text="Screenshot of the two artifacts added to the solution." lightbox="media/dataflows-solution-awareness/solutions-06-components-added.png":::

   To save your work, be sure to publish all customizations. Now, the solution is ready for you to export from the source environment and import to the destination environment.

## Exporting and importing solutions containing dataflows

Exporting and importing solutions containing dataflows is identical to doing the same operations for other artifacts. For the most up-to-date instructions, go to the documentation on [exporting](/powerapps/maker/data-platform/export-solutions) and [importing](/powerapps/maker/data-platform/import-update-export-solutions) solutions.

## Updating a dataflow's connections after solution import

For security reasons, credentials of connections used by dataflows aren't persisted by solutions. Once a dataflow is deployed as part of a solution, you need to edit its connections before it can be scheduled to run.

1. On the left navigation pane, select the down arrow next to **Dataverse** and select **Dataflows**. Identify the dataflow that was imported, and select **Edit** from the context menu.

   :::image type="content" source="media/dataflows-solution-awareness/solutions-dataflows-after-import-02.png" alt-text="Screenshot showing navigation to the dataflow tab." lightbox="media/dataflows-solution-awareness/solutions-dataflows-after-import-02.png":::

2. In the Dataflow list, locate and double-click the dataflow that was added as part of the solution you imported.

3. You're asked to enter credentials required for the dataflow.

   :::image type="content" source="media/dataflows-solution-awareness/solutions-dataflows-after-import-03.png" alt-text="Screenshot of power query prompting for credentials." lightbox="media/dataflows-solution-awareness/solutions-dataflows-after-import-03.png":::

   Once the credentials for the connection are updated, all queries that use that connection automatically load.

4. If your dataflow loads data in Dataverse tables, select **Next** to review the mapping configuration.

   :::image type="content" source="media/dataflows-solution-awareness/solutions-dataflows-after-import-05.png" alt-text="Screenshot showing all queries with data loaded after connection credentials are provided." lightbox="media/dataflows-solution-awareness/solutions-dataflows-after-import-05.png":::

5. The mapping configuration is also saved as part of the solution. Since you also added the destination table to the solutions, there's no need to recreate the table in this environment and you can publish the dataflow.

   :::image type="content" source="media/dataflows-solution-awareness/solutions-dataflows-after-import-06.png" alt-text="Screenshot of the map tables experience with preconfigured selections." lightbox="media/dataflows-solution-awareness/solutions-dataflows-after-import-06.png":::

   That's it. Your dataflow now refreshes and loads data to the destination table.

## Known limitations

* Dataflows can't use connection references for any connector.
* Dataflows can't use environment variables.
* Dataflows don't support adding required components, such as custom tables they load data to. Instead, the custom table should be manually added to the solution.
* Application users can't deploy dataflows (service principals).
* Incremental refresh configuration isn't supported when deploying solutions. After deployment of the dataflow via solution, the incremental refresh configuration should be reapplied.
* Linked tables to other dataflows aren't supported when deploying solutions. After deployment of the dataflow via solution, edit the dataflow and edit the connection to the linked dataflow.
* To enable dataflow import, the Dataflows plugin performs unmanaged customizations during the asynchronous import step. These modifications are essential for a successful import.
* Dataflows don't support block of unmanaged customizations. For more information, go to [Block unmanaged customizations in Dataverse environments](/power-platform/alm/block-unmanaged-customizations#known-limitations).
* Dataflows don't support preferred solutions. For more information, go to [Set a preferred solution](/power-apps/maker/data-platform/preferred-solution#limitations).
* For dataflows to import successfully into an environment, either the environment can't be in administration mode, or background operations need to be enabled.
* If a dataflow is created as part of the solution and data is loaded into a new table, that table isn't created in the same solution. Therefore, the prefixes of the column schema names shown in the dataflow experience don't match the publisher prefix of the dataflow solution.
* For security reasons, credentials of connections used by dataflows aren't persisted by solutions. Once a dataflow is deployed as part of a solution, you need to edit its connections before it can be scheduled to run. Connections need to be updated in both update and upgrade modes of the import, regardless of whether there was a change to the dataflow.
