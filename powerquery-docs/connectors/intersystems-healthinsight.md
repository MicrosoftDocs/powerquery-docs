---
title: Intersystems Health Insight
description: Provides basic details about using the Intersystems Health Insight connector.
author: jbolinsky
ms.topic: conceptual
ms.date: 9/11/2025
ms.author: dougklo
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Intersystems Health Insight

>[!Note]
>This connector is owned and provided by Intersystem.

## Summary

|**Item**                              |**Description**                                        |
|:-------------------------------------|:------------------------------------------------------|
| Release State                        | General Availability                                  |
| Products Supported                   | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication types supported       | Health Insight IRIS account                           |

## Prerequisites

To use the Intersystems Health Insight connector, you must have an IRIS account (user/password) and your user must have privileges to access the SQL tables, views, and cubes. You must also have the IRIS ODBC driver installed.
The IRIS ODBC driver can be downloaded from the [WRC distributions page](https://wrc.intersystems.com/wrc/coDistGen.csp) and installed separately.

## Capabilities supported

- Import
- DirectQuery (Power BI semantic models)

## Connect to an Intersystems Health Insight database in Power BI Desktop

1. Identify the Health Insight server connection details&mdash;Server, Super server port, and Namespace.

2. Open Power BI Desktop, select **Get Data** and then **More**.

   :::image type="content" source="./media/intersystem-healthinsight/initial-desktop.png" alt-text="Screenshot of the initial desktop with the Get data steps emphasized." lightbox="./media/intersystem-healthinsight/initial-desktop.png":::

3. When the **Get Data** dialog opens, select **Database** and then search the listing to find Intersystems Health Insight. Then select the **Connect** button.

   :::image type="content" source="./media/intersystem-healthinsight/get-data.png" alt-text="Screenshot of the Get data dialog with the connector emphasized.":::

4. The connection screen opens. Here, Host (IP Address) is the IP address of the host for your InterSystems Health Insight instance, Port is the instance’s superserver port, and Namespace is the namespace where your Health Insight data is located. Answer **Yes** or **No** to the questions related to connecting via SSL and hiding system tables. Then select the desired connectivity.

   :::image type="content" source="./media/intersystem-healthinsight/connection-screen.png" alt-text="Screenshot of the InterSystems Health Insight connection screen.":::

5. Upon your first connection to the Health Insight instance, an authentication dialog appears. Choose **Basic** and enter your InterSystems Health Insight credentials.

   :::image type="content" source="./media/intersystem-healthinsight/authentication-screen.png" alt-text="Screenshot of the InterSystem Health Insight authentication screen.":::

6. The navigation window opens and presents a Table folder (this folder is where the HSAA tables reside) and a Cube folder (this folder is where you find the cubes).

Visit the [documentation](https://docs.intersystems.com/hslatest/csp/docbook/DocBook.UI.Page.cls?KEY=HSAA_powerbi) for connection, usage, and troubleshooting instructions.

## Considerations and limitations

### Booleans cause errors in DirectQuery mode

When you use Power BI in Direct Query mode, attempting to create filters, slicers, or visuals with Health Insight Booleans results in errors. These errors occur because the InterSystems Health Insight Connector exposes Booleans as the BIT datatype. Power BI can't handle BIT data in DirectQuery mode and returns a folding error if you attempt to create filters, slicers, or visuals.

You can correct this issue by exposing the Boolean in a view via a CAST statement. For example:

CAST((CASE WHEN *fieldname*=1 then 1 ELSE 0 END) as INTEGER) as *fieldname*

...where *fieldname* is the Boolean in question.

This CAST statement exposes the Boolean as an Integer, which Power BI can handle without error. Any NULLs are defaulted to 0.

You can either create your own views or use the CreateViewEntry utility to create a view for any Health Insight table with this issue.

### Long strings cause errors in DirectQuery mode

When you use Power BI in DirectQuery mode, attempting to create filters, slicers, or visuals with long Health Insight strings results in errors. When data is brought into a report in DirectQuery mode, the Power BI engine tries to limit the number of queries sent to the source environment and attempts to use data that it has cached in memory. When the engine uses cached memory data, it's unable to handle larger strings and returns a folding error.

For example, Gender_Code in HSAA.Patient has a maximum length of 32,000 and causes errors in DirectQuery mode. You can correct this issue by exposing the property in a view via a CAST statement. For example:

CAST(*fieldname* AS VARCHAR(4000)) as *fieldname*

...where *fieldname* is the long string in question.

This CAST statement limits the schema maximum length that is sent to Power BI. Ensure that you don't eliminate important data via this CAST statement. As an example, you might confirm that your Gender_Code data never exceeds 4,000 characters in length, meaning that you can shorten the maximum length that's sent to Power BI without consequence.

You can either create your own views or use the CreateViewEntry utility to create a view for any Health Insight table with this issue.

## Further assistance

For further assistance, contact InterSystems' [Worldwide Response Center](https://wrc.intersystems.com).
