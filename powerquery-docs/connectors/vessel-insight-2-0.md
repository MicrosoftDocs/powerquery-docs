# Vessel Insight 2.0


> [!NOTE]
>The following connector article is provided by Kongsberg, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Kongsberg website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Organizational account |

## Prerequisites

Before you can sign in to Vessel Insight, you must have an organization account (username/password) connected to a tenant.

## Capabilities Supported

* Import

## Connect to Vessel Insight

To connect to Vessel Insight:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Other** from the categories on the left, select **Vessel Insight 2.0**, and then select **Connect**.

   :::image type="content" source="./media/vessel-insight-2-0/get-data.png" alt-text="Get Data from Vessel Insight 2.0.":::

2. If this is the first time you're getting data through the Vessel Insight connector, a third-party notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

3. Select the parameters for the data query, the selection will be applied to all Vessel Insight Data.
   :::image type="content" source="./media/vessel-insight-2-0/parameters.png" alt-text="Select parameters.":::
   
The parameters are:
- Time mode: **Latest** or **Period**
   - In case of **Latest**, the other parameters are optional
- **Interval**: Different intervals to select for data retrieval e.g. **1h**
- **Start**/**End** **time**: Time interval to get data for e.g. 2024-11-03T00:00:00Z
- **Resampling methods**: Which aggregate method to use, any combination of **avg**, **min**, **max**, **count** and **sum**
  
4. To sign in to your Vessel Insight account, select **Sign in**.

   :::image type="content" source="./media/vessel-insight-2-0/sign-in-ac.png" alt-text="Select sign in button.":::

5. In the window that appears, provide your Vessel Insight tenant URL in the format `<companyname>.kognif.ai`. Then select **Validate**.

    :::image type="content" source="./media/vessel-insight-2-0/validate.png" alt-text="Insert Vessel Insight tenant.":::

6. In the window that appears, provide your credentials to sign in to your Vessel Insight account.

   :::image type="content" source="./media/vessel-insight-2-0/aadsignin.png" alt-text="Sign in to Vessel Insight.":::

   If you entered an email address and password, select **Continue**.

7. Once you've successfully signed in, select **Save**.

   :::image type="content" source="./media/vessel-insight-2-0/connect.png" alt-text="Signed in and ready to connect.":::

Once the connection is established, you can preview and select data within the **Navigator** dialog box to create a single tabular output.

You can select the following options in the navigator:

* **Vessel Insight Data 2.0**: Time series data for your fleets in the new asset hierarchy. Only tags with data will be shown.
* **Voyage**: Voyage history and location data from Automatic Identification System (AIS).

For **Vessel Insight Data 2.0** the same parameters are applied to all selections, and the summary shows which values are in use:

:::image type="content" source="./media/vessel-insight-2-0/summary.png" alt-text="Parameters selected.":::

Only nodes which contain data is shown:

:::image type="content" source="./media/vessel-insight-2-0/nodes.png" alt-text="Navigator selected.":::


You can **Load** the selected time series data, which brings the one table for each selected time series tag into Power BI Desktop, or you can select **Transform Data** to edit the query, which opens the Power Query editor. You can then filter and refine the set of data you want to use, and then load that refined set of data into Power BI Desktop.

:::image type="content" source="./media/vessel-insight-2-0/load.png" alt-text="Load or transform data.":::



### Voyage
For **Voyage**, you need to input IMOs that you want to fetch data for.

:::image type="content" source="./media/vessel-insight-2-0/voyage.png" alt-text="Voyage IMO parameter.":::

When you import voyage data through the **Voyage** node, you can limit the amount of data for the **History** and **Location History** table by setting a set of optional input parameters.

:::image type="content" source="./media/vessel-insight-2-0/voyageparams.png" alt-text="Voyage limit data":::
      
These input parameters are:  
*   **Comma Separated IMOs**: Input one or multiple IMO numbers you want voyage data for.
*   **Start (Time: Period), e.g. 2024-10-08T00:00:00Z**: Filter on range by inserting the start date and time here.
*   **End (Time: Period), e.g. 2024-10-08T01:00:00Z**: Filter on range by inserting the end date and time here.


## Limitations and issues

You should be aware of the following limitations and issues associated with accessing Vessel Insight data.
*   There's a general limit of 1-GB data that's imported into Power BI, unless the workspace is in a Power BI Premium capacity. We recommend that you aggregate and choose a short date range when importing time series data, as it can become heavy.
*   Each time series tag with associated values is outputted in a separate table in Power BI. If it's necessary to combine tags and values into one table, the tags and their values need to be merged in the Power Query editor.
*   The API request limits returned values to 10000, and an error message is shown if response will go above. Use a higher level aggregate, e.g. change from 5s to 1h and retry until the response is within limits.
*   The API request timeout is, by default, one minute.
For more guidelines on accessing Vessel Insight data, go to [The Getting started guide](https://community.kongsbergdigital.com/kb/api-documentation-vessel-insight).

## Recommended content

You might also find the following Vessel Insight information useful:

* [About Vessel Insight](https://www.kongsbergdigital.com/maritime-data-hub))
* [Vessel Insight API](https://developer.kognif.ai/)
