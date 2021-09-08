# Usercube

## Summary

| Item                             | Description                                                                  |
| -------------------------------- | ---------------------------------------------------------------------------- |
| Release State                    | General Availability                                                         |
| Products                         | Power BI (Datasets)                                                          |
| Authentication Types Supported   | Client Credentials                                                           |
| Function Reference Documentation | [Usercube.Universes](/powerquery-m/usercube-universes)                       |
|                                  |                                                                              |

## Prerequisites

You must have a Usercube instance with the *PowerBI* option.

## Capabilities Supported

- Import

## Connect to Usercube from Power Query Desktop

To connect to a Usercube server:

1. Launch Power BI Desktop and enter the **Get Data** experience.

2. From the **Other** category, select **Usercube**, and then select **Connect**.

   ![Get Data.](media/usercube/usercube-get-data.png)

3. You'll be prompted to specify your Usercube server's URL.

   ![Usercube Server.](media/usercube/usercube-server.png)

4. Enter the client credentials. The *Client Id* must be built from the *Identifier* of an *OpenIdClient* element defined in the configuration of your Usercube instance. To this identifier, you must concatenate the `@` character and the domain name of the Usercube instance. 

   ![Client credentials.](media/usercube/usercube-client-credentials.png)

5. In **Navigator**, select the data you require. Then, either select **Transform data** to transform the data in the  Power Query Editor, or choose **Load** to load the data in Power BI.

   ![Usercube import data navigator](./media/usercube/usercube-import-data-navigator.png)