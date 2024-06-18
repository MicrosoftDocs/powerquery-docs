---
title: Autodesk Construction Cloud Power Query Connector
description: Includes basic information, prerequisites, and information on how to connect to your Autodesk Construction Cloud data, along with a list of known issues and limitations.
author: DougKlopfenstein
ms.topic: conceptual
ms.date: 1/18/2023
ms.author: dougklo
---

# Autodesk Construction Cloud

> [!NOTE]
>The following connector article is provided by Autodesk, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Autodesk website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)  |
| Authentication Types Supported | Autodesk account |
| Function Reference Documentation |&mdash; |

## Prerequisites

To use the Autodesk Construction Cloud connector, you must have an Autodesk account with a username and password and have access to the Executive Overview in a BIM360 or an ACC Account. You also need to run a Data Connector extraction manually or have the extractions scheduled to run in order to use this connector. The Connector pulls from the last ran extract.

## Capabilities Supported

* Import
* Supports United States, Europe, and Australia Autodesk Construction Cloud servers

## Connect to Autodesk Construction Cloud data

To connect to Autodesk Construction Cloud data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, select **Autodesk Construction Cloud**, and then select **Connect**.

2. If this is the first time you're getting data through the Autodesk Construction Cloud connector, a preview connector notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

3. Select the Autodesk server **region** (United States, Europe, or Australia), and then select **OK**.
  
   :::image type="content" source="./media/autodesk-construction-cloud/acc-region-selection.png" alt-text="Select server region.":::

4. To sign in to your Autodesk account, select **Sign in**.
  
   :::image type="content" source="./media/autodesk-construction-cloud/acc-sign-in.png" alt-text="Select sign in button.":::

5. In the Autodesk window that appears, provide your credentials to sign in to your Autodesk account.
  
   :::image type="content" source="./media/autodesk-construction-cloud/acc-adsk-login.png" alt-text="Sign in to Autodesk.":::

6. Once you've successfully signed in, select **Connect**.

   :::image type="content" source="./media/autodesk-construction-cloud/acc-sign-in-success.png" alt-text="Signed in and ready to connect.":::

7. In **Navigator**, expand the Account you want to pull data from, which will display an **Account Extract** folder and a **Project Extracts** folder. **Account Extract** will contain the data extract of the most recent account level extract if you have proper access and have ran an account level data extract. **Project Extracts** will contain a listing of each project in the account you have access to, which you can then expand to see the relevant tables in that specific project's extracts if you have run a data extraction.

   :::image type="content" source="./media/autodesk-construction-cloud/acc-extract-selection.png" alt-text="Navigate to the desired data extraction.":::

8. Once you navigate to the desired Account or Project extract, select the desired tables, and then either select **Load** to load the data or **Transform Data** to continue transforming the data in the Power Query editor.

   :::image type="content" source="./media/autodesk-construction-cloud/acc-table-selection-account.png" alt-text="Navigate to data tables and load or transform data.":::
  
## Connect using Autodesk provided Power BI Templates

* Download the latest Power BI Templates from the Template Gallery within **Data Connector**.

  :::image type="content" source="./media/autodesk-construction-cloud/acc-powerbi-template-gallery.png" alt-text="Screenshot showing the Power BI Template Gallery in Data Connector":::

* Only templates with **"...(Connector).."** in the file name are set up to work with this connector.

To use the Power BI Templates:

1. Open a template file.

2. Provide your ACC Account name and select the server region.

   :::image type="content" source="./media/autodesk-construction-cloud/acc-template-prompt.png" alt-text="Provide ACC Account name and select server region.":::

   > [!NOTE]
   >The **Account Name** is the name of the ACC account you want to connect to, not your user account name. You can find the Account name on the Account Admin portal just to the right of the Account Admin drop down or under **Settings**. The Account name also appears on the Insight (Account) page just to the right of the Insight dropdown in the upper left hand corner.

   :::image type="content" source="./media/autodesk-construction-cloud/acc-template-account-name.png" alt-text="Account name can be found on the Account Admin portal.":::

3. If prompted, follow steps 4 through 6 in the previous procedure to sign-in and connect.

## Limitations and issues

You should be aware of the following limitations and issues associated with accessing Autodesk data.

* This connector pulls data from the last run Data Connector extract and not the live data from the account.
