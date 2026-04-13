---
title: TIBCO(R) Data Virtualization connector
description: Provides basic information, prerequisites, and instructions on how to connect to your TIBCO(R) Data Virtualization Server.
author: whhender
ms.topic: concept-article
ms.date: 11/24/2025
ms.author: whhender
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# TIBCO(R) Data Virtualization

> [!NOTE]
>This connector is owned and provided by TIBCO.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Database (Username/Password)<br/>Windows Authentication (NTLM/Kerberos) |
| Function Reference Documentation | &mdash; |

## Prerequisites

[!INCLUDE [Includes_tibco_prerequisites](includes/tibco/tibco-prerequisites.md)]

## Capabilities Supported

[!INCLUDE [Includes_tibco_capabilities-supported](includes/tibco/tibco-capabilities-supported.md)]

## Connect to a TIBCO(R) Data Virtualization server from Power Query Desktop

Once the matching connector is installed and a DSN is configured, you can connect to a TIBCO(R) Data Virtualization server. To make the connection, take the following steps:

1. Select the **TIBCO(R) Data Virtualization** option in the connector selection.

2. In the **Power BI Connector for TIBCO(R) Data Virtualization** dialog that appears, provide the Data Source Name.

   :::image type="content" source="./media/tibco/tdv-datasourcename.png" alt-text="Screenshot of the TDV connection builder in Power BI.":::

3. Select either the **Import** or **DirectQuery** data connectivity mode.

4. If you're connecting to this database for the first time, select the authentication type. If applicable, enter the needed credentials. Then select **Connect**.
   - **Anonymous**: Uses the credentials stored in the DSN.
   - **Basic**: Username/password are submitted when creating the connection.
   - **Windows**: Authenticates using the current Windows user. This authentication type requires the **SSO** connection property to be set. When you use Kerberos, the **Use Platform Kerberos API** must be set to true to use the current Windows user.

    :::image type="content" source="./media/tibco/tdv-auth.png" alt-text="Screenshot of the TDV authentication dialog where you enter your credentials.":::

5. In **Navigator**, select the database information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

   :::image type="content" source="./media/tibco/tdv_navigator.png" alt-text="Screenshot of the Power Query Desktop Navigator showing the product data in TDV.":::

## Connect using advanced options

Power Query Desktop provides a set of advanced options that you can add to your query if needed.

The following table lists all of the advanced options you can set in Power Query Desktop.

| Advanced option | Description |
| --------------- | ----------- |
| Advanced Connection Properties | Takes a semi-colon separated list of connection properties. This option is used to specify other connection properties not configured in the DSN. |
| SQL statement | For information, go to [Import data from a database using native database query](../native-database-query.md). |

Once you select the advanced options you require, select **OK** in Power Query Desktop to connect to your TIBCO(R) Data Virtualization Server.

## Kerberos-based single sign-on (SSO) for TIBCO(R) Data Virtualization

The TIBCO(R) Data Virtualization connector now supports Kerberos-based single sign-on (SSO).

To use this feature:

1. Sign in to your Power BI account, and navigate to the **Gateway management** page.

2. Add a new data source under the gateway cluster you want to use.

3. Select the connector in the **Data Source Type** list.

4. Expand the **Advanced Settings** section.

5. Select the option to **Use SSO via Kerberos for DirectQuery queries** or **Use SSO via Kerberos for DirectQuery and Import queries**.

   :::image type="content" source="./media/tibco/kerberos-sso.png" alt-text="Screenshot of the Add data source dialog showing the Kerberos advanced settings in TDV.":::

For more information, go to [Configure Kerberos-based SSO from Power BI service to on-premises data sources](/power-bi/connect-data/service-gateway-sso-kerberos).
