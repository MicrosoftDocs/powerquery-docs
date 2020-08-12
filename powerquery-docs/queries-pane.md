---
title: Query pane
description: Within Power Query, you maneuver around the different queries in the editor through the queries pane.
author: jessli20
ms.service: powerquery
ms.reviewer: 
ms.date: 08/04/2020
ms.author: jessli20
---


# Understanding the queries pane

In Power Query, you'll be creating many different queries. Whether it be from getting data from many tables or from duplicating the original query, the number of queries will increase.

You'll be using the **Queries Pane** to navigate through the queries.

![Queries Pane Basic](images/queries-pane-basic.png)


## Navigating with the queries pane

The most basic usage of the **Queries Pane** is to navigate to all of the queries.
The navigation is similar to a file explorer. To switch between the queries, just select the query that you want to go to.

There are also different actions between the online versus desktop Power Query Desktop editors.

## Basic actions in the query pane

Similar to features throughout the Ribbon and the editor, the context menu on a query can allow you to make transformations directly onto the query.

To reach these actions, open the context menu (the right-click menu) on the query pane box.

Differences between online and desktop:

- Power Query Online

  ![Queries Pane Context Menu on Query](images/queries-pane-context-menu-on-query.png)

- Power Query Desktop

  ![Queries Pane Context Menu on Query Desktop](images/queries-pane-context-menu-on-query-desktop.png)

For the sake of being more comprehensive, we will be touching on all of the context menu actions that are relevant for either.

### Rename a query
To directly change the name of the query, double-select on the name of the query. This action will allow you to immediately change the name.

Other options to rename the query are:
- Go to the context menu and select **Rename**

  ![Queries Settings Rename](images/queries-settings-rename.png)

- Go to the **Query Settings** and enter in a different name in the **Name** input field.
 
  ![Queries Pane On Query Rename](images/queries-pane-on-query-rename.png)

### Delete a query
To delete a query, open the context pane on the query and select **Delete**.
There will be an additional pop-up confirming the deletion. To finalize the deletion, select the *Delete* button.

![Queries Pane On Query Delete](images/queries-pane-on-query-delete.png)

### Duplicating a query
Duplicating a query will create a copy of the query you are selecting. 

To duplicate your query, open the context pane on the query and select **Duplicate**. A new duplicate query will pop up on the side of the query pane.

![Queries Pane Duplicate](images/queries-pane-on-query-duplicate.png)

### Referencing a query
Referencing a query will create new query to use the steps of a pervious query without having to duplicate the query. Additionally, any changes on the original query will transfer down to the referenced query.

To duplicate your query, open the context pane on the query and select **Reference**. A new referenced query will pop up on the side of the query pane.

![Queries Pane Reference](images/queries-pane-on-query-reference.png)

### Copy and Paste
Copy and Paste can be used when you have a copied query to place into the Power Query editor.

>[!NOTE]
>If you would like to learn more about how to share and copy and paste queries, 
[look here.](placeholder -)


## Context pane actions in the query pane

There are some context pane key actions that you can do in the queries pane given what is necessary for you. These actions are *New query*, *Merge queries*, *New parameter*, *New group*. 

To reach these actions, open the context menu (the right-click menu) on the query pane box.

Differences between online and desktop:

- Power Query Online

  ![Queries Pane Context Menu Online](images/queries-pane-context-menu.png)

- Power Query Desktop

  ![Queries Pane Context Menu Desktop](images/queries-pane-context-menu-desktop.png)

And once again, for the sake of being more comprehensive, we will be touching on all of the context menu actions that are relevant for either.

### New query
You can import data into the Power Query editor as an option from the context menu.

This option functions the same as the **Get Data** feature located on the Ribbon.  

![Queries Pane New Query](images/queries-pane-new-query.png)

>[!Note]
>If you would like to learn more about **Get Data** and importing data into Power Query, 
[look here.](https://docs.microsoft.com/power-query/get-data-experience)

### Merge queries
You can open the *Merge queries* input screen when you select the **Merge queries** option from the context menu. 

This option functions the same as the **Merge queries** feature located on the Ribbon and in other areas of the editor. 

>[!Note]
>If you would like to learn more about merging queries, [look here.](https://docs.microsoft.com/power-query/merge-queries-overview)

### New parameter
You can open the *New parameter* input screen when you select the **New parameter** option from the context menu. 
This option functions the same as the **New parameter** feature located on the Ribbon.


### New group
You can make folders and move the queries into and out of the folders for organizational purposes. These folders are called *groups*.

![Queries Pane New Group](images/queries-pane-new-group.png)

To move the query into a group, open the context menu on the specific query. 

In the menu, select **Move to group**. 

Then, select the group you want to put the query in.

![Queries Pane Move To](images/queries-pane-move-to-group.png)

The move will look like below. Using the same steps as above, you can also move the query out of the group by selecting **Queries (root)** or another group. 

![Queries Pane Moved Into](images/queries-pane-moved-into-group.png)

In desktop versions of Power Query, you can also drag and drop the queries into the folders.
