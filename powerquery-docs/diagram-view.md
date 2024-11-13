---
title: Diagram view
description: Diagram view offers a visual way to prepare data in the Power Query editor, where you can easily create queries and visualize the data preparation process.
author: ptyx507
ms.date: 11/11/2024
ms.author: miescobar
---

# Diagram view

Diagram view offers a visual way to prepare data in the Power Query editor. With this interface, you can easily create queries and visualize the data preparation process. Diagram view simplifies the experience of getting started with data wrangling. It speeds up the data preparation process and helps you quickly understand the dataflow, both the "big picture view" of how queries are related and the "detailed view" of the specific data preparation steps in a query.

This article provides an overview of the capabilities provided by diagram view.

:::image type="content" source="media/diagram-view/diagram-view-sample.png" lightbox="media/diagram-view/diagram-view-sample.png" alt-text="Screenshot of the Power Query interface with three queries shown in the diagram view.":::

This feature is enabled by selecting **Diagram view** in the **View** tab on the ribbon. You can also enable diagram view by selecting the diagram view icon in the lower right side of the Power Query editor. With diagram view enabled, the steps pane and queries pane are collapsed.  

:::image type="content" source="media/diagram-view/enabling-diagram-view.png" alt-text="Screenshot of the diagram view option inside the View tab in the Power Query ribbon.":::

:::image type="content" source="media/diagram-view/enabling-diagram-view-icon.png" alt-text="Screenshot of the diagram view icon in the lower right portion of the Power Query editor.":::

> [!NOTE]
>Currently, diagram view is only available in Power Query Online.

## Authoring queries using diagram view

Diagram view provides you with a visual interface to create, view, or modify your queries. In diagram view, you can connect to many different types of data sources using the [get data experience](get-data-experience.md).

Diagram view is also connected to the Data Preview and the ribbon so that you can select columns in the Data Preview.

You can add a new step within a query, after the currently selected step, by selecting the **+** button, and then either search for the transform or choose the item from the shortcut menu. These items are the same transforms you find in the Power Query editor ribbon.

:::image type="content" source="media/diagram-view/diagram-view-plus-sign.png" alt-text="Screenshot showing an example of using the plus icon in a query to add a new step in the query.":::

When you search and select the transform from the shortcut menu, the step gets added to the query.

:::image type="content" source="media/diagram-view/step-added-from-diagram-view.png" alt-text="Screenshot of the Remove duplicates transform added through the use of the plus icon in the query when in the diagram view.":::

> [!NOTE]
> To learn more about how to author queries in the Query editor using the Power Query editor ribbon or data preview, go to [Power Query Quickstart](/power-query/power-query-ui).

## Query level actions

You can perform two quick actions on a query&mdash;*expand/collapse* a query and *highlight related queries*. These quick actions show up on an active selected query or when hovering over a query.

:::image type="content" source="media/diagram-view/diagram-view-query-quick-actions.png" alt-text="Screenshot of quick action buttons in a query as shown in the diagram view." lightbox="media/diagram-view/diagram-view-query-quick-actions.png":::

You can perform more query level actions, such as duplicate, reference, and so on, by selecting the query level context menu (the three vertical dots). You can also right-click in the query and get to the same context menu.

 :::image type="content" source="media/diagram-view/diagram-view-query-more-actions.png" alt-text="Screenshot of the query contextual menu with more query level actions provided." lightbox="media/diagram-view/diagram-view-query-more-actions.png":::

### Expand or collapse query

To expand or collapse a query, right-click in the query and select **Expand/Collapse** from the query's context menu. You can also double-click in the query to expand or collapse a query.

:::image type="content" source="media/diagram-view/diagram-view-expand-collapse-query.png" alt-text="Screenshot emphasizing the collapse button in the context menu of the query." lightbox="media/diagram-view/diagram-view-expand-collapse-query.png":::

### Highlight related queries

To view all the related queries for a given query, right-click in a query and select **Highlight related queries**. You can also select the highlight related queries button on the top-right of a query.

:::image type="content" source="media/diagram-view/diagram-view-highlight-related-queries.png" alt-text="Screenshot highlighting the related queries button at the top of the Top US Customers query and inside the context menu.":::

For example, if you select the highlight related queries button in the **Top US Customers** query, the **Customers** and **Orders** queries are then highlighted.  

:::image type="content" source="media/diagram-view/diagram-view-highlight-related-queries-active.png" alt-text="Screenshot with the related queries highlighted for the Top US Customers query inside the diagram view." lightbox="media/diagram-view/diagram-view-highlight-related-queries-active.png":::

### Delete query

To delete a query, right-click in a query and select **Delete** from the context menu. Another pop-up asks you to confirm the deletion.

:::image type="content" source="media/diagram-view/diagram-view-delete-query.png" alt-text="Screenshot of the delete option inside the query contextual menu emphasized.":::

### Rename query

To rename a query, right-click in a query and select **Rename** from the context menu.

:::image type="content" source="media/diagram-view/diagram-view-rename-query.png" alt-text="Screenshot of the rename option inside the query contextual menu emphasized.":::

### Enable load

To ensure that the results provided by the query are available for downstream use such as report building, by default **Enable load** is set to true. In case you need to disable load for a given query, right-click in a query and select **Enable load**. The queries where **Enable load** is set to false are displayed with a grey outline.

:::image type="content" source="media/diagram-view/diagram-view-query-enable-load.png" alt-text="Screenshot of the enable load option inside the query contextual menu emphasized.":::

### Duplicate

To create a copy of a given query, right-click in the query and select **Duplicate**. A new duplicate query appears in the diagram view.

:::image type="content" source="media/diagram-view/diagram-view-duplicate-query.png" alt-text="Screenshot of the duplicate option inside the query contextual menu emphasized.":::

### Reference

Referencing a query creates a new query. The new query uses the steps of the previous query without having to duplicate the query. Additionally, any changes in the original query transfers down to the referenced query. To reference a query, right-click in the query and select **Reference**.

:::image type="content" source="media/diagram-view/diagram-view-reference-query.png" alt-text="Screenshot of the reference option inside the query contextual menu emphasized.":::

### Move to group

You can make folders and move the queries into these folders for organizational purposes. These folders are called *groups*. To move a given query to a Query group, right-click in a query and select **Move to group**. You can choose to move the queries to an existing group or create a new query group.

:::image type="content" source="media/diagram-view/diagram-view-move-query-to-group.png" alt-text="Screenshot of the move to group option inside the query contextual menu emphasized." lightbox="media/diagram-view/diagram-view-move-query-to-group.png":::

You can view the query groups above the query box in the diagram view.

:::image type="content" source="media/diagram-view/diagram-view-queries-in-group.png" alt-text="Screenshot of the icon and label that specifies the group the query is moved to." lightbox="media/diagram-view/diagram-view-queries-in-group.png":::

### Create function

When you need to apply the same set of transformations in different queries or values, creating custom Power Query *functions* can be valuable. To learn more about custom functions, go to [Using custom functions](./custom-function.md). To convert a query into a reusable function, right-click in a given query and select **Create function**.

:::image type="content" source="media/diagram-view/diagram-view-create-function.png" alt-text="Screenshot of the create function option inside the query contextual menu emphasized." lightbox="media/diagram-view/diagram-view-create-function.png":::

### Convert to parameter

A parameter provides the flexibility to dynamically change the output of your queries depending on their value and promotes reusability. To convert a nonstructured value such as date, text, number, and so on, right-click in the query and select **Convert to Parameter**.

:::image type="content" source="media/diagram-view/diagram-view-convert-to-parameter.png" alt-text="Convert to parameter option inside the query contextual menu.":::

> [!NOTE]
> To learn more about parameters, go to [Power Query parameters](power-query-query-parameters.md).

### Advanced editor

With the advanced editor, you can view the code that Power Query editor is creating with each step. To display the code for a given query, right-click in the query and select **Advanced editor**.

:::image type="content" source="media/diagram-view/diagram-view-advanced-editor.png" alt-text="Screenshot of the advanced editor option inside the query contextual menu emphasized." lightbox="media/diagram-view/diagram-view-advanced-editor.png":::

> [!NOTE]
> To learn more about the code used in the advanced editor, go to [Power Query M language specification](/powerquery-m/power-query-m-language-specification).

### Edit query name and description

To edit the name of a query or add a description, right-click in a query and select **Properties**.

:::image type="content" source="media/diagram-view/diagram-view-query-properties.png" alt-text="Screenshot of the properties option inside the query contextual menu emphasized.":::

This action opens a dialog box where you can edit the name of the query or add to or modify the query description.

:::image type="content" source="media/diagram-view/diagram-view-query-properties-window.png" alt-text="Screenshot of the query properties window for the Top Employees by Customers query with a custom Description.":::

Queries with a query description have an affordance (***i*** icon). You can view the query description by hovering near the query name.

:::image type="content" source="media/diagram-view/diagram-view-description-icon.png" alt-text="Screenshot of the affordance or ***i*** icon next to the name of the query that when hovered displays the description of the query.":::

### Append queries/Append queries as new

To append or perform a UNION of queries, right-click in a query and select **Append queries**. This action displays the **Append** dialog box where you can add more tables to the current query. **Append queries as new** also displays the **Append** dialog box, but allows you to append multiple tables into a new query.

:::image type="content" source="media/diagram-view/diagram-view-append-queries.png" alt-text="Screenshot of the append queries options inside the query contextual menu emphasized." lightbox="media/diagram-view/diagram-view-append-queries.png":::

> [!NOTE]
> To learn more about how to append queries in Power Query, go to [Append queries](append-queries.md).

### Merge queries/Merge queries as new

To merge or JOIN queries, right-click in a query and select **Merge queries**. This action displays the **Merge** dialog box, with the selected query as the left table of the merge operation. **Merge queries as new** also displays the **Merge** dialog box, but allows you to merge two tables into a new query.

:::image type="content" source="media/diagram-view/diagram-view-merge-queries.png" alt-text="Screenshot of the merge queries options inside the query contextual menu emphasized." lightbox="media/diagram-view/diagram-view-merge-queries.png":::

> [!NOTE]
> To learn more about how to merge queries in Power Query, go to [Merge queries overview](merge-queries-overview.md).

## Step level actions

By right-clicking a step, you can perform step level actions such as *Edit settings*, *Rename*, and so on.

:::image type="content" source="media/diagram-view/diagram-view-step-settings.png" alt-text="Screenshot of the step level actions displaying in the contextual menu after right clicking a step." lightbox="media/diagram-view/diagram-view-step-settings.png":::

### Edit settings

To edit the step level settings, right-click the step and choose **Edit settings**. Or, you can double-click the step (that has step settings) and directly get to the settings dialog box. In the settings dialog box, you can view or change the step level settings. For example, the following image shows the settings dialog box for the **Split column** step.

:::image type="content" source="media/diagram-view/diagram-view-edit-step-settings.png" alt-text="Screenshot of the settings dialog for the Split column step of a query.":::

### Rename step

To rename a step, right-click the step and select **Rename**. This action opens the **Step properties** dialog. Enter the name you want, and then select **OK**.

:::image type="content" source="media/diagram-view/diagram-view-rename-step.png" alt-text="Screenshot of the rename option inside the step level contextual menu after right-clicking a step.":::

### Delete step

To delete a step, right-click the step and select **Delete**. To delete a series of steps until the end, right-click the step and select **Delete until end**.

:::image type="content" source="media/diagram-view/diagram-view-delete-step.png" alt-text="Screenshot of the Delete and Delete until end options inside the step level contextual menu after right-clicking a step.":::

### Move before/Move after

To move a step one position before, right-click a step and select **Move before**. To move a step one position after, right-click a step and select **Move after**.

:::image type="content" source="media/diagram-view/diagram-view-move-step.png" alt-text="Screenshot of the Move before and Move after options inside the step level contextual menu after right-clicking a step.":::

### Extract previous  

To extract all previous steps into a new query, right-click the first step that you *don't* want to include in the query, and then select **Extract previous**.

:::image type="content" source="media/diagram-view/diagram-view-extract-previous-steps.png" alt-text="Screenshot of the Extract previous option inside the step level contextual menu after right clicking a step.":::

### Edit step name and description

To add step descriptions, right-click a step in a query and then choose **Properties**.

:::image type="content" source="media/diagram-view/diagram-view-steps-properties.png" alt-text="Screenshot of the Properties option inside the step level contextual menu after right-clicking a step." lightbox="media/diagram-view/diagram-view-steps-properties.png":::

This action opens a dialog box where you can add the step description. This step description comes in handy when you come back to the same query after a few days or when you share your queries or dataflows with other users.

:::image type="content" source="media/diagram-view/diagram-view-steps-properties-window.png" alt-text="Screenshot of the Step properties window for the step with the name 'Filtered rows' and a description that reads 'Filter by USA'.":::

By hovering over each step, you can view a call out that shows the step label, step name, and step descriptions (that were added).

:::image type="content" source="media/diagram-view/diagram-view-step-descriptions.gif" alt-text="Animated GIF showing the descriptions at the step level for the steps with the names 'Choose columns' and 'Filter rows' in the Customers query." lightbox="media/diagram-view/diagram-view-step-descriptions.gif":::

By selecting each step, you can see the corresponding data preview for that step.

## Expand and collapse queries

To ensure that you can view your queries in the diagram view, you can collapse the ones that you aren't actively working on and expand the ones that you care about. Expand or collapse queries by selecting the **Expand/Collapse** button on the top-right of a query. Alternatively, double-clicking an expanded query collapses the query and vice-versa.

:::image type="content" source="media/diagram-view/diagram-view-collapse-query.png" alt-text="Screenshot of the Collapse button on the top right corner of the query in the diagram view." lightbox="media/diagram-view/diagram-view-collapse-query.png":::

You can also expand or collapse a query by selecting the query level actions from the query's context menu.

:::image type="content" source="media/diagram-view/diagram-view-collapse-query-from-context-menu.png" alt-text="Screenshot of the Collapse option inside the query context menu after right-clicking the query." lightbox="media/diagram-view/diagram-view-collapse-query-from-context-menu.png":::

To expand all or collapse all queries, select the **Expand all/Collapse all** button next to the layout options in the diagram view pane.

:::image type="content" source="media/diagram-view/diagram-view-collapse-all-queries-button.png" alt-text="Screenshot of the Expand all/collapse all queries button at the bottom right-hand corner of the diagram view pane.":::

You can also right-click any empty space in the diagram view pane to display a context menu to expand all or collapse all queries.

:::image type="content" source="media/diagram-view/diagram-view-right-click.png" alt-text="Screenshot of the Contextual menu that showcases the Expand all and Collapse all queries options." lightbox="media/diagram-view/diagram-view-right-click.png":::

In the collapsed mode, you can quickly look at the steps in the query by hovering over the number of steps in the query. You can select these steps to navigate to that specific step within the query.  

:::image type="content" source="media/diagram-view/diagram-view-collapsed-queries.png" alt-text="Callout showing the available steps in the Customers query after hovering over the number of steps label in the query." lightbox="media/diagram-view/diagram-view-collapsed-queries.png":::

## Layout Options

There are five layout options available in the diagram view: zoom out, zoom in, mini-map, full screen, fit to view, and reset.

### Zoom out and zoom in

With this option, you can adjust the zoom level and zoom out or zoom in to view all the queries in the diagram view.

:::image type="content" source="media/diagram-view/diagram-view-zoom.png" alt-text="Zoom out or zoom in button available at the bottom right-hand corner of the diagram view pane.":::

### Mini-map

With this option, you can turn the diagram view mini-map on or off. More information: [Show mini-map](#show-mini-map)

:::image type="content" source="media/diagram-view/show-mini-map-button.png" alt-text="Mini-map button available at the bottom right-hand corner of the diagram view pane.":::

### Full screen

With this option, you can view all the queries and their relationships through the *Full screen* mode. The diagram view pane expands to full screen and the data preview pane, queries pane, and steps pane remain collapsed.

:::image type="content" source="media/diagram-view/diagram-view-full-screen.png" alt-text="Full screen button available at the bottom right-hand corner of the diagram view pane.":::

### Fit to view

With this option, you can adjust the zoom level so that all the queries and their relationships can be fully viewed in the diagram view.

:::image type="content" source="media/diagram-view/diagram-view-fit-to-view.png" alt-text="Fit to view button available at the bottom right hand corner of the diagram view pane.":::

### Reset

With this option, you can reset the zoom level back to 100% and also reset the pane to the top-left corner.

:::image type="content" source="media/diagram-view/diagram-view-reset-view.png" alt-text="Reset button available at the bottom right-hand corner of the diagram view pane.":::

## View query relationships

To view all the related queries for a given query, select the **Highlight related queries** button. For instance, by selecting the highlight related queries button in the **Top US Customers** query, the **Customers** and **Orders** queries are highlighted.  

:::image type="content" source="media/diagram-view/diagram-view-highlight-related-queries-sample.png" alt-text="Screenshot of the highlighted queries related to the Top US Customers (Orders and Customers) after selecting the Highlight related queries button." lightbox="media/diagram-view/diagram-view-highlight-related-queries-sample.png":::

You can also select the dongle on the left of a given query to see the direct and indirect referenced queries.

:::image type="content" source="media/diagram-view/diagram-view-highlight-related-queries-sample-dongle.png" alt-text="Screenshot of the highlighted queries related to the Top US Customers after selecting the small dongle on the Top US Customers query." lightbox="media/diagram-view/diagram-view-highlight-related-queries-sample-dongle.png":::

Similarly, you can select the right dongle to view direct and indirect dependent queries.

:::image type="content" source="media/diagram-view/diagram-view-highlight-related-queries-direct-indirect-dependent-queries.png" alt-text="Screenshot of the callout that displays the direct dependent and indirect dependent queries after selecting the right dongle of the Customers query." lightbox="media/diagram-view/diagram-view-highlight-related-queries-direct-indirect-dependent-queries.png":::

You can also hover on the link icon below a step to view a callout that shows the query relationships.

:::image type="content" source="media/diagram-view/diagram-view-hover-link-icon.png" alt-text="Referenced queries are listed in a callout after hovering over the link icon below a step.":::

## Diagram view settings

There are two ways to modify diagram view settings. The first way is to select the lower half of the **Diagram View** button inside the **View** tab in the ribbon.

:::image type="content" source="media/diagram-view/diagram-view-settings.png" alt-text="Screenshot shows the diagram view settings after opening from the diagram view button on the View ribbon.":::

The second way to modify diagram view settings is to right-click over a blank part of the diagram view background.

:::image type="content" source="media/diagram-view/diagram-view-settings-2.png" alt-text="Screenshot displays diagram view setting after right-clicking over blank part of the background." lightbox="media/diagram-view/diagram-view-settings-2.png":::

### Step labels and step names

Diagram view shows **step labels** by default.

:::image type="content" source="media/diagram-view/diagram-view-step-labels.png" alt-text="Screenshot of the Step labels displayed in diagram view." lightbox="media/diagram-view/diagram-view-step-labels.png":::

You can change diagram view settings to show **step names** to match the **applied steps** within the **query settings** pane.

:::image type="content" source="media/diagram-view/diagram-view-step-names-change.png" alt-text="Screenshot of the Diagram view settings under the view tab with Show step names emphasized.":::

The step names are now displayed in the diagram view.

:::image type="content" source="media/diagram-view/diagram-view-step-names.png" alt-text="Step names are displayed in diagram view." lightbox="media/diagram-view/diagram-view-step-names.png":::

### Auto-highlight related queries

By selecting **Auto-highlight related queries** within diagram view settings, related queries are always highlighted so that you can visually see the query dependencies better.

:::image type="content" source="media/diagram-view/diagram-view-auto-highlight-related-queries.png" alt-text="Screenshot of the Diagram view showing a light blue highlight for queries which are related to each other." lightbox="media/diagram-view/diagram-view-auto-highlight-related-queries.png":::

### Compact view

When you have queries with multiple steps, it can be challenging to scroll horizontally to view all your steps within the viewport.

:::image type="content" source="media/diagram-view/diagram-view-compact-view.png" alt-text="Screenshot of the Diagram view showing a query with many steps, requiring a low zoom level to view all the steps." lightbox="media/diagram-view/diagram-view-compact-view.png":::

To address this issue, diagram view offers **Compact view**, which compresses the steps from top to bottom instead of left to right. This view can be especially useful when you have queries with multiple steps, so that as many queries as possible are displayed within the viewport.

:::image type="content" source="media/diagram-view/diagram-view-compact-view-activated.png" alt-text="Screenshot of the Diagram view showing a query in compact view, where steps are displayed top to bottom instead of left to right." lightbox="media/diagram-view/diagram-view-compact-view-activated.png":::

To enable this view, navigate to diagram view settings and select **Compact view** inside the **View** tab in the ribbon.

:::image type="content" source="media/diagram-view/diagram-view-compact-view-settings.png" alt-text="Diagram view settings with compact view selection in a red box.":::

### Show mini-map

Once the number of queries begin to overflow the diagram view, you can use the scroll bars at the bottom and right side of the diagram view to scroll through the queries. One other method of scrolling is to use the diagram view mini-map control. The mini-map control lets you keep track of the overall dataflow "map," and quickly navigate, while looking at a specific area of the map in the main diagram view area.

To open the mini-map, either select **Show mini-map** from the diagram view menu or select the mini-map button in the layout options.

:::image type="content" source="media/diagram-view/show-mini-map.png" alt-text="Screenshot of the Diagram view settings with compact view selection emphasized." lightbox="media/diagram-view/show-mini-map.png":::

Right-click and hold the rectangle on the mini-map, then move the rectangle to move around in the diagram view.

### Show animations

When the **Show animations** menu item is selected, the transitions of the sizes and positions of the queries are animated. These transitions are easiest to see when collapsing or expanding the queries or when changing the dependencies of existing queries. When cleared, the transitions are immediate. Animations are turned on by default.

:::image type="content" source="media/diagram-view/show-animations.gif" alt-text="Animation showing the difference between Show animations being selected or being cleared.":::

## Maximize data preview

You might want to see more data within the data preview to understand and analyze the data. To do so, expand the data preview so as much data as before is displayed within the data preview without leaving diagram view.

:::image type="content" source="media/diagram-view/diagram-view-maximize-data-preview.jpg" alt-text="Screenshot of the data preview with the Expand and Contract up and down arrows in the top left emphasized." lightbox="media/diagram-view/diagram-view-maximize-data-preview.jpg":::

## Expand or collapse all queries

By default, the queries in diagram view are collapsed. There are options to expand or collapse each query in a single selection.

:::image type="content" source="media/diagram-view/data-preview-expand-queries.png" alt-text="Screenshot showing a button and tooltip to expand all queries in the bottom right of diagram view.":::

You can also expand or collapse related queries from the query level context menu.

:::image type="content" source="media/diagram-view/diagram-view-expand-or-collapse-queries.png" alt-text="Screenshot of the diagram view's query level context menu with the Expand or Collapse related queries emphasized." lightbox="media/diagram-view/diagram-view-expand-or-collapse-queries.png":::

## Multi-select queries

You select multiple queries within the diagram view by holding down the Ctrl key and selecting queries. Once you multi-select, right-clicking shows a context menu that allows performing operations such as merge, append, move to group, expand and collapse, and more.

:::image type="content" source="media/diagram-view/diagram-view-multi-select.png" alt-text="Screenshot of the diagram view with two queries multi-selected and a context menu displaying different operations." lightbox="media/diagram-view/diagram-view-multi-select.png":::

## Inline rename

You can double-click the query name to rename the query.

:::image type="content" source="media/diagram-view/diagram-view-inline-rename.png" alt-text="Screenshot of the diagram view showing how double clicking the query name makes the name editable." lightbox="media/diagram-view/diagram-view-inline-rename.png":::

Double-clicking the step name allows you to rename the step, provided the diagram view setting is showing step names.

:::image type="content" source="media/diagram-view/diagram-view-rename-inline-step.png" alt-text="Screenshot of the diagram view showing how double clicking the step name makes the name editable." lightbox="media/diagram-view/diagram-view-rename-inline-step.png":::

When step labels are displayed in diagram view, double-clicking the step label shows the dialog box to rename the step name and provide a description.

:::image type="content" source="media/diagram-view/diagram-view-rename-step-label.png" alt-text="Screenshot of the diagram view showing a modal where step properties and description can be edited.":::

## Accessibility

Diagram view supports accessibility features such as keyboard navigation, high-contrast mode, and screen reader support. The following table describes the keyboard shortcuts that are available within diagram view. To learn more about keyboard shortcuts available within Power Query Online, go to [keyboard shortcuts in Power Query](keyboard-shortcuts.md).

| Action | Keyboard shortcut|
| --- | --- |
| Expand selected query | Ctrl+Right arrow key |
| Collapse selected query | Ctrl+Left arrow key |
| Move focus from query level to step level | Alt+Down arrow key |
| Move focus from step level to query level | Esc |
| Expand all queries | Ctrl+Shift+Right arrow key |
| Collapse all queries | Ctrl+Shift+Left arrow key |
| Insert new step using+button (after selected step) | Ctrl+Alt+N |
| Highlight related queries | Ctrl+Alt+R |
| Select all queries | Ctrl+A |
| Copy queries | Ctrl+C |
| Paste queries | Ctrl+V |
