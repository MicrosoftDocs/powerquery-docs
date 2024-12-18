---
title: Power Query template (preview)
description: Learn how to import and export a Power Query template that helps you move entire Power Query projects across environments.
author: ptyx507x
ms.topic: overview
ms.date: 6/14/2024
ms.author: miescobar
ms.subservice: transform-data
---

# Power Query template (preview)

A Power Query template is a file that encompasses the Power Query script and its associated metadata for a single Power Query project.

The template is meant to be used as a simple means to package your entire Power Query project in a single file. You can then share the file or import it to other Power Query integrations.

> [!NOTE]
>A Power Query project can be defined as a single instance of the Power Query editor. This instance could contain any number of parameters, queries, and specific settings, such as the locale that should be used to interpret data types.

> [!IMPORTANT]
>Concepts that are outside of the Power Query script or its metadata are outside of the scope of what to find in a Power Query template. Some examples are dataflow related concepts such as scheduled refresh definition, refresh history, dataflow IDs, connections referenced, and other concepts that aren't stored in the Power Query script or the metadata of a Power Query project.

## Export a template

> [!NOTE]
>The following guide applies to all Power Query Online hosts.
>
>For Power Query in Excel for Windows, follow the guide in [exporting queries in Excel to a Power Query template](new-dataflow-from-template.md#exporting-queries-in-excel-to-a-power-query-template).

You can find the **Export template** button inside of the **Home** tab of the Power Query ribbon, under the **Share** group.

:::image type="content" source="media/power-query-template/export.png" alt-text="Screenshot that shows the Export Template button located inside the Share group of the Home tab in the ribbon." lightbox="media/power-query-template/export.png":::

When you select this button, the **Export template** dialog appears. In this dialog, you can enter the name of the template and the description that is used for the template.

:::image type="content" source="media/power-query-template/export-dialog.png" alt-text="Screenshot that shows the Export Template dialog, where you set the name and the description for the template.":::

This operation downloads a file with the extension.pqt, which is your Power Query template file.

## Import a template

> [!NOTE]
>This functionality is only available inside of the Dataflows Gen2 experience for Microsoft Fabric.

The option to import from a template is only available in Power Query projects with no queries or parameters set. In the home screen of the Power Query editor, there's a link that reads **Import from Power Query template**.

:::image type="content" source="media/power-query-template/import-template.png" alt-text="Screenshot that shows how to import from a Power Query template link in the Power Query home page or canvas." lightbox="media/power-query-template/import-template.png":::

Selecting the **Import from Power Query template** button triggers an experience to help you upload your Power Query template and immediately load the project with all its queries, parameters, and settings.

> [!IMPORTANT]
>Connections and/or credential definitions aren't stored inside of a Power Query template file. These items need to be set after importing the template.
