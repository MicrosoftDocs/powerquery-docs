---
title: Power Query Amazon Athena connector
description: Provides basic information, prerequisites, and instructions on how to connect to Amazon Athena
author: bezhan-msft
ms.service: powerquery
ms.topic: conceptual
ms.date: 7/1/2021
ms.author: bezhan
ms.reviewer: kvivek
LocalizationGroup: reference
---

# Amazon Athena

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Beta |
| Products | Power BI (Datasets) |
| Authentication Types Supported | DSN configuration <br /> Organizational account    |

## Prerequisites

* [AWS account](https://aws.amazon.com/),
* [Permissions](https://docs.aws.amazon.com/athena/latest/ug/policy-actions.html) to use Athena, and,
* Customers must install the [Amazon Athena ODBC driver](https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc.html) prior to using the connector. 

## Capabilities supported

* Import
* DirectQuery

## Connect to Amazon Athena

To connect to Athena data:

1. Launch Power BI Desktop.

2. Open the **Get Data** experience.

3. In the search box, enter **Athena**.

4. Select **Amazon Athena**, and then select **Connect**.

    ![Select Amazon Athena](./media/amazon-athena/amazon-athena-1.png)
    
5. On the **Amazon Athena** connection page, enter the following information.

    * For **DSN**, enter the name of the ODBC DSN that you want to use. For instructions on configuring your DSN, see the [ODBC driver documentation](https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc.html#connect-with-odbc-driver-documentation).
    * For **Data Connectivity mode**, choose a mode that is appropriate for your use case, following these general guidelines:
        * For smaller datasets, choose **Import**. When using Import mode, Power BI works with Athena to import the contents of the entire dataset for use in your visualizations.
        * For larger datasets, choose **DirectQuery**. In DirectQuery mode, no data is downloaded to your workstation. While you create or interact with a visualization, Microsoft Power BI works with Athena to dynamically query the underlying data source so that you're always viewing current data. For more information about DirectQuery, see the [Direct Query documentation](/power-bi/connect-data/desktop-use-directquery).
    
    ![Enter connection information](./media/amazon-athena/amazon-athena-2.png)
    
6. Select **OK**. 

7. At the prompt to configure data source authentication, select either **Use Data Source Configuration** or **AAD Authentication**, and then select **Connect**.
    
    ![Choose an authentication method](./media/amazon-athena/amazon-athena-3.png)
    
    Your data catalog, databases, and tables appear in the **Navigator** dialog box.
    
    ![The Navigator dialog box shows your data](./media/amazon-athena/amazon-athena-4.png)
    
8. In the **Display Options** pane, select the check box for the dataset that you want to use.

9. If you want to transform the dataset before you import it, go to the bottom of the dialog box and select **Transform Data**. This opens the Power Query Editor so that you can filter and refine the set of data you want to use.

10. Otherwise, select **Load**. After the load is complete, you can create visualizations like the one in the following image. If you selected **DirectQuery**, Power BI issues a query to Athena for the visualization that you requested.
    
    ![A sample data visualization](./media/amazon-athena/amazon-athena-5.png)