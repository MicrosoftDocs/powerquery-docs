---
title: Power Query Profisee connector
description: Provides basic information and prerequisites for the Profisee connector, descriptions of the optional input parameters, and discusses limitations and issues you might encounter.
author: DougKlopfenstein
ms.author: dougklo
ms.service: powerquery
ms.topic: conceptual
ms.date: 11/21/2025
LocalizationGroup: reference
ms.subservice: connectors
---

# Profisee

> [!NOTE]
>This connector is owned and provided by Profisee.

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Organizational account |

> [!NOTE]
>Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

Before using the Profisee connector, you must have:

* A Profisee account (username and password)
* A running Profisee instance (version 2022.R1 or higher)

## Capabilities supported

* Import

## Connect to Profisee in Power BI Desktop

To use the Profisee connector:

1. Open Power BI Desktop.

2. Select the **Get Data** option in the **Home** ribbon to open the **Get Data** dialogue.

   :::image type="content" source="media/profisee/pconnector1.png" alt-text="Screenshot of the Get Data dialog opening screen.":::

3. Enter **Profisee** into the search box or select **Online Services** and select **Profisee** from the list, then select **Connect.**

   :::image type="content" source="media/profisee/pconnector2.png" alt-text="Screenshot of the Get Data dialog with the Profisee connector selected.":::

4. Enter the URL for your Profisee instance, then select **OK**.

   :::image type="content" source="media/profisee/pconnector3.png" alt-text="Screenshot of the Profisee connector dialog where you enter the URL.":::

5. If it's your first time connecting, you're prompted to sign in using an authentication service.

   :::image type="content" source="media/profisee/pconnector4.png" alt-text="Screenshot of the authentication dialog where you sign in to your account.":::

6. Select **Connect.**

   :::image type="content" source="media/profisee/pconnector5.png" alt-text="Screenshot of the authentication dialog after you sign in to your account.":::

7. Once connected, the **Navigator** is displayed. This display lists all entities in your Profisee instance. You can scroll through the navigator to locate specific entities, or search for entities by name using the search bar.

   :::image type="content" source="media/profisee/pconnector6.png" alt-text="Screenshot of the Navigator dialog where you select the entities you want to use.":::

8. Select the entities that you want to import into Power BI. You can preview the data and choose to either first **Transform Data** if you want to edit the attribute columns, apply filters, and so on, or **Load** the data directly into Power BI Desktop.

   :::image type="content" source="media/profisee/pconnector7.png" alt-text="Screenshot of the Navigator dialog after you select the entities you want to use.":::

9. Once loaded, the entities appear in the model view, and you can view the attributes ready for use in Power BI in the **Fields** dialog.

   :::image type="content" source="media/profisee/pconnector8.png" alt-text="Screenshot of the fields pane in Power BI Desktop.":::

> [!NOTE]
 >Relationships in Profisee aren't created in the model in Power BI. After the entities are loaded, you can view the model and create or modify relationships as desired.
