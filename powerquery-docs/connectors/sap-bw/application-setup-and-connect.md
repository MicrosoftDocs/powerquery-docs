---
title: Power Query SAP Business Warehouse Application Server connector
description: Power Query SAP Business Warehouse Application Server connector reference
author: dougklopfenstein
ms.topic: conceptual
ms.date: 7/14/2023
ms.author: bezhan
---

# SAP Business Warehouse Application Server

>[!NOTE]
>The SAP Business Warehouse (BW) Application Server connector is now certified for SAP BW/4HANA as of June 2020.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Analysis Services |
| Authentication Types Supported | Windows (desktop)<br/>Database (desktop)<br/>Basic (online) |
| Function Reference Documentation | [SapBusinessWarehouse.Cubes](/powerquery-m/sapbusinesswarehouse-cubes)<br/>[Sapbusinesswarehouseexecutionmode.DataStream](/powerquery-m/sapbusinesswarehouseexecutionmode-type)<br/>[SapBusinessWarehouseExecutionMode.BasXml](/powerquery-m/sapbusinesswarehouseexecutionmode-type)<br/>[SapBusinessWarehouseExecutionMode.BasXmlGzip](/powerquery-m/sapbusinesswarehouseexecutionmode-type) |

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

>[!IMPORTANT]
> Version 1.0 of the SAP BW Application Server connector has been deprecated. New connections will use Implementation 2.0 of the SAP BW Application Server connector. All support for version 1.0 will be removed from the connector in the near future.

You'll need an SAP account to sign in to the website and download the drivers. If you're unsure, contact the SAP administrator in your organization. The drivers need to be installed on the gateway machine.

BW 7.3, BW 7.5 and BW/4HANA 2.0 is supported.

To use the SAP BW Application Server connector in Power BI Desktop or Power Query Online, you must install the SAP .NET Connector 3.0 or 3.1. Access to the download requires a valid S-user. Contact your SAP Basis team to get the SAP .NET Connector 3.0 or 3.1. You can download the [SAP .NET Connector 3.0](https://support.sap.com/en/product/connectors/msnet.html) from SAP. The connector comes in 32-bit and 64-bit versions. Choose the version that matches your Power BI Desktop installation. For Power Query Online, choose the 64-bit version. Currently, the website lists two versions for .NET 4.0 framework:

* SAP Connector for Microsoft .NET 3.0.23.0 for Windows 32 bit (x86) as a zip file (6,928 KB), May 28, 2020
* SAP Connector for Microsoft .NET 3.0.23.0 for Windows 64 bit (x64) as a zip file (7,225 KB), May 28, 2020

<a name="app-gac-install"></a>
When you install, in **Optional setup steps**, make sure you select **Install assemblies to GAC**.

![Select install assemblies to GAC.](install-to-gac.png)

>[!NOTE]
>As of late 2023, the SAP BW Application Server connector contains support for SAP .NET Connector 3.1.

## Capabilities Supported

* Import
* Direct Query (Power BI Datasets)
* Advanced
  * Language code
  * Execution mode
  * Batch size
  * MDX statement
  * Enable characteristic structures

## Connect to an SAP BW Application Server from Power Query Desktop

To connect to an SAP BW Application Server:

1. From the **Home** tab of Power BI Desktop, select **Get Data > SAP Business Warehouse Application Server**.

2. Enter the server name, system number, and client ID of the SAP BW Application Server you want to connect to. This example uses `SAPBWTestServer` as the server name, a system number of `00`, and a client ID of `837`.

    The rest of this example describes how to import your data into Power Query Desktop, which is the default setting for **Data Connectivity mode**. If you want to use DirectQuery to load your data, go to [Connect to SAP Business Warehouse by using DirectQuery in Power BI](/power-bi/connect-data/desktop-directquery-sap-bw).

    If you want to use any of the advanced options for this connector to fine-tune your query, go to [Use advanced options](use-advanced-options.md).

    When you've finished filling in the relevant information, select **OK**.

   ![Enter the SAP Business Warehouse Application Server information.](get-data-app.png)

3. When accessing the database for the first time, the SAP BW Application Server requires database user credentials. Power Query Desktop offers two authentication modes for SAP BW connections&mdash;user name/password authentication (Database), and Windows authentication (single sign-on). SAML authentication isn't currently supported. Select either **Windows** or **Database**. If you select **Database** authentication, enter your user name and password. If you select **Windows** authentication, go to [Windows Authentication and single sign-on](single-sign-on.md) to learn more about the requirements for Windows authentication.

   ![Enter the server credentials.](sign-in-app.png)

   Then select **Connect**.

   For more information about authentication, go to [Authentication with a data source](../../connectorauthentication.md).

4. From the **Navigator** dialog box, select the items you want to use. When you select one or more items from the server, the **Navigator** dialog box creates a preview of the output table. For more information about navigating the SAP BW Application Server query objects in Power Query, go to [Navigate the query objects](navigate-query-objects.md).

   [![Navigator view from Power Query Desktop.](navigator-desktop.png)](navigator-desktop.png#lightbox)

5. From the **Navigator** dialog box, you can either transform the data in the Power Query Editor by selecting **Transform Data**, or load the data by selecting **Load**.

## Connect to an SAP BW Application Server from Power Query Online

To connect to an SAP BW Application Server from Power Query Online:

1. From the **Data sources** page, select **SAP BW Application Server**.

2. Enter the server name, system number, and client ID of the SAP BW Application Server you want to connect to. This example uses `SAPBWTestServer` as the server name, a system number of `00`, and a client ID of `837`.

3. Select the [on-premises data gateway](/data-integration/gateway/service-gateway-onprem) you want to use to connect to the data.

4. Set **Authentication Kind** to **Basic**. Enter your user name and password.

   ![SAP BW Application Server online sign-in.](get-data-online-power-apps-app.png)

5. You can also select from a set of [advanced options](use-advanced-options.md) to fine-tune your query.

6. Select **Next** to connect.

7. From the **Navigator** dialog box, select the items you want to use. When you select one or more items from the server, the **Navigator** dialog box creates a preview of the output table. For more information about navigating the SAP BW Application Server query objects in Power Query, go to [Navigate the query objects](navigate-query-objects.md).

8. From the **Navigator** dialog box, you can transform the data in the Power Query Editor by selecting **Transform Data**.

   [![Navigator view from Power Query Online.](navigator-online.png)](navigator-online.png#lightbox)

## Connect using router strings

SAP router is an SAP program that acts as an intermediate station (proxy) in a network connection between SAP systems, or between SAP systems and external networks. SAP router controls the access to your network, and, as such, is a useful enhancement to an existing firewall system (port filter). Figuratively, the firewall forms an impenetrable "wall" around your network. However, since some connections need to penetrate this wall, a "gate" has to be made in the firewall. SAP router assumes control of this gate. In short, SAP router provides you with the means of controlling access to your SAP system.

## Router strings in Power Query

To establish a connection to an SAP BW system through an SAP router, you can use router strings in place of the server name in the Power Query connection settings.

The syntax used for the router string is:

`<SAP router 1><SAP router 2>.....<SAP router n><destination : application server>`

Where:

* `<SAP router>` = `/H/<sap router host name>/S/<sap router port>`
* `<destination> = /H/<application server host name>/S/<application server port or service name>`

>[!NOTE]
>`/S/<port>` can be omitted if the port is the default port (3299).

The following table contains examples of some router strings.

| Destination | Example | Router string |
| ----------- | ------- | ------------- |
| Application Server | FQDN for application server | `/H/saprouter-maq/S/3299/H/bwmpas.mycompany.com/S/3214` |
| Application Server | SAP Router port provided | `/H/saprouter-maq/S/3299/H/bwmpas/S/3214` |
| Application Server | SAP Router port omitted | `/H/10.11.23.33/H/bwmpas/S/3214` |

## Considerations

* Router strings can include passwords, prefixed by either `/P/` or `/W/`. Passwords aren't supported in Power Query router strings as this could be unsafe. Using a password will result in an error.

* Router strings also allow the use of symbolic SAP system names, prefixed with `/R/`. This type of string isn't supported in Power Query.

* In Power Query, you can use the "router string" syntax to specify a custom port, so router strings with a single station are allowed. Router strings can then be identified as starting with either `/H/` or `/M/`. Any other input is assumed to be a server name/IP address.

## Next steps

* [Navigate the query objects](navigate-query-objects.md)
* [SAP Business Warehouse fundamentals](sap-bw-fundamentals.md)
* [Use advanced options](use-advanced-options.md)
* [SAP Business Warehouse connector troubleshooting](sap-bw-troubleshooting.md)
