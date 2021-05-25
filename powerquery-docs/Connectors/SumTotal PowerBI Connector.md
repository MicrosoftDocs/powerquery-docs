

---

# SumTotal PowerBI Connector

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Dynamics 365 Customer Insights |
| Authentication types | SumTotal credentials via OAuth2.0 |
| Function Reference Documentation | Web.Conents <br> Table.ToNavigationTable <br>Table.FromRecords <br> Json.Document|
| | |

## Prerequisites

You must have a SumTotal hosted environment with standard permissions to access the portal, and read permissions to access data within tables.

## Capabilities supported

* Query Multiple OData endpoints
* Create rich and visual reporting via query data
* Advanced
   * Optionally filter records by RowVersionId parameter to get incremental data

## Finding your Sumtotal Hosted URL

Copy the SumTotal hosted root URL in full. This root URL is the unique URL specific to customer. The URL will be in the format of **https://\<*yourcustomerdomain*>.sumtotal.host/**. Make sure not to copy the rest of the URL. Keep this URL somewhere handy so you can use it later.

## Connect to SumTotal BI from Power BI Desktop

>[Note]
> The Power Query SumTotal connector is currently only suited towards OData API endpoints. For more information, go to [SumTotal's OData API functionality](#https://marketplace.sumtotalsystems.com/Home/ODataAPI).

To connect to SumTotal from Power BI Desktop:

1. Select **Get data** from the **Home** tab.

2. In the **Get Data** dialog box, select **Other > SumTotal**, and then select **Connect**.

3. Enter the server URL address of the data you want to load.

**NOTE"** You will be prompted with a Script Error popup, this is to load JS/CSS scripts the login form uses, Click Yes.

4. When the table is loaded in the **Navigator** dialog box, you will be presented with the list of OData API entities that are currently supported by the connector, you can select one or multiple entities.

  When you've finished selecting entities , select **Load** or  **Transform Data**.

**NOTE:** If this is the first time you're connecting to this site, 
select **Sign in** and input your credentials. Then select **Connect**.

## Limitations and issues

### SumTotal OData API performance and throttling limits

For information about OData API performance and throttling limits for SumTotal connections, go to [SumTotal's OData API functionality](#https://marketplace.sumtotalsystems.com/Home/ODataAPI)  under 'Important Notes' section. These limitations apply to both the SumTotal connector (which uses the OData API as an implementation detail) and the 'actual' OData Hosted API when accessing the same endpoints.

### Table retrieval rate

As a guideline, most default tables will be retrieved at a rate of approximately 1000 rows per second using the SumTotal connector. If you require faster retrieval rates, consider using the RowVersionId filter Parameter that you can pass directly into the environment hosted URL by appending it as a query string parameter. 
Full url example with rowVersionId parameter: https://{host}.sumtotalystems.com/?rowVersionId=1234

