---
title: BuildingConnected Power Query Connector
description: Includes basic information, prerequisites, and information on how to connect to your BuildingConnected data, along with a list of known issues and limitations.
author: joefields
ms.topic: conceptual
ms.date: 6/7/2024
ms.author: dougklo
---

# BuildingConnected

> [!NOTE]
>The following connector article is provided by Autodesk, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Autodesk website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Preview |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)  |
| Authentication Types Supported | Autodesk account |
| Function Reference Documentation |&mdash; |

## Prerequisites

To use the BuildingConnected connector, you must have a BuildingConnected account that has been linked to your AutodeskID. An active Bidboard Pro subscription is required to access Opportunity data and an active TradeTapp subscription is required for TradeTapp data.

## Capabilities Supported

* Import
* Supports BuildingConnected and TradeTapp accounts

## Connect to BuildingConnected data

To connect to BuildingConnected data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, select **BuildingConnected & TradeTapp**, and then select **Connect**.

   :::image type="content" source="./media/buildingconnected/buildingconnected-get-data.png" alt-text="Screenshot showing BuildingConnected & TradeTapp connector":::

2. If this is the first time you're getting data through the BuildingConnected & TradeTapp connector, a preview connector notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

3. Select **Sign in** and use your Autodesk credentials to connect to your BuildlingConnected or TradeTapp account.
  
   :::image type="content" source="./media/buildingconnected/buildingconnected-sign-in.png" alt-text="Screenshot showing Select sign in button":::

4. In the Autodesk window that appears, provide your credentials to sign in to your Autodesk account.
  
   :::image type="content" source="./media/buildingconnected/buildingconnected-adsk-login.png" alt-text="Screenshot showing Sign in to Autodesk dialog":::

5. Once you've successfully signed in, select **Connect**.

   :::image type="content" source="./media/buildingconnected/buildingconnected-sign-in-success.png" alt-text="Screenshot showing Signed in and ready to connect dialog":::

6. In the **Navigator**, select the data type you want to load to see a preview in the right pane. You can then load or transform the data. **If you click Load, all records will be loaded in to the Power BI model**. It may take several minutes for all records to load depending on the numebr of objects.

   :::image type="content" source="./media/buildingconnected/buildingconnected-data-types.png" alt-text="Screenshot showing Navigate to the desired data type":::

7. Optionally you can use the Range Start and Range End inputs on the BuildingConnected function to load data based on the updatedAt query parameter. This allows you to implement incremental refresh to load only updated data once the initial data load has been injested. To use the input dialog for these dates, select a table and transform it to load it in to Power Query. Then click the gear to the right of the Source step. **Range Start** and **Range End** are optional parameters. Using **Range Start** only will provide all records updated on or after the provided **Range Start** date. Using Range End only will provide all records updated on or before the provided **Range End** date. Providing both dates will constrain to records update between the two dates.

   :::image type="content" source="./media/buildingconnected/buildingconnected-updatedAt.png" alt-text="Screenshot showing Optional range start and range end query parameters":::

8. Some data types contain nested records and lists that may need to be expanded to see all data fields. Expand each Record and List items as needed to see all fields.

   :::image type="content" source="./media/buildingconnected/buildingconnected-expand-nested-items.png" alt-text="Screenshot showing Expand nested records":::
  