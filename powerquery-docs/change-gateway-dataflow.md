---
title: Change the gateway used in a Dataflow project
description: An article that describes how to change the data gateway in Power Query Online dataflow projects
author: ptyx507
ms.service: powerquery
ms.date: 12/6/2021
ms.author: dougklo
ms.reviewer: dougklo
---
# Change the gateway used in a Dataflow project

When creating a new dataflow project in Power Query Online, you are able to select the gateway used for your specific data sources during the get data experience. This article showcases how you can modify or assign a gateway to an existing dataflow project.

>[!NOTE]
>Before being able to change a gateway, make sure that you have the needed gateways already registered under your tenant and with access for the authors of the dataflow project. You can learn more about data gateways from the article on [using an on-premises data gateway](https://docs.microsoft.com/power-query/dataflows/using-dataflows-with-on-premises-data).

## Changing the gateway
To showcase how to change the gateway in a Dataflow project, this article will use a query that connects to a local folder as an example.

This query used to use a gateway by the name of "Gateway A" to connect to the folder, but "Gateway A" no longer has access to such folder due to new company policies. A new gateway with the name "Gateway B" has been registered and now has access to the folder that the query requires. The goal is to change the gateway used in this dataflow project so it uses the new "Gateway B".

![Image shows how the query has a error message related to data gateway being unreachable or offline](media\change-gateway\gateway-error.png)

To change the gateway, go to the Home tab in the ribbon and select the button that reads *Options*. From the drop-down menu, select the option that reads *Project Settings*.

![Drop-down menu found in the Options button inside the home tab that shows the Project options button](media\change-gateway\project-options.png)

This will show you a new dialog with the name Project options where you can select what gateway shall be used for your project.

![](media\change-gateway\project-options-dialog.png)

If there have been recent changes to your gateways, you can click the small refresh button to the right of the drop-down menu to update the list of available gateways.

![](media\change-gateway\project-options-dialog-change-gateway.png)

After selecting the correct gateway for the project, *Gateway B*, you can click the OK button at the bottom of the dialog to go back to the Power Query Editor.

## Validate your data source path

After changing your data gateway, t is always recommended to check your data source paths to make sure that your queries are connecting to your data sources as expected. 

>[!Note]
>The M engine identifies a data source using a combination of its Kind and Path.
>
>The Kind defines what connector or data source function is being used such as SQL Server, Folder, Excel Workbook, or others.
>
>The Path value is derived from the required parameters of your data source function and for this example that would be the folder path.

The best way to validate the data source path is to go into the query where your data source function is being used and check the parameters being used for it. For this example, there is only one query that connects to a folder and this query has the *Source* step with the data source path defined in it. You can double-click the Source step to get the dialog that will show you the parameters used for your data source function and make sure that the folder path, or the correct parameters for your data source function, is the correct one in relation to the gateway being used.

![](media\change-gateway\data-source-path.png)