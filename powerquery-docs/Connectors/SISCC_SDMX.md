---
title: SIS-CC SDMX connector
description: Provides basic information and prerequisites for the connector and descriptions of the optional input parameters.
author: David Barraclough
---

# SIS-CC SDMX 

>[!Note]
>The following connector article is provided by the Statistical Information System Collaboration Community (SIS-CC), the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the https://siscc.org/ website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets) |
| Authentication Types Supported | Anonymous |
| Function Reference Documentation | SDMX.Contents |

## Prerequisites
Before you get started, make sure you've properly configured the URL from the Service Provider’s API. The exact process here will depend on the Service Provider.

## Capabilities Supported
Import of SDMX-CSV 2.1 format. Other formats are not supported.

## Connection instructions
To connect to SDMX Web Service data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **All** from the categories on the left, and then select **SIS-CC SDMX**. Then select **Connect**.

![sisccsdmxconnectordesktop](https://user-images.githubusercontent.com/9213243/135047581-e8d87c44-2ecc-432f-9568-6cf840dd0eb5.jpg)

2. Fill in the parameters as so:
	1.	In the **Data query URL** put an SDMX REST data query URL (the web service must support the SDMX-CSV format).
	2.	In **Display format** select one of the options: 
		- Show codes and labels, ex: FREQ: Frequency
		- Show codes; ex: FREQ
		- Show labels ex: Frequency
		- Optionally, enter a language preference in **Label language preference** using an IETF BCP 47 tag

![sisccsdmxconnectordesktopparams](https://user-images.githubusercontent.com/9213243/135048221-d97d4c56-dc90-4d77-8652-a18d919aebff.jpg)

3.	If this is the first time you’re connecting to the REST web service in the previous step **Data query URL**, this authentication step is displayed.  As the connection is Anonymous, click **Connect**

![sisccsdmxconnectordesktopauth](https://user-images.githubusercontent.com/9213243/135048653-e331ac0e-9995-4ee5-b932-ddbaa037c887.jpg)

5.	Select **Load** to import the data into Power BI, or **Transform Data** to edit the query in Power Query Editor where you can refine the query before loading into Power BI.

## Limitations and issues
This version of the connector does not support importing data formats SDMX-ML or SDMX-JSON.

## Next Steps
If you wish to submit a feature request, or contribute to the open source project then go to the [Gitlab project site](https://gitlab.com/sis-cc/sdmx-tools/sdmx-power-bi)
