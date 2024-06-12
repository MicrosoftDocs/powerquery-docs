---
title: Power Query BI Book connector
description: Includes basic information and prerequisites, instructions on how to connect to your BI Book company's data.
author: oscar.winberg@greenstep.fi
ms.topic: conceptual
ms.date: 6/7/2024
ms.author: dougklo
---

# BI Book

## Summary

| Item | Description |
| ------- | ------------|
|Release state | Preview |
| Products supported | Power BI (Semantic models)<br/> |
| Authentication types supported| Basic<br/> |
| Function reference docs | [BIBook.Contents](/powerquery-m/bi-book) |

## Prerequisites

To use our connector you need a BI Book company. Head to [BI Book](https://get.bibook.com/) to sign up if you haven't already.

## Capabilities supported

* Import

## Connection Instructions

To connect to BI Book from Power Query Desktop, take the following steps:

1. Select **BI Book** in the get data experience. The get data experience in Power Query Desktop varies between apps. For more information about the Power Query Desktop get data experience for your app, go to [Where to get data](../where-to-get-data.md).

2. In **From BIBook.Contents**, provide the base url of your BI Book domain, e.g. https://bibook.com and your BI Book company id.

   :::image type="content" source="./media/bi-book/signin.png" alt-text="Enter BI Book company connection.":::

3. Select **OK**.

4. If this is the first time you're connecting to this BI Book company, you need to input your credentials. Then select **Connect**.

   :::image type="content" source="./media/bi-book/authenticate.png" alt-text="BI Book company authentication":::


5. In **Navigator**, select the BI Book files and tables you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

   :::image type="content" source="./media/bi-book/navigate.png" alt-text="BI Book Power Query Desktop Navigator.":::
