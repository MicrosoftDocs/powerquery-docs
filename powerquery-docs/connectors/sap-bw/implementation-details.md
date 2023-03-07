---
title: Implementation details
description: Describes conversion information and specific features available in Implementation 2 of the Power Query SAP Business Warehouse connector.
author: dougklopfenstein
ms.topic: conceptual
ms.date: 11/29/2022
ms.author: bezhan
---

# Implementation details

This article describes conversion information and specific features available in Implementation 2 of the Power Query SAP Business Warehouse connector.

>[!IMPORTANT]
> Version 1.0 of the SAP Business Warehouse connector has been deprecated. New connections will use Implementation 2.0 of the SAP Business Warehouse connector.  All support for version 1.0 will be removed from the connector in the near future. Use the information in this article to update existing version 1.0 reports so they can use Implementation 2.0 of this connector.

## New options for Implementation 2.0

Implementation 2.0 supports the following options:

* *ExecutionMode* specifies the MDX interface used to execute queries on the server. The following options are valid:

  * `SapBusinessWarehouseExecutionMode.BasXml`
  * `SapBusinessWarehouseExecutionMode.BasXmlGzip`
  * `SapBusinessWarehouseExecutionMode.DataStream`

    The default value is `SapBusinessWarehouseExecutionMode.BasXmlGzip`.

    Using `SapBusinessWarehouseExecutionMode.BasXmlGzip` may improve performance when experiencing high latency for large datasets.

* *BatchSize* specifies the maximum number of rows to retrieve at a time when executing an MDX statement. A small number translates into more calls to the server while retrieving a large dataset. A large number of rows may improve performance, but could cause memory issues on the SAP BW server. The default value is 50000 rows.

* *EnableStructures* indicates whether characteristic structures are recognized. The default value for this option is false. Affects the list of objects available for selection. Not supported in Native query mode.

The *ScaleMeasures* option has been deprecated in this implementation. The behavior is now the same as setting *ScaleMeasures* to false, always showing unscaled values.

## Additional improvements for Implementation 2.0

The following list describes some of the additional improvements that come with the new implementation:

* Improved performance.
* Ability to retrieve several million rows of data, and fine-tuning through the batch size parameter.
* Ability to switch execution modes.
* Support for compressed mode. Especially beneficial for high latency connections or large datasets.
* Improved detection of `Date` variables.
* Expose `Date` (ABAP type DATS) and `Time` (ABAP type TIMS) dimensions as dates and times respectively, instead of text values. More information: [Support for typed dates in SAP BW](#support-for-typed-dates-in-sap-bw)
* Better exception handling. Errors that occur in BAPI calls are now surfaced.
* Column folding in BasXml and BasXmlGzip modes. For example, if the generated MDX query retrieves 40 columns but the current selection only needs 10, this request will be passed onto the server to retrieve a smaller dataset.

### Changing existing reports to use Implementation 2.0

Changing existing reports to use Implementation 2.0 is only possible in import mode. Follow these steps:

1. Open an existing report, select **Edit Queries** in the ribbon, and then select the SAP Business Warehouse query to update.

1. Right-click the query and select **Advanced Editor**.

1. In the **Advanced Editor**, change the `SapBusinessWarehouse.Cubes` call as follows:

    Determine whether the query already contains an option record, such as the following example.

    ![Screenshot shows a plaintext query with an option record.](sap_bw_9.png)

    If so, add the `Implementation 2.0` option, and remove the `ScaleMeasures` option, if present, as shown.

    ![Screenshot shows a plaintext query with the added value Implementation = 2.0.](sap_bw_10.png)

    If the query doesn't already include an options record, just add it. For the following option:

    ![Screenshot shows a plaintext query with an option record added.](sap_bw_11.png)

    Just change it to:

    ![Screenshot shows a plaintext query of the new option with the added value Implementation = 2.0.](sap_bw_12.png)

Every effort has been made to make Implementation 2.0 of the SAP BW connector compatible with version 1. However, there may be some differences because of the different SAP BW MDX execution modes being used. To resolve any discrepancies, try switching between execution modes.

## Support for typed dates in SAP BW

Implementation 2.0 of the SAP BW connector includes support for typed dates and times. If you query a report that has dimensions with ABAP types, DATS, or TIMS, they can now be output as dates instead of text.

The limitations for using this functionality are:

* Only available in Implementation 2.0 of the SAP BW connector.
* Only available in Import mode.
* The account used to connect to the SAP BW server should have enough permissions to call BAPI_IOBJ_GETDETAIL.

```
let
   Source = SapBusinessWarehouse.Cubes("sapbwtestserver", "00", "837", [ExecutionMode=SapBusinessWarehouseExecutionMode.BasXmlGzip, Implementation="2.0"]),
   #"$INFOCUBE" = Source{[Name="$INFOCUBE"]}[Data],
   #"$0D_DECU" = #"$INFOCUBE"{[Id="$0D_DECU"]}[Data],
   #"Added Items" = Cube.Transform(#"$0D_DECU",
   {
      {Cube.AddAndExpandDimensionColumn, "[0CALDAY]", {"[0CALDAY].[LEVEL01]"}, {"Calendar day.Calendar day Level 01"}},
      {Table.AddColumn, "Calendar day.Calendar day Level 01.Key", each Cube.AttributeMemberProperty([Calendar day.Calendar day Level 01], "[20CALDAY]")},
      {Cube.AddMeasureColumn, "Billed Quantity", "[Measures].[0D_INV_QTY]"}
   }) 
in
     #"Added Items"
```

You'll need to add the key in to access the typed date. For example, if there's a dimension attribute called [0CALDAY], you'll need to add the key [20CALDAY] to get the typed value.

In the example above, this means that:

* Calendar day.Calendar day Level 01 [0CALDAY] will be text (a caption). (Added by default when the dimension is added.)
* Calendar day.Calendar day Level 01.Key [20CALDAY] will be a date (must be manually selected).

To manually add the key in Import mode, just expand **Properties** and select the key.

![Selecting the Key property in the Power Query navigator.](key-property.png)

The key column will be of type date, and can be used for filtering. Filtering on this column will fold to the server.

## Support for SAP BW features

The following table lists all SAP BW features that aren't fully supported or will behave differently when using the Power Query SAP BW connector.

| Feature | Description |
| ------- | ----------- |
| Local calculations | Local calculations defined in a BEX Query will change the numbers as displayed through tools like Bex Analyzer. However, they aren't reflected in the numbers returned from SAP, through the public MDX interface.<br/><br/>**As such, the numbers seen in Power Query won't necessarily match those for a corresponding visual in an SAP tool.**<br/><br/>For instance, when connecting to a query cube from a BEx query that sets the aggregation to be Cumulated (for example, running sum), Power Query would get back the base numbers, ignoring that setting. An analyst could then apply a running sum calculation locally in, for example, Power BI, but would need to exercise caution in how the numbers are interpreted if this isn't done. |
| Aggregations	| In some cases (particularly when dealing with multiple currencies), the aggregate numbers returned by the SAP public interface don't match those shown by SAP tools.<br/><br/>**As such, the numbers seen in Power Query won't necessarily match those for a corresponding visual in an SAP tool.**<br/><br/>For instance, totals over different currencies would show as "*" in Bex Analyzer, but the total would get returned by the SAP public interface, without any information that such an aggregate number is meaningless. Thus the number (aggregating, say, $, EUR, and AUD) would get displayed by Power Query. |
| Currency formatting | Any currency formatting (for example, $2,300 or 4000 AUD) isn't reflected in Power Query. |
| Units of measure | Units of measure (for example, 230 KG) aren't reflected in Power Query. |
| Key versus text (short, medium, long) | For an SAP BW characteristic like CostCenter, the navigator will show a single item Cost Center Level 01. Selecting this item will include the default text for Cost Center in the field list. Also, the Key value, Short Name, Medium Name, and Long Name values are available for selection in the Properties node for the characteristic (if maintained in SAP BW).<br/><br/>Note that this only applies to Import connectivity mode. For DirectQuery mode, only the default text will be included in the data set. |
| Attributes | The attributes of a characteristic will be available for selection in the Properties for the characteristic. This only applies to Import connectivity mode. For DirectQuery mode, attributes won't be available. |
| Multiple hierarchies of a characteristic | In SAP, a characteristic can have multiple hierarchies. Then in tools like BEx Analyzer, when a characteristic is included in a query, the user can select the hierarchy to use.<br/><br/>In Power BI, the various hierarchies can be seen in the field list as different hierarchies on the same dimension. However, selecting multiple levels from two different hierarchies on the same dimension will result in empty data being returned by SAP. |
| Treatment of ragged hierarchies | SAP BW supports ragged hierarchies, where levels can be missed, for example:<br/><br/>&nbsp;&nbsp;&nbsp;Continent<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Americas<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Canada<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;USA<br/>&nbsp;&nbsp;&nbsp;Not Assigned<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Australia<br/><br/>In Power BI, this appears with (Blank) at the missing level:<br/><br/>&nbsp;&nbsp;&nbsp;Continent<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Americas<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Canada<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;USA<br>&nbsp;&nbsp;&nbsp;Not Assigned<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Blank)<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Australia |
| Scaling factor/reverse sign | In SAP, a key figure can have a scaling factor (for example, 1000) defined as a formatting option, meaning that all displays will be scaled by that factor.<br/><br/>It can similarly have a property set that reverses the sign. Use of such a key figure in Power BI (in a visual, or as part of a calculation) will result in the unscaled number being used (and the sign isn't reversed). The underlying scaling factor isn't available. In Power BI visuals, the scale units shown on the axis (K,M,B) can be controlled as part of the visual formatting. |
| Hierarchies where levels appear/disappear dynamically | Initially when connecting to SAP BW, the information on the levels of a hierarchy will be retrieved, resulting in a set of fields in the field list. This is cached, and if the set of levels changes, then the set of fields doesn't change until Refresh is invoked.<br/><br/>This is only possible in Power BI Desktop. Such a Refresh to reflect changes to the levels cannot be invoked in the Power BI service after Publish. |
| Default filter | A BEX query can include Default Filters, which will be applied automatically by SAP Bex Analyzer. These aren't exposed, and so the equivalent usage in Power Query won't apply the same filters by default. |
| Hidden Key figures | A BEX query can control visibility of Key Figures, and those that are hidden won't appear in SAP BEx Analyzer. This isn't reflected through the public API, and so such hidden key figures will still appear in the field list. However, they can then be hidden within Power Query. |
| Numeric formatting | Any numeric formatting (number of decimal positions, decimal point, and so on) won't automatically be reflected in Power Query. However, it's possible to then control such formatting within Power Query. |
| Hierarchy versioning | SAP BW allows different versions of a hierarchy to be maintained, for example, the cost center hierarchy in 2007 versus 2008. Only the latest version will be available in Power Query, as information on versions isn't exposed by the public API. |
|Time-dependent hierarchies | When using Power Query, time-dependent hierarchies are evaluated at the current date. |
| Currency conversion | SAP BW supports currency conversion, based on rates held in the cube. Such capabilities aren't exposed by the public API, and are therefore not available in Power Query. |
| Sort Order | The sort order (by Text, or by Key) for a characteristic can be defined in SAP. This sort order isn't reflected in Power Query. For example, months might appear as "April", "Aug", and so on.<br/><br/>It isn't possible to change this sort order in Power Query. |
| Technical names | In the navigator, the characteristic/measure names (descriptions) and technical names can both be displayed using the Display Options selector. The field list contains the characteristic/measure names (descriptions). |
|End user language setting | The locale used to connect to SAP BW is set as part of the connection details, and doesn't reflect the locale of the final report consumer. |
| Text Variables | SAP BW allows field names to contain placeholders for variables (for example, "$YEAR$ Actuals") that would then get replaced by the selected value. For example, the field appears as "2016 Actuals" in BEx tools, if the year 2016 were selected for the variable.<br/><br/>The column name in Power Query won't be changed depending on the variable value, and so would appear as "$YEAR$ Actuals". However, the column name can then be changed in Power Query. |
| Customer Exit Variables | Customer Exit variables aren't exposed by the public API, and are therefore not supported by Power Query. |
| | |

## Performance Considerations

The following table provides a summary list of suggestions to improve performance for data load and refresh from SAP BW.

| Suggestion | Description |
| ---------- | ----------- |
| Limit characteristics and properties (attribute) selection | The time it takes to load data from SAP BW into Power Query increases with the size of the dataset, that is, the number of columns and rows in the flattened result set. To reduce the number of columns, only select the characteristics and properties in the navigator that you eventually want to see in your report or dashboard. |
| Make use of parameters | Using filters/parameters contributes to reducing the size of the result set, which significantly improves query runtimes.<br/><br/>Parameters are especially valuable when used with large dimensions, where there's many members, such as customers, materials, or document numbers. |
| Limit number of key figures | Selecting many key figures from a BEx query/BW model can have a significant performance impact during query execution because of the time being spent on loading metadata for units. Only include the key figures that you need in Power Query. |
| Split up very large queries into multiple, smaller queries | For very large queries against InfoCubes or BEx queries, it may be beneficial to split up the query. For example, one query might be getting the key figures, while another query (or several other queries) is getting the characteristics data. You can join the individual query results in Power Query. |
| Avoid Virtual Providers (MultiProviders or InfoSets) | VirtualProviders are similar to structures without persistent storage. They are useful in many scenarios, but can show slower query performance because they represent an additional layer on top of actual data. |
| Avoid use of navigation attributes in BEx query | A query with a navigation attribute has to run an additional join, compared with a query with the same object as a characteristic in order to arrive at the values. |
| Use RSRT to monitor and troubleshoot slow running queries | Your SAP Admin can use the Query Monitor in SAP BW (transaction RSRT) to analyze performance issues with SAP BW queries. Review SAP note 1591837 for more information. |
| Avoid Restricted Key Figures and Calculated Key Figures | Both are computed during query execution and can slow down query performance. |
| Consider using incremental refresh to improve performance | Power BI refreshes the complete dataset with each refresh. If you're working with large volume of data, refreshing the full dataset on each refresh may not be optimal. In this scenario, you can use incremental refresh, so you're refreshing only a subset of data. For more details, go to [Incremental refresh in Power BI](/power-bi/service-premium-incremental-refresh). |
| | |

## Comparison to Analysis for Office (AFO)

There are fundamental differences between the Analysis for Office (AFO) tool and the Power Query SAP Business Warehouse connector, so the outputs of data may differ. AFO doesn't use MDX, but rather they use a proprietary protocol developed by SAP that is not available for 3rd parties, such as the Power Query SAP Business Warehouse connector. SAP only certifies connectors that use the MDX interface. AFO uses a multidimensional querying strategy, which navigates the data differently whereas the Power Query SAP Business Warehouse connector needs to flatten the data so it can be represented as a table, so even though it's the same data, it is queried, represented, and ultimately outputted differently. 

### See also

* [SAP Business Warehouse Application Server](application-setup-and-connect.md)
* [SAP Business Warehouse Message Server](message-setup-and-connect.md)
* [Import vs. DirectQuery for SAP BW](import-vs-directquery.md)
