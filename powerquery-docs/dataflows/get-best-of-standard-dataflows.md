---
title: Field mapping considerations for standard dataflows
description: Learn how to get the best outcomes when writing creating dataflows that write their output to Dataverse
author: bensack

ms.reviewer: v-douklo
ms.service: dataflows
ms.topic: conceptual
ms.date: 12/3/2020
ms.author: bensack
---

# Field mapping considerations for standard dataflows

[!INCLUDE [CDS note](../includes/cc-data-platform-banner.md)]

When you create dataflows that write their output to Dataverse, you can follow some guide lines and best practices to get the best outcome. In this article, some of those best practices are covered.

## Set the key field in the entity

Having a primary key column in the entity helps in avoiding duplicates in the data rows. A primary key column is a column that's unique and deterministic of a data row in the entity. For example, in an Orders table, if the Order ID is the primary key column, you shouldn't have two rows with the same Order ID. Also, one Order ID, let's say an order with the ID 345, should only represent one row in the entity.

To choose the key column for the entity in Dataverse from the dataflow, you need to set the alternate key.

The following image shows how you can choose the key column to be populated from the source when you create a new entity in the dataflow.

> [!div class="mx-imgBorder"]
> ![Primary key and the alternate key are the same](media/PKAKsame.png)

The primary name field that you see in the field mapping is for a label field; this field doesn't need to be unique. The field that's used in the entity for checking duplication will be the field that you set in the **Alternate Key** field.

Having a primary key in the entity ensures that even if you have duplicate data rows with the same value in the field that's mapped to the primary key, the duplicate entries won't be loaded into the entity, and the entity will always have a high quality of the data. Having an entity with a high quality of data is essential in building reporting solutions based on the entity.

### The primary name field

The primary name field is a display field used in Dataverse. This field is used in default views to show the content of the entity in other applications. This field isn't the primary key field, and shouldn't be considered as that. This field can have duplicates, because it's a display field. The best practice, however, is to use a concatenated field to map to the primary name field, so the name is fully explanatory.

The alternate key field is what is used as the primary key.

## What are good candidates for the key field

The key field is a unique value representing a unique row in the entity. It's important to have this field, because it helps you avoid having duplicate records in the entity. This field can come from three sources:

- The primary key in the source system (such as OrderID in the example above).

- A concatenated field created through Power Query transformations in the dataflow. 

  > [!div class="mx-imgBorder"]
  > ![Merging columns to create a concatenated unique column](media/MergeColumnsDataflow.png)

- A combination of fields to be selected in the **Alternate Key** option. A combination of fields used as a key field is also called a *composite key*.

  ![Creating a composite key through field mapping](media/CompositeKeyMapping.png)

## Remove rows that no longer exist

If you want to have the data in your entity always synchronized with the data from the source system, choose the **Delete rows that no longer exist in the query output** option. However, be aware that this option slows down the dataflow because there's a need for a row comparison based on the primary key (alternate Key in the field mapping of the dataflow) for this action to occur.

Having this option checked means that if there's a data row in the entity that doesn't exist in the next dataflow refresh's query output, that row will be removed from the entity.

> [!div class="mx-imgBorder"]
> ![Delete rows that no longer exists](media/DeleteRowsNotExist.png)




