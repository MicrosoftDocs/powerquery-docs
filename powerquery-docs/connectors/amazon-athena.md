---
title: Power Query Amazon Athena connector
description: Provides basic information, prerequisites, and instructions on how to connect to Amazon Athena
author: DougKlopfenstein
ms.topic: concept-article
ms.date: 11/10/2025
ms.author: dougklo
ms.subservice: connectors
---

# Amazon Athena

> [!NOTE]
>This connector is owned and provided by Amazon.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | DSN configuration <br /> Organizational account |

## Prerequisites

* An [Amazon Web Services (AWS) account](https://aws.amazon.com/)
* [Permissions](https://docs.aws.amazon.com/athena/latest/ug/policy-actions.html) to use Athena
* Customers must install the [Amazon Athena ODBC driver](https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc.html) before using the connector

## Capabilities supported

* Import
* DirectQuery (Power BI semantic models)

## Connect to Amazon Athena

To connect to Athena data:

1. Launch Power BI Desktop.

2. In the **Home** tab, select **Get Data**.

3. In the search box, enter **Athena**.

4. Select **Amazon Athena**, and then select **Connect**.

    :::image type="content" source="./media/amazon-athena/amazon-athena-1.png" alt-text="Screenshot of the Get data dialog where you select Amazon Athena.":::

5. On the **Amazon Athena** connection page, enter the following information:

    * For **DSN**, enter the name of the ODBC DSN that you want to use. For instructions on configuring your DSN, go to the [ODBC driver documentation](https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc.html#connect-with-odbc-driver-documentation).
    * For **Data Connectivity mode**, choose a mode that's appropriate for your use case, following these general guidelines:
        * For smaller data sets, choose **Import**. When you use import mode, Power BI works with Athena to import the contents of the entire data set for use in your visualizations.
        * For larger data sets, choose **DirectQuery**. In DirectQuery mode, no data is downloaded to your workstation. While you create or interact with a visualization, Microsoft Power BI works with Athena to dynamically query the underlying data source so that you're always viewing current data. For more information, go to [Use DirectQuery in Power BI Desktop](/power-bi/connect-data/desktop-use-directquery).

    :::image type="content" source="./media/amazon-athena/amazon-athena-2.png" alt-text="Screenshot of the Amazon Athena connector dialog where you enter the connection information.":::

6. Select **OK**.

7. At the prompt to configure data source authentication, select either **Use Data Source Configuration** or **AAD Authentication**. Enter any required sign-in information. Then select **Connect**.

    :::image type="content" source="./media/amazon-athena/amazon-athena-3.png" alt-text="Screenshot of the Amazon Athena authentication dialog where you choose an authentication method.":::

    Your data catalog, databases, and tables appear in the **Navigator** dialog box.

    :::image type="content" source="./media/amazon-athena/amazon-athena-4.png" alt-text="Screenshot of the Navigator dialog that shows your data.":::

8. In the **Display Options** pane, select the check box for the data set that you want to use.

9. If you want to transform the data set before you import it, go to the bottom of the dialog box and select **Transform Data**. This selection opens the Power Query Editor so that you can filter and refine the set of data you want to use.

10. Otherwise, select **Load**. After the load is complete, you can create visualizations like the one in the following image. If you selected **DirectQuery**, Power BI issues a query to Athena for the visualization that you requested.

    :::image type="content" source="./media/amazon-athena/amazon-athena-5.png" alt-text="Screenshot of a sample Amazon Athena data visualization.":::

## Limitations

When you use the Amazon Athena Connector through an on-premises data gateway, driver information must be registered under the System Data Source Name (DSN), not the User DSN. If the driver is registered under the User DSN, a `Data source name not found and no default driver specified` error occurs when connecting through the on-premises data gateway. A Windows limitation causes this error. In Windows, User DSNs are stored in the HKEY_CURRENT_USER section of the Windows Registry. This means they're tied specifically to the user profile under which they were created. When an application runs as a Windows Service, it typically operates under a service account (for example, LocalSystem, NetworkService, or a custom domain account) with its own security context. These accounts don't load the interactive user's profile and therefore don't have access to that user's HKEY_CURRENT_USER registry section. For more information, go to the [Amazon Athena ODBC v2 driver public documentation for Windows](https://docs.aws.amazon.com/athena/latest/ug/odbc-v2-driver-getting-started-windows.html).
