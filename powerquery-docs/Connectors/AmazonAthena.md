# Amazon Athena

## Summary

|<b>Item</b>    |<b>Description</b>    |
|---    |---    |
|Release State    |General Availability    |
|Products    |Power BI (Datasets)    |
|Authentication Types Supported    |DSN Configuration <br /> Organizational Account    |

## Prerequisites

* [AWS account](https://aws.amazon.com/)
* [Permissions to use Athena](https://docs.aws.amazon.com/athena/latest/ug/policy-actions.html)
* [Amazon Athena ODBC driver](https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc.html)

## Capabilities supported

* Import
* DirectQuery

## Connect to Amazon Athena

**To connect to Athena data:**

1. Launch Power BI Desktop.
2. Do one of the following:
   - Choose **File**, **Get Data**
    - From the **Home** ribbon, choose **Get Data**.
3. In the search box, enter **Athena**.
4. Select **Amazon Athena**, and then choose **Connect**.

    [Image: amazon-athena-1.png]
    
5. On the **Amazon Athena** connection page, enter the following information.

    * For **DSN**, enter the name of the ODBC DSN that you want to use. For instructions on configuring your DSN, see the [ODBC driver documentation](https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc.html#connect-with-odbc-driver-documentation).
    * For **Data Connectivity mode**, choose a mode that is appropriate for your use case, following these general guidelines:
        * For smaller datasets, choose **Import**. When using Import mode, Power BI works with Athena to import the contents of the entire dataset for use in your visualizations.
        * For larger datasets, choose **DirectQuery**. In DirectQuery mode, no data is downloaded to your workstation. While you create or interact with a visualization, Microsoft Power BI works with Athena to dynamically query the underlying data source so that you're always viewing current data. For more information about DirectQuery, see [Use DirectQuery in Power BI Desktop](https://docs.microsoft.com/en-us/power-bi/connect-data/desktop-use-directquery).
    
    [Image: amazon-athena-2.png]
    
6. Choose **OK**. 
7. At the prompt to configure data source authentication, choose either **Use Data Source Configuration** or **AAD Authentication**, and then choose **Connect**.
    
    [Image: amazon-athena-3.png]
    
    Your data catalog, databases, and tables appear in the **Navigator** dialog box.
    
    [Image: amazon-athena-4.png]
    
8. In the **Display Options** pane, select the check box for the dataset that you want to use.
9. If you want to transform the dataset before you import it, go to the bottom of the dialog box and choose **Transform Data**. This opens the Power Query Editor so that you can filter and refine the set of data you want to use.
10. Choose **Load**. After the load is complete, you can create visualizations like the one in the following image. If you selected **DirectQuery** as the import mode, Power BI issues a query to Athena for the visualization that you requested.
    
    [Image: amazon-athena-5.png]
