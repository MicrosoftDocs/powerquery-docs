---
title: Use advanced options
description: Describes how to use the Power Query SAP Business Warehouse connector advanced sign-in options.
author: dougklopfenstein
ms.topic: concept-article
ms.date: 1/8/2024
ms.author: dougklo
ms.subservice: connectors
ms.custom: sfi-image-nochange
---

# Use advanced options

When you create a connection to an SAP Business Warehouse server, you can optionally specify a language code, execution mode, batch size, and an MDX Statement. Also, you can select whether you want to enable characteristic structures.

> [!NOTE]
> Although the images in this article illustrate the advanced options in the SAP Business Warehouse Application Server connector, they work the same way in the SAP Business Warehouse Message Server connector.

## Language code

You can optionally specify a language code when establishing a connection to the SAP BW server.

:::image type="content" source="language-code.png" alt-text="Entering a two-digit language code in the advanced options.":::

The expected value is a two-letter language code as defined in the SAP system. In Power Query Desktop, select the Help icon (question mark) next to the Language Code field for a list of valid values.

After you set the language code, Power Query displays the descriptive names of the data objects in SAP BW in the specified language, including the field names for the selected objects.

> [!NOTE]
> Not all listed languages might be configured in your SAP BW system, and object descriptions might not be translated in all languages.

:::image type="content" source="navigator-language-option.png" alt-text="Navigator showing language change for descriptive and field names.":::

If no language code is specified, the default locale from the **Options** dialog will be used and mapped to a valid SAP language code. To view or override the current locale in Power BI Desktop, open the **File** > **Options and settings** > **Options** dialog box and select **Current File** > **Regional settings**. To view or override the current locale in Power Query Online, open the **Home** > **Options** > **Project options** dialog box. If you do override the locale, your setting gets persisted in your M query and would be honored if you copy-paste your query from Power Query Desktop to Power Query Online.

## Execution mode

The **Execution mode** option specifies the MDX interface is used to execute queries on the server. The following options are valid:

* **BasXml**: Specifies the *bXML flattening mode* option for MDX execution in SAP Business Warehouse.
* **BasXmlGzip**: Specifies the *Gzip compressed bXML flattening mode* option for MDX execution in SAP Business Warehouse. This option is recommended for low latency or high volume queries. The default value for the execution mode option.
* **DataStream**: Specifies the *DataStream flattening mode* option for MDX execution in SAP Business Warehouse.

   :::image type="content" source="execution-mode.png" alt-text="Sign in dialog box showing location of the Execution mode option.":::

## Batch size

Specifies the maximum number of rows to retrieve at a time when executing an MDX statement. A small number translates into more calls to the server when retrieving a large data set. A large number of rows may improve performance, but could cause memory issues on the SAP BW server. The default value is 50000 rows.

## MDX Statement

> [!NOTE]
>The MDX statement option isn't available in Power Query Online.

Instead of using the navigator to browse through and select from available data objects in SAP BW, a user who's familiar with the MDX query language can specify an MDX statement for direct execution in SAP BW. However, be aware that no further query folding will be applied when using a custom MDX statement.

The statement for the example used here would look as shown in the following sample, based on the technical names of the objects and properties in SAP BW.

```
SELECT {[0EFUZM0P10X72MBPOYVBYIMLB].[0EFUZM0P10X72MBPOYVBYISWV]} ON COLUMNS ,
NON EMPTY CROSSJOIN(CROSSJOIN([0D_MATERIAL].[LEVEL01].MEMBERS,[0D_PUR_ORG].[LEVEL01].MEMBERS) ,
[0D_VENDOR].[LEVEL01].MEMBERS)
DIMENSION PROPERTIES
[0D_MATERIAL].[20D_MATERIAL],
[0D_MATERIAL].[50D_MATERIAL],
[0D_PUR_ORG].[20D_PUR_ORG],
[0D_PUR_ORG].[50D_PUR_ORG],
[0D_VENDOR].[20D_VENDOR],
[0D_VENTOR].[50D_VENDOR] ON ROWS FROM [0D_PU_C01/0D_PU_C01_Q0013]
```

:::image type="content" source="example-mdx-statement.png" alt-text="Example MDX statement shown in MDX statement option.":::

The SAP BW connector will display a preview of the data that is returned by the MDX statement. You can then either select **Load** to load the data (Power Query Desktop only), or select **Transform Data** to further manipulate the data set in the Power Query Editor.

:::image type="content" source="mdx-preview-data.png" alt-text="MDX data displayed in the navigator preview.":::

To validate and troubleshoot an MDX statement, SAP BW provides the *MDXTEST* transaction for SAP GUI for Windows users. Further, the MDXTEST transaction can be a useful tool for analyzing server errors or performance concerns as a result of processing that occurs within the SAP BW system.

For more detailed information on this transaction, go to [MDX Test Environment](https://help.sap.com/viewer/64e2cdef95134a2b8870ccfa29cbedc3/7.3.15/en-US/19fdd486b13c43e2ad9f562a3222a480.html).

:::image type="content" source="mdxtest-in-sapgui.png" alt-text="Troubleshooting an MDX statement with MDXTEST in the SAPGUI.":::

MDXTEST can also be used to construct an MDX statement. The transaction screen includes panels on the left that assist the user in browsing to a query object in SAP BW and generating an MDX statement.

The transaction offers different execution modes/interfaces for the MDX statement. Select *Flattening (basXML)* to mimic how Power Query would execute the query in SAP BW. This interface in SAP BW creates the row set dynamically using the selections of the MDX statement. The resulting dynamic table that's returned to Power Query Desktop has a very compact form that reduces memory consumption.

:::image type="content" source="select-flattening.png" alt-text="Shows Flattening selected in Execute in Export mode.":::

The transaction will display the result set of the MDX statement and useful runtime metrics.

:::image type="content" source="mdx-result-set.png" alt-text="Displays the result set of the MDX statement.":::

## Enable characteristic structures

The **Enable characteristic structures** selection changes the way characteristic structures are displayed in the navigator. A structure is an SAP BW object that can be used when building BEX queries. In the BEX UX they look like the following image.

:::image type="content" source="characteristic-structures.png" alt-text="Structure used when building BEX queries.":::

If the **Enable characteristic structures** selection is clear (default), the connector will produce a cartesian product of each dimension on the structure with each available measure. For example:

![Image of the navigator showing the Net Value stat curr and Number of documents values each displayed for Calgary, Frankfurt, and Munich.](clear-characteristic-structure.png)

If selected, the connector produces only the available measures. For example:

:::image type="content" source="enable-characteristic-structure.png" alt-text="Image of the navigator showing only the Net Value stat curr and Number of documents values displayed.":::

### See also

* [Navigate the query objects](navigate-query-objects.md)
* [Transform and filter SAP BW data set](transform-filter-sap-bw-data.md)
* [SAP Business Warehouse connector troubleshooting](sap-bw-troubleshooting.md)
