---
title: Power Query SAP Business Warehouse Message Server connector
description: Power Query SAP Business Warehouse Message Server connector reference
author: whhender
ms.topic: concept-article
ms.date: 1/25/2024
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# SAP Business Warehouse Message Server

> [!NOTE]
>The SAP Business Warehouse (BW) Message Server connector is now certified for SAP BW/4HANA as of June 2020.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows) |
| Authentication Types Supported | Windows (desktop)<br/>Database (desktop)<br/>Basic (online) |
| Function Reference Documentation | [SapBusinessWarehouse.Cubes](/powerquery-m/sapbusinesswarehouse-cubes)<br/>[Sapbusinesswarehouseexecutionmode.DataStream](/powerquery-m/sapbusinesswarehouseexecutionmode-type)<br/>[SapBusinessWarehouseExecutionMode.BasXml](/powerquery-m/sapbusinesswarehouseexecutionmode-type)<br/>[SapBusinessWarehouseExecutionMode.BasXmlGzip](/powerquery-m/sapbusinesswarehouseexecutionmode-type) |

> [!NOTE]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

[!INCLUDE [Includes_message-setup-and-connect_prerequisites](../includes/message-setup-and-connect/message-setup-and-connect-prerequisites.md)]

## Capabilities Supported

[!INCLUDE [Includes_message-setup-and-connect_capabilities-supported](../includes/message-setup-and-connect/message-setup-and-connect-capabilities-supported.md)]

## Connect to an SAP BW Message Server from Power Query Desktop

To connect to an SAP BW Message Server:

1. From the **Home** tab of Power BI Desktop, select **Get Data > SAP Business Warehouse Message Server**.

2. Enter the server, system number, client ID, and logon group of the SAP BW Message Server you want to connect to. This example uses `SAPBWTestServer` as the server name, a system number of `100`, a client ID of `837`, and a logon group of `PURCHASING`.

   > [!NOTE]
   >You can also use router strings to connect to your data. More information: [Connect using router strings](#connect-using-router-strings)

    The rest of this example describes how to import your data into Power Query Desktop, which is the default setting for **Data Connectivity mode**. If you want to use DirectQuery to load your data, see [Connect to SAP Business Warehouse by using DirectQuery in Power BI](/power-bi/connect-data/desktop-directquery-sap-bw).

    If you want to use any of the advanced options for this connector to fine-tune your query, go to [Use advanced options](use-advanced-options.md).

    When you've finished filling in the relevant information, select **OK**.

   :::image type="content" source="get-data-message.png" alt-text="Enter the SAP Business Warehouse Message Server information.":::

3. When accessing the database for the first time, the SAP BW Message Server requires database user credentials. Power Query Desktop offers two authentication modes for SAP BW connections&mdash;user name/password authentication (Database), and Windows authentication (single sign-on). SAML authentication isn't currently supported. Select either **Windows** or **Database**. If you select **Database** authentication, enter your user name and password. If you select **Windows** authentication, go to [Windows Authentication and single sign-on](single-sign-on.md) to learn more about the requirements for Windows authentication.

   :::image type="content" source="sign-in-message.png" alt-text="Enter the message server credentials.":::

   Then select **Connect**.

   For more information about authentication, go to [Authentication with a data source](../../connectorauthentication.md).

4. From the **Navigator** dialog box, select the items you want to use. When you select one or more items from the server, the **Navigator** dialog box creates a preview of the output table. For more information about navigating the SAP BW Message Server query objects in Power Query, go to [Navigate the query objects](navigate-query-objects.md).

   :::image type="content" source="navigator-desktop.png" lightbox="navigator-desktop.png" alt-text="Message Server navigator view from Power Query Desktop.":::
5. From the **Navigator** dialog box, you can either transform the data in the Power Query Editor by selecting **Transform Data**, or load the data by selecting **Load**.

## Connect to an SAP BW Message Server from Power Query Online

[!INCLUDE [Includes_message-setup-and-connect_connect-to-power-query-online](../includes/message-setup-and-connect/message-setup-and-connect-connect-to-power-query-online.md)]

## Connect using router strings

SAP router is an SAP program that acts as an intermediate station (proxy) in a network connection between SAP systems, or between SAP systems and external networks. SAP router controls the access to your network, and, as such, is a useful enhancement to an existing firewall system (port filter). Figuratively, the firewall forms an impenetrable "wall" around your network. However, since some connections need to penetrate this wall, a "gate" has to be made in the firewall. SAP router assumes control of this gate. In short, SAP router provides you with the means of controlling access to your SAP system.

## Router strings in Power Query

To establish a connection to an SAP BW system through an SAP router, you can use router strings in place of the server name in the Power Query connection settings.

The syntax used for the router string is:

`<SAP router 1><SAP router 2>.....<SAP router n><destination : message server>`

Where:

* `<SAP router>` = `/H/<sap router host name>/S/<sap router port>`
* `<destination> = /M/<message server host name>/S/<message server port or service name>/G/<logon group>`

> [!NOTE]
>`/S/<port>` can be omitted if the port is the default port (3299).

The following table contains examples of some router strings.

| Destination | Example | Router string |
| ----------- | ------- | ------------- |
| Message Server | SAP Router with message server port | `/H/saprouter-maq/S/3299/M/bwmpms.mycompany.com/S/3214` |
| Message Server | SAP Router with logon group | `/H/saprouter-maq/S/3299/M/bwmpms.mycompany.com/S/3214/G/space` |

## Considerations

* Router strings can include passwords, prefixed by either `/P/` or `/W/`. Passwords aren't supported in Power Query router strings as this could be unsafe. Using a password will result in an error.

* Router strings also allow the use of symbolic SAP system names, prefixed with `/R/`. This type of string isn't supported in Power Query.

* In Power Query, you can use the "router string" syntax to specify a custom port, so router strings with a single station are allowed. Router strings can then be identified as starting with either `/H/` or `/M/`. Any other input is assumed to be a server name/IP address.

* To allow you to use the same router strings you use in other tools, the `/G/` option in the router string is supported. When provided, it should match the value specified in the "Logon group" parameter.

* If a message server port is specified, it will be sent. Under these circumstances, the `SystemId` is omitted from the connection string as it’s no longer required. However, you must still provide a value for `SystemId` even though it won't be used to establish the connection.

### See also

* [Navigate the query objects](navigate-query-objects.md)
* [SAP Business Warehouse fundamentals](sap-bw-fundamentals.md)
* [Use advanced options](use-advanced-options.md)
* [SAP Business Warehouse connector troubleshooting](sap-bw-troubleshooting.md)
