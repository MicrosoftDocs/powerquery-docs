---
title: Migrate a standard V1 dataflow to a standard V2 dataflow
description: Describes how to migrate a Power Platform standard V1 dataflow to a new standard V2 dataflow
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 11/20/2024
ms.author: dougklo
ms.subservice: dataflows
---

# Migrate a standard V1 dataflow to a standard V2 dataflow

> [!NOTE]
> We encourage Power Platform dataflow users to migrate from standard V1 dataflows to standard V2 dataflows. Standard V1 dataflows are on a path to discontinued support in the near future.

Follow these steps to migrate a standard V1 dataflow to a standard V2 dataflow.

1. In the dataflow action bar, select the **Create copy** option for the standard V1 dataflow you would like to migrate to a standard V2 dataflow. In case the dataflow isn't published, the draft version would be copied.

   :::image type="content" source="media/migrate-standard-v1-to-v2-dataflow/select-create-copy.png" alt-text="Screenshot of the dataflows action bar with the Create copy option emphasized.":::

1. A new dataflow copy is created as a standard V2 dataflow type.

   :::image type="content" source="media/migrate-standard-v1-to-v2-dataflow/standard-v2-type.png" alt-text="Screenshot of the new dataflow as a standard v2 dataflow.":::

1. Select the **Edit** option.

   :::image type="content" source="media/migrate-standard-v1-to-v2-dataflow/select-edit-option.png" alt-text="Screenshot of the dataflow copy ellipsis menu open and the edit option emphasized.":::

1. Review the Power Query settings that were copied from the original standard V1 dataflow.

1. If needed, reconfigure the dataflow connection.

1. Select **Next** and review the destination settings that were copied from the original standard V1 dataflow.

   Optionally, consider temporarily changing the target table so that you can validate the new standard V2 dataflow refresh results without integrating data into your production table.

1. Select **Publish**. This selection also automatically starts a refresh for the dataflow.

1. If the original standard V1 dataflow was configured with an automatic refresh schedule, select **Edit refresh settings** and reconfigure the refresh schedule for the new standard V2 dataflow.

   :::image type="content" source="media/migrate-standard-v1-to-v2-dataflow/edit-refresh-settings.png" alt-text="Screenshot of the published v2 dataflow ellipsis menu with Edit refresh settings emphasized.":::

1. Optionally, you can download the standard V1 dataflow refresh history logs by selecting **Show refresh history** and then **Download refresh history file**.

   :::image type="content" source="media/migrate-standard-v1-to-v2-dataflow/show-refresh-history.png" alt-text="Screenshot of the published v2 dataflow ellipsis menu with Show refresh history emphasized.":::

1. If the standard V1 dataflow is included within an unmanaged solution, delete it from the solution using the **Remove from this solution** option.

   If the standard V1 dataflow is included within a managed solution, go to the source environment and recreate the solution with the new standard V2 dataflow.

   Add the new standard V2 dataflow to the solution using **Add existing** -> **Automation** -> **Dataflow**, and then **Publish all customization**. For more information, go to [Solutions in Power Apps](/power-apps/maker/data-platform/solutions-overview).

   :::image type="content" source="media/migrate-standard-v1-to-v2-dataflow/add-existing-automation-dataflow.png" alt-text="Screenshot of the automation dataflow option to select under the add existing option menu.":::

1. Once the new standard V2 dataflow is configured and validated, we recommend that you delete the old standard V1 dataflow.

   :::image type="content" source="media/migrate-standard-v1-to-v2-dataflow/delete-v1-dataflow.png" alt-text="Screenshot of the published v2 dataflow ellipsis menu with Delete option emphasized.":::
