---
title: Power Query template
description: Learn how to import and export a Power Query template that helps you move entire Power Query projects across environments that support the template functionality.
author: ptyx507x
ms.topic: overview
ms.date: 4/13/2026
ms.author: miescobar
ms.subservice: transform-data
---

# Power Query template

A Power Query template is a file that includes the Power Query script and its related metadata for a single Power Query project.

You can use it to package your entire Power Query project into a single file so you can share it or import it into other Power Query integrations.

>[!NOTE]
>A Power Query project is a single instance of the Power Query editor that can have any number of parameters, queries, and settings like the locale used to interpret data types.
>[!IMPORTANT]
>Items outside the mashup document or its metadata aren't part of a Power Query template. Examples include dataflow-related items like scheduled refresh definitions, refresh history, dataflow IDs, referenced connections, and other items that aren't stored in the mashup document or its metadata.

## Export a template

>[!NOTE]
>This guide applies to all Power Query Online hosts.
>
>For Power Query in Excel for Windows, see [Export queries in Excel to a Power Query template](new-dataflow-from-template.md#exporting-queries-in-excel-to-a-power-query-template).

On the **Home** tab of the ribbon, go to the *Share* group and select **Export template**.

:::image type="content" source="media/power-query-template/export.png" alt-text="Screenshot of the Export Template button located inside the Share group of the Home tab in the ribbon.":::

When you select this button, a dialog opens where you can enter the template name and description.

:::image type="content" source="media/power-query-template/export-dialog.png" alt-text="Screenshot of the Export Template dialog to set the name and the description for the template.":::

This action downloads a `.pqt` file, which is your Power Query template file.

>[!NOTE]
>Different product integrations let you export specific scripts, like destination queries and query attributes in the Fabric Dataflow Gen2 experience.

## Import a template

>[!NOTE]
>This feature is only available in the Dataflows Gen2 experience for Microsoft Fabric.

The option to import from a template is only available in Power Query projects that don't have queries or parameters set. On the Power Query editor home screen, you can select **Import from Power Query template**.

:::image type="content" source="media/power-query-template/import-template.png" alt-text="Screenshot of how to import from a Power Query template link in the Power Query home page or canvas.":::

When you select **Import from Power Query template**, you can upload your Power Query template and immediately load the project with all its queries, parameters, and settings.

>[!IMPORTANT]
>Connections and credential definitions aren't stored in a Power Query template file. You need to set them up after you import the template.
