---
title: Change the gateway used in a dataflow project
description: An article that describes how to change the data gateway in Power Query Online dataflow projects
author: ptyx507
ms.service: powerquery
ms.date: 12/6/2021
ms.author: dougklo
ms.reviewer: dougklo
---
# Change the gateway used in a dataflow project

When creating a new dataflow project in Power Query Online, you can select the gateway used for your specific data sources during the get data experience. This article showcases how you can modify or assign a gateway to an existing dataflow project.

>[!NOTE]
>Before being able to change a gateway, make sure that you have the needed gateways already registered under your tenant and with access for the authors of the dataflow project. You can learn more about data gateways from [Using an on-premises data gateway in Power Platform dataflows](using-dataflows-with-on-premises-data.md).

## Changing the gateway

To showcase how to change the gateway in a dataflow project, this article uses a query that connects to a local folder as an example.

This query previously used a gateway named "Gateway A" to connect to the folder. But "Gateway A" no longer has access to the folder due to new company policies. A new gateway named "Gateway B" has been registered and now has access to the folder that the query requires. The goal is to change the gateway used in this dataflow project so it uses the new "Gateway B".

![Image shows how the query has a error message related to data gateway being unreachable or offline](media\change-gateway\gateway-error.png)

To change the gateway:

1. From the **Home** tab in Power Query, select **Options**.
2. From the drop-down menu, select **Project Options**.

   ![Drop-down menu found in the Options button inside the home tab that shows the Project options button](media\change-gateway\project-options.png)

3. In the **Project options** dialog box, select the gateway to use for your project, in this case, Gateway B.

   ![Image of Project options dialog box with the drop-down menu listing None, Gateway A, and Gateway B](media\change-gateway\project-options-dialog-change-gateway.png)

   >[!Tip]
   >If there were recent changes to your gateways, select the small refresh icon to the right of the drop-down menu to update the list of available gateways.

4. After selecting the correct gateway for the project, *Gateway B*, select **OK** to go back to the Power Query editor.

## Validate your data source path

After changing your data gateway, we recommended that you check your data source paths to make sure that your queries are connecting to your data sources as expected.

>[!Note]
>The M engine identifies a data source using a combination of its *kind* and *path*.
>
>The kind defines what connector or data source function is being used, such as SQL Server, Folder, Excel Workbook, or others.
>
>The path value is derived from the required parameters of your data source function and, for this example, that would be the folder path.

The best way to validate the data source path is to go into the query where your data source function is being used and check the parameters being used for it. For this example, there's only one query that connects to a folder and this query has the **Source** step with the data source path defined in it. You can double-click the **Source** step to get the dialog that shows you the parameters used for your data source function. Make sure that the folder path, or the correct parameters for your data source function, is the correct one in relation to the gateway being used.

![Image of the results of double-clicking the Source in the Power Query Query settings pane, with the Folder path shown from the example in this article.](media\change-gateway\data-source-path.png)