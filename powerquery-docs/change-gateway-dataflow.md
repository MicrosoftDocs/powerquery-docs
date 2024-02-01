---
title: Change the gateway used in a dataflow project
description: An article that describes how to change the data gateway in Power Query Online dataflow projects.
author: ptyx507
ms.date: 5/25/2023
ms.author: dougklo
ms.reviewer: miescobar
---
# Change the gateway used in a dataflow project

When creating a new dataflow project in Power Query Online, you can select the on-premises data gateway used for your specific data sources during the get data experience. This article showcases how you can modify or assign a gateway to an existing dataflow project.

>[!NOTE]
>Before being able to change a gateway, make sure that you have the needed gateways already registered under your tenant and with access for the authors of the dataflow project. You can learn more about data gateways from [Using an on-premises data gateway in Power Platform dataflows](dataflows/using-dataflows-with-on-premises-data.md).

## Changing the gateway

To showcase how to change the gateway in a dataflow project, this article uses a query that connects to a local folder as an example.

This query previously used a gateway named "Gateway A" to connect to the folder. But "Gateway A" no longer has access to the folder due to new company policies. A new gateway named "Gateway B" has been registered and now has access to the folder that the query requires. The goal is to change the gateway used in this dataflow project so it uses the new "Gateway B".

![Image with a query that has an error message related to the data gateway being unreachable or offline.](media\change-gateway\gateway-error.png)

To change the gateway:

1. From the **Home** tab in Power Query, select **Options**.

   ![Screenshot of Options icon and selection in Power Query Home tab.](media\change-gateway\new-settings.png)

2. In the **Options** dialog box, select **Data load**, and then select the gateway to use for your project, in this case, Gateway B.

   ![Screenshot of Project options dialog box with the drop-down menu listing None, Gateway A, and Gateway B.](media\change-gateway\options-dialog-change-gateway.png)

   >[!Tip]
   >If there were recent changes to your gateways, select the small refresh icon to the right of the drop-down menu to update the list of available gateways.

3. After selecting the correct gateway for the project, in this case, Gateway B, select **OK** to go back to the Power Query editor.

## Validate your data source path

After changing your data gateway, we recommend that you check your data source paths to make sure that your queries are connecting to your data sources as expected.

>[!Note]
>The M engine identifies a data source using a combination of its *kind* and *path*.
>
>The kind defines what connector or data source function is being used, such as SQL Server, folder, Excel workbook, or others.
>
>The path value is derived from the required parameters of your data source function and, for this example, that would be the folder path.

The best way to validate the data source path is to go into the query where your data source function is being used and check the parameters being used for it. For this example, there's only one query that connects to a folder and this query has the **Source** step with the data source path defined in it. You can double-click the **Source** step to get the dialog that indicates the parameters used for your data source function. Make sure that the folder path, or the correct parameters for your data source function, is the correct one in relation to the gateway being used.

![Image of the results of double-clicking the Source in the Power Query Query settings pane, with the Folder path shown from the example in this article.](media\change-gateway\data-source-path.png)

## Modify authentication

To modify the credentials used against your data source, select **Get data** in the Power Query editor ribbon to launch the **Choose data source** dialog box, then define a new or existing connection to your data source. In this example, the connector that's used is the Folder connector.

![Choose data source dialog with the folder connector emphasized.](media\change-gateway\choose-data-source.png)

Once in **Connection settings**, create a new connection or select or modify a different connection for your data source.

![Connection settings dialog for the Folder connector.](media\change-gateway\folder-connection-settings.png)

After defining the connection details, select **Next** at the bottom-right corner and validate that your query is loading in the Power Query editor.

>[!NOTE]
>This process is the same as if you were to connect again to your data source. But by doing the process again, you're effectively re-defining what authentication method and credentials to use against your data source.
