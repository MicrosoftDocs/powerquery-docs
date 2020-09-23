---
title: Reverse rows
description: An article that demonstrates how to reverse rows from a table in Power Query.
author: ptyx507
ms.service: powerquery
ms.reviewer: v-douklo
ms.date: 06/08/2020
ms.author: v-miesco
ms.custom: edited
---

# Reverse rows

With Power Query, it's possible to reverse the order of rows in a table. 

Imagine a table with two columns, **ID** and **Country**, as shown in the following image.

:::image type="complex" source="images/me-reverse-rows-original-table.png" alt-text="Initial table with ID and Country values":::
   Initial table with ID and Country columns. The ID rows contain, from top to bottom, values of 1 through 7. The Country rows contain, from top to bottom, USA, Canada, Mexico, China, Spain, Panama, and Columbia.
:::image-end:::

<!-- ![Initial table with ID and Country columns. The ID rows contain, from top to bottom, values of 1 through 7. The Country rows contain, from top to bottom, USA, Canada, Mexico, China, Spain, Panama, and Columbia.](images/me-reverse-rows-original-table.png "Initial table with ID and Country values") -->

On the **Transform** tab, select **Reverse rows**.

![Reverse rows command on the Transform tab](images/me-reverse-rows-icon.png "Reverse rows command on the Transform tab")

The result of this operation will look as follows.

:::image type="complex" source="images/me-reverse-rows-final-table.png" alt-text="Output table after reversing rows":::
   Output table with the rows reversed. The ID rows now contain, from top to bottom, values of 7 down to 1. The Country rows contain, from top to bottom, Columbia, Panama, Spain, China, Mexico, Canada, and USA.
:::image-end:::

<!-- ![Output table after reversing rows](images/me-reverse-rows-final-table.png "needs detailed alt text") -->
