---
title: LinkedIn Sales Navigator (Beta)
description: Includes basic information, prerequisites, and information on how to connect to LinkedIn Sales Navigator.

author: dougklopfenstein
ms.topic: conceptual
ms.date: 7/11/2022
ms.author: dougklo

---

# LinkedIn Sales Navigator (Beta)

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Datasets) |
| Authentication Types Supported | Organizational Account |
| Function Reference Documentation | &mdash; |

## Prerequisites

* An Azure subscription. Go to [Get Azure free trial](https://azure.microsoft.com/pricing/free-trial/).

* An Azure Data Lake Storage Gen1 account. Follow the instructions at [Get started with Azure Data Lake Storage Gen1 using the Azure portal](/azure/data-lake-store/data-lake-store-get-started-portal). This article assumes that you've already created a Data Lake Storage Gen1 account, called **myadlsg1**, and uploaded a sample data file (**Drivers.txt**) to it. This sample file is available for download from [Azure Data Lake Git Repository](https://github.com/Azure/usql/tree/master/Examples/Samples/Data/AmbulanceData/Drivers.txt).

## Capabilities supported

* Import
* Advanced options
  * Page size in bytes

## Connect to LinkedIn Sales Navigator

To connect to LinkedIn Sales Navigator data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, then scroll until you see **LinkedIn Sales Navigator (Beta)**.

   ![Get Data in Power BI Desktop](media/linkedin-sales-navigator/get-data.png)

   Select **Connect** to continue.

2. You'll be advised that you're connecting to a third-party connecter that's still under development.

   ![Third-party warning](media/linkedin-sales-navigator/third-party-notice.png)

When you select **Continue**, you're prompted to specify which data you want.

![Prompt for which information to provide](media/desktop-connect-linkedin-sales-navigator/linkedin-sales-navigator-04.png)


In the **LinkedIn Sales Navigator** window that appears, select which data you want to return, either *All contacts* or *Selected contacts* from the first drop-down selector. You can then specify the start and end dates to constrain the data it receives to a particular time window.

Once you've provided the information, Power BI Desktop connects to the data associated with your LinkedIn Sales Navigator contract. Use the same email address you use to sign in to LinkedIn Sales Navigator through the website. 

![Sign in to LinkedIn](media/desktop-connect-linkedin-sales-navigator/linkedin-sales-navigator-05.png)

When you connect successfully, you're prompted to select which data from your LinkedIn Sales Navigator contract from a **Navigator** window.

![Select data with Navigator](media/desktop-connect-linkedin-sales-navigator/linkedin-sales-navigator-09.png)

You can create whatever reports you like with your LinkedIn Sales Navigator data. To make things easier, there is also a LinkedIn Sales Navigator .PBIX file that you can download, that has sample data already provided, so you can get familiar with the data and the reports, without having to start from scratch.

You can download the PBIX file from the following location:
* [PBIX for LinkedIn Sales Navigator](service-template-apps-samples.md)

In addition to the PBIX file, the LinkedIn Sales Navigator also has a template app that you can download and use, too. The next section describes the template app in detail.


## Using the LinkedIn Sales Navigator template app

To make using the **LinkedIn Sales Navigator** as easy as possible, you can use the [template app](service-template-apps-overview.md) that automatically creates a ready-made report from your LinkedIn Sales Navigator data.

![Template app for LinkedIn Sales Navigator](media/desktop-connect-linkedin-sales-navigator/linkedin-sales-navigator-10.png)

When you download the app, you can select whether to connect to your data, or explore the app with sample data. You can always go back and connect to your own LinkedIn Sales Navigator data after you explore the sample data. 

![Connect to data for LinkedIn Sales Navigator](media/desktop-connect-linkedin-sales-navigator/linkedin-sales-navigator-11.png)



You can get the **LinkedIn Sales Navigator** template app from the following link:
* [LinkedIn Sales Navigator template app](https://appsource.microsoft.com/en-us/product/power-bi/pbi-contentpacks.linkedin_navigator)

The template app provides four tabs to help analyze and share your information:

* Usage
* Search
* InMail
* SSI

The **Usage** tab shows your overall LinkedIn Sales Navigator data.

![LinkedIn Sales Navigator Usage tab shows your overall LinkedIn Sales Navigator data.](media/desktop-connect-linkedin-sales-navigator/linkedin-sales-navigator-12.png)

The **Search** tab lets you drill deeper into your search results:

![LinkedIn Sales Navigator Search tab](media/desktop-connect-linkedin-sales-navigator/linkedin-sales-navigator-13.png)

The **InMail** provides insights into your InMail usage, including number of InMails sent, acceptance rates, and other useful information:

![LinkedIn Sales Navigator InMail tab](media/desktop-connect-linkedin-sales-navigator/linkedin-sales-navigator-14.png)

The **SSI** tab provides additional details into your social selling index (SSI):

![LinkedIn Sales Navigator SSI tab](media/desktop-connect-linkedin-sales-navigator/linkedin-sales-navigator-15.png)

To go from the sample data to your own data, select **edit app** in the top-right corner (the pencil icon) and then select **Connect your data** from the screen that appears.

![Connect your own data](media/desktop-connect-linkedin-sales-navigator/linkedin-sales-navigator-16.png)

From there you can connect your own data, selecting how many days of data to load. You can load up to 365 days of data. You'll need to sign in, again using the same email address you use to sign in to LinkedIn Sales Navigator through the website. 

![Sign in](media/desktop-connect-linkedin-sales-navigator/linkedin-sales-navigator-17.png)

the template app then refreshes the data in the app with your data. You can also set up a scheduled refresh, so the data in your app is as current as your refresh frequency specifies. 

Once the data updates, you can see the app populated with your own data.

## Getting help

If you run into problems when connecting to your data, you can contact LinkedIn Sales Navigator support at https://www.linkedin.com/help/sales-navigator. 
