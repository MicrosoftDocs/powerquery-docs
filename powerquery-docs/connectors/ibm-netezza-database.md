---
title: Power Query Netezza database connector
description: Provides basic information for the Netezza database connector, along with how to connect to your Netezza data.
author: DougKlopfenstein
ms.topic: concept-article
ms.date: 11/19/2025
ms.author: dougklo
ms.subservice: connectors
---

# IBM Netezza database

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | Deprecating (Simba ODBC Driver), Preview (IBM Netezza ODBC) |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Database |
| Function Reference Documentation | &mdash; |

> [!IMPORTANT] 
> We're beginning the deprecation process for the Netezza Connector starting March, 2026. Instead, we'll be supporting the IBM Netezza ODBC Driver; customers will need to supply their own Netezza driver.    

> [!NOTE]
> Some capabilities might be present in one product but not others due to deployment schedules and host-specific capabilities.

> [!NOTE]
>
> Since the July 2025 release for Power BI Desktop and the on-premises data gateway, we provide a new option to use the user-installed Netezza ODBC driver to connect to the IBM Netezza database, currently available in preview. Learn more from [Use user-installed Netezza ODBC driver](#use-netezza-odbc-driver-preview).

## Capabilities Supported

* Import
* DirectQuery (Power BI semantic models)
* Advanced options
  - Command timeout in day.hr:min:sec
  - Command timeout in day.hr:min:sec
  - Normalize database name
  - Create hierarchical navigation view
  - Include relationship columns

## Connect to an IBM Netezza database from Power Query Desktop

To connect to an **IBM Netezza** database, take the following steps:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop.

2. Select **Database** from the categories on the left, select **IBM Netezza** on the right, and then select **Connect**.

    :::image type="content" source="media/ibm-netezza-database/get-data.png" alt-text="Screenshot of the Get Data dialog with the Database category and Netezza connector selected.":::

3. In the **IBM Netezza** window that appears, type or paste the name of your Netezza server and database into the boxes. You can **Import** data directly into Power BI or you can use **DirectQuery**. Learn more about [using DirectQuery](/power-bi/connect-data/desktop-use-directquery). Then select **OK**.

    :::image type="content" source="media/ibm-netezza-database/server-selection.png" alt-text="Screenshot of the Netezza dialog with a Server name entered and the Import data connectivity mode selected.":::

4. When prompted, enter your credentials. The IBM Netezza connector supports user name and password authentication.

   :::image type="content" source="media/ibm-netezza-database/sign-in-screen.png" alt-text="Screenshot of the authentication dialog with Database authentication configuration.":::

   For more information about authentication methods, go to [Authentication with a data source](../connectorauthentication.md).

5. After you connect, a **Navigator** window appears and displays the data that's available on the server. Either select **Load** to load the data or **Transform Data** to continue transforming the data in the Power Query editor.


## Connect to an IBM Netezza database from Power Query Online

To connect to an **IBM Netezza** database, take the following steps:

1. Select the **IBM Netezza** option in the connector selection.

2. In **Connect to data source**, provide the name of the server and database.

   :::image type="content" source="./media/ibm-netezza-database/service-signin.png" alt-text="Enter the Netezza database online connection.":::

3. Select the name of your on-premises data gateway.

4. If this is the first time you're connecting to this Netezza database, configure the user name and password for the IBM Netezza authentication.

5. Select **Next** to continue.

6. In **Navigator**, select the data you require, then select **Transform data** to transform the data in the Power Query editor.

## Connect using advanced options

Power Query Desktop and Power Query Online provide a set of advanced options that you can add to your query if needed.

The following table lists all of the advanced options you can set in Power Query Desktop and Power Query Online.

| Advanced option | Description |
| --------------- | ----------- |
| Command timeout in day.hr:min:sec | Specifies how long to wait for a response when interacting with the Snowflake service before returning an error. Default is no time-out. |
| Command timeout in day.hr:min:sec | Specifies how long to wait for a query to complete before returning an error. Default is no time-out. |
| Normalize database name | Specifies whether to normalize the database name. Default is true. |
| Create hierarchical navigation view | Specifies whether to provide the database navigation in hierarchy view. Default is true. |
| Include relationship columns | Specifies whether to include columns that might have relationships to other tables. Default is true. |

Once you've selected the advanced options you require, select **OK** in Power Query Desktop or **Next** in Power Query Online to connect to your IBM Netezza database.

## Use Netezza ODBC driver (Preview)

The IBM Netezza connector includes a built-in driver for connectivity by default. Starting from the **July 2025 version** of Power BI Desktop and the on-premises data gateway, there's a new option to use the user-installed Netezza ODBC driver to connect to the IBM Netezza database, currently available in preview. It enables you to utilize the native client tool provided by the data source.

To install the driver on the machine running Power BI Desktop or the on-premises data gateway, follow the IBM Netezza instruction from [Installing and configuring ODBC (Windows)](https://www.ibm.com/docs/en/netezza?topic=odbc-installing-configuring-windows).

To use the user-installed Netezza ODBC driver in Power BI Desktop, navigate to **Options and settings** (under the **File** tab) > **Options** > **Preview features**, and then select the checkbox to enable the **Use user-installed Netezza ODBC driver** option.

:::image type="content" source="media/ibm-netezza-database/pbi-desktop-preview-option.png" alt-text="Screenshot of the use user-installed Netezza ODBC driver option in Power BI Desktop.":::

To use the user-installed Netezza ODBC driver in on-premises data gateway, update the gateway configurations using the following steps:

1. On the local machine where the on-premises data gateway is installed, navigate to **C:\Program Files\On-premises data gateway**.
2. Make a backup of the configuration file named **Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config**.
3. Open the original **Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config** configuration file and locate the `MashupUseUserInstalledNetezzaODBCDriver` entry.
4. Update the `MashupUseUserInstalledNetezzaODBCDriver` value as `True`.
5. Restart your gateway.

```xml
<Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.GatewayCoreSettings>
   ...
   <setting name="MashupUseUserInstalledNetezzaODBCDriver" serializeAs="String">
      <value>True</value>
   </setting>
   ...
</Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.GatewayCoreSettings>    
```

Currently, using the user-installed Netezza ODBC driver has the following known limitations:

- "Include relationship columns" is not supported. Relationships aren't returned. The capability will be added in the upcoming August release.
- "Create hierarchical navigation view" setting as `false` is not supported and will result in an error. The connector always provides the database navigation in hierarchy view which is the default behavior.

The remaining configurations to connect to an IBM Netezza database from Power Query Desktop or Power Query Online are the same as described in the previous sections.
