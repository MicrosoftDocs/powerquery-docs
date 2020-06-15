# Troubleshooting dataflow issue: Get Data from Dataflow

You might have created a dataflow, but then have a difficulty in getting data from it (Either using Power Query in Power BI Desktop, or from other dataflows). This article explains some of the most common issues happened when you get data from a dataflow.

## Problem: This table is empty

Let's assume that you are getting data from a dataflow (Either in the Power BI Desktop or in another dataflow), and you have access to that dataflow. Sometimes, however, when you get data from a dataflow with the above situation, you get a message in the Navigator, saying that "This table is empty".

Reason:

This table is empty means the data is not loaded into the table.

Resolution:

In Power Query in the desktop tools such as Power Query in Excel and Power Query in the Power BI Desktop, the load of the data into tables happens automatically (Unless you disable it). This behavior is a bit different in Power Query in the dataflow. The data won't be loaded in the dataflow entities unless you Refresh the data.

You have to set up a scheduled refresh for the dataflow, or if you want to just have a one-off refresh, use the manual refresh option. 

![Refresh dataflow](https://docs.microsoft.com/en-us/power-bi/transform-model/media/service-dataflows-create-use/dataflows-create-use_13.png)

Once the dataflow is refreshed, the data in entities will be visible in the Navigator window of other tools and services.

![Schedule Refresh for dataflows](https://docs.microsoft.com/en-us/power-bi/transform-model/media/service-dataflows-create-use/dataflows-create-use_14.png)



## Problem: Can't see my Power Platform dataflow listed

Sometimes, you have a Power Platform dataflow created, and also refreshed. However, you cannot still access it from a get data experience. This might be because of the account is trying to access the dataflow. However, if the account is having access to the dataflow, another reason can be the type of dataflow.

The error message you receive might be "We reached the end of the buffer", or "DataFormat.Error: We reached the end of the buffer".

![Get data from standard dataflow](C:\Users\reza_\OneDrive - Microsoft\Dataflow Docs\08\media\StandardDataflowGetData.png)

Reason: 

Only analytical dataflows can be used in Get Data from dataflow experience.

Resolution:

If you have created a dataflow that stores the data into the Common Data Services, You cannot see it using the Get Data from dataflow experience. You can use [Get data from Common Data Services](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-powerbi-connector#finding-your-common-data-service-environment-url) instead, to get data from standard dataflows. Or you can create an [analytical dataflow](understanding-differences-between-analytical-standard-dataflows.md) instead, and then access it through the Get data from dataflow.

![Get data from standard vs analytical dataflows](C:\Users\reza_\OneDrive - Microsoft\Dataflow Docs\08\media\GetDataStandardAnalyticalDataflow.png)

## Problem: Cannot have a DirectQuery Connection to the dataflow

If you intent to use the dataflow as a DirectQuery source, then you might need to enable it first.

Reason:

The enhanced compute engine settings is disabled.

Resolution:

[Enable the enhanced compute engine](https://docs.microsoft.com/power-bi/transform-model/service-dataflows-directquery) and then you will have the option to connect to the dataflow using DirectQuery option.

![Enable enhanced compute engine](https://docs.microsoft.com/en-us/power-bi/transform-model/media/service-dataflows-directquery/dataflows-directquery-01.png)