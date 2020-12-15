---
title: Load Data into Dataverse table and build a dataflows monitoring report with Power BI
description: How to use the dataflows connector templates in Power Automate to created a dataflows monitoring report in Power BI
author: mideboer

ms.service: powerquery
ms.reviewer: kvivek
ms.topic: conceptual
ms.date: 15/2/2020
ms.author: mideboer
---

In this step-by-step example we will show you how to set up your own monitoring dashboard for all your dataflows:

![An example of folder structure](media/dashboard.PNG)

You can use this dashboard to monitor your dataflow's refresh duration and failure count. This way you can easily track any issues with your dataflows performance and share with others. 

First, we are going to create a new Dataverse table. This table will store all the metadata from the dataflow run. For every refresh of a dataflow, we add a record to this table. We can store metadata for multiple dataflows runs in the same table. When we built the table, we can connect the .pbit file to the Dataverse table.

![An example of folder structure](media/dataverse.PNG)
## Requirements

* Download and Install [Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494)

* [Dataverse environment](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-intro) (with rights to create new custom tables)

* [Power Automate Premium Licence](https://docs.microsoft.com/power-platform/admin/pricing-billing-skus)

* A dataflow in [Power BI Dataflows](https://docs.microsoft.com/power-bi/transform-model/dataflows/dataflows-introduction-self-service) or [Power Platform Dataflows](https://docs.microsoft.com/powerapps/maker/common-data-service/create-and-use-dataflows#:~:text=Create%20a%20dataflow%201%20Sign%20in%20to%20Power,entities%20to%20be%20stored.%20...%20Mais%20itens...%20)

## Download the .pbit file

[Download Dataverse .pbit file](https://download.microsoft.com/download/1/4/E/14EDED28-6C58-4055-A65C-23B4DA81C4DE/dataverse-template.pbit)

## Create new table in Dataverse
* Navigate to [Power Apps portal](https://powerapps.microsoft.com/)
* Follow these [Instructions](https://docs.microsoft.com/powerapps/maker/common-data-service/create-custom-entity) to create a new table.

    In the right pane, enter the following values, and then select `Create`.
    * **Display name**  *Dataflows Monitoring*
    * **Column name**   *Dataflow ID*
* Follow the same instruction to add custom columns to the new table.

    In the right pane, enter the following values, and then select `Create`
    * **Display name** *Dataflow Name*
    * **Data type** *text*
    * **Required** *Required*
* Repeat adding column for the following values
    * **Display name** *Refresh Status*, **Data type** *Text*, **Required** *Required*
    * **Display name** *Refresh Type*, **Data type** *Text*, **Required** *Required*
    * **Display name** *Start Time*, **Data type** *Date and Time*, **Required** *Required*
    * **Display name** *End Time*, **Data type** *Date and Time*, **Required** *Required*



## Create a dataflow
If you do not already have one, create a Dataflow. This can be done in either [Power BI Dataflows](https://docs.microsoft.com/power-bi/transform-model/dataflows/dataflows-introduction-self-service) or [Power Apps Dataflows](https://docs.microsoft.com/powerapps/maker/common-data-service/create-and-use-dataflows).

## Create a Power Automate Flow
* Navigate to [Power Automate Portal](https://flow.microsoft.com)
* Search for the template **When a dataflows refresh completes, output status into CDS entity**, by following these [instructions](https://docs.microsoft.com/power-automate/get-started-logic-template)

![An example of folder structure](media/connector.PNG)

* Customize the flow
    Actions that require input from you will automatically be expanded.

   The **Dataflow Refresh** trigger is expanded because you need to enter *Dataflow*. You need to enter the following information:
    * **Group Type**: Choose *Environment* when connection to Power Apps and *Workspace* when connecting to Power BI
    * **Group**: Select the Power Apps environment or the Power BI workspace you dataflow is in
    * **Dataflow**: Select your dataflow by name

     The **Create new record** action is expanded because you need to enter you CDS *Environment* and *Entity Name*. You need to enter the following information:
    * **Environment**: The CDS environment you created the custom table in in step 1.
    * **Entity Name**: Select the entity/table *Dataflows Monitoring* you created in step 2

* Add dynamic values to the required fields

    For every required field, we are going to add a dynamic value. This value is the ouput of the meta-data of the dataflow run. 
    * click on the field  next to **Dataflow ID** and then click on the *lightning* button.
![An example of folder structure](media/dynamic.png)

    * Add the Dataflow ID as the dynamic content
![An example of folder structure](media/dataflowid.png)

    * Repeat this proces for all required fields
![An example of folder structure](media/final.PNG)  

* `Save` the flow

## Create Power BI Report
* open the `.pbit` file
* connect to your CDS entity **Dataflow Monitoring**

In this dashboard, you can monitor, for every dataflow, in your specified time interval:
* Dataflow duration
* Dataflow count
* Dataflow failure count

Note: The uniqueID for every dataflow is generated by a merge between Dataflow name and Start time.