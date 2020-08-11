---
title: Applied steps
description: Applied steps show the transformations to the data.
author: t-sazaki
ms.service: powerquery
ms.reviewer: 
ms.date: 08/05/2020
ms.author: t-sazaki
---

# Using the Applied steps list
Applied steps tracks the transforms to your data. In this guide you will learn to 
- Access the Applied steps list
- View data transformations
- Rename Step
- Delete Step
- Delete until end
- Insert step after 
- Move step
- Extract the previous steps into query 
- Edit step names and their descriptions

## Access the Applied steps list
Select the **View** tab from the ribbon and then select **Query Settings**

![Applied steps view](images/applied-steps-view.png)

The **Query Settings** menu will open to the right with the **Applied steps** list.

![Applied steps query settings](images/applied-steps-query-settings.png)

## View data transformations
Any transformations to your data will show in the Applied steps list. For instance, if we change the first column name, it will display in the Applied steps list as **Renamed Columns**.

![Applied steps new column name](images/applied-steps-new-column-name.png)

## Rename Step
To rename a step, right click the step and select **Rename**. 

![Applied steps rename step](images/applied-steps-rename.png)

Enter in the desired name and hit **Enter** or click away from the step.

## Delete Step
To delete a step, right click the step and select **Delete**.

![Applied steps delete step](images/applied-steps-delete.png)

Alternatively, select the **x** next to the step.

![Applied steps delete step with x](images/applied-steps-delete-x.png)

## Delete until end
To delete a series of steps, right click the first step of the series and select **Delete until end**. This will delete the selected step and all the subsequent steps.

![Applied steps delete until end](images/applied-steps-delete-until-end.png)

Select **Delete** on the new window.

![Applied steps delete until end warning](images/applied-steps-delete-until-end-warning.png)

The Applied steps list after using the **Delete until end**.

![Applied steps delete until end after](images/applied-steps-delete-until-end-after.png)

## Insert step after
To add a new step, right click on the last step in the list and select **Insert step after**.

![Applied steps insert step after](images/applied-steps-insert-step-after.png)

To insert a new intermediate step, right click on a step and select **Insert step after**. Then select **Insert** on the new window.

![Applied steps insert step after warning](images/applied-steps-insert-step-after-warning.png)

To set a transformation for the new step, select it in the list and make the change to the data. It will automatically link the transformation to the selected step.

## Move step
To move a step up one position in the list, right click the step and select **Move up**.

![Applied steps move up](images/applied-steps-move-up.png)

To move a step down one position in the list, right click the step and select **Move down**.

![Applied steps move down](images/applied-steps-move-down.png)

Alternatively, or to move more than a single position, drag and drop the step to the desired location.

![Applied steps drag and drop step](images/applied-steps-drag-and-drop-step.png)

## Extract the previous steps into query
It can help to separate a series of transformations into a different query. To extract all the previous steps into a new query, right click the first step you do *not* want to include in the query and select **Extract Previous**.

![Applied steps extract previous](images/applied-steps-extract-previous.png)

Name the new query and select **OK**. To access the new query, navigate to the **Queries pane** on the left side of the screen.

## Edit step names and their descriptions
To edit the step, right click the step and select **Properties**.

![Applied steps properties](images/applied-steps-properties.png)

In the window you can change the step name and description and save the changes by selecting **OK**.

![Applied steps properties](images/applied-steps-properties-window.png)
